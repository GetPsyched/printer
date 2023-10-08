import prince from 'prince';

import { generatePDF } from '../../lib/generate';

export async function POST({ request, url }: any) {
  const body = await request.json();
  const target = url.searchParams.get('target');
  const pdf = await generatePDF(body.data, body.options, target);

  return new Response(pdf, {
    headers: {
      'Content-Type': 'application/pdf',
    },
  });
}
