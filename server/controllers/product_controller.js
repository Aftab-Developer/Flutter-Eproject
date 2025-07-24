const Product_Model = require("../models/ProductModel");
const Busboy = require("busboy");
const cloudinary_uploader = require("../cloudinary/cloudinary_uploader");
async function createProductController(req,res) {
    try {
        console.log("hellow",req.headers) ;
     const busboy  =  Busboy({headers:req.headers});  
     console.log("busboy created")
     const dbObject = { 
        product_name: "" ,
        product_des:"" ,
        product_images: []  , 
        product_price:0

     } ; 
     console.log(dbObject) ;

     busboy.on("file",(fieldName,file,fileName) => {
       if(fieldName == 'product_images') {
        dbObject.product_images.push(cloudinary_uploader(file,`${dbObject.product_name}/${fileName}`))
       } 
        else {
        values.resume() ;
       }
     }) ;  

     busboy.on('field',(fieldName,values) => {
      if(fieldName == "product_name") {
         dbObject[fieldName] = values
       }
       else if(fieldName == "product_des") {
         dbObject[fieldName] = values
       }
       else if(fieldName == "product_price") {
         dbObject[fieldName] = Number(values)
       } 
     })

     busboy.on('finish',async() => {
      
        const product_images_results =   dbObject.product_images.length > 0 ? await Promise.all(dbObject.product_images) : [] ; 

         const product_images_arr = product_images_results.map(r => 
       (
         {
            image_url : r.secure_url ,
            public_id : r.public_id
        }
       )) ;  
         console.log(dbObject)
         console.log(product_images_arr)

        await Product_Model.create(
            {
                ...dbObject ,
               product_images : product_images_arr
            }
        ) ; 

    return res.json({message:"Product uploaded success",success:true}).status(201) ; 

     }) ; 
     req.pipe(busboy) ;
    } catch (error) {
    return res.json({message:"some thing went wrong plse try agai later ...",success:false}).status(500) ;
        
    }
}   

module.exports = createProductController ;