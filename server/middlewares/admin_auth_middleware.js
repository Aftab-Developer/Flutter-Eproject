const jwt = require("jsonwebtoken")
require("dotenv").config() ; 
const AdminModel = require("../models/Admin_model")

async function Auth_Admin(req,res,next) {
  try {
    const token = req.cookies.token ; 
  if(!token) {
    return res.json({message:"Your Sesssion has ended plse login again to get a new session"}).status(401) ;
  } 
  const user =  jwt.verify(token, process.env.JWT_SECRECT) ; 
  if(!user) {
    return res.json({message:"Invalid Session"}).status(401) ;
  }  
   const isAdmin = await AdminModel.findOne({_id:user._id}) ; 
   if(iasAdmin) {
  req.userId = user._id; 
  req.username = user.username; 
  req.email = user.email; 
   } else {
    return res.json({message:"You are un authorized",success:false}).status(401) ;

   }
  
  next();
  } catch (error) {
    return res.json({message:"internal server error",success:false}).status(500) ;
    
  }
} 

module.exports = Auth_Admin ;