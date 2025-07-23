const {model , Schema , default:mongoose} = require('mongoose'); 

const CartSchema = new Schema({
    items:{
        type:mongoose.Schema.Types.ObjectId ,
        ref:"Product"
    }
},{timestamps:true}) ; 


const CartModel = model("CartModel",CartSchema) ; 


module.exports = CartModel ;