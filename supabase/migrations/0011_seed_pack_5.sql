-- Migration 0011: Seed Pack 5 (Decks 24-30, 4 questions each)
-- Decks: Holidays & Seasons, Party Themes, Board Games, Ice Cream & Desserts, Weather Preferences, Study & Focus Habits, Sports to Watch

do $$
declare
  d_id uuid;
  r_id uuid;
  o1 uuid; o2 uuid; o3 uuid;
begin

  -- 24. Holidays & Seasons
  insert into decks (id, slug, title) values (gen_random_uuid(), 'holidays-seasons', 'Holidays & Seasons') returning id into d_id;
  
  -- Q1: Halloween / Christmas / New Year's Eve
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Spooky Halloween', '🎃') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cozy Christmas Morning', '🎄') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'New Years Eve Fireworks', '🎆') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Crisp Autumn / Sunny Summer / Fresh Spring
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Golden Autumn Foliage', '🍂') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Endless Summer Sunshine', '☀️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Blooming Spring Breeze', '🌸') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Thanksgiving Feast / 4th of July BBQ / Valentine Dinner
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Thanksgiving Turkey Feast', '🦃') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Summer Cookout BBQ', '🍔') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Candlelight Valentine Meal', '🕯️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Snow Day Off / Summer Festival / Spring Road Trip
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Blizzard Snow Day Off', '❄️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Open Air Music Fest', '🎪') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Coastline Spring Cruise', '🚘') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 25. Party Themes
  insert into decks (id, slug, title) values (gen_random_uuid(), 'party-themes', 'Party Themes') returning id into d_id;
  
  -- Q1: 80s Neon Rave / Masquerade Ball / Hawaiian Luau
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), '80s Retro Neon Rave', '🪩') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Mysterious Masquerade', '🎭') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Tropical Island Luau', '🌺') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Great Gatsby 1920s / Sci-Fi Galactic / Wild Western Saloon
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), '1920s Gatsby Speakeasy', '🍸') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Galactic Cyber Party', '🛸') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Wild West Saloon', '🤠') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Backyard Pool Bash / Silent Disco / Murder Mystery Dinner
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sunny Pool Float Party', '🏊') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Silent Headphone Disco', '🎧') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Murder Mystery Manor', '🔍') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Live DJ Set / Live Cover Band / Acoustic Camp Jam
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'High-Energy DJ Set', '🎧') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Live 4-Piece Cover Band', '🎸') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fireside Jam Session', '🪕') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 26. Board Games
  insert into decks (id, slug, title) values (gen_random_uuid(), 'board-games', 'Board Games') returning id into d_id;
  
  -- Q1: Catan / Monopoly / Scrabble
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Settlers of Catan', '🌾') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Monopoly Empire', '🎩') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Scrabble Word Duel', '🔤') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Chess / Risk Global Domination / Clue
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Grandmaster Chess', '♟️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Risk World Conquest', '🗺️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Clue Detective Game', '🔎') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Codenames / Uno / Jenga
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Codenames Spy Clues', '🕵️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Uno Draw 4 Chaos', '🃏') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Giant Jenga Tower', '🪵') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Dungeons & Dragons / Poker Night / Trivia Night
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Tabletop D&D Campaign', '🐉') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Texas Holdem Poker', '♠️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Pub Trivia Team Duel', '🧠') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 27. Ice Cream & Desserts
  insert into decks (id, slug, title) values (gen_random_uuid(), 'ice-cream-desserts', 'Ice Cream & Desserts') returning id into d_id;
  
  -- Q1: Mint Chocolate Chip / Pistachio / Salted Caramel
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Mint Chocolate Chip Scoop', '🍃') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Roasted Pistachio Gelato', '🍨') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Salted Caramel Crunch', '🍯') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Warm Lava Cake / Tiramisu / Mango Sticky Rice
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Molten Chocolate Lava Cake', '🍫') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Espresso Tiramisu', '☕') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Coconut Mango Sticky Rice', '🥭') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Waffle Cone / Glass Sundae Bowl / Sandwich Wafer
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cinnamon Waffle Cone', '🍦') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Banana Split Bowl', '🍌') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Artisan Ice Cream Sandwich', '🍪') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: French Macarons / Japanese Mochi / Cinnamon Churros
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Pastel French Macarons', '🧁') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sweet Strawberry Mochi', '🍡') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Crispy Sugar Churros', '🥖') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 28. Weather Preferences
  insert into decks (id, slug, title) values (gen_random_uuid(), 'weather-preferences', 'Weather Preferences') returning id into d_id;
  
  -- Q1: Rainy Thunderstorm / Bright Sunny Sky / Heavy Snowfall
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Rainy Night Thunderstorm', '⛈️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Clear Blue Sky 75°F', '☀️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Silent Heavy Snowfall', '❄️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Autumn Breeze 60°F / Tropical Warmth 85°F / Crisp Cold 40°F
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Hoodie Weather 60°F', '🍂') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Swimwear Heat 85°F', '🌴') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Scarf & Coat Cold 40°F', '🧣') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Morning Mountain Fog / Ocean Seabreeze / Desert Sunset
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Mystic Mountain Fog', '🌫️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fresh Salty Seabreeze', '🌊') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Purple Desert Sunset', '🏜️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Coffee Inside on Rainy Day / Sunbathing at Park / Stargazing on Clear Night
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Window Rain & Warm Mug', '☕') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Park Grass Sunbath', '🧺') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Midnight Galaxy Stargaze', '✨') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 29. Study & Focus Habits
  insert into decks (id, slug, title) values (gen_random_uuid(), 'study-focus-habits', 'Study & Focus Habits') returning id into d_id;
  
  -- Q1: Bustling Coffee Shop / Dead Silent Library / Bedroom Desk
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Bustling Cafe Ambiance', '☕') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Dead Silent Law Library', '📚') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Dark Bedroom Setup', '🖥️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Lofi Hip-Hop Beats / Complete Silence / Heavy White Noise
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Lofi Chillhop Radio', '🎧') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Absolute Pin-Drop Silence', '🤫') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Rain & Brown Noise Loop', '🌧️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Pomodoro 25/5 / 4-Hour Flow State / Last-Minute Deadline Rush
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Structured 25-Min Pomodoro', '🍅') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Unbroken 4-Hour Hyperfocus', '🧠') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), '3 AM Adrenaline Deadline Rush', '⚡') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Paper Notebook & Pen / Dual Monitor Notion / iPad Stylus
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Hardcover Moleskine & Ink', '📓') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Digital Workspace & Markdown', '💻') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Tablet Handwriting & Canvas', '📱') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 30. Sports to Watch
  insert into decks (id, slug, title) values (gen_random_uuid(), 'sports-to-watch', 'Sports to Watch') returning id into d_id;
  
  -- Q1: World Cup Soccer / Super Bowl Football / NBA Finals
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'FIFA World Cup Final', '⚽') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Super Bowl Sunday', '🏈') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'NBA Finals Game 7', '🏀') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Formula 1 Racing / UFC Fight Night / Wimbledon Tennis
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Formula 1 Monaco GP', '🏎️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'UFC Main Card Octagon', '🥊') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Wimbledon Grass Final', '🎾') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Summer Olympics 100m / Winter Olympics Snowboarding / Extreme X-Games
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Olympic 100m Sprint', '🥇') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Halfpipe Snowboard Airs', '🏂') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'X-Games Skate Vert', '🛹') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Front Row Stadium / Sports Bar with Friends / 4K OLED at Home
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Roaring 80,000 Stadium Crowd', '🏟️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Packed Sports Bar & Wings', '🍻') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Comfy Couch Replay Screen', '📺') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

end $$;
