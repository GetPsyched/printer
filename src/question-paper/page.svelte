<script lang="ts">
  import questionPaper from '../../dist/data.json';

  import Information from './information.svelte';
  import Questions from './questions.svelte';
</script>

<main class="box-border flex flex-col max-w-[8.5in]">
  <hgroup>
    <h1 class="font-bold text-center text-md">{questionPaper.title}</h1>
    <p class="font-bold text-center text-md">{questionPaper.subtitle}</p>
  </hgroup>

  <br />
  <Information {questionPaper} />
  <br />

  <br />
  <Questions questions={questionPaper.questions} />
</main>
