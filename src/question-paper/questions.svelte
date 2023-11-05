<script lang="ts">
  import { marked } from 'marked';

  import Markdown from '../lib/markdown.svelte';

  export let questions: Array<
    Array<
      Array<{
        text: string;
        image: string;
        prompt: string;
        marks: string | number;
      }>
    >
  >;
</script>

<table class="w-full">
  <tbody>
    {#each questions as choice_questions, number}
      {#each choice_questions as subquestions, choice_index}
        {#if choice_index > 0}
          <tr>
            <td />
            <td><p class="text-center">OR</p></td>
            <td />
          </tr>
        {/if}

        {#each subquestions as subquestion, subquestion_index}
          <tr>
            {#if subquestion_index == 0}
              <td class="align-top" rowspan={subquestions.length}>
                Q{number + 1}.
              </td>
            {/if}

            <td>
              <Markdown source={subquestion.text} />

              {#if subquestion.image}
                <br />
                <img
                  alt="some dynamic asset that didn't load."
                  class="mx-auto"
                  height="384"
                  width="384"
                  src={subquestion.image}
                />
                <br />
              {/if}

              {#if subquestion.prompt}
                <p class="text-right">
                  [ {@html marked.parseInline(subquestion.prompt)} ]
                </p>
              {/if}
            </td>

            <td class="align-top text-center">
              {subquestion.marks}
            </td>
          </tr>
        {/each}
      {/each}
    {/each}
  </tbody>
</table>

<style>
  table,
  td {
    border: 1px black solid;
    padding: 0.5rem 0.75rem;
  }
</style>
