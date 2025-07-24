const sendMail = require("../helper/sendMail");
const AdminModel = require("../models/Admin_model"); 
const UserModel = require("../models/User_Model"); 


async function AdminLoginController(req,res)  {
 try {
    const {email , password} = req.body ; 
 if(!email || !password) {
    return res.json({message:"plse provide all fields",success:false}).status(400) ;
 } 
 const isUserExsists = await AdminModel.findOne({email}) ; 
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
    return res.json({message:"some thing went wrong plse try again later ...",success:false}).status(500) ;
    
 }
} 


async function AdminCreationTemp (req,res) {
  await AdminModel.create(req.body); 
  return res.json({message:"Created",success:true}).status(201) ;
}
 

module.exports = {AdminLoginController , AdminCreationTemp} ; 
