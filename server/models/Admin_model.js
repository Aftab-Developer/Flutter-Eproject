const {model , Schema  , default:mongoose} = require("mongoose"); 

const AdminSchema = new Schema( {
    ad_name:{
        type:String , 
        required:true
    } ,
      ad_email:{
        type:String , 
        required:true
    }, 
     ad_profile_image:{
        type:String , 
        required:true , 
        default: ""
    }
},{timestamps:true}); 

const AdminModel = model("admin_model",AdminSchema); 

module.exports = AdminModel ;