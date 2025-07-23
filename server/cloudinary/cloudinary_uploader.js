require("dotenv").config() ;
const cloudinary = require('cloudinary').v2;

cloudinary.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRECT,
}); 

function cloudinary_uploader(file , folder) {
 return new Promise((resolve,reject) => {
    const cloudinary_stream  = cloudinary.uploader.upload_stream({
        folder ,
        resource_type: 'auto', 
    } , (error,result)=> {
        if(error) reject(error) ; 
        return resolve(result);
    }
)  
file.pipe(cloudinary_stream)
 })
} 

module.exports = cloudinary_uploader ;