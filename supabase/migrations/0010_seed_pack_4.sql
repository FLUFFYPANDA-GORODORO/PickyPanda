-- Migration 0010: Seed Pack 4 (Decks 16-23, 4 questions each)
-- Decks: Streaming Binge, Coffee & Tea Orders, Morning Routine, Creative Hobbies, City vs Nature, Fashion Style, Car Types, Musical Instruments

do $$
declare
  d_id uuid;
  r_id uuid;
  o1 uuid; o2 uuid; o3 uuid;
begin

  -- 16. Streaming Binge
  insert into decks (id, slug, title) values (gen_random_uuid(), 'streaming-binge', 'Streaming Binge') returning id into d_id;
  
  -- Q1: Stranger Things / The Bear / Succession
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Stranger Things', '🚲') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'The Bear', '👨‍🍳') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Succession', '💼') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Anime Series / True Crime Doc / Sitcom
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Shonen Anime', '⚡') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'True Crime Mystery', '🔍') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Comfort 20-Min Sitcom', '📺') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Weekly Release / Full Season Drop / 3-Episode Mini Series
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Weekly Episode Hype', '🗓️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'All-At-Once All-Nighter', '🍿') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Tight Limited Series', '🎬') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Subtitles Always On / Dubbed English / Pure Original Audio
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Subtitles Always On', '💬') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'English Voice Dub', '🎙️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Raw Audio No Subs', '🔊') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 17. Coffee & Tea Orders
  insert into decks (id, slug, title) values (gen_random_uuid(), 'coffee-tea-orders', 'Coffee & Tea Orders') returning id into d_id;
  
  -- Q1: Iced Caramel Latte / Cold Brew / Flat White
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Iced Caramel Oat Latte', '🧋') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Nitro Cold Brew', '🧊') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Velvety Flat White', '☕') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Matcha Latte / Chai Latte / London Fog
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ceremonial Matcha Latte', '🍵') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Spiced Chai Latte', '🫖') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Earl Grey London Fog', '🍋') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Oat Milk / Almond Milk / Whole Milk
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Creamy Oat Milk', '🌾') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Nutty Almond Milk', '🥜') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Classic Whole Milk', '🥛') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Dark Roast Espresso / Pour Over Chemex / French Press
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Double Shot Espresso', '⚡') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Artisanal Pour-Over', '🧪') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Heavy French Press', '🫖') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 18. Morning Routine
  insert into decks (id, slug, title) values (gen_random_uuid(), 'morning-routine', 'Morning Routine') returning id into d_id;
  
  -- Q1: Cold Shower / 10-Min Meditation / 5-Mile Run
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Shock Cold Shower', '🚿') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Silent Meditation', '🧘') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Brisk Morning Jog', '🏃') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Check Social Feeds / Read Journal / Stare at Ceiling
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Doomscroll In Bed', '📱') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Gratitude Journal', '✍️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Contemplate Existence', '🛏️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Fresh Breakfast Feast / Protein Shake / Black Coffee Only
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Hot Cooked Breakfast', '🍳') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Whey Protein Shake', '🥤') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Intermittent Fasting & Coffee', '☕') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: 1 Snooze / 5 Alarms / Up on 1st Beep
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Instant Wakeup First Beep', '⏰') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'The 9-Minute Snooze', '🛌') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Chaos of 7 Different Alarms', '🚨') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 19. Creative Hobbies
  insert into decks (id, slug, title) values (gen_random_uuid(), 'creative-hobbies', 'Creative Hobbies') returning id into d_id;
  
  -- Q1: Oil Painting / Pottery Wheel / Woodworking
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Oil Canvas Painting', '🎨') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ceramic Pottery Wheel', '🏺') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Woodworking & Carpentry', '🪵') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: 3D Printing / Leather Crafting / Knitting
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Resin 3D Printing', '🖨️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Custom Leatherwork', '🧰') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Wool Knitting & Crochet', '🧶') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Beatmaking / Screenplay Writing / Film Photography
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Synth Beat Production', '🎹') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Movie Screenwriting', '📜') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), '35mm Darkroom Photo', '🎞️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Sourdough Baking / Bonsai Gardening / Candle Making
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Artisanal Sourdough', '🍞') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Zen Bonsai Tree Sculpting', '🪴') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Aromatherapy Candle Pouring', '🕯️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 20. City vs Nature
  insert into decks (id, slug, title) values (gen_random_uuid(), 'city-vs-nature', 'City vs Nature') returning id into d_id;
  
  -- Q1: Penthouse Apartment / Forest Cabin / Beach Villa
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Skyline Penthouse', '🏙️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Deep Woods Log Cabin', '🪵') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cliffside Beach Villa', '🏖️') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: 24/7 Subway System / Mountain Bike Trail / Speedboat
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Late Night Metro Subway', '🚇') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ridge Mountain Bike', '🚵') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Lake Speedboat', '🚤') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Rooftop Lounge / Campfire Under Stars / Secret Waterfall
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Rooftop Cocktail Lounge', '🍸') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Stargazing Campfire', '🔥') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Hidden Mountain Waterfall', '🌊') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Concrete Jungle / Redwood Forest / Rolling Prairie
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Neon Skyscraper District', '🌆') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ancient Giant Redwoods', '🌲') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Endless Wildflower Valley', '🌾') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 21. Fashion Style
  insert into decks (id, slug, title) values (gen_random_uuid(), 'fashion-style', 'Fashion Style') returning id into d_id;
  
  -- Q1: Streetwear Hoodie / Tailored Suit / Vintage Thrift
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Oversized Streetwear', '🧥') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sharp Tailored Suit', '👔') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), '90s Vintage Thrift', '👖') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Fresh White Sneakers / Leather Chelsea Boots / Minimalist Loafers
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Crisp White Kicks', '👟') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Chelsea Leather Boots', '👢') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Classic Suede Loafers', '👞') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Minimal All-Black / Vibrant Bold Neon / Earth Tone Neutral
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'All-Black Minimalist', '🖤') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Bold Colorway Pop', '🎨') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Cozy Earth Tones', '🤎') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Designer Shades / Luxury Watch / Statement Trench Coat
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Dark Designer Sunglasses', '🕶️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Mechanical Swiss Watch', '⌚') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Long Wool Trench', '🧥') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 22. Car Types
  insert into decks (id, slug, title) values (gen_random_uuid(), 'car-types', 'Car Types') returning id into d_id;
  
  -- Q1: Electric Hypercar / V8 Muscle Car / Classic 60s Convertible
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Silent Electric Hypercar', '⚡') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Roaring V8 Muscle Car', '🏎️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), '1960s Vintage Roadster', '🚗') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: 4x4 Overland SUV / Track Superbike / Luxury Chauffeur Sedan
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Lifted 4x4 Overland Rig', '🚙') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Track Sport Motorcycle', '🏍️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Executive Luxury Sedan', '🚘') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Autobahn Speed Run / Desert Dune Bashing / Coastline Cruising
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'No-Limit Highway Blast', '🛣️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sahara Dune Drifting', '🏜️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Sunset Pacific Highway', '🌅') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Manual 6-Speed Stick / Dual-Clutch Paddle / Full Self-Driving
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Purist 6-Speed Manual', '🕹️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'F1 Paddle Shifter', '🏎️') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Hands-Off Autonomous AI', '🤖') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);


  -- 23. Musical Instruments
  insert into decks (id, slug, title) values (gen_random_uuid(), 'musical-instruments', 'Musical Instruments') returning id into d_id;
  
  -- Q1: Electric Lead Guitar / Acoustic Grand Piano / Full Drum Kit
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 1) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Screaming Lead Guitar', '🎸') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Concert Grand Piano', '🎹') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Full Acoustic Drum Set', '🥁') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q2: Cello / Trumpet / Flute
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 2) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Deep Resonant Cello', '🎻') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Bright Brass Trumpet', '🎺') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Ethereal Silver Flute', '🪈') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q3: Synthesizer Vocoder / Ukulele / Harmonica
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 3) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Modular Analog Synth', '🎛️') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Island Wooden Ukulele', '🪕') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Blues Harmonica', '🎶') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

  -- Q4: Slap Bass / Bagpipes / Harp
  insert into rounds (id, deck_id, round_order) values (gen_random_uuid(), d_id, 4) returning id into r_id;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Funk Slap Bass', '🎸') returning id into o1;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Highland Bagpipes', '🏴󠁧󠁢󠁳󠁣󠁴󠁿') returning id into o2;
  insert into options (id, label, emoji) values (gen_random_uuid(), 'Celestial Classical Harp', '🪉') returning id into o3;
  insert into round_options (round_id, option_id) values (r_id, o1), (r_id, o2), (r_id, o3);

end $$;
