package main

import (
	"github.com/wiratkhamphan/shop_my/sec/backend/router"
	datashopmy "github.com/wiratkhamphan/shop_my/sec/database/data_shop_my"
)

func main() {
	router.Run_router()
	datashopmy.ConnectionDBshop()
}
