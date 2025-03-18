<script lang="ts">
  import IconDelete from "virtual:icons/mdi/trash-outline";
	interface Props {
		movies: Array<string>,
    onDelete: ((movie: string) => void)|null;
	}
	let { movies, onDelete }: Props = $props();
</script>

<div class="bg-gray-300 p-2 border border-gray-400 rounded min-w-80 min-h-96 flex items-center">
  <ol class="w-full">
    {#each movies as movie}
      <li>
        <div class="flex items-center gap-2">
          <div class="w-10/10">
            <p class="prose text-lg">{movie}</p>
          </div>
          {#if onDelete !== null}
            <div class="flex items-center">
              <button onclick={() => onDelete(movie)}
              class="hover:bg-gray-100 hover:cursor-pointer border-0 rounded-full">
                <IconDelete class="text-xl"/>
              </button>
            </div>
          {/if}
      </div>
      </li>
    {/each}
  </ol>
</div>
