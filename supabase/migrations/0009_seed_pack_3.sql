-- Migration 0009: Seed Pack 3 (Decks 8-15, 4 questions each)
-- Decks: Music Moods, Pets & Companions, Tech Gadgets, Movie Night, Dream Job, Fitness Style, World Travel, Comfort Food

do $$
declare
  d_id uuid;
  r_id uuid;
  o1 uuid; o2 uuid; o3 uuid;
begin

  -- 8. Music Moods
  insert into decks (id, slug, title) values (gen_random_uuid(), 'music-moods', 'Music Moods') returning id into d_id;
  
  -- Q1: Rock / Pop / Hip-Hop
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Rock Anthem', '🎸') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Pop Hit', '🎹') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Hip-Hop Beat', '🎤') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Classical / Jazz / Electronic
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Symphony Classical', '🎻') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Late Night Jazz', '🥁') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'EDM Festival', '🎧') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Live Concert / Vinyl Record / Wireless Earbuds
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Live Stadium Concert', '🎙️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Vintage Vinyl', '📻') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Noise-Canceling Earbuds', '🎧') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Acoustic Guitar / Piano Solo / Saxophone
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Acoustic Guitar', '🪕') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Grand Piano', '🎹') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Smooth Saxophone', '🎷') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 9. Pets & Companions
  insert into decks (id, slug, title) values (gen_random_uuid(), 'pets-companions', 'Pets & Companions') returning id into d_id;
  
  -- Q1: Dog / Cat / Rabbit
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Playful Dog', '🐶') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Independent Cat', '🐱') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fluffy Rabbit', '🐰') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Fish Tank / Songbird / Pet Turtle
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Exotic Fish Aquarium', '🐠') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Singing Canary', '🐦') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Slow Pet Turtle', '🐢') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Horse / Colorful Parrot / Chubby Hamster
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ranch Horse', '🐴') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Talking Parrot', '🦜') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Chubby Hamster', '🐹') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Golden Retriever / French Bulldog / Husky
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Golden Retriever', '🐕') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'French Bulldog', '🐶') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Snow Husky', '🐺') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 10. Tech Gadgets
  insert into decks (id, slug, title) values (gen_random_uuid(), 'tech-gadgets', 'Tech Gadgets') returning id into d_id;
  
  -- Q1: Smartphone / Laptop / Smartwatch
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Flagship Smartphone', '📱') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ultrabook Laptop', '💻') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Fitness Smartwatch', '⌚') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Over-Ear ANC / Mirrorless Cam / Handheld Console
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Studio Over-Ear Headphones', '🎧') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Mirrorless Camera', '📷') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Portable Gaming Device', '🎮') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Multi-Monitor Rig / Drawing Tablet / Spatial VR
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Multi-Monitor BattleStation', '🖥️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Stylus Pen Tablet', '📱') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Spatial VR Headset', '🕶️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Smart Speaker / Robot Vacuum / Smart Lighting
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'AI Home Speaker', '🔊') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Robot Vacuum', '🤖') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ambient Smart RGB', '💡') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 11. Movie Night
  insert into decks (id, slug, title) values (gen_random_uuid(), 'movie-night', 'Movie Night') returning id into d_id;
  
  -- Q1: Comedy Special / Supernatural Horror / Action Blockbuster
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Laugh-Out-Loud Comedy', '😂') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Haunting Horror', '😱') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Explosive Action', '💥') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Gripping Drama / Space Sci-Fi / Rom-Com
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Gripping Drama', '🎭') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cosmic Sci-Fi', '🚀') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sweet Rom-Com', '💘') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Buttered Popcorn / Hot Cheese Nachos / Theater Red Vines
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Extra-Butter Popcorn', '🍿') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Jalapeno Nacho Box', '🧀') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cinema Licorice & Candy', '🍬') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: IMAX Front Row / Private Screening / Outdoor Starlight
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Giant IMAX Dome', '🕶️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cozy Home Projector', '🛋️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Moonlight Drive-In', '🚗') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 12. Dream Job
  insert into decks (id, slug, title) values (gen_random_uuid(), 'dream-job', 'Dream Job') returning id into d_id;
  
  -- Q1: Digital Illustrator / Software Architect / Surgeon
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Concept Artist', '🎨') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Lead Software Engineer', '👨‍💻') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Trauma Surgeon', '👨‍⚕️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Astronaut / Hollywood Director / Rock Star
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Mars Astronaut', '🚀') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Film Director', '🎬') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Touring Rock Star', '🎤') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Travel Influencer / Michelin Chef / Fantasy Novelist
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Globe-Trotter Blogger', '🏝️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Michelin-Star Chef', '👨‍🍳') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Bestselling Novelist', '📚') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Wildlife Photographer / Architect / Pilot
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Safari Photographer', '📷') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Skyscraper Architect', '📐') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Commercial Jet Captain', '✈️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 13. Fitness Style
  insert into decks (id, slug, title) values (gen_random_uuid(), 'fitness-style', 'Fitness Style') returning id into d_id;
  
  -- Q1: Heavy Weightlifting / Marathon Running / Flow Yoga
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Heavy Barbell Lifting', '🏋️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Trail Running', '🏃') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Mindful Yoga Flow', '🧘') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Road Cycling / Lap Swimming / Muay Thai Boxing
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Road Cycling', '🚴') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Olympic Swimming', '🏊') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Kickboxing & Heavy Bag', '🥊') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Basketball 5v5 / Downhill Skiing / Crossfit Group
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Pickup Basketball', '🏀') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Downhill Skiing', '🎿') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'High-Intensity Bootcamp', '🤸') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: 5 AM Early Workout / Midnight Gym Session / Lunch Break Workout
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), '5 AM Dawn Grind', '🌅') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Late Night Empty Gym', '🌙') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Midday Energy Boost', '⚡') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 14. World Travel
  insert into decks (id, slug, title) values (gen_random_uuid(), 'world-travel', 'World Travel') returning id into d_id;
  
  -- Q1: Paris / New York / Tokyo
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Paris, France', '🗼') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'New York City, USA', '🗽') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Tokyo, Japan', '🏯') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Rome / Istanbul / San Francisco
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ancient Rome', '🏛️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Historic Istanbul', '🕌') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'San Francisco Bay', '🌉') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Bali Beaches / Swiss Alps / Dubai Skyline
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Bali Rice Terraces', '🏝️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Swiss Matterhorn Peaks', '🏔️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Futuristic Dubai', '🏜️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Kyoto Temples / Northern Lights in Iceland / Great Barrier Reef
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Kyoto Zen Gardens', '🌸') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Iceland Aurora Lights', '🌌') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Coral Barrier Reef', '🐠') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 15. Comfort Food
  insert into decks (id, slug, title) values (gen_random_uuid(), 'comfort-food', 'Comfort Food') returning id into d_id;
  
  -- Q1: Woodfired Pizza / Smash Burger / Street Taco
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Woodfired Pepperoni Pizza', '🍕') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Double Smash Burger', '🍔') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Birria Beef Tacos', '🌮') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Tonkotsu Ramen / Truffle Pasta / Butter Chicken Curry
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Tonkotsu Pork Ramen', '🍜') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Truffle Cream Pasta', '🍝') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Rich Butter Chicken', '🍛') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Club Sandwich / Loaded Burrito / Falafel Wrap
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Triple-Decker Club Sandwich', '🥪') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Loaded Carnitas Burrito', '🌯') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Crispy Falafel Pita', '🥙') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Clam Chowder / Beef Stew / Kimchi Fried Rice
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Creamy Clam Chowder', '🍲') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Slow-Cooked Beef Stew', '🥘') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Kimchi Egg Fried Rice', '🍚') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

end $$;
