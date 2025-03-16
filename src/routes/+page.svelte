<script lang="ts">
  import MovieSvg from "$lib/components/svgs/movieSVG.svelte";
</script>

<div class="flex h-8/10 flex-row gap-5 w-full justify-center items-center">
  <div class="size-64">
    <a href="/create">
      <icon>
        <MovieSvg fill="#00000" classes="size-64"/>
      </icon>
    </a>
  </div>
  <div class="w-64">
    <p class="prose text-lg">
      Welcome to MoviePickerPal!<br/>
      Click on the icon to the left to start creating a list of movies.
    </p>
  </div>
</div>
