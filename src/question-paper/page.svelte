<script lang="ts">
  import Information from './information.svelte';
  import Questions from './questions.svelte';

  export let data: {
    title: string;
    subtitle: string;
    date: { day: number; month: string; year: number };
    programme: string;
    course: { name: string; code: string };
    semester: number;
    pages: number;
    time: string;
    questions: Array<{
      contents: Array<{ text: string; image: string; prompt: string }>;
      marks: string | number;
    }>;
  };
</script>

<main class="box-border flex flex-col max-w-[8.5in]">
  <hgroup>
    <h1 class="font-bold text-center text-md">{data.title}</h1>
    <p class="font-bold text-center text-md">{data.subtitle}</p>
  </hgroup>

  <br />
  <Information questionPaper={data} />
  <br />

  <br />
  <Questions questions={data.questions} />
</main>
