<script lang="ts">
	import '../app.css';
	import MovieSvg from '$lib/components/svgs/movieSVG.svelte';
	let { children } = $props();
</script>

<svelte:head>
  <title>MoviePickerPal</title>
</svelte:head>

<div class="bg-bluegray h-dvh">
	<div
		class="bg-oxford-blue justify-left flex h-16 w-screen items-center p-1.5 shadow shadow-black"
	>
		<a href="/">
			<div class="pl-8" aria-label="movie reel icon">
				<MovieSvg fill="#FFFFFF" classes="size-18 stroke-white fill-bluegray" />
			</div>
		</a>
		<a href="/">
			<div><p class="prose text-2xl text-gray-300">MoviePickerPal</p></div>
		</a>
	</div>

	{@render children()}
</div>
