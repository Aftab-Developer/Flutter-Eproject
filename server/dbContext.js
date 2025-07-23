const mongoose = require('mongoose') ;

module.exports = async function() {
    try{
    await mongoose.connect("mongodb://localhost:27017/laptopHarbor") ; 
    console.log("database connected success")
    }catch(e) {
    console.log("database connected failure"); 
    process.exit(1);

    }
}