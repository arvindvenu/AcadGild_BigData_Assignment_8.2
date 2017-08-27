-- FLATTEN operator
-- problem statement: The shows are listed as show name and inner bag of episode names.
-- Need to flatten as tuples of show name and episode name

-- load the shows
shows = LOAD '../input/shows.txt' AS (show_name:chararray, episodes:bag{(episode_name:chararray)});

/*
flatten the episodes so that each tuple in the relation will have 
an show name and episode name pair
*/
show_episode = FOREACH shows GENERATE show_name, FLATTEN(episodes) AS episode_name;

-- store the flattened output in local file system
STORE show_episode INTO '../output/task_9' USING PigStorage(',');

