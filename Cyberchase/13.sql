SELECT "season", "episode_in_season", "title", "topic" FROM "episodes" WHERE NOT ("episode_in_season" > 3) AND NOT "season" > 5;
