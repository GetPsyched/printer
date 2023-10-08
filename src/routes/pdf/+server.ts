import { readFileSync } from 'fs';
import prince from 'prince';

import { generatePDF } from '../../lib/generate';

export async function POST({ request, url }: any) {
  const body = await request.json();
  const target = url.searchParams.get('target');
  await generatePDF(body.data, body.options, target);

  return new Response(readFileSync('dist/output.pdf'), {
    headers: {
      'Content-Type': 'application/pdf',
    },
  });
}
