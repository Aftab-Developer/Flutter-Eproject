const express = require('express'); 
const AuthRouter = require('./routes/login_route');
const PORT=3000 ;
const app = express();  
const dbConnect = require("./dbContext.js")
const cookieParser = require("cookie-parser")

const cors = require('cors') ;
const productRouter = require('./routes/products_route.js');
require("dotenv").config() ;
app.use(express.json()) ;
app.use(cors({
    methods:["GET","POST","PUT","DELETE"] , 
    credentials:true ,
    origin:true
}))
app.use(cookieParser()) ;
app.use("/api/v1/auth",AuthRouter) ;
app.use("/api/v1/product",productRouter) ;

dbConnect().then(() => {
app.listen(PORT,() =>{
     console.log(`Server is running on port ${PORT}` )
})
}).catch((e) => {
    console.log("failure")
})
