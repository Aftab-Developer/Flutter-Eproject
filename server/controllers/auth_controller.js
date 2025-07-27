const userModel = require("../models/User_Model");
const jwt = require("jsonwebtoken");
const productModel = require("../models/ProductModel");
const bcrypt = require("bcryptjs");
require("dotenv").config();
const sendMail = require("../helper/sendMail"); 
const { OAuth2Client } = require('google-auth-library');

async function LoginController(req, res) {
  try {
    const { email, password } = req.body;
    console.log("clicked");
    if (!email || !password) {
      return res.status(400).json({ message: "Please provide all fields", success: false });
    }
    const isUserExsists = await userModel.findOne({ email });
    if (!isUserExsists) {
      return res.status(400).json({ message: "Please create your account first", success: false });
    }
    console.log(isUserExsists);
    const passIsvalid = await bcrypt.compare(password, isUserExsists.password);
    console.log(passIsvalid);
    if (!passIsvalid) {
      return res.status(400).json({ message: "Invalid Credentials", success: false });
    }
    const token = jwt.sign(
      {
        _id: isUserExsists._id,
        username: isUserExsists.username,
        email: isUserExsists.email,
      },
      process.env.JWT_SECRECT,
      {
        expiresIn: "4h",
      }
    );
    return res
      .status(200)
      .cookie("token", token, {
        httpOnly: true,
        maxAge: 4 * 60 * 60 * 1000,
        samesite: "none",
        secure: false,
      })
      .json({ message: `Welcome ${isUserExsists.username}`, success: true });
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong, please try again later...", success: false });
  }
}

async function SignUpController(req, res) {
  try {
    console.log("hello");
    const { username, email, password } = req.body;
    if (!username || !email || !password) {
      return res.status(400).json({ message: "Please provide all fields", success: false });
    }
    console.log(req.body);
    const userExsists = await userModel.findOne({ email });
    console.log(userExsists);
    if (userExsists) {
      return res.status(400).json({ message: `${username} your account already created`, success: false });
    }
    const hashedPassword = await bcrypt.hash(password, 12);
    await userModel.create({ username, email, password: hashedPassword });
    return res.status(201).json({ message: `${username} your account created`, success: true });
  } catch (error) {
    return res.status(500).json({ message: "Something went wrong, please try again later...", success: false });
  }
}

async function demoController(req, res) {
  const pro = await productModel.find({});
  return res.status(200).json({ pro });
}

async function LogOutController(req, res) {
  try {
    return res
      .status(200)
      .cookie("token", "", {
        httpOnly: true,
        expires: new Date(0),
      })
      .json({ message: `${req.username} is logout success`, success: true });
  } catch (e) {
    return res.status(500).json({ message: "Something went wrong, please try again later...", success: false });
  }
}

async function EmailVerificationController(req, res) {
  try {
    console.log("reached");
    console.log(`${req.body}`);
    const { email } = req.body;
    if (!email) {
      return res.status(400).json({ message: "Please provide all fields", success: false });
    }

    const user = await userModel.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: `${email} does not exist`, success: false });
    }
    console.log("Reached email user.");

    const otp = Math.floor(100000 + Math.random() * 900000);
    const otp_expiry = Date.now() + 10 * 60 * 1000;

    const mailResponse = await sendMail({
      username: user.username,
      email,
      Otp: otp,
    });
    console.log("Mail sent:", mailResponse);

    user.otp = otp;
    user.otp_expiry = otp_expiry;
    await user.save();
    return res.status(200).json({
      message: "An OTP code was sent to your recovery email...",
      success: true,
    });
  } catch (error) {
    console.error("EmailVerification error:", error);
    return res.status(500).json({
      message: "Something went wrong, please try again later.",
      success: false,
    });
  }
} 


async function CheckOtpValidContoller(req,res) { 
  try { 
    const {otp} = req.body ; 
    

    const user = await userModel.findOne({email:req.params.email}); 
    if(!otp && !user) {
      return res.status(400).json({ message: "Please provide all fields", success: false });

    } 
    if(!user.otp === otp ) {
      return res.status(400).json({ message: "Invalid Otp", success: false });
    }         
    else if(!user.otp_expiry > Date.now()) {
      return res.status(400).json({ message: "Otp has been expired ", success: false });
    
    }   
    user.otp = null ; 
    user.otp_expiry = null ; 
    await user.save() ;
    return res.status(200).json({ message: "Otp verification success", success: true });
  
  } catch (error) {
    return res.status(500).json({
      message: "Something went wrong, please try again later.",
      success: false,
    });
  }

}


async function ResetPasswordController(req,res) {
  try {
    const {resetPassword} = req.body;   
    const email = req.params.email;  
    

    if(!resetPassword || !email) {
      return res.status(400).json({ message: "Please provide all fields", success: false });
      
    }   

    const hashedPass = await bcrypt.hash(resetPassword,10) ;
 
    const isUpdated = await userModel.updateOne({email},{$set:{password:hashedPass}}) ;  
   if(!isUpdated){
      return res.status(400).json({ message: "Please provide all fields", success: false });

   }
else {
      return res.status(200).json({ message: "Reset password Success", success: true });

}
    



  } catch (error) {
    return res.status(500).json({
      message: "Something went wrong, please try again later.",
      success: false,
    });
  }
} 





async function GoogleSignInController(req,res) {
  try {
    const {username,email,image} = req.body;  
   if (!username || !email || !image) {
      return res.status(400).json({ message: "Please provide all fields", success: false });
    }
    console.log(req.body);
    const userExsists = await userModel.findOne({ email });
    console.log(userExsists); 

    if(!userExsists){
      await userModel.create({username,email,profile_image:image}) ; 
    }
    
const token =  jwt.sign(
        {_id : userExsists._id ,
        
        username,email},process.env.JWT_SECRECT,{
          expiresIn:"4h"
        })  ; 

        return res.cookie("token",token,{ httpOnly: true,
        maxAge: 4 * 60 * 60 * 1000,
        samesite: "none",
        secure: false,}).json(
          {message:"Successfully login",success:true}
        )
    

  } catch (error) {
    return res.status(500).json({
      message: "Something went wrong, please try again later.",
      success: false,
    });
  }
}

module.exports = {
   SignUpController, 
   LoginController,
   demoController,
    LogOutController,
     EmailVerificationController,
     CheckOtpValidContoller,
     ResetPasswordController,
     GoogleSignInController 
    };
