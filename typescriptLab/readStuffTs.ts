import { readFileSync } from 'fs';

let txt:string = readFileSync('readStuff.js','utf8');

console.log(txt);