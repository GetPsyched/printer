<script lang="ts">
  import * as marked from 'marked';
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
</style>
