<script lang="ts">
  import { marked } from 'marked';
  export let source: string;
</script>

<div>
  {@html marked.parse(source)}
</div>

<style>
  div :global(ul) {
    margin: 0;
    margin-top: 4px;
    padding-left: 15px;
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
    padding: 0.25rem;
  }
</style>
