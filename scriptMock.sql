
CREATE DATABASE [MOCK]
GO
USE [MOCK]
GO
/****** Object:  Table [dbo].[BookChapter]    Script Date: 19-Apr-22 11:53:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookChapter](
	[book_id] [int] NULL,
	[chapter_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 19-Apr-22 11:53:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ABookChapter]    Script Date: 19-Apr-22 11:53:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create view [dbo].[ABookChapter] as
select c.id,c.title,c.content,bc.book_id,bc.chapter_id 
from Chapter c join BookChapter bc on c.id = bc.chapter_id 
where bc.book_id = 1
GO
/****** Object:  View [dbo].[ABookChapter1]    Script Date: 19-Apr-22 11:53:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create view [dbo].[ABookChapter1] as
select c.id,c.title,c.content,bc.book_id,bc.chapter_id 
from Chapter c join BookChapter bc on c.id = bc.chapter_id
GO
/****** Object:  Table [dbo].[Book]    Script Date: 19-Apr-22 11:53:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[book_title] [nvarchar](max) NULL,
	[author] [nvarchar](max) NULL,
	[brief] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[genre] [nvarchar](250) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCase]    Script Date: 19-Apr-22 11:53:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCase](
	[book_case_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[book_id] [int] NULL,
	[book_case_name] [nvarchar](max) NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_BookCase] PRIMARY KEY CLUSTERED 
(
	[book_case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19-Apr-22 11:53:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookCase]  WITH CHECK ADD  CONSTRAINT [FK_BookCase_Book] FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[BookCase] CHECK CONSTRAINT [FK_BookCase_Book]
GO
ALTER TABLE [dbo].[BookCase]  WITH CHECK ADD  CONSTRAINT [FK_BookCase_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BookCase] CHECK CONSTRAINT [FK_BookCase_User]
GO
ALTER TABLE [dbo].[BookChapter]  WITH CHECK ADD  CONSTRAINT [FK_BookChapter_Book] FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[BookChapter] CHECK CONSTRAINT [FK_BookChapter_Book]
GO
ALTER TABLE [dbo].[BookChapter]  WITH CHECK ADD  CONSTRAINT [FK_BookChapter_Chapter] FOREIGN KEY([chapter_id])
REFERENCES [dbo].[Chapter] ([id])
GO
ALTER TABLE [dbo].[BookChapter] CHECK CONSTRAINT [FK_BookChapter_Chapter]
GO
ALTER DATABASE [MOCK] SET  READ_WRITE 
GO
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (1, N'The Wind in the Willows', N'Kenneth Grahame', N'The setting is set in the English countryside and the content revolves around the exciting adventures of animals living by the river. Grahame''s use of simple language and brilliant imagination make the book a spiritual treat for both adults and children.', N'https://kbimages1-a.akamaihd.net/bb8173ed-542c-4204-b8e6-56bb2d265c1a/1200/1200/False/the-wind-in-the-willows-220.jpg', N'Drammar')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (2, N'Lord of the Flies', N'William Golding', N'The story is about a group of young people isolated on a deserted island, isolated from the outside world. There, they established a new society with extremely brutal and strict principles. Golding uses language that is dramatic and engaging, making readers feel like they''re inside the story.', N'https://bizweb.dktcdn.net/100/326/228/products/lordoftheflieswilliamgolding.jpg?v=1540290999563', N'Action')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (3, N' The Old Man and the Sea', N'Ernest Hemingway', N'The story is about a brave old Cuban fisherman, and the battle against Marlin the giant fish.', N'https://cdn-amz.fadoglobal.io/images/I/6156MReb60L.jpg', N'Comedy')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (4, N'The Giver', N'Lois Lowry', N'The Giver is about a world where everything is perfect in a “uniform” way. All human beings are born with their respective positions arranged by the elders. Everything follows the law, there is no dispute, there is no riot, and there is no deception.', N'https://images-na.ssl-images-amazon.com/images/I/819XiIZg59L.jpg', N'Comedy')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (5, N'Charlotte’s Web', N'E. B. White', N'The content is about Wilbur the pig that was almost killed but was saved by the spider Charlotte.
The content is about Wilbur the pig that was almost killed but was saved by the spider Charlotte.
Nội dung kể về chú lợn Wilbur suýt bị giết nhưng được nhện Charlotte cứu.
The content is about Wilbur the pig who was almost killed but was rescued by the spider Charlotte.
Nội dung kể về chú lợn Wilbur suýt bị giết nhưng được nhện Charlotte cứu.
 Thanks to her intelligence, Charlotte knitted the spider''s web with messages of welcome to the pig, causing an owner to let him live.', N'https://cdn0.fahasa.com/media/catalog/product/9/7/9780064410939.jpg', N'Drammar')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (6, N'Adventures of Huckleberry Finn', N'Mark Twain', N'The story follows a boy named Huckleberry Finn who is adopted by a wealthy family. However, he did not feel happy living in an environment full of rules and rituals of the rich.', N'https://images-na.ssl-images-amazon.com/images/I/91cIE3bCZHL.jpg', N'Action')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (7, N'Harry Potter', N'J.K. Rowling', N'The story tells about the process of going to magical school of the wizard boy Harry Potter. Here he found for himself good friends and went through many ups and downs together.', N'https://i.pinimg.com/236x/32/f1/25/32f1258b33fe88843d7d4f2eb189db68--book-log-deathly-hallows.jpg', N'Advanture')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (8, N'Cuore', N'Edmondo De Amicis', N'Through this, children can learn meaningful moral lessons and understand the importance of parents and schools in their education.', N'https://images-na.ssl-images-amazon.com/images/I/61lTgfPTd9L.jpg', N'Comedy')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (9, N'Number the Stars', N'Lois Lowry', N'A ten year old girl with her best friend Ellen. The story is set during the period when the German Army began a "resettlement" campaign against the Jews in Denmark.', N'https://m.media-amazon.com/images/I/51LCU-JANQL.jpg', N'Drammar')
INSERT [dbo].[Book] ([book_id], [book_title], [author], [brief], [image], [genre]) VALUES (10, N'Robinson Crusoe', N'Daniel Defoe', N'Robinson Crusoe is about the adventures of a man named Robinson Crusoe. He is a boy with a great desire for the sea. However, things were extremely unfavorable for him. The sailings were all failures.', N'https://product.hstatic.net/200000343865/product/robinson-cruso_bia_4e692b3276944a20a49f9bb97198bce1_master.jpg', N'Advanture')

-----------------------------

INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (1, N'Chapter 1', N'The warmth from behind slowly surrounds, hot breath in the ear: "Afraid?"

The strange breath around the ears makes people so cold that they don''t dare to speak.

Lam Tu Lap felt like the man had slowed down a bit, then his voice sounded again: "It''s still time to regret it."

She nervously clenched her fists, shook her head: "I don''t regret ..."

She is in her prime, but…

This night is painful but long…

Finally, at midnight, the man got up and went to the bathroom. Only then did Lam Tu La pull his tired body and get dressed out of the room.

Downstairs of the hotel, there was a middle-aged woman who introduced this job to her standing there, saw Lam Tu Lap coming, she gave her a black bag: "This is your remuneration."

Lam Tu Lap accepted it almost without hesitation, took the money and quickly ran away, not even caring about the pain in his body, just wanted to go to the hospital as soon as possible.

The sky was still not bright, so the corridor was very quiet, on the ground in front of the operating room there were two ambulance stretchers, because they did not pay, they were not allowed to enter the operating room.

Lam Tu Lap looked at her heartbroken, sobbing and said: "I have money, hurry to save my mother and younger brother..." She choked on the money in her hand to the doctor, the doctor glanced at it and gave it to the nurse. inventory, then ask staff to bring the injured into the operating room.

Lam Tu Lap did not see them push his brother in, quickly jumped up to catch the doctor and begged: "And my brother too, please save him..."

The doctor sighed: "It''s too embarrassing, your brother can''t be saved anymore..."

“Can''t save anymore?!

This word was like a thunderclap that hit the head of Lam Tu Lap, making her eyes black...

Pain, chest pain like being harassed by a knife, painful to shiver sitting curled up on the ground, eight years ago, she was ten years old, her father had an affair, abandoned her mother, kicked her pregnant mother and she went abroad. strange.

After that, her brother was born. At the age of three, she was found to have autism. Life was already poor. Her brother''s illness was in constant trouble. She and her mother went to work for other people everywhere to live. day by day. But a traffic accident, in a foreign country with no relatives, no money, no one to help, makes her feel what is the same way.

Forced to the end, she sold herself and could not save her brother.

There was a pain, it wasn''t intense, but it made people feel uncomfortable, breathing was difficult, the sky was gray, but she had to accept it, she had to accept it with a smile, because she was still alive. mom.

Mom needs you.

After receiving treatment, her mother''s health improved, but when she learned that her brother was dead, she collapsed.

It was Lam Tu Lap who hugged her and cried, "Mom, you still have children, try to live a good life for me."

During a month at the hospital, Trang Kha Nguyet often sat by the bed, Lam Tu La knew that she missed her brother. If it weren''t for me, I''m afraid that her mother would have followed her brother, because she had to take care of her mother, she would have been expelled from school, but her mother''s wound had changed for the better.

She carried food to the hospital, reached the door of the hospital room, when she raised her hand and was about to open the door, she heard a voice inside...

She was very used to it, even after eight years, she still clearly remembered the look of him forcing her mother to divorce her.

After bringing them here, he never came to see them, what does it mean to suddenly appear here today?

"Kha Nguyet, in the past, she and the landlady of the Tong family were like sisters. They decided to be engaged from a young age, according to morality, the marriage she decided should be made by her daughter..."')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (2, N'Chapter 2', N'"Lin Vien Trung, what do you mean?!" Trang Kha Nguyet''s body was thin and thin, despite having wounds on her body, she struggled to get up to hit him, is he still human?

Arranged for her and her daughter to stay in this strange strange place, never cared about their life and death, today want her daughter to get married?

"The eldest son of the Tong family is also her good friend''s son, good-looking, you know that from the Tong family lineage, you can only enjoy being married there..." As he spoke behind, his voice softened.

The eldest son of the Tong family is really noble, handsome and polite, but a month ago, he went abroad to work and was bitten by a venomous snake, paralyzed, unable to act, can''t even do that. .

Marrying there is like being a widow.

"I take."

Lam Tu Lap suddenly pushed open the door, she stood in front of the door, her hands clasped tightly holding the rice box in her hand: "You can get married, but I have one condition."

Lam Vien Trung looked out the door and saw this eight-year-old daughter he hadn''t seen, panicking for a few seconds. When she brought her here, she was still a child of ten years old, now an adult, her skin is white, and very thin, her small face is not as big as the palm of her hand, dry and not bright. anyway, like not so well developed.

Doesn''t make people like the little girl in the house.

The unwillingness in her heart also decreased, anyway her appearance was not very beautiful, even if she married a husband who could not do that, she would not be too upset.

Thinking like that, Lam Vien Trung did not see anything bad: "What conditions, say it."

"I returned home with my mother, returned all of her mother''s things to us, I agreed to get married." Lam Tu Lap repeatedly clenched his fists, and gradually calmed down.

Although she is not in the country every year, she has heard of the Tong family of B city, a huge family with millions of millions in wealth, and the owner of the Tong family is naturally noble. Lam Tu Lap did not feel that such a good thing would come to him, maybe the eldest son of the Tong family was very ugly, or there was a defect in his body.

But even so, this is also a very good opportunity to return to her home country, make good use of it, and even regain the property that was her mother''s dowry.

"Lala ..." Trang Kha Nguyet wanted to advise her, big things like marriage can''t be played with.

She followed her grandmother and endured a lot of hardship, she couldn''t let her bring marriage in.

Lam Vien Trung heard that, worried that Lam Tu Lap, persuaded by Trang Kha Nguyet, would not want to get married, quickly said: "Okay, as long as you marry, I will let you go home."

"What about my mother''s dowry?" Lam Tu La looked at the father in his name, his voice was extremely cold.

Before, when Trang Kha Nguyet married him, he really had a lot of dowry, which is a large amount, now asking Lam Vien Trung to take it out makes him very uncomfortable.

“Dad, maybe my other sister is very beautiful, she should have something better, if she marries a man who has flaws in her body, her whole life will be over, not to mention he and my mother are divorced. , you should also return the money she took to the Lam family, right?"

Lam Vien Trung timidly avoided looking at her directly.

How do you know that the eldest son of the Tong family is an imperfect person?

Lam Vien Trung who knows Lam Tu La is just guessing.

Thinking that she had to marry an unusual man, Lam Vien Trung gritted his teeth: "I''ll give it to you when you get married."

His little daughter is like a flower like a pearl, how can you marry a man who can''t do that?

No matter how noble, not being able to do marriage is like a disabled person?

Thinking of this, Lam Vien Trung is not so upset anymore.

But in his heart, he hates Lam Tu La more than a few parts, only thinking about taking money from his hand.

Lam Vien Trung coldly looked at her: "Your mother really didn''t teach you properly, didn''t know how to be polite at all!"

Lam Tu Lap really wants to say that a father is not responsible? Throwing her here never mind.

But at this moment she can''t say, her advantage is too weak, angering Lam Vien Trung is not beneficial to her.

"Prepare a little, come back tomorrow." Lam Vien Trung waved his sleeve and left the hospital room.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (3, N'Chapter 3', N'"Lala, marriage is a big deal in life, I won''t let you do that." More or less Trang Kha Nguyet also knows Lam Tu La''s intentions.

Lam Tu Lap put the lunch box on the nightstand, took it out and said: "I don''t even marry outsiders, isn''t it the son of your mother''s friend."

"She died early, I don''t understand her son, even if I break my word, I want you to marry the person you like, not use marriage as an advantage, so, I''d rather stay here at all. life.”

The person I like?

Even if she could meet her anyway, she wouldn''t have the qualifications.

She lowered her head, it didn''t matter who she married, the important thing was to get back everything that was taken away.

Trang Kha Nguyet could not convince Lam Tu La to change his mind, the next day they immediately returned home.

Lam Vien Trung hates their mother and children, does not allow them to enter the door of the Lam family, but rents them a room outside, waiting for the wedding day, when Lam Tu La comes back.

Just or Lam Tu Lap doesn''t want to go back, returning, mother will have to face the concubine who destroys her marriage, compared to losing nature is not as good as staying here.

Quiet.

Trang Kha Nguyet is still very worried: "Lap Lap, if this was a good marriage, it wouldn''t have come to you, even though mother and grandmother used to have ... reciprocal affection."

Lam Tu Lap didn''t want to talk about these things with his mother, so he changed the subject: "Mom, hurry up and eat something."

Trang Kha Nguyet sighed, obviously Lam Tu Lap did not want to talk about this, she followed her to suffer, now even marriage has to be sacrificed.

Lam Tu Lap held chopsticks in his hand, but had no appetite and was still nauseous.

"Aren''t you comfortable?" Trang Kha Nguyet asked interested.

She did not want to worry her grandmother, saying that she had no appetite after sitting on the plane.

Put down your chopsticks and go to your room.

The room door closed, she leaned on the door panel, although she had never been pregnant, but she had seen the appearance when her mother was pregnant, she was also nauseated and did not eat well.

And her current situation is the same.

More than a month ago that night, her red light day was also ten days late…

She didn''t dare to think about it anymore, that night was already humiliating. If it weren''t for her mother and brother, she wouldn''t have sold herself.

She shivered…

"You''re pregnant, six weeks."

Out of the hospital, Lam Tu Lap''s mind still replayed the doctor''s words that she was pregnant.

Lam Tu La tricked Trang Kha Nguyet to go to the hospital to check, then the result was like that, her mood was very confused, I don''t know what to do now, give birth, or break?

Her hand couldn''t help but cover her stomach, surprised, even humiliating, but she still couldn''t help it.

There is a sense of joy, and anticipation, when first becoming a mother.

She panicked.

Returning to the residence, Lam Tu Lap hid the ultrasound paper B, then pushed the door open.

But Lam Vien Trung was also there, her face suddenly darkened.

What did he come to do?

Lam Vien Trung''s face was also not very good, it seems that because he did not see her, he made him wait for a long time, coldly said: "Go change clothes."

Lam Tu La frowned: "Why?"

"If you have to marry to the Tong family, you and the eldest son of the Tong family must also meet." Lam Vien Trung observed her from top to bottom: "Are you going to meet him dressed like this? Want to make me lose face?”')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (4, N'Chapter 4', N'It seems that Lam Vien Trung also thought of this, with a slightly embarrassed expression: "Let''s go, the Tong family is coming soon, it''s not convenient for them to wait."

"Lap ..." Trang Kha Nguyet was worried, still wanted to advise Lam Tu Lap, she had already lost her son, now she just wants to take good care of her daughter, money is no longer important.

I also don''t want my daughter to enter the Lam family, or the Tong family.

The rich are complicated, and they don''t even know what the eldest son of the Tong family looks like.

She worried.

"Mom." Lam Tu Lap gave her a comforting look, making her feel more secure.

"Hurry up." Lam Vien Trung impatiently urged, afraid that Lam Tu Lap would change his mind, he even pushed her.

Lam Vien Trung does not like her, she also has no feelings for this father.

Eight years, all blood ties are gone.

Lam Tu Lap''s clothes are really old, again having to meet the Tong family, Lam Vien Trung takes her to a luxury women''s clothing store, buys a makeshift outfit for her.

Entering the shop, there was also a staff member to welcome, Lam Vien Trung pushed Lam Tu Lap forward: "Get whatever she can wear."

The staff looked at her once, probably knew what number she was wearing: "Follow me."

The staff member held a long light blue dress and handed it to her: "You go to the fitting room and see."

Lam Tu La took it and went to the fitting room.

"Bai, do you have to marry the daughter of the Lam family?" The woman''s voice was vaguely filled with resentment.

Lam Tu Lap suddenly heard the voice, so she looked across the next room, through the gap in the door, she saw the woman hugging the man''s neck: "Can you not marry another girl? ?”

Tong Zhanbai looked at the woman, his eyes seemed to carry helplessness, this was the marriage decision his mother made for him, he couldn''t change his mind.

But thinking about that night, he couldn''t bear to let her down: "Was it painful that night?"

More than a month ago, he went abroad to a backward country to survey an item, the result was that he was bitten by a snake, its venom is very strong, if not poured out on a woman, it will dry up and die.

And Bach Lo Khiet, made the antidote for him.

He himself knew that at that time he could not control how much.

Everyone says that a woman''s first time is very painful, and he is merciless, can imagine how much it hurts.

But she resigned like that, never said a single word, only trembling in his heart.

Qin Lo Khiet liked him, he always knew, but never gave her a chance.

One is that he doesn''t love her, the other is because his mother has already decided to marry him.

But she was always by his side, from then on, he felt that he should give this woman a status.

To this day, he still clearly remembers how brilliant that red mark was.

Qin Lo Khiet buried in his arms, eyes slightly drooping, hummed shyly.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (5, N'Chapter 1', N'A screaming scream echoed at Fill at, breaking the people who worked the thrill of strengthened legs, letting go down the head and looked up and looked up.

Only saw no medium for a few adventurers, extraordinary gases, the main people who spawned the astronaut, we were dignified, the gaze looked straight into the front, placing two-handed chest with a bizarre , Under the open-lasting foot of a glimpse of explosion, the body swords with symbols, along with explosions that sounded slightly light and extraordinary spirits.

The old man is waiting for a group of people who love them to look at them in the first mouth, just feel the first body of the body like radiating my mystery to make people guesseless, making others in love Want to go to the exploration, discovered that no matter what it could not access.

Waiting for the people who turned into a few small black points, filled in the middle of the work of the new group of new people and followed in the tremor to regain the spirit.

"The righteous is the first person, it''s just making people glancing at a felt like the god of air, tired of absolutely no!"

"That''s right?

"What do you don''t think, think against it is extremely beautiful! Is the first person like that, says us these people also use this lodge to live?"

"Have a why say that, Thuy Tien longs for a long time is that it is like a talent of a water spirit! Thinking for the first pink soft waist, white thighs, it''s right to let me Want to stop without. "')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (6, N'Chapter 2', N'God in accidentally passed, doing these things to work with crude-legged hands of the group to forget it yet to finish the farm house, the pants pants gathered at the same spot of the sky to discuss.

The Luxurious Luxuriously looked at the others, silently thought in the heart of an unproverted language, it was a few aids, but this crowds of the three-man, my children but compared to these tops and swords Much stronger first!

He opposed the hoe looked up at the sky, the sun was like a fire, dazzling his eyes against him in a hurry to bow his head.

Approaching noon, the king of old man definitively brought the most combed hue, most butt sitting at not far from a giant tree below, holding the straw hat with the blower.

Sken pulled several stressed hair to pull at the top of his head, the sweat looked up according to his forehead flowing down, rolling up the laentit of muddy mud according to his wrinkles on the cheeks, despicable Narrow, long-eyed triangle insufficiently unbearable, liquefied skin as close to wrapping the core bones, drying together. Breathing with your mouth opening, revealing this in this rickety scolio with yellow teeth, the teeth interspersed with dirty types, green vegetables, pink pink pepper, also do not know how many days ...

It was sixties with the Five King of the Five Heads, though not high, the body was stronger than ordinary people, black and the skin below the cover was filled with a burning force of the muscle force, this is also him every year Between working hand limbs.

Sitting for a moment later, the old king only felt that it was fearful, a bit of a bit of body activity still feeling not later, even the indifferent people lie in the tree below, bringing straw hat on the face Apply one, immediately prepare a break for a moment.

Reluctantly for ten respiratory devices, navigators of navy rang out, the old man dried with his stomach with his respiratory time when he turned down.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (7, N'Chapter 3', N'Godxen and excitement with the sound outside the door rang, the Yellow Old Dry Yellow Eye can often see vibrating a few, rushing to leaning back to the outside the room.

"The elementary, real, my son!" Wang Lao Lao Lao Tung Hoanh, a phen of nose a phen of tears looking at the eyes of remembering hoping to look forward to her, who despiced could not stand the face even more wriggled, despite anyone to see anomalous opposite.

With the old King of Five forming the difference clearly differently, his son Vuong is full of eight taller than the horizontal gas rulers, the elevation in the midst of the emotional emissions of natural and white glossy, the face is facing the right Obviously Tuan, between the two rows of eyebrows to reveal a brother of the gas, the five-minded five such as Tuan Tu Diasters, wearing anyone who looks like to praise a good question a dude.

"Father, don''t be agitated, you see who to bring back." Wang looked at his eyes laughing, raising his hand to bring the old arduous king on his face, and his mind told him to look behind him.

Choking the old man''s old eyes, only felt the middle steam shadow who appeared a white body than snow, like not eating the smoke of the fantasy to normally hover Na Na, walking slowly go.

He was at the same time but forgot to lose his respiratory, stunned at his eyes, causing people who were unrelated to a gentle physique,

Yang Lieu small waist, in front of the breasts, there is no enough to live, depending on the female gently walking the slightly slightly slightly white collar, not a stimulating porous psychiatric porous.
 In accidentally passing, doing these things to work crude-legged hands of the group to forget it yet to finish the farm house, the pants pants gathered at the same spot of the sky to discuss.

The Luxurious Luxuriously looked at the others, silently thought in the heart of an unproverted language, it was a few aids, but this crowds of the three-man, my children but compared to these tops and swords Much stronger first!

He opposed the hoe looked up at the sky, the sun was like a fire, dazzling his eyes against him in a hurry to bow his head.

Approaching noon, the king of old man definitively brought the most combed hue, most butt sitting at not far from a giant tree below, holding the straw hat with the blower.

Sken pulled several stressed hair to pull at the top of his head, the sweat looked up according to his forehead flowing down, rolling up the laentit of muddy mud according to his wrinkles on the cheeks, despicable Narrow, long-eyed triangle insufficiently unbearable, liquefied skin as close to wrapping the core bones, drying together. Breathing with your mouth opening, revealing this in this rickety scolio with yellow teeth, the teeth interspersed with dirty types, green vegetables, pink pink pepper, also do not know how many days ...

It was sixties with the Five King of the Five Heads, though not high, the body was stronger than ordinary people, black and the skin below the cover was filled with a burning force of the muscle force, this is also him every year Between working hand limbs.

Sitting for a moment later, the old king only felt that it was fearful, a bit of a bit of body activity still feeling not later, even the indifferent people lie in the tree below, bringing straw hat on the face Apply one, immediately prepare a break for a moment.

Reluctantly for ten respiratory devices, navigators of navy rang out, the old man dried with his stomach with his respiratory time when he turned down.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (8, N'Chapter 1', N'Right now, he dareded his eyes to his eyes wanted to clear the girl in front of the time, a fair hand fell into him on him, bringing him under the beautiful dream in the province.

Being cut in a beautiful abrupt abrasion of anger and anger without a secret, red on the old face wanted to look at the end that everything was killed like that unique force.

"How, look at this form of this form of blaming you to go to sleep?" He came he looked down at the old king, his face hated.

"U, this is not the top of the top, which winds bring you to this place?" The King of Luxurities saw it clear that the Local Founded Local Foundation of the Dung Vuong Dung at the moment, immediately like the air balloon fartoon was absolutely no, on the opposite of the face.

Nonsense, if he dare to play with this kind of hard play, all the networks are not enough to die.

Saying this Vuong Dung is rude, in the citadel based on the people who kill pigs selling pork because they live, but from a word Ms. Dung alone goes to the mountain to solve and harm the local people in love The tiger then was in a special enjoyment to receive use, into a favorite name. The more it was relying on a strong relatively, bringing the room of others to be afraid, a promoted road, becoming in one person under a hundred leash below the total head.

This respondedly, a rough person with rapidly transforming the top of the head, before he did not say he was both the meat muscles, just the top of the head of the trenches also let him do not dare to easily tease it easily.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (9, N'Chapter 2', N'The old King of Five Now followed inside the beautiful dreams of the moment, formerly just a local death sentence with this Royal Dung, now he was one of themselves to find himself, just afraid not to happen What is the difference?

"See bringing you threatened! Rest assured, I''m not coming this time, it is for you to transmit the news."

The old king in the mouth in the mouth of the wife to fly to the Dung Dung cavity inside, who rushed to stop breathing, hate the direction back to the back of the steps, the way he was a few meters away from the locality.

"Russia? What good news?"

The old king for Vuong Dung urinal movement did not pay attention at all, he was filled with black mud scratching his hair, miscellaneous flying down in the air in the midst of the flight.

Looking at him a set of shapes, Vuong Dung in his heart is hating, otherwise he looked here he was born with a child''s money, for him how much he could not want to run this!

"Upperly heard that the son of the king worshiped Thien Thien Kho Chieu Ha, so we were Kim Lang Thanh difficult to be a good thing, so in particular, let me come to the reward."

"Bonus? What bonuses?" The King of Ngu heard a good place after two old eyes flashed, a little rush to Vuang Dung in front of him, a set looking forward to the shape.

"Don''t be urgent, waiting for you to know." Vuong Dung saw him as easily, longer across a sip of golden teeth to radiate his mouth to go to his body, he folded his breath, leaving a sneaky sentence to run away.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (10, N'Chapter 3', N'Waiting for him, the King of Fively smiled a few hours, a butt sat at the gorge below.

Recalling just now in a curtain dream, A na Multi-woman shook her body, every central movement is filled with a strike soul, he only feels both hard-drying people, a Ta The fire in his stomach was promoted, suddenly appearing sexually causing the objects under their hips to stand up straight, toughly toughness, as if he wanted his pants to pierce.

Although saying the old man was sixty years, but this object under the miracle was big, coming in prosperity in the five young male comparison with only more than not least.

He shouted the four sides to look back, identifying everywhere without anywhere, bringing the right hand to put it in spreads.

Holding the hot base, the old Kingdom satisfies a moan, in his wife who died many years in the inside, he could only rely on his methods to the efforts of prospects in his heart. Go to a satisfactory ray.

He was constantly panting, his right hand was in the lower pants to lower, in the brain, they appeared and fell into the body, felt and not later, automatically at the top of the top of the spring. thing.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (11, N'Chapter 1', N'The old king now in the brain only has him and the subordinate to conduct an intimate water fish, he is crude with the main hand of the main hand to grab a high-tall and white purity, arbitrarily stroking the shape, The strong base stabbed into the entrance, one into the middle into the middle of blowing liquid disorderly sweeping, bringing the subagroc under the wet''s entire bed. Under pediatric capability full of Xuan Trieu, Xuan Spring eyes were floating in the form, gods of loss of soul, lewding a cheerful voice.

His hand upwards constantly increases rapidly, the base gains up to the extreme, at a loss of souls to the ultra groaning later, the head of midst of slicing, in the airway Hoan My curve, approximately a few meters away.

The King of Five still lies in returning to the second place that he could not escape himself, breathing with a bit slightly opening, a few rays of disgusting saliva hanging at the side of his mouth.

Defective distance becomes soft, until normal shape recovery.

Who is, regret to this iron sticks, if there is a woman on the side, it''s good, we have to have to let FEOPE LEARY PLAYER PLAYER!

The old king sighed a bit, there was a little loving to touch the essay, carefully taking into the pants inside.

How Too Mong How Muoi Ky Fuck, the Liberty clearly went out for a little better than a little year, how could it be likely to go back, how could it be likely to take a flower like Ngoc Nhu Ngoc Woman?

He shook his head, giving a mind of the bowl of mind that the idea kicked out.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (12, N'Chapter 2', N'But Thien Gia opened his eyes, his son Vuong was extremely excellent, in the latter, it was different from the ordinary people in Thien Phu Tien Tien, where Kim Lang Thanh was in a jar with a difficulty to see the rival, following The coincidence was collected by Thien Master Cao Nhan as a disciple, going out of thousands of masters, this trip was five years, so far no news.

Here the Legend of the mainland above, Miscellaneously distributed tuon monks, in this most intellectual inner, the most solid status is Thien Thien Kho, Tuyen Mechanical, Bach Hoa Mon Tam Dai Sects, for their breeds, base foreign affairs cannot know, only one generation from when he starts to know, immediately for him to hear.

In addition, there is a holy celestial city, this mystical though it is impossible to join Tam Dai Mon comparing with, but because of the political, economic, military, cultural Waiting for blood vessels, no doubt to occupy at this mainendary piece above a head for the strength to expand herohood.

Furthermore, Thien Hoang Los the Dynasty of the Dynasty Dynasty The new choice class can climb the throne of the Emperor, not only the fullcomings of the entire bravery, even more and more difficulties The worries of Thien Ha, happy after the fun of God, every one can be confessed to be Minh Quan.

This also makes the Paint of Thien Hoang to penetrate the people of the people who love themselves, collecting all the people of people in mindfulness, the status cannot break, immediately the teacher is also for the third hessage.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (13, N'Chapter 1', N'Let''s talk a little of the mainland, which took the "Huyen Tu" named, because at this mainland piece above the bizarre flooding of the phenomenon, the large enlightenment, not carefully falling to the cliff found The secret of jumping becomes a person who is not surprised, intruding an internal acupmit that has been died at a higher life point at a time when a consultation of a period of time will arise.

Saying that, only the air, it was enough to explode, saying that forever, fortunately, fortunately in the top of the upper, quickly transformed the pheasant into the phoenix.

The rumor has a lot of humanity to spoken to the sponsor of thoughts, specializing in paginal evil, discarding the main cultivation, or waiting at the side of the cliff waiting for the enlightenment, or going to a very rare desert Looking for tracers, or or every day there is nothing illusory from the sky falling.

This also takes a funny face, maybe some day passing through a cliff, will see a little strange thought who bites his teeth, aiming for two eyes towards the jump. Real waiting for us is not the two types of outcomes, one is inadequate, two are turning into a bottom of a leak.

The fortunes so far is not ungainly unjustly for the forestry forever in anyone, only the extraordinary Thien Phu is sufficiently trying to efforts, doing well to prepare people who can bring them very well .

Fortunately, the mainland mainland cultivates the air is strong, a little imperiality of young people at a young age, which is a young talent, being selected by the representatives, then steps up to Tien Tien.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (14, N'Chapter 2', N'In this way, the more complicacy is an extraordinary complex, divided into a legislative with two types of souls, priorities are only swordsmanship, magic, gas practice, medicine preparation, guessing, calling and waiting for all kinds of designs Fairyism, each type of advanced method has unique methods of the same method.

This swordsmanship Make Master and Sword and Sword Tien Thanh Established, Earn the Motion, the mind of the sword. Cultivating to Dai Thanh who is able to incarnate to make a sword, own the same property to do one, strong power.

Like the old man who previously looked at the astronaut, it was not admitted to the Middle School of Middle School.

Dharma battles If the true, the first person to bring exactly to the surrounding research for the internal fabrication, every match can be promoted to attack the enemy unprepared. Any too match also divided three seven categories, the lowest match in the match can only continuously, the attack force is also corner because of limited, high-end matches can lead to letharic lethargia, paint , A match enough to turn the most turning the most successful.

In terms of gas preparation, preparation of drugs, guessing, calling and waiting for the first method to distinguish the first and auxiliary spirit, the bodies, auxiliary, auxiliary love to see if the monks attend Tien Tien.

Anonymousness of any kind of advanced method has a low low low division, based on the strong priest strongly divided into heavenly air, Hoang Dinh Dinh Truc, compensation of air condensation, Tien Khi Trieu Nguyen, Tam Hoa Peak capacitors, Yang Renal, Swiss spikes, natural dharma, Vo Chinh Thang Tien waiting for nine gender, each of the gids to divide into the sister, Trung Ky, post-three aim.

Every bit of breakthroughs need the priest to pay the countless price of trying, absorbing to the Fairy of the elite, the need to practice in the heart of the area, undergoing countless great people around her Go to pure, can break the scene, step into the new realm.

But the more demanding of the world could break down, countless people plugged at the top of the room.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (15, N'Chapter 1', N'In terms of the spirit of the soul added mystical, not only wanted to look at the monks Tien Thien Than souls of the level, even more and behind the gods to practice the secret of the same breath.

At all saying that no science, counting is that the angel of the angel is stronger than ordinary people, if there is not enough intensity of the secret to the secret, the final result can only be no different from people often.

If not, the most of the artifact is a high cultivation of the secret to the secret of the secret to the buffalo, not a little effect.

In short, two people support each other, without one possible.

Tu Tien truth is full of countless tough doors, the most pillars are the most difficult to step-by-step is to have the prosecution of Thien Phu, only a little spiritual nature of the body You can see the first priest threshold.

At the mainland curriculum above, the linh is to judge a affordable person appropriately, this is low to high divided into the Nine-level, a little bit of heaven. Born at the peak, almost the type of harsh love of Thien Phu Tien to be the highest to buy, at all unchanged to bring the territory between the rare possession of this body to use this body, bring a foster because of this The mainland heads the fake lord.

But this type of faith type of genius nearly thousands of years is difficult to meet, normally coming to say that it can appear in the Live-level left-end continent is difficult to be difficult.

The old King of the King of the United Kingdom was previously showing the Linh Tri medium-level, he was hit by Thien Master to be hit by a disciple.

Fairy people carrying less people who are less and less, ordinary people who occupy Huong Luc Bay Thanh many, can only work, agriculture, and wait for the industry, their whole life because of his life.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (16, N'Chapter 2', N'Only occupying three people who troops can enjoy a great hypocrisy of 70% of resources, the whole life of peanuts, no need to worry about losing the problem, this is also why the old king is waiting for people Looking at the monks when it is desire to worship.

Who, we can only be in this concerberate.

The old king sighed a breath, using his head shaking, bringing his mind a little bit in reality the idea kicked out.

The eyes of the sky are getting blurry, the sunset falls, a Ti in the end of the sun falls at the highest place above the mobile apricot, diluting the air infected with a warm rustic floor, this large blade filled in The middle was like wearing a single-layer Kim Trang, in the sun in the sun flashing the dark yellow iridescent, the night surfed by the night, blowing a happy hit with a happy hit.

The sun rises that the sun goes down but the breath, the original with the old king of the arms to work a group of people soon kicking the way home, where there is a fragrant food with the softness of the softer wait waiting for them He.

But is the old king? Just thought about home, it was only one body to face the wall, without the smoke of fire and the kitchen and the kitchen, his inner mind immediately.

It was too dark that was dark, calculated that he was not volunteering, only slowly slowly slowly moving to the house.

Very fast, the temple in the end of the evil side also disappeared here the Blade, the sky is completely dark, only far away from the miscellaneous families reluctantly illuminated on the middle of the small road .')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (17, N'Chapter 1', N'The old king alone goes, the psychology is full of sadness, a pair of triangular eyes on pulling, liquefied the eye of the skin under the skin, the corners of the eye to cover the five months of traces, climbing full of coupons Wrinkled, in this there was a big nude not small and black shining 痦 death, it seems a despicable person.

He aggressively kicked a row on the ground of the stone, towards the ground on a spare.

At this moment, besides the neutral trees to a sound of sound activity, at night inside seemed to disrupt terror.

The King of Ngu Thu threatened to dance, at the foot of the restraint, both the hair was raised, the whole body nervously was tied, standing on the spot of a small movement did not dare.

He suddenly remembered the previous paragraph of the time in the city appeared rumored: Neighboring the wild mountain above the empty hollow appeared some dangers of beasts, often at the night of absent from the night to go to town Around, chose to choose these budgeted people down to hand, there were more than ten people who were unknown, more than half suffered miserable.

Nose of the buildings of the towns so the hearts of people are shocked, but covering the entrance to a group of hazards also close to the dance, not only with no solving love problems, even consecutive losses The monk, the money of loss of disabilities.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (18, N'Chapter 2', N'According to the luck to bring back to the Fairy of the Arts, typing the rectifier is the mediocre of beasts, not enough fear, scary truly scary is these beasts that seem to be in the darkness , rehearsing the vi exercises not only in it, hiding in the darkness and launching the offering and falling back and falling back and falling back, furthermore the good standards, most stimulating the loss of the wire is not much melon .

The mediocre of very low force is very low, it is natural to operate the range, not a normal negligence will not actively attack humanity. Which in front of these phenomena can not help but be skeptical, all behind their backs have a big hand in quietly controlling, even declaring, all are all love Department for!

Speaking the same place, very quickly reaching the porch of Dai Wave, love love is something concept, the same beast can say differently one sky, not only possible with the same person to compare the linh, Furthermore extraordinary power, the body of the power of a strong cross, together with the same levels of other human monks who are only more and not least.

Also cultivating to Dai Thanh loves animals, jumping can turn virtual people, mixing tea at humanity, in which it is difficult to clearly clearly, the actually strong, the more powerful gods, Vi Vi Vi Vu Vi , At a glance in the middle in the middle, it can be destroyed.

Thinking so, the old Psychology of Psychology was not hit a trembling welding, two vacuums prevented trembling, cold wind screaming with him on the surfers, bonsai duffle duffle Like him the whole body above every nerve.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (19, N'Chapter 1', N'Two tough lips pasted closely at the same place, two flexible tongue heads at each other probe, male heads of rude tongue filled with the women''s mouth, the lower left right a little blended, straight The female breathing is not unappointed, can only be given to the sound of the sound.

A rough black couple assembled hands in white women on the body lowered, eventually stopping at the two breasts above, using stroking, only saw soft breasts in his hand constantly turning out all kinds shape. The female person who tolerates this type of stimulation, the grapes so the two beautiful nude breasts stood straight, she skyrocketed, the moment the expectation of the male entry.

"Nha ~ Ân ~ Ân ~" The female before Xuan Trieu, shining redness, filled with love to squeeze at his body above the male person.

The maid under the penis hips lifted his head puffed up his chest, the body of the blue veins appeared in black purple, the head of purple blue shining, the top of the flow was a little transparent throughout the liquid, with the vaginal female vagina sticky set.

The penis maid though it was impossible to compare with the old king, but considered as toughly tough.

Really he does not appear without intrusive calculation of calculation, which is the team on the female multiplying between two legs constantly stroking flat, the middle of the brought out of the slippery slippery liquid, prospective Move the butt to spread at the grass above.

His big hand continues to go down to the roof, until the mystical black forest tree, gentle fingers slit into the two-sides of the honey, in the wet female, the local lake seals touch, fingertips Stopping through the other pagoda, under the woman with him the body''s body started to be trembling autonomy.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (20, N'Chapter 1', N'The female person is against such a rich male experience provocative, lowering the normal pink wet, in the moonlight shining below the shiny rise.

She gave her finger to put it in her mouth to keep sucking, the other hand down to seek, holding a hot male man with a basey, when she reached down to start stirring up to, smooth white with the end of the penis In the formation of intense opposite, making a stealing sight of the old king just feeling the abdomen to promote a battle of the evil, spread in his four-spent of Bach Hai, so the penis pants also bulged uncomfortable.

He did not control the inside of the dynamic, bringing soon soon as soon as the penis of the penis hooked out, a pair of old-eyed cute eyes did not move his eyes at the eyes of men and women, skinny at the bottom of the body constantly Plucking.

"This woman, in everyday a cold shape like ice form, in the men under the hips, the hips are extremely lewd!"

Nam Nhan gasped, looking at her dormitory, immediately put her fingers into her graves, great dug.

Being able to meet the female feminine with the eyes of the eyes, heading up herself to the buttore, coordinating the man''s man''s hand, letting it add more invasive.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (21, N'Chapter 2', N'The feeling of hot pure spirit into his own body inside, the female person was to satisfy huge, her body constantly twitching, because extreme pleasure made the head behind the threshold, gas Chaos, a couple enticing the eyes of slightly flipping Byakugan, she had a sense of sense of sense of conquest, both immersed in the truthless climbing.

Male people started to become soft and softened with the penis, relevant to oppose white, lovingly wet the gravocyle is greater open, inside the inserted white flowing with transparent liquid, very powerful incestuous.

In terms of concentration, two people did not know where they were uniformly climax, in the dark, there was a peeping peek through self-comforting also reaching the peak.

Raising moaning with the Diem Diem Huong without a stimulation of the porous psychiatry, he groaned, the two sides were thick in ugly lips slightly, a breathe to breathe at the inside of flying out, Love to the deep moment, there are a few drops of viscount sticking with the corner of his mouth sliding down, dripping down in front of his face grass above.

Really he obviously didn''t pay attention to these ones, grasping the right hand to move rapidly, in Nam Nhan to play the last moment, he jumped over the ministry also risking the peak of peaks and gas The spending force is like a lack of a base, like that only it can make him achieve great pleasure.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (22, N'Chapter 3', N'At the two people at the same time reaching the spring of the moment, the old King also achieved the delight of the peak, he could not moan himself, but because he was in front of him when he was full of drunkenness Maze, so it has not been discovered that he exists.

Oh ơi Semenicly followed the old Five Cusils shot out, a little bit, two, three children, consecutively the new players stopped, splashing four sides of the grass were spreads and grass Thuong covered with white milk with white milk.

In the air adventure a thicker than the stench, overwhelmed in four sides.

Two smooth shiny balls appear like there is no urgent to leave the idea, the opposite of you is that I am ashydrated as embarrassed, do not secure two hands in each other on the probe, male Humanly the bottom of the object began to become fierce, revealing black branches shining.

Looking at certain tonight is the most sleepless night a.

Suose from that day in accidentally touching two people at the middle of the U, the old man in the darkness observed himself with the other person a little bit of boys and girls, also discovered many people in the middle little secret.

At the side of the West Lao Chu every Friday is still wanting to go to the east, my grandmother said the cause is the entry store, the reality is to find a bastard in the dark u, Making a chin tone is, this love is also a husband and woman who is married, not every year outside of the outside, hungry and hard to dictate the prosperity to him, two people with a trail , Estimated every Friday in the surplus in the budget.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (23, N'Chapter 1', N'Except for that time, the old King of the old growers are not equal to the outer surface like that, often with a few bride cottages and eyebrows, leaning to bring Thu Thuy lanes, not about what day It chatted chatting to chat into the blanket.

In love with these people in the middle of the opposite no old king of the day to see the other pair of men and women, at that time the dark moonlight, he could only reluctantly look at the stamen of people, two dreams of dreams Ho, like a butt of a face-covered towel like how it is not very clear. Also, that day the old king was having a startling, dare to have the liver approaching the two faces clearly.

Really, the other woman''s woman is really A Na Mo Mo, full of milk chest, full of a waistline, white berry, long-lasting thighs ...

Well, the old man recalled the scene at that time, he could not stay in everything.

The way he peeked others with the presence over the days, but every time it remembers that day the scene, the old king is still in restraint, is always wanting to stay behind the back to the upper Some new playbacks are crushed.

I don''t know why, when you are young and live still alive, he doesn''t have such intensity, so that the object under her hips is not the same as today, but wait until now this age The stronger the ginger, the older the ginger, the more and more and more and more and more. Let''s saying that he was forced to force him forced every day early in the bed, he couldn''t go to bed soon.')
INSERT [dbo].[Chapter] ([id], [title], [content]) VALUES (24, N'Chapter 2', N'He quickly suppressed this unknown evil, stood upright and began to slightly slightly, hiding this made Nan Kham embarrassing awkwardness, as well as the day below to pass by The one who looked away, there was a little bit of a little lovingly talking behind him whispering him!

Struggling to bring her inner interior to override, the King of Quickers now dare to live on the back of the back to fill in the middle of the orientation.

Day for the day, year ago, trying to go to Korea, cultivated in the spring harvest of the collection, from the princess king afterwards, he immediately considered the three most lives, life also a ink Thus, according to the old-decommunated core.

At the time before the rabbidized king did not have to give him a place to lead him the same room to Thien Thien coating, maybe the old man in his heart still remembers his own nest to the nest and with this blade, if As he went immediately, he had been able to save these things that could be really wild.

After saying later, he was a normal person who had nothing to go to the pseudonyms like Heavenly Master''s Clouds, this was not a joking, until then not only his old face wants to lose all, just afraid of Vuong Also want to get the people laughing aloud.

Thinking to all kinds of factors, the old man who had to have a great king, stayed in Kim Lang Thanh in the old house with the field.

Thinking about the king, he was hard to appear smiling, although he had no use, but his child was not inferior to A!

Really do not know what the cottage is too ...')
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (1, 1)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (1, 2)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (1, 3)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (1, 4)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (2, 5)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (2, 6)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (2, 7)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (3, 8)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (3, 9)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (3, 10)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (4, 11)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (4, 12)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (5, 13)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (5, 14)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (6, 15)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (6, 16)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (7, 17)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (7, 18)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (8, 19)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (9, 20)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (9, 21)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (9, 22)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (10, 23)
INSERT [dbo].[BookChapter] ([book_id], [chapter_id]) VALUES (10, 24)