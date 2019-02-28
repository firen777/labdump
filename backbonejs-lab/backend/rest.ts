import express = require('express');
import * as fs from 'fs';
import * as path from 'path';
import {IArticle, IUser} from './model_type';

const app = express();



app.get('/user', (req, res)=>{
    let id:string = req.query['id'];

    if (id=="" || id == undefined) res.send({msg:"Ayy no param"});
    else {
        try {
            let readResult:IUser = JSON.parse(fs.readFileSync(_makeUserJSONPath(id), "utf8"));
            res.send(readResult);
        } catch (error) {
            res.send({msg:"Ayy not found"});
        }
    }
});

app.post('/user', (req, res)=>{
    
})

app.listen(3003, ()=>{
    console.log("Express running in port 3003");
});



function _makeUserJSONPath(id:string):string{
    // return "." + path.sep + "data" + path.sep + "user-" + id + ".json"
    return path.join(__dirname, "data", "user-"+id+".json");
}