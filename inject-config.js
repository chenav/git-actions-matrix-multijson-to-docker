const fs = require('fs');

//file containing the node-red flows a JSON (Array of jsons)
var flows_array = require( process.argv[2]);
//the specific JSON for the airbnb config to add 
//--> WARNING it is a string, needs parsing
//need to be passed through github actions
var config_arg = process.argv[3];

let json = JSON.parse(config_arg);

flows_array.push(json);      

fs.writeFile('/data/flows.json', JSON.stringify(flows_array), err => {

  if (err) {
    console.error(err);
  }

});