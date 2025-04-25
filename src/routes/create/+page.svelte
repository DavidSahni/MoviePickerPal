<script lang="ts">
	import MovieInput from '$lib/components/movieInput.svelte';
	import MovieList from '$lib/components/movieList.svelte';
	import StandardTextButton from '$lib/components/buttons/standardTextButton.svelte';
	import { GetRandomByLength } from '$lib/utils/randomUtils';
	import { time } from 'drizzle-orm/mysql-core';
	import { ConsoleLogWriter } from 'drizzle-orm';
	//todo hitting select with no options in window breaks page
	let testArray = [
		'Harry Potter 1',
		'The Brutalist',
		'Aladdin',
		'Indiana Johns and the Crystal Skull',
		'How to Train Your Dragon',
		'Anora',
		'Mickey 17',
		'Midsommar',
		'Flow',
		'Conclave'
	];

	let movieList: Array<string> = $state([]);
	let selection = $state('');
	let onSubmitClick = (movie: string) => {
		movieList.push(movie);
	};

	let onDeleteClick = (movie: string) => {
		let toRemove = movieList.indexOf(movie);
		movieList.splice(toRemove, 1);
	};

	let onClearClick = () => {
		movieList = [];
	};

	let elapsed = 0;
	let prevRandom = -1;
	let onSelectClick = () => {
		if (movieList.length == 0) {
			return;
		}
		if (movieList.length == 1) {
			selection = movieList[0] + '!!!!';
			return;
		}
		const movieSelected = movieList[GetRandomByLength(movieList.length)];
		let timeOutFunction = (interval: number) => {
			if (elapsed >= 4000) {
				selection = movieSelected + '!!!!';
				elapsed = 0;
				prevRandom = -1;
			} else {
				let random = GetRandomByLength(movieList.length);
				while (random == prevRandom) {
					random = GetRandomByLength(movieList.length);
				}
				prevRandom = random;
				let movie = movieList[random];
				selection = movie;
				elapsed += interval;
				if (elapsed < 2500) {
					setTimeout(() => timeOutFunction(50), 50);
				} else {
					setTimeout(() => timeOutFunction(200), 200);
				}
			}
		};
		setTimeout(() => timeOutFunction(50), 50);
	};
	// $inspect(movieList);
</script>

<div class="my-16 flex w-full flex-wrap items-center justify-center gap-5">
	<div class=" flex min-h-8 w-full justify-center">
		<p class="prose text-xl font-bold">{selection}</p>
	</div>
	<div class="grid grid-cols-2 items-center justify-center gap-5">
		<div>
			<MovieList movies={movieList} onDelete={onDeleteClick} />
		</div>
		<div>
			<MovieInput onClick={onSubmitClick} />
		</div>
		<div class="flex justify-end">
			<StandardTextButton text="Clear" onClick={onClearClick} />
		</div>
		<div class="">
			<StandardTextButton text="Select!" onClick={onSelectClick} disabled={movieList.length == 0} />
		</div>
	</div>
</div>
