import express = require('express');

const app = express();

app.listen(3003, ()=>{
    console.log("Express running in port 3003");
})