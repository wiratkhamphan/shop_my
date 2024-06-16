package datashopmy

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
	"github.com/wiratkhamphan/shop_my/sec/database/data_shop_my/env"
)

func ConnectionDBshop() (*sql.DB, error) {
	env, err := env.ConnfileEnv()

	if err != nil {
		return nil, err
	}

	db, err := sql.Open(env.DBdriver, fmt.Sprintf("%s:%s@/%s", env.DBuser, env.DBpass, env.DBname))

	if err != nil {
		panic(err)
	}

	err = db.Ping()
	if err != nil {
		panic(err)
	}
	// fmt.Println("ConnfileEnv", err)

	return db, err
}
