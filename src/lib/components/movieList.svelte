<script lang="ts">
	interface Props {
		movies: Array<string>;
	}
	let { movies }: Props = $props();
</script>

<ol>
	{#each movies as movie}
		<li>
			{movie}
		</li>
	{/each}
</ol>
