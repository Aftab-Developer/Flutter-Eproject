const {model,Schema , default:mongoose} = require("mongoose") ; 

const ProductSchema = new Schema({
    product_name:{
        type:String ,
        required:true
    } ,
    product_des:{
        type:String ,
        required:true ,   
    },
    product_images:[
        {
            image_url:{
                type:String,
                required:true
            } ,
            public_id:{
                type:String,
                required:true
            }
        }
    ] ,
       
    product_price:{
     type:Number ,
     required:true , 
    } ,
    ratings : [
         {
        user:{
            type:mongoose.Schema.Types.ObjectId  ,
            ref:"UserModel" ,
        } ,
        value:{
            type:Number ,
            min:1 , 
            max:5 ,

        }    , 
       
    }
]
},{timestamps:true}) ;  

ProductSchema.index({created_at:-1})
ProductSchema.index({product_name:"text",product_des:"text"}) ;

const Product_Model = model("Product",ProductSchema) ; 

module.exports = Product_Model ;