const {Schema , model, default: mongoose} = require('mongoose'); 

const UserSchema = new Schema({
    username: {
        type:String ,
        required:true ,

    } ,
    email: {
        type:String ,
        required:true ,
        
    } ,  
    password: {
    type:String ,
        required:false ,
    } , 
    otp:{
        type:Number ,

    } , 
    otp_expiry: {
        type:Number ,

    } ,
    profile_image : {
        type:String ,
        required:true ,
        default:"https://cdn-icons-png.flaticon.com/512/847/847969.png"
    } ,
    cart: {
        type:mongoose.Schema.Types.ObjectId ,
        ref:"Cart"
    } ,
    success_orders: {
         type:mongoose.Schema.Types.ObjectId ,
         ref:"Product"
    } ,
    

},{timestamps:true}) ; 

const userModel = model("UserModel",UserSchema) ; 
module.exports = userModel ;