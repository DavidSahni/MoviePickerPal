<script lang="ts">
	import MovieInput from '$lib/components/movieInput.svelte';
	import MovieList from '$lib/components/movieList.svelte';
	let movieList: Array<string> = $state([]);

	let onSubmitClick = (movie: string) => {
		movieList.push(movie);
	};
</script>

<div class="flex h-8/10 w-full flex-row items-center justify-center gap-5">
	<div class="ml-12">
		<MovieList movies={movieList} />
	</div>
	<div class="">
		<MovieInput onClick={onSubmitClick} />
	</div>
</div>
