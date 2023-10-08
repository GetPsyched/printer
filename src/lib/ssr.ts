/// <reference types="node" />

import { writeFileSync } from 'fs';

import { generateHTML } from './generate.ts';

const data = process.argv.slice(3)[0];
const target = process.argv.slice(2)[0];
generateHTML(
  JSON.parse(data),
  {
    tailwindcss: Boolean(process.env.USE_TAILWINDCSS),
  },
  target
).then((html: string) => writeFileSync(`dist/${target}.html`, html));
