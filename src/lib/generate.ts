import { readFileSync, writeFileSync } from 'fs';
import prince from 'prince';

import CSS from '../../public/global.css?raw';
import HTML from '../app.html?raw';

export async function generateHTML(
  data: any,
  options: { [key: string]: boolean | string },
  target: string
) {
  const component = await import(`../${target}/page.svelte`);
  const ssg = component.default.render({ data: data });

  let cssFiles = [CSS, ssg.css.code];
  if (options.tailwindcss == true) {
    cssFiles.push(readFileSync('dist/tailwind.css'));
  }

  return HTML.replace(
    '%sveltekit.head%',
    `<style>${cssFiles.join('\n')}</style>`
  ).replace('%sveltekit.body%', ssg.html);
}

export async function generatePDF(
  data: any,
  options: { [key: string]: boolean | string },
  target: string
) {
  const html = await generateHTML(data, options, target);
  writeFileSync(`dist/${target}.html`, html);

  await prince()
    .license('./prince-license.xml')
    .inputs(`dist/${target}.html`)
    .output('dist/output.pdf')
    .execute();
}
