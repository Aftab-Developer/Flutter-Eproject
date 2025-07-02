const express = require('express'); 
const PORT=3000 ;
const app = express(); 

app.get('/',(req,res) => {
    res.send("Hellow from server") ;
})


app.listen(PORT,() => console.log(`Server is running on port ${PORT}` ))