'use strict';
const express = require('express');
const path = require('path');

const port = 5000;
const host = '0.0.0.0';

const app = express();

let creatorPid;
let watchPid;
//let state = false;

app.get('/', (req, res) => {
  res.sendFile(path.join('/html/index.html'));
});

app.get('/style.css', (req, res) => {
  res.sendFile(path.join('/html/style.css'));
});

app.get('/script.js', (req, res) => {
  res.sendFile(path.join('/html/script.js'));
});

app.get("/start", function (req, res){
  //if(!state) {
  //  state = true;
    const {execFile} = require('child_process');
    const create = execFile('/scripts/cteatorLog.sh', (error, stdout, stderr) => {
      if (error) {
        throw error;
      }
    });

    const watch = execFile('/scripts/watchLog.sh', (error, stdout, stderr) => {
      if (error) {
        throw error;
      }
    });
    creatorPid = create.pid;
    watchPid = watch.pid;
 // }
});

app.get("/stop", function (req, res){
 // if(state) {
 //   state = false;
    const {exec} = require('child_process');

    exec(`kill -2 ${creatorPid} ${watchPid}`, (err, stdout, stderr) => {
      if (err) {
        console.error(err)
      }
    });
    res.redirect('back');
 // }
});

app.get("/quantity", function (req,  res) {
  const fs = require('fs');

  fs.readFile('/scripts/quantityLog.txt', 'utf8', function (error, data) {
    res.end(data)
  });
});
//
// app.get('/state', function (req, res){
//   console.log(state)
//   res.send(state);
// });

app.listen(port, host);
console.log(`running on http://${host}:${port}`);
