const fs = require('fs');

let txt = fs.readFileSync('sample_file.txt','utf8').toString();

console.log(txt);