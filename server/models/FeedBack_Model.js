const {model , Schema , default:mongoose} = require('mongoose'); 

const FeedBack_Schema = new Schema({
    username:{
        type:String ,
        required:true
    } ,
    email:{
        type:String ,
        required:true
    } ,

    description:{
        type:String ,
        required:true
    }
},{timestamps:true}) ; 

const FeedBack_Model  = model("Feedback",FeedBack_Schema) ;

module.exports = FeedBack_Model ;