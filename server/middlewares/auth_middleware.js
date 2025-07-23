const jwt = require("jsonwebtoken")
require("dotenv").config() ;

async function Auth(req,res,next) {
  try {
    const token = req.cookies.token ; 
  if(!token) {
    return res.json({message:"Your Sesssion has ended plse login again to get a new session"}).status(401) ;
  } 
  const user =  jwt.verify(token, process.env.JWT_SECRECT) ; 
  if(!user) {
    return res.json({message:"Invalid Session"}).status(401) ;
  } 
  req.userId = user._id; 
  req.username = user.username; 
  req.email = user.email; 
  
  next();
  } catch (error) {
    return res.json({message:"internal server error",success:false}).status(500) ;
    
  }
} 

module.exports = Auth ;