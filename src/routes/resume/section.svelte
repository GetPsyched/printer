<script lang="ts">
  export let name: string;
</script>

<div class="section">
  <div class="header">
    {name}
  </div>
  <div class="children">
    <slot />
  </div>
</div>

<style>
  .section:not(:first-child) {
    margin-top: 20pt;
  }

  .header {
    color: var(--pr);
    font-weight: 700;
    font-size: var(--fsz-h1);
  }

  .children {
    display: flex;
    flex-direction: column;
    /* gap: 10px; */
  }
  .children > :global(*):not(.hidden) {
    margin-top: 10pt;
  }
</style>
