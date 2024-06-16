package router

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
	webmy "github.com/wiratkhamphan/shop_my/sec/backend/router/web/web_my"
)

func Run_router() {
	app := fiber.New()

	app.Use(cors.New(cors.Config{
		AllowOrigins: "*",
		AllowMethods: "GET,POST",
	}))

	app.Post("/login", webmy.Login)

	app.Listen(":8080")
}
