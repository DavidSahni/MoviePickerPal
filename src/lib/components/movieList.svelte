<script lang="ts">
	import IconDelete from 'virtual:icons/mdi/trash-outline';
	interface Props {
		movies: Array<string>;
		onDelete: ((movie: string) => void) | null;
	}
	let { movies, onDelete }: Props = $props();
</script>

<div class="flex min-h-96 min-w-80 items-center rounded border border-gray-400 bg-gray-300 p-2">
  <ol class="w-full">
		{#each movies as movie}
			<li>
				<div class="flex items-center gap-2">
					<div class="w-10/10">
						<p class="prose text-lg">{movie}</p>
					</div>
					{#if onDelete !== null}
						<div class="flex items-center">
							<button
								onclick={() => onDelete(movie)}
								class="rounded-full border-0 hover:cursor-pointer hover:bg-gray-100"
							>
								<IconDelete class="text-xl" />
							</button>
						</div>
					{/if}
				</div>
			</li>
		{/each}
	</ol>
</div>
