const express = require('express'); 
const createProductController = require('../controllers/product_controller');
const productRouter = express.Router() ; 
const Auth = require("../middlewares/auth_middleware.js")

productRouter.route("/create").post(createProductController)


module.exports = productRouter ;