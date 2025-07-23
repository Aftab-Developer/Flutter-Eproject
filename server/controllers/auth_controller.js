const userModel = require("../models/User_Model");
const jwt = require("jsonwebtoken") ;
const productModel = require("../models/ProductModel")
const bcrypt = require("bcryptjs") ; 
require("dotenv").config() ;

async function LoginController(req,res)  {
 try {
   const {email , password} = req.body ; 
 if(!email || !password) {
    return res.json({message:"plse provide all fields",success:false}).status(400) ;
 } 
 const isUserExsists = await userModel.findOne({email}) ; 
 if(!isUserExsists) {
    return res.json({message:"Plse create your account first",success:false}).status(400) ;

 } 
 const token = jwt.sign(
        {
        _id:isUserExsists._id ,
         username:isUserExsists.username,
         email:isUserExsists.email
        },
        process.env.JWT_SECRECT,
        {
    expiresIn:"4h" 
        }
 ) ; 
 return res.status(200).cookie("token",token,{
    httpOnly:true,
    expiresIn:4*60*60*1000,
    samesite:'none',
    secure:false
}).json({message:`${isUserExsists.username} login success`,success:true})
 } catch (error) {
    return res.json({message:"internal server error",success:false}).status(500) ;
   
 }
} 

  async function SignUpController(req,res) {
 try { 
   console.log("hellow")
   const {username , email , password} = req.body ; 
 if(!username || !email || !password){
    return res.json({message:"plse provide all fields",success:false}).status(400) ;
 }   
 console.log(req.body); 
 const userExsists = await userModel.findOne({email});  
 console.log(userExsists) ;
 if(userExsists) {
    return res.json({message:`${username} your account already created`,success:false}).status(400) ;
 }
 const hashedPassword = await bcrypt.hash(password,12);  
 await userModel.create({username , email , password:hashedPassword} ); 
    return res.json({message:`${username} your account  created`,success:true}).status(400) ;
 } catch (error) {
    return res.json({message:"internal server error",success:false}).status(500) ;
   
 }
} 
 
async  function demoController(req,res){
  const pro =  await productModel.find({}) ; 
   return res.status(200).json({pro});

}
 
async function LogOutController(req,res) {
   try {
    return res.cookie("token","").json({message:`${req.username} is logout success`,success:true})
   }catch(e) {
    return res.json({message:"internal server error",success:false}).status(500) ;

   }
}
module.exports = {SignUpController,LoginController,demoController,LogOutController} ;