<script lang="ts">
	import MovieInput from '$lib/components/movieInput.svelte';
	import MovieList from '$lib/components/movieList.svelte';
  import StandardTextButton from '$lib/components/buttons/standardTextButton.svelte';
  import { GetRandomByLength } from '$lib/utils/randomUtils';
	import { time } from 'drizzle-orm/mysql-core';
	import { ConsoleLogWriter } from 'drizzle-orm';

  let testArray = ['Harry Potter 1', 'The Brutalist', 'Aladdin', 'Indiana Johns and the Crystal Skull', 'How to Train Your Dragon', 'Anora',
    'Mickey 17', 'Midsommar', 'Flow', 'Conclave'
  ];

	let movieList: Array<string> = $state([]);
  let selection = $state("");
	let onSubmitClick = (movie: string) => {
		movieList.push(movie);
	};

  let onDeleteClick = (movie: string) => {
    console.log("CALLED");
    let toRemove = movieList.indexOf(movie);
    movieList.splice(toRemove, 1);
  }

  let onClearClick = () => {
    movieList = [];
  }

  let intervalId: any;
  let elapsed = 0;
  let prevRandom = -1;
  let onSelectClick = () => {
    if (movieList.length == 1){
      selection = movieList[0] + '!!!!';
      return;
    }
    const movieSelected = movieList[GetRandomByLength(movieList.length)];
    let timeOutFunction = (interval : number) => {
      if (elapsed >= 4000){
        selection = movieSelected + '!!!!';
        elapsed = 0;
        prevRandom = -1;
      }else {
        let random = GetRandomByLength(movieList.length);
        while (random == prevRandom){
          random = GetRandomByLength(movieList.length);
        }
        prevRandom = random;
        let movie = movieList[random];
        selection = movie;
        elapsed += interval;
        if (elapsed < 2500){
          setTimeout(() => timeOutFunction(50), 50);
        }else {
          setTimeout(() => timeOutFunction(200), 200);
        }
      }
    }
    setTimeout(() => timeOutFunction(50), 50);
  }
  $inspect(movieList);
</script>

<div class="flex flex-wrap w-full gap-5 items-center justify-center my-16">
  <div class=" w-full min-h-8 flex justify-center">
    <p class="prose font-bold text-xl">{selection}</p>
  </div>
  <div class="grid grid-cols-2 justify-center items-center gap-5">
    <div >
      <MovieList movies={movieList} onDelete={onDeleteClick}/>
    </div>
    <div>
      <MovieInput onClick={onSubmitClick} />
    </div>
    <div class="flex justify-end">
      <StandardTextButton text="Clear" onClick={onClearClick}/>
    </div>
    <div class="">
      <StandardTextButton text="Select!" onClick={onSelectClick}/>
    </div>
  </div>
</div>

