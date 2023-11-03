<script lang="ts">
  import { marked } from 'marked';
  export let source: string;
</script>

<div>
  {@html marked.parse(source)}
</div>

<style>
  div :global(ul),
  div :global(ol) {
    margin: 0;
    margin-top: 4px;
    padding-left: 15px;
  }

  div :global(li) {
    margin-left: 15px;
  }

  div :global(ul > li) {
    list-style-type: disc;
  }

  div :global(ol > li) {
    list-style-type: decimal;
  }

  div :global(table),
  div :global(th),
  div :global(td) {
    margin-left: auto;
    margin-right: auto;
    border: 1px black solid;
  }

  div :global(th),
  div :global(td) {
    padding: 0.25rem 0.5rem;
  }
</style>
