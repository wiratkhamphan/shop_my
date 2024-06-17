package webmy

import (
	"database/sql"
	"fmt"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/gofiber/fiber/v2"
	datashopmy "github.com/wiratkhamphan/shop_my/sec/database/data_shop_my"
)

type Credentials struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

type User struct {
	Username string `json:"username"`
	Email    string `json:"email"`
	Age      int    `json:"age"`
	Fname    string `json:"fname"`
	Password string `json:"password"`
}

var db *sql.DB

func Login(c *fiber.Ctx) error {
	var creds Credentials
	if err := c.BodyParser(&creds); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
			"error": "Cannot parse login data. Please ensure your JSON is properly formatted.",
		})
	}

	db, err := datashopmy.ConnectionDBshop()
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "Database connection error"})
	}
	defer db.Close()

	var user User
	err = db.QueryRow("SELECT username, email, age, fname, password FROM user WHERE username = ?", creds.Username).Scan(&user.Username, &user.Email, &user.Age, &user.Fname, &user.Password)
	if err != nil {
		if err == sql.ErrNoRows {
			return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
				"message": "Invalid credentials",
			})
		}
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
			"error": "Query error",
		})
	}

	if user.Password != creds.Password {
		return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
			"message": "Invalid credentials",
		})
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"username": creds.Username,
		"exp":      time.Now().Add(time.Hour * 72).Unix(),
	})

	tokenString, err := token.SignedString([]byte("your_secret_key"))
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
			"error": "Failed to generate token",
		})
	}

	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"status":      "OK",
		"accessToken": tokenString,
		"username":    user.Username,
		"email":       user.Email,
		"age":         user.Age,
	})
}

func GetUser(c *fiber.Ctx) error {
	tokenString := c.Get("Authorization")[7:] // Remove "Bearer " prefix

	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
		}
		return []byte("your_secret_key"), nil
	})

	if err != nil {
		return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{"message": "Invalid token"})
	}

	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		username := claims["username"].(string)

		db, err := datashopmy.ConnectionDBshop()
		if err != nil {
			return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "Database connection error"})
		}
		defer db.Close()

		var user User
		err = db.QueryRow("SELECT username, email, age, fname FROM user WHERE username = ?", username).Scan(&user.Username, &user.Email, &user.Age, &user.Fname)
		if err != nil {
			if err == sql.ErrNoRows {
				return c.Status(fiber.StatusNotFound).JSON(fiber.Map{"message": "User not found"})
			}
			return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "Query error"})
		}

		return c.Status(fiber.StatusOK).JSON(fiber.Map{
			"status": "ok",
			"user":   user,
		})
	}

	return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{"message": "Invalid token"})
}
