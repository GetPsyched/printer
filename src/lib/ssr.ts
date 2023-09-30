/// <reference types="node" />

import { readFileSync, writeFileSync } from 'fs';

const appName = process.argv.slice(2)[0];
import(`../routes/${appName}/+page.svelte`)
  .then((app) => {
    let ssg = app.default.render();
    let text = readFileSync('src/app.html').toString();
    let globalcss = readFileSync('global.css').toString();
    text = text
      .replace('/* STYLE */', `${ssg.css.code}\n${globalcss}`)
      .replace('<!-- HTML -->', ssg.html);
    writeFileSync('index.html', text);
  })
  .catch((error) => {
    if (error.message.startsWith('Unknown variable dynamic import:')) {
      console.error(`ERROR: ${appName} is not an available option`);
      return;
    }
    throw error;
  });
