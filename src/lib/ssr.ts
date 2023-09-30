/// <reference types="node" />

import { readFileSync, writeFileSync } from 'fs';

import resume from '../routes/resume/+page.svelte';

let ssg = resume.render();
let text = readFileSync('src/app.html').toString();
let globalcss = readFileSync('global.css').toString();
text = text
  .replace('/* STYLE */', `${ssg.css.code}\n${globalcss}`)
  .replace('<!-- HTML -->', ssg.html);
writeFileSync('index.html', text);
