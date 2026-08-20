-- Migration 0008: Seed Pack 2 (Decks 1-7, 4 questions each)
-- Decks: Breakfast Battles, Superpowers, Vacation Vibes, Retro Gaming, Sweet Tooth, Weekend Plans, Fictional Worlds

do $$
declare
  d_id uuid;
  r_id uuid;
  o1 uuid; o2 uuid; o3 uuid;
begin

  -- 1. Breakfast Battles
  insert into decks (id, slug, title) values (gen_random_uuid(), 'breakfast-battles', 'Breakfast Battles') returning id into d_id;
  
  -- Q1: Pancakes / Waffles / Bagel
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Pancakes', '🥞') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Waffles', '🧇') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Bagel', '🥯') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Fried Egg / Scrambled Egg / Omelette
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fried Egg', '🍳') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Scrambled Egg', '🥚') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Omelette', '🍳') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Coffee / Tea / Orange Juice
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Morning Coffee', '☕') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Green Tea', '🍵') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Orange Juice', '🥤') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Bacon / Sausage / Toast
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Crispy Bacon', '🥓') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sausage', '🌭') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Avocado Toast', '🍞') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 2. Superpowers
  insert into decks (id, slug, title) values (gen_random_uuid(), 'superpowers', 'Superpowers') returning id into d_id;
  
  -- Q1: Flight / Invisibility / Time Travel
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Flight', '🦸') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Invisibility', '👻') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Time Travel', '⏳') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Super Strength / Super Speed / Mind Reading
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Super Strength', '💪') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Super Speed', '⚡') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Mind Reading', '🧠') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Fire Control / Ice Control / Lightning Control
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fire Control', '🔥') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ice Control', '❄️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Lightning Control', '⚡') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Healing Touch / Invincibility / Water Control
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Healing Touch', '🩹') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Invincibility', '🛡️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Water Control', '🌊') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 3. Vacation Vibes
  insert into decks (id, slug, title) values (gen_random_uuid(), 'vacation-vibes', 'Vacation Vibes') returning id into d_id;
  
  -- Q1: Beach / Mountains / City
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sunny Beach', '🏖️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Alpine Mountains', '🏔️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Metropolis City', '🏙️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Camping / Hotel / Airbnb
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Wilderness Camping', '⛺') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Luxury Hotel', '🏨') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cozy Airbnb', '🏠') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Fly / Road Trip / Train
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Flight Travel', '✈️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Road Trip', '🚗') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Scenic Train', '🚂') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Tropical / Snowy / Desert
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Tropical Island', '🌴') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Snowy Resort', '❄️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Desert Oasis', '🏜️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 4. Retro Gaming
  insert into decks (id, slug, title) values (gen_random_uuid(), 'retro-gaming', 'Retro Gaming') returning id into d_id;
  
  -- Q1: Arcade / Console / PC
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Retro Arcade', '🕹️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Home Console', '🎮') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Gaming PC', '💻') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Platformer / Racing / RPG
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Platformer', '👾') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Racing Sim', '🏎️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Epic RPG', '⚔️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Board Games / Card Games / Puzzle Games
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Board Game Night', '🎲') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Deck Cards', '🃏') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Puzzle Games', '🧩') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: 8-Bit / 16-Bit / Modern 3D
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), '8-Bit Pixel', '🕹️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), '16-Bit Sprite', '🎨') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Modern Raytracing', '✨') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 5. Sweet Tooth
  insert into decks (id, slug, title) values (gen_random_uuid(), 'sweet-tooth', 'Sweet Tooth') returning id into d_id;
  
  -- Q1: Dark Chocolate / Gummy Candy / Lollipop
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Dark Chocolate', '🍫') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Gummy Bears', '🍬') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Lollipop', '🍭') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Glazed Donut / Cupcake / Choco Cookie
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Glazed Donut', '🍩') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cupcake', '🧁') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Choco Cookie', '🍪') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Soft Serve / Hot Fudge Sundae / Thick Milkshake
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Soft Serve', '🍦') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fudge Sundae', '🍨') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Thick Milkshake', '🥤') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Berry Pie / Birthday Cake / Vanilla Pudding
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Berry Pie', '🥧') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Birthday Cake', '🎂') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Vanilla Pudding', '🍮') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 6. Weekend Plans
  insert into decks (id, slug, title) values (gen_random_uuid(), 'weekend-plans', 'Weekend Plans') returning id into d_id;
  
  -- Q1: Stay In / Go Out / Go Hiking
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Stay In & Chill', '🛋️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Go Out Dancing', '🎉') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Go Hiking', '🚶') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Read a Book / Watch a Movie / Play Games
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Read a Book', '📚') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Movie Marathon', '🎬') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Multiplayer Games', '🎮') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Cook at Home / Eat Out / Order Delivery
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cook Gourmet at Home', '🍳') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fine Dining Out', '🍽️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Order Delivery', '🚚') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Saturday Morning Sleep / Early Workout / Farmers Market
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sleep In Late', '😴') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sunrise Workout', '🏃') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Farmers Market', '🥑') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 7. Fictional Worlds
  insert into decks (id, slug, title) values (gen_random_uuid(), 'fictional-worlds', 'Fictional Worlds') returning id into d_id;
  
  -- Q1: Fantasy Kingdom / Space Colony / Cyberpunk City
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fantasy Kingdom', '🧙') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Deep Space Colony', '🚀') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cyberpunk Metropolis', '🏙️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Dragons / Aliens / Zombies
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fire Dragons', '🐉') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cosmic Aliens', '👽') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Zombie Apocalypse', '🧟') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Medieval Knight / Cyborg / Elf Archer
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Medieval Knight', '⚔️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Battle Android', '🤖') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Elf Archer', '🧝') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Magic Wand / Lightsaber / Portal Gun
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Magic Wand', '🪄') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Laser Blade', '⚔️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Portal Gun', '🌀') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

end $$;
