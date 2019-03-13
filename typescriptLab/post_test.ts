import { API_URL, API_PATH, X_API_KEY, API_PORT } from "./sensitive_data";

import * as https from "https";

let jsonObject = JSON.stringify({
	"data": [
	{
		"log_id": 5,
		"status": 1
	},
	{
		"log_id": 6,
		"status": -1
	},
	{
		"log_id": 7,
		"status": 1
	},
	{
		"log_id": 8,
		"status": -1
	}
  ]
});

let postheaders = {
  'Content-Type' : 'application/json',
  'Content-Length' : Buffer.byteLength(jsonObject, 'utf8'),
  // 'X-API-KEY' : X_API_KEY,
};

let optionspost:https.RequestOptions = {
  host : API_URL,
  port : API_PORT,
  path : API_PATH,
  method : 'POST',
  headers : postheaders
};

console.info('Options prepared:');
console.info(optionspost);
console.info('Do the POST call');

let reqPost = https.request(optionspost, function(res) {
  console.log("statusCode: ", res.statusCode);
  // uncomment it for header details
  // console.log("headers: ", res.headers);

  res.on('data', function(d) {
      console.info('POST result:\n');
      process.stdout.write(d);
      console.info('\n\nPOST completed');
  });
});

reqPost.write(jsonObject);
reqPost.end();
reqPost.on('error', function(e) {
  console.error(e);
});