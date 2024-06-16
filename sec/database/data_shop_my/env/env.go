package env

import (
	"log"
	"os"
	"path/filepath"

	"github.com/joho/godotenv"
)

type env struct {
	DBdriver string
	DBuser   string
	DBpass   string
	DBname   string
}

func ConnfileEnv() (*env, error) {
	envPath := filepath.Join("./sec/database/data_shop_my/env", "shop.env")

	err := godotenv.Load(envPath)

	if err != nil {
		log.Fatal("Error logdinh shop.env file :", err)
	}

	Env := &env{
		DBdriver: os.Getenv("DB_driver"),
		DBuser:   os.Getenv("DB_user"),
		DBpass:   os.Getenv("DB_pass"),
		DBname:   os.Getenv("DB_name"),
	}
	// fmt.Println(Env)
	return Env, err
}
