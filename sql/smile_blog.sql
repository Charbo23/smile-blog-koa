-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-10-07 15:02:11
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smile_blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `cover` varchar(255) DEFAULT '',
  `description` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `public` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `cover`, `description`, `category_id`, `created_date`, `public`, `status`, `like`, `star`, `views`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '你好啊，陌生人', '如果快乐有颜色，那一定是淡蓝色\n```javascript\nconsole.log("Hello world");\n```', 'https://i.loli.net/2019/09/21/5AblygzpvEoKDhJ.jpg', '音乐是救世主', 1, '2019-09-22 00:10:40', 1, 1, 0, 2, 27, '2019-09-21 15:49:29', '2019-10-07 22:59:43', NULL),
(3, '记“刺客信条”三部曲：水月镜像，无心去来', '\n\n> Nothing is true, everything is permitted.万物皆虚，万事皆允。        \n\n*—— 《刺客信条2》《刺客信条：兄弟会》《刺客信条：启示录》-Ezio三部曲*\n\n\n实习回来后，在朋友的推荐下玩了刺客信条这款游戏，感触挺深，后来想一定要为它写点文字。闭眼一想，还是那句话萦回脑中：我们为了服侍光明而耕耘于黑暗……万物皆虚，万事皆允。却不知道这句话该怎么翻译，被游戏寓意为“信条”的话语，相对于它的题材所包含的深度，好像任何翻译都会带来偏差。很难用几句话描述清楚这部作品，它展现了完全不同的世界与价值，过去与现在，生存与死亡，仇恨与宽容，这些宽泛弘毅的对立词相互交织，在刀刃与鲜血中重获新释，浓缩于主人公Ezio的一生。\n\n## **虚**\n\nEzio诞生于文艺复兴时期的佛罗伦萨，作为银行家的富二代，每日就是游手好闲沾花惹草。还记得游戏的第一个任务就是去打架，然后爬上高楼跟姑娘幽会。生活波澜不惊，基调如翡翠般平和，蓝天白云之下的鲜花之城给予了Ezio太多纨绔子弟的气息。而至于后来，当他每次的任务都要手起刀落快意恩仇，然后安抚亡者的灵魂，当他对深爱的Sophia的请求无奈道出对不起我的时间很宝贵，当他在异乡的深夜给妹妹Claudia满怀深情地写信时，你才会发现，他动荡的内心深处，自有一个不曾惊扰的世界，一个不曾惊扰的翡冷翠。那些逝去的日子，在游戏开头略显无聊的情景，恰如一个简朴的别针，固定在心中最纯粹的角落。\n\n![奔波到威尼斯的Ezio](https://charbo.me/images/blogImg/ckxt1.jpg)  \n\n以至于说，何以为正义，真理，信仰，自由？这都是些多么美好的词语，然而都不是Ezio最终想要的，又恰好是他，见过了太多为了这些美好而疯狂追逐，最终坠下深渊的人。好奇害死猫，人又何尝不是？因此，创世的神让人间有了死亡。刺客从天而降，帽檐遮住他的眉宇，和平鸽还不知晓下一刻的慌乱，风起风止间，优雅的袖刃已将迷乱的鲜红绽放。\n             \nEzio更像一个布道者，将“虚”的信条用死亡的方式传谕。而事物的真实与否，本来就无所谓人的好坏。朋友Leonardo是虚的，他花了很多心里发明战争机器，下一刻就想摧毁它们；叔叔Mario是虚的，一个质朴果敢的领路人，在庄园陷落时便虎落平阳；Niccolo也是虚的，一个满腹经纶兢兢业业的刺客首领，却一度被当作内奸。连Ezio本人也是虚的，从佛罗伦萨的起步，到威尼斯的追寻，再到罗马的复兴，最后到君士坦丁堡的迟暮，其实Ezio最终才认识到，自己不也是为所谓的复仇与荣耀努力了一辈子吗？原来那个最先坠入深渊的人，正是Ezio自己。\n\n![刺客从天而降](https://charbo.me/images/blogImg/ckxt2.jpg)      \n\n因此，Ezio最后在和害死了父兄的教皇Rodrigo对峙时，留下这句信条而放过了他（最终反被儿子Cesare毒死）。这一刻，不知手染太多鲜血的刺客大师是否想到了多年前的一尘不染的佛罗伦萨。抉择与变卦，过一分钟就不能再回头。Ezio的身后这座辉煌的城市，原本就是他想终结邪恶，获得荣耀的目的地。如今，城市更加辉煌，以往的日子，爱人，自由，却一并失去了踪影。相对于当下，他知道一切于事无补，反而有一种繁花落尽，悄然入土的随性。他赫然发现Nothing is true原来不是对别人的告诫，而是对自己内心深处最无奈的独白。\n\n## **允**\n\n任何一个刺客，加入brotherhood时都要完成一个仪式。他们从城市最高的塔尖上俯瞰全城，然后向着塔底的草堆高高跃下。他们在跃下的那一刻伸展手臂，一种近乎疯狂的自由呼啸而来，将烦恼和恐惧抛诸脑后，你很容易联想到鹰的意象。我们总是可以将道理示于别人，却无法说服自己。这种仪式无疑是对自身的勇敢与自由最好的诠释，刺客们以这样的方式向城市宣告，他们的行为准则秉承信仰，允许他们在法律和道德中掌握邪恶者的生杀大权。他们称之为“信仰之跃”。\n\n![信仰之跃](https://charbo.me/images/blogImg/ckxt3.jpg)      \n\n他们在塔尖飘飞消失，城市的风景情韵尽收眼底，背后是虚无的高塔，火焰，荣耀，前方是被允许的使命。而一个人的好与坏，生与死，无时不在拷问着Ezio的灵魂。是的，他也刺杀过好人，而他更多选择了沉默与忘却。允许，到底谁在允许？导师Altair在多次刺杀后终于有觉悟的说：“我所杀的人都对我说了些奇怪的话。他们都没有后悔。即使快死了，他们也看着对胜利很有自信。法律不是来自于神，而是理性。我现在明白了我们的信条不是要求我们去自由。是要求我们智慧。”一个允字，要么成为刺杀后不觉得罪恶的借口，要么成为超越假象的大智慧。\n                 \n游戏情节里有一幕我印象特别深，年迈的Ezio将地下城军火库的首领刺死，单膝跪地抱着他的尸体，缓缓的说：“杀戮是可耻的…”。你能否想象，这是一个手沾鲜血，以刺杀为荣的刺客大师，对着刚被自己刺杀的将亡人说出的一番话。人到了死神降临这一步，才会明白所谓是非成败转头空，才会明白权利和金钱都会在下一次眨眼中灰飞烟灭。而杀人者Ezio此时最想告诉对方的，就是对方杀戮的原罪，不是其他。Ezio此时的眼神不是锋利的，而是坚定如磐石，我想到这一步，头发灰白的Ezio是参透了信条何谓“万事皆允”。Ezio异常从容与坚定，他知道他的杀戮必将会带来救赎，这是上天的允许，也是内心的智慧。刀锋使处，字句溃逃，任何的道理都无法阻止手中将逝的灵魂。\n![年迈的Ezio](https://charbo.me/images/blogImg/ckxt4.jpg)      \n\n到了这个时候，才知道年过半百的Ezio为什么在君士坦丁堡受这么多人的尊重，才知道为什么他严厉指责因鲁莽而错杀他人的徒弟，不全是因为高明的刺杀艺术，更多的是他比更多年轻人知道内心一个允字的定夺。而最后，Ezio完成了对自己的救赎，英雄迟暮，卸甲归田。一颗颠簸的心，终于泡在村灯狗吠之中。在定夺了这么多人的命运之后，他终于想到了自己，想到了Sophia，想到了佛罗伦萨。如果世上有一个人能阻止他，那这个人肯定是Ezio自己，因而他允许了英雄的离去，从容的卸下袖剑，留下背影，自此，永不回头。而门前的花与阳光在岁月中偷偷窜出，似乎等了他几十年。\n\nEzio最后的信：\n> When I was a young man,              \n> 当我还是个年轻的小伙子                \n> I had liberty, but I did not see it.                 \n> 我拥有自由，却从未认知                  \n> I had time, but I did not know it.                   \n> 我拥有时间，却毫不知情                   \n> And I had love, but I did not feel it.                   \n> 而我亦拥有爱，却从未感觉到                   \n> Many decades would pass before I understood the meaning of all three.                   \n> 直到数十年过去后，我才真正理解这三项的意义                   \n> And now, the twilight of my life, misunderstanding has past into contentment.                   \n> 而现在，垂暮之年的我，这领悟让我感到满足                   \n> Love, liberty, and time: once was so disposable, are the fuels that drive me forward.                   \n> 曾经能自由支配的爱，自由以及时间，是支持我前进的动力                   \n> And love, most especially, mia caro.                   \n> 而爱，是最特别的一个， 亲爱的                   \n> For you, our children, our brothers and sisters.                   \n> 为你，为我们的孩子以及为我们的兄弟姐妹们                   \n> And for the vast and wonderful world that gives us lives and keeps us guessing,                   \n> 为这赐予我们生命与惊奇的广阔，精彩的世界                   \n> endless affection，mio Sofia,                   \n> 至死不渝的挚爱， 我的索菲亚                   \n> Forever yours, Ezio Auditore                   \n> 永远属于你的， Ezio Auditore                   ', 'https://i.loli.net/2019/09/21/QyEuAgToC1aGXhK.jpg', 'Nothing is true, everything is permitted.', 1, '2019-09-22 04:03:52', 1, 1, 1, 1, 12, '2019-09-21 20:04:28', '2019-10-07 23:00:40', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `articleauthor`
--

CREATE TABLE `articleauthor` (
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `articleauthor`
--

INSERT INTO `articleauthor` (`article_id`, `author_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2019-09-21 15:49:29', '2019-10-07 22:59:42', '2019-10-07 22:59:42'),
(1, 2, '2019-10-07 22:59:43', '2019-10-07 22:59:43', NULL),
(2, 1, '2019-09-21 19:52:06', '2019-09-21 19:52:06', '2019-09-21 19:57:16'),
(3, 1, '2019-09-21 20:04:28', '2019-09-21 20:04:28', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `articletag`
--

CREATE TABLE `articletag` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `articletag`
--

INSERT INTO `articletag` (`article_id`, `tag_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2019-09-21 15:49:29', '2019-09-21 15:49:29', NULL),
(2, 2, '2019-09-21 19:52:06', '2019-09-21 19:52:06', '2019-09-21 19:57:16'),
(3, 2, '2019-09-21 20:04:28', '2019-09-21 20:04:28', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(320) NOT NULL,
  `description` varchar(255) NOT NULL,
  `auth` tinyint(4) NOT NULL DEFAULT '8',
  `password` varchar(127) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `author`
--

INSERT INTO `author` (`id`, `name`, `avatar`, `email`, `description`, `auth`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Charbo', 'https://i.loli.net/2019/09/21/r4NjZxbTU76MEfY.jpg', 'charbo233@foxmail.com', 'Super admin', 32, '$2a$10$e1zN7EeiRf3OJYVr0/nPdevUiR3ws7A5Dp0F4pooNu8hjZTZ656IC', '2019-09-21 15:03:13', '2019-09-21 15:03:13', NULL),
(2, 'Sophia', 'https://i.loli.net/2019/10/07/AWRXE8tLZ7nfr5m.jpg', 'charbo233@qq.com', 'Co-Author', 8, '$2a$10$qjrc28Abr23KPDtJBmGXjeULlvjI1g2jKPDpzzruFIUaGJJY5TAnS', '2019-10-07 22:58:58', '2019-10-07 23:02:02', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `cover`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '杂谈', '随心随性', 'https://resource.shirmy.me/lighthouse.jpeg', '2019-09-21 15:47:01', '2019-09-21 15:47:01', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(32) NOT NULL,
  `content` varchar(1023) NOT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `email` varchar(320) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `parent_id`, `nickname`, `content`, `like`, `email`, `website`, `article_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Charbo', '你也好', 1, 'charbo233@foxmail.com', 'https://charbo.me', 1, '2019-09-21 15:51:56', '2019-09-21 15:52:41', NULL),
(2, 1, 'Charbo', '233', 0, 'charbo233@foxmail.com', 'https://charbo.me', 1, '2019-09-21 17:29:04', '2019-09-21 17:29:04', '2019-09-21 17:29:20');

-- --------------------------------------------------------

--
-- 表的结构 `friend`
--

CREATE TABLE `friend` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `friend`
--

INSERT INTO `friend` (`id`, `name`, `link`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'My Hexo Blog', 'https://charbo.me', 'https://i.loli.net/2019/09/21/SpLsoUzA9CxleYd.jpg', '2019-09-21 16:13:36', '2019-09-21 17:03:54', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `content` varchar(1023) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `tag`
--

INSERT INTO `tag` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '杂谈', '2019-09-21 15:47:13', '2019-09-21 15:47:13', NULL),
(2, '游戏', '2019-09-21 19:51:01', '2019-09-21 19:51:01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articleauthor`
--
ALTER TABLE `articleauthor`
  ADD PRIMARY KEY (`article_id`,`author_id`);

--
-- Indexes for table `articletag`
--
ALTER TABLE `articletag`
  ADD PRIMARY KEY (`article_id`,`tag_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `friend`
--
ALTER TABLE `friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
