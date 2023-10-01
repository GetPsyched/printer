<script lang="ts">
  export let group: string | undefined;
  export let skills: string[];
</script>

<div class={group == 'hidden' ? 'hidden' : undefined}>
  {#if group}
    <b>{group}</b>:
  {/if}
  {#each skills as s}
    <span class="skill">{s}</span>
  {/each}
</div>

<style>
  .hidden {
    font-size: 0.01px;
  }
  .skill:not(:last-child)::after {
    content: ', ';
  }
</style>
