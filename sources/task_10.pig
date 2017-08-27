-- FLATTEN operator
-- problem statement: Filter out shows that have episodes bag as empty

-- load the shows
shows = LOAD '../input/shows.txt' AS (show_name:chararray, episodes:bag{(episode_name:chararray)});

/*
Filter out all shows which have episodes inner bag as empty
*/
shows_with_zero_episodes = FILTER shows BY IsEmpty(episodes);

show_name_with_zero_episodes = FOREACH shows_with_zero_episodes GENERATE show_name;

-- store the flattened output in local file system
STORE show_name_with_zero_episodes INTO '../output/task_10';

