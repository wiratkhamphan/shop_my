package webmy

import (
	"database/sql"

	"github.com/gofiber/fiber/v2"
	datashopmy "github.com/wiratkhamphan/shop_my/sec/database/data_shop_my"
)

type Credentials struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func Login(c *fiber.Ctx) error {
	var creds Credentials

	if err := c.ParamsParser(&creds); err != nil {
		return c.Status(fiber.StatusAlreadyReported).JSON(fiber.Map{
			"error": "Canno pars login data",
		})
	}

	db, err := datashopmy.ConnectionDBshop()
	if err != nil {
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"error": "Database connetion error"})
	}
	defer db.Close()

	var User Credentials
	err = db.QueryRow("SELECT password FROM user_login WHERE username = ?", User.Username).Scan(
		&User.Username, &User.Password,
	)
	if err != nil {
		if err == sql.ErrNoRows {
			return c.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
				"message": "Invalid credenitals",
			})
		}
		return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
			"Error": "Quert error",
		})
	}
	return c.SendStatus(fiber.StatusOK)
}
