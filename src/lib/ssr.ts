/// <reference types="node" />

import { readFileSync, writeFileSync } from 'fs';

const appName = process.argv.slice(2)[0];
const dataJSON = process.argv.slice(3)[0];
import(`../${appName}/page.svelte`)
  .then((app) => {
    let ssg = app.default.render({ data: JSON.parse(dataJSON) });
    let text = readFileSync('src/app.html').toString();
    let globalcss = readFileSync('global.css').toString();

    let tailwindcss = process.env.USE_TAILWINDCSS
      ? readFileSync('tailwind.css').toString()
      : '';

    text = text
      .replace(
        '%sveltekit.head%',
        `<style>${ssg.css.code}\n${globalcss}\n${tailwindcss}</style>`
      )
      .replace('%sveltekit.body%', ssg.html);
    writeFileSync('index.html', text);
  })
  .catch((error) => {
    if (error.message.startsWith('Unknown variable dynamic import:')) {
      console.error(`ERROR: ${appName} is not an available option`);
      return;
    }
    throw error;
  });
