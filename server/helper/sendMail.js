const nodemailer = require('nodemailer'); 
const mailTemOtp = require('../mails/optMailTemp');

 async function sendMail({email,username,Otp}) {
   try { 
    console.log("called")
     const trasnporter = nodemailer.createTransport({
        service:"gmail", 
        port:465 ,
        secure:true ,
        auth: {
            user :"aftab785ahmed@gmail.com" , 
            pass : "mrmj bzmw qozs eeer"
        }
    }) ; 
    console.log("called ho gay transporter")


    await trasnporter.sendMail({
        from: "aftab785ahmed@gmail.com" , 
        to:email , 
        subject : "Recover Your Account Password" ,
        html:mailTemOtp({username,otpCode:Otp}) 
    }) ; 
    return {message:"email send",success:true}
   } catch (error) {
    return {message:"email not send",success:false,error}
    
   }
}
module.exports = sendMail ;