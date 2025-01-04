-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 02 2023 г., 22:28
-- Версия сервера: 5.5.64-MariaDB-cll-lve
-- Версия PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `user1001800_smm2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `api_providers`
--

CREATE TABLE IF NOT EXISTS `api_providers` (
  `id` int(10) unsigned NOT NULL,
  `ids` text COLLATE utf8mb4_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'standard',
  `balance` decimal(15,5) DEFAULT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `ids` text,
  `uid` int(11) DEFAULT NULL,
  `name` text,
  `desc` text,
  `image` text,
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `faqs`
--

CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL,
  `ids` text,
  `uid` int(11) DEFAULT NULL,
  `question` text,
  `answer` longtext,
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `general_custom_page`
--

CREATE TABLE IF NOT EXISTS `general_custom_page` (
  `id` int(11) NOT NULL,
  `ids` text,
  `pid` int(1) DEFAULT '1',
  `position` int(1) DEFAULT '0',
  `name` text,
  `slug` text,
  `image` text,
  `description` longtext,
  `content` longtext,
  `status` int(1) DEFAULT '1',
  `changed` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `general_file_manager`
--

CREATE TABLE IF NOT EXISTS `general_file_manager` (
  `id` int(11) NOT NULL,
  `ids` text CHARACTER SET utf8mb4,
  `uid` int(11) DEFAULT NULL,
  `file_name` text CHARACTER SET utf8mb4,
  `file_type` text CHARACTER SET utf8mb4,
  `file_ext` text CHARACTER SET utf8mb4,
  `file_size` text CHARACTER SET utf8mb4,
  `is_image` text CHARACTER SET utf8mb4,
  `image_width` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=322 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `general_file_manager`
--

INSERT INTO `general_file_manager` (`id`, `ids`, `uid`, `file_name`, `file_type`, `file_ext`, `file_size`, `is_image`, `image_width`, `image_height`, `created`) VALUES
(316, '69be4727bda87f14ea2ec99df22da63e', 38, '7a1fd50f8f9721b9a15997fe760eeca5.png', 'image/png', 'png', '5.69', '1', 200, 40, '2021-11-09 04:18:09'),
(317, 'd7cacaef1d147249d6ba3cdb84d8a134', 38, '249b9b96a27cca055977614630b17d69.png', 'image/png', 'png', '5.69', '1', 200, 40, '2021-11-09 04:18:30'),
(318, '8a3a6b4f82ea918037f734f22eaf7bed', 38, '9d6bae4b8c46be4719cbfa8c290aeef4.png', 'image/png', 'png', '13.97', '1', 177, 106, '2021-11-09 04:22:29'),
(319, 'd3faba14a5f64c7fdc04d63ef5ddb4f8', 38, '31e5cec961ec159d62f1406c720cc87b.png', 'image/png', 'png', '6.92', '1', 200, 40, '2021-12-24 06:05:27'),
(320, 'e63355cc67b8586c3c61c78343ca4ce6', 38, 'd9998dc4ecf5e7d983a7850f031238a9.png', 'image/png', 'png', '6.92', '1', 200, 40, '2021-12-24 06:05:30'),
(321, '7a832a988178b60257d0190c85017b96', 38, '3851dfce8e8fb3e797dea7c043efe033.png', 'image/png', 'png', '6.92', '1', 200, 40, '2021-12-24 06:05:33');

-- --------------------------------------------------------

--
-- Структура таблицы `general_lang`
--

CREATE TABLE IF NOT EXISTS `general_lang` (
  `id` int(11) NOT NULL,
  `ids` varchar(100) DEFAULT NULL,
  `lang_code` varchar(10) DEFAULT NULL,
  `slug` text,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `general_lang_list`
--

CREATE TABLE IF NOT EXISTS `general_lang_list` (
  `id` int(11) NOT NULL,
  `ids` varchar(225) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `country_code` varchar(225) DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `general_lang_list`
--

INSERT INTO `general_lang_list` (`id`, `ids`, `code`, `country_code`, `is_default`, `status`, `created`) VALUES
(1, '00cf79903db8946e155b0ff66d319bf1', 'en', 'GB', 0, 1, '2021-07-21 09:14:04'),
(2, '7fa965246d13c6b5bb2d09c64b333d5f', 'ru', 'RU', 1, 1, '2021-11-09 02:36:55');

-- --------------------------------------------------------

--
-- Структура таблицы `general_news`
--

CREATE TABLE IF NOT EXISTS `general_news` (
  `id` int(10) unsigned NOT NULL,
  `ids` text COLLATE utf8mb4_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `general_news`
--

INSERT INTO `general_news` (`id`, `ids`, `uid`, `type`, `description`, `status`, `created`, `expiry`, `changed`) VALUES
(1, '97e3b748887a652322dfb790e99265b8', 38, 'announcement', '&lt;h1 class=&quot;title&quot;&gt;RU Telegram&lt;/h1&gt;\r\n&lt;div class=&quot;post-body&quot;&gt;\r\n&lt;div&gt;\r\n&lt;p&gt;&lt;br /&gt;Наблюдаются проблемы с дешёвыми Русскими подписчиками Телеграм без списаний (&lt;strong&gt;ID 199, ID 438&lt;/strong&gt;)&lt;/p&gt;\r\n&lt;p&gt;Пока мы обновляем базу для ваших заказов, воспользуйтесь более дорогими услугами сейчас &amp;mdash; &lt;strong&gt;ID 614, ID 280&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Приносим свои извинения за неудобства.&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span class=&quot;labelpn&quot;&gt;-ENGLISH-&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\r\n&lt;p&gt;There are problems with cheap Russian Telegram Non Drop members (&lt;strong&gt;ID 199, ID 438&lt;/strong&gt;)&lt;/p&gt;\r\n&lt;p&gt;While we are updating the database for your orders, use more expensive services now &amp;mdash; &lt;strong&gt;ID 614, ID 280&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;We are sorry for the inconvenience.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', 1, '2021-11-13 00:00:00', '2021-12-31 00:00:00', '2021-11-14 03:19:38'),
(2, 'c0fb1232d28772ef8edbc081373cb506', 38, 'announcement', '&lt;h1 class=&quot;title&quot;&gt;RU Telegram&lt;/h1&gt;\r\n&lt;div class=&quot;post-body&quot; style=&quot;max-height: none;&quot;&gt;\r\n&lt;div&gt;\r\n&lt;p&gt;&lt;br /&gt;Устранена проблема по дешёвым Русским подписчиками без списаний Телеграм.&lt;/p&gt;\r\n&lt;p&gt;&lt;br /&gt;&lt;span class=&quot;labelpn&quot; style=&quot;background-color: rgba(255, 71, 114, 0.125); color: #ff4772;&quot;&gt;-ENGLISH-&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\r\n&lt;p&gt;Fixed problem with cheap Russian Non drop members Telegram.&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;', 1, '2021-11-15 00:00:00', '2022-01-19 00:00:00', '2021-11-16 01:25:15');

-- --------------------------------------------------------

--
-- Структура таблицы `general_options`
--

CREATE TABLE IF NOT EXISTS `general_options` (
  `id` int(11) NOT NULL,
  `name` text,
  `value` longtext
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `general_options`
--

INSERT INTO `general_options` (`id`, `name`, `value`) VALUES
(67, 'enable_https', '1'),
(68, 'enable_disable_homepage', '0'),
(69, 'website_desc', 'SMMPANEL сервис для продвижения социальных сетей: instagram, YouTube, Вконтакте, Telegram, TikTok и другие                                                        '),
(70, 'website_keywords', 'ram reseller panel                                                                                '),
(71, 'website_title', 'SMMPANEL - Быстрая раскрутка и продвижение в социальных сетях.'),
(72, 'website_favicon', ''),
(73, 'embed_head_javascript', '&lt;!-- Global site tag (gtag.js) - Google Analytics --&gt;\r\n&lt;script async src=&quot;https://www.googletagmanager.com/gtag/js?id=G-2T08N1WNLZ&quot;&gt;&lt;/script&gt;\r\n&lt;script&gt;\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(&#039;js&#039;, new Date());\r\n\r\n  gtag(&#039;config&#039;, &#039;G-2T08N1WNLZ&#039;);\r\n&lt;/script&gt;\r\n\r\n    &lt;!-- Yandex.Metrika counter --&gt;\r\n&lt;script type=&quot;text/javascript&quot; &gt;\r\n   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};\r\n   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})\r\n   (window, document, &quot;script&quot;, &quot;https://mc.yandex.ru/metrika/tag.js&quot;, &quot;ym&quot;);\r\n\r\n   ym(86445157, &quot;init&quot;, {\r\n        clickmap:true,\r\n        trackLinks:true,\r\n        accurateTrackBounce:true,\r\n        webvisor:true\r\n   });\r\n&lt;/script&gt;\r\n&lt;noscript&gt;&lt;div&gt;&lt;img src=&quot;https://mc.yandex.ru/watch/86445157&quot; style=&quot;position:absolute; left:-9999px;&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;&lt;/noscript&gt;\r\n&lt;!-- /Yandex.Metrika counter --&gt;'),
(74, 'website_logo_white', ''),
(75, 'enable_service_list_no_login', '1'),
(76, 'enable_api_tab', '1'),
(77, 'disable_signup_page', '0'),
(78, 'website_name', 'SMMPANEL'),
(79, 'social_facebook_link', ''),
(80, 'social_twitter_link', ''),
(81, 'social_pinterest_link', ''),
(82, 'social_instagram_link', ''),
(83, 'social_youtube_link', ''),
(84, 'copy_right_content', 'Copyright © - SMMPANEL'),
(85, 'notification_popup_content', '<p>Лучшие цены на раскрутку!<img src="https://smmpanel.pw/assets/plugins/tinymce/plugins/emoticons/img/smiley-cool.gif" alt="cool"></p>'),
(86, 'embed_javascript', ''),
(87, 'enable_notification_popup', '0'),
(88, 'new_currecry_rate', '1'),
(89, 'default_price_percentage_increase', '100'),
(90, 'enable_goolge_recapcha', '0'),
(91, 'currency_decimal_separator', 'dot'),
(92, 'currency_thousand_separator', 'comma'),
(93, 'currency_symbol', '₽'),
(94, 'currency_decimal', '2'),
(95, 'default_header_skin', 'light-blue'),
(96, 'enable_news_announcement', '1'),
(97, 'is_cookie_policy_page', ''),
(98, 'contact_tel', '+7 (499) 355-24-28'),
(99, 'contact_email', 'info@smmpanel.pw'),
(100, 'contact_work_hour', 'Без выходных 24/7'),
(101, 'social_tumblr_link', ''),
(102, 'auto_rounding_x_decimal_places', '2'),
(103, 'is_auto_currency_convert', '0'),
(104, 'is_maintenance_mode', '0'),
(105, 'website_logo', ''),
(106, 'default_home_page', 'regular'),
(107, 'default_limit_per_page', '50'),
(108, 'is_clear_ticket', '0'),
(109, 'default_clear_ticket_days', '30'),
(110, 'default_min_order', '300'),
(111, 'default_max_order', '5000'),
(112, 'default_price_per_1k', '0.80'),
(113, 'enable_drip_feed', '1'),
(114, 'default_drip_feed_runs', '10'),
(115, 'default_drip_feed_interval', '30'),
(116, 'enable_explication_service_symbol', '1'),
(117, 'enable_signup_skype_field', '0'),
(118, 'google_capcha_site_key', ''),
(119, 'google_capcha_secret_key', ''),
(120, 'currency_code', 'RUB'),
(121, 'is_verification_new_account', '0'),
(122, 'is_welcome_email', '0'),
(123, 'is_new_user_email', '1'),
(124, 'is_payment_notice_email', '1'),
(125, 'is_ticket_notice_email', '1'),
(126, 'is_ticket_notice_email_admin', '1'),
(127, 'is_order_notice_email', '1'),
(128, 'email_from', 'no-reply@site.com'),
(129, 'email_name', 'Smmpanel'),
(130, 'email_protocol_type', 'php_mail'),
(131, 'smtp_server', ''),
(132, 'smtp_port', ''),
(133, 'smtp_encryption', 'none'),
(134, 'smtp_username', ''),
(135, 'smtp_password', ''),
(136, 'verification_email_subject', '{{website_name}} - Please validate your account'),
(137, 'verification_email_content', '<p><strong>Welcome to {{website_name}}! </strong></p><p>Hello <strong>{{user_firstname}}</strong>!</p><p> Thank you for joining! We&#39;re glad to have you as community member, and we&#39;re stocked for you to start exploring our service.  If you don&#39;t verify your address, you won&#39;t be able to create a User Account.</p><p>  All you need to do is activate your account by click this link: <br>  {{activation_link}} </p><p>Thanks and Best Regards!</p>'),
(138, 'email_welcome_email_subject', '{{website_name}} - Getting Started with Our Service!'),
(139, 'email_welcome_email_content', '<p><strong>Welcome to {{website_name}}! </strong></p><p>Hello <strong>{{user_firstname}}</strong>!</p><p>Congratulations! <br>You have successfully signed up for our service - {{website_name}} with follow data</p><ul><li>Firstname: {{user_firstname}}</li><li>Lastname: {{user_lastname}}</li><li>Email: {{user_email}}</li><li>Timezone: {{user_timezone}}</li></ul><p>We want to exceed your expectations, so please do not hesitate to reach out at any time if you have any questions or concerns. We look to working with you.</p><p>Best Regards,</p>'),
(140, 'email_new_registration_subject', '{{website_name}} - New Registration'),
(141, 'email_new_registration_content', '<p>Hi Admin!</p><p>Someone signed up in <strong>{{website_name}}</strong> with follow data</p><ul><li>Firstname {{user_firstname}}</li><li>Lastname: {{user_lastname}}</li><li>Email: {{user_email}}</li><li>Timezone: {{user_timezone}}</li></ul> '),
(142, 'email_password_recovery_subject', '{{website_name}} - Password Recovery'),
(143, 'email_password_recovery_content', '<p>Hi<strong> {{user_firstname}}! </strong></p><p>Somebody (hopefully you) requested a new password for your account. </p><p>No changes have been made to your account yet. <br>You can reset your password by click this link: <br>{{recovery_password_link}}</p><p>If you did not request a password reset, no further action is required. </p><p>Thanks and Best Regards!</p>                '),
(144, 'email_payment_notice_subject', '{{website_name}} -  Thank You! Deposit Payment Received'),
(145, 'email_payment_notice_content', '<p>Hi<strong> {{user_firstname}}! </strong></p><p>We&#39;ve just received your final remittance and would like to thank you. We appreciate your diligence in adding funds to your balance in our service.</p><p>It has been a pleasure doing business with you. We wish you the best of luck.</p><p>Thanks and Best Regards!</p>'),
(146, 'cookies_policy_page', '<p><strong>Lorem Ipsum</strong></p><p>Lorem ipsum dolor sit amet, in eam consetetur consectetuer. Vivendo eleifend postulant ut mei, vero maiestatis cu nam. Qui et facer mandamus, nullam regione lucilius eu has. Mei an vidisse facilis posidonium, eros minim deserunt per ne.</p><p>Duo quando tibique intellegam at. Nec error mucius in, ius in error legendos reformidans. Vidisse dolorum vulputate cu ius. Ei qui stet error consulatu.</p><p>Mei habeo prompta te. Ignota commodo nam ei. Te iudico definitionem sed, placerat oporteat tincidunt eu per, stet clita meliore usu ne. Facer debitis ponderum per no, agam corpora recteque at mel.</p>'),
(147, 'terms_content', '<p>Использование услуг, предоставляемых сайтом SmmPanel.pw означает согласие с этими условиями. Регистрируясь или используя наши услуги, вы соглашаетесь с тем, что прочитали и полностью приняли следующие условия обслуживания и SmmPanel.pw не будет нести никакой ответственности за убытки пользователей, которые не читали ниже условия обслуживания.</p>\r\n<p><br>1. Важно<br>Размещая заказ на SmmPanel.pw , вы автоматически принимаете все перечисленные ниже условия использования.</p>\r\n<p>Мы оставляем за собой право изменять эти условия обслуживания без предварительного уведомления. Ожидается, что вы прочитаете все условия обслуживания перед размещением любого заказа, чтобы убедиться, что вы в курсе любых изменений или любых будущих изменений.</p>\r\n<p>Вы будете использовать только SmmPanel.pw в соответствии со всеми соглашениями, заключенными с Instagram / Facebook / Twitter / Youtube / и других социальных сетей на их индивидуальной странице Условий использования. SmmPanel.pw может изменить цены в любое время без предварительного уведомления. Оплата / возврат политика остается в силе в случае изменения ставки. SmmPanel.pw не гарантирует сроки доставки каких-либо услуг. Мы предлагаем наилучшую оценку того, когда будет доставлен заказ. Это только оценка и мы не возмещаем заказы, которые обрабатываются, если вы чувствуете, что они занимают слишком долго времени. SmmPanel.pw изо всех сил старается доставить именно то, что от нас ожидают наши покупатели. В этом случае мы оставляем за собой право изменить тип услуги, если сочтем необходимым выполнить заказ.</p>\r\n<p>Дисклеймер:</p>\r\n<p>SmmPanel.pw не несет ответственности за любой ущерб, который может понести вам или вашему бизнесу.</p>\r\n<p>Обязательства:</p>\r\n<p>SmmPanel.pw никоим образом не несет ответственности за приостановку учетной записи или удаление фотографий. через Instagram, Twitter, Facebook, YouTube или другие социальные сети.</p>\r\n<p>2. Услуги<br>SmmPanel.pw будет использоваться только для продвижения вашей учетной записи Instagram / Twitter / Facebook или других социальных сетях и только для улучшения вашей «внешности».</p>\r\n<p>Мы НЕ гарантируем, что ваши новые подписчики будут взаимодействовать с вами, мы просто гарантируем, что вы получите подписчиков, за которых вы платите.</p>\r\n<p>Мы НЕ гарантируем 100%, что наши учетные записи будет иметь изображение профиля, полную биографию и загруженные изображения, хотя мы стремимся сделать это реальностью для всех.</p>\r\n<p>Вы не будете ничего загружать в SmmPanel.pw включая изображения наготы или любые материалы, которые не принимаются или не подходят для сообщества Instagram / Twitter / Facebook или социальных сетей.</p>\r\n<p>Перед заказом убедитесь, что ваша учетная запись общедоступна и содержит контент, не запрещённый законодательством и политикой социальных сетей (накрутка, спам, взлом, подделка/продажа документов). В противном случае заказы могут быть отменены с возвратом средств.</p>\r\n<p><br>Политика возврата<br>Возврат средств на ваш способ оплаты не производится. После внесения депозита отменить его невозможно. Вы должны использовать свой баланс для заказов от SmmPanel.pw.</p>\r\n<p>Вы соглашаетесь с тем, что после завершения платежа вы ни по какой причине не будете подавать против нас спор или возвратный платеж.</p>\r\n<p>Если после внесения депозита вы подадите против нас спор или возвратите платеж, мы оставляем за собой право аннулировать все будущие заказы и заблокировать вас на нашем сайте. Мы также оставляем за собой право забрать любых подписчиков или лайков, которые мы поставили вам или вашим клиентам в Instagram / Facebook / Twitter или в других социальных сетях.</p>\r\n<p>Заказы размещены в SmmPanel.pw не будут возвращены или отменены после размещения. Вы получите возврат на свой счет SmmPanel.pw если заказ не может быть доставлен.</p>\r\n<p>Неуместные заказы или заказы на личный счет не подлежат возмещению. Обязательно подтверждайте каждый заказ перед его размещением.</p>\r\n<p>Мошенническая деятельность, такая как использование неавторизованных или украденных кредитных карт, приведет к прекращению действия вашей учетной записи. Никаких исключений.</p>\r\n<p>Пожалуйста, не используйте более одного сервера одновременно для одной и той же страницы. В этом случае мы не сможем дать вам правильное количество подписчиков / лайков. Мы не вернем деньги за эти заказы.</p>\r\n<p></p>\r\n<p></p>'),
(148, 'policy_content', '<p>Эта политика описывает, как мы используем ваши персональные данные. Мы серьезно относимся к вашей конфиденциальности и примем все меры для защиты вашей личной информации.</p>\r\n<p>Любая полученная личная информация будет использована только для выполнения вашего заказа. Мы не будем продавать и распространять вашу информацию никому. Вся информация зашифрована и сохранена на безопасных серверах.</p>'),
(149, 'is_active_manual', ''),
(150, 'manual_payment_content', 'You can make a manual payment to cover an outstanding balance. Once time, open a ticket and contact with Administrator.'),
(151, 'enable_attentions_orderpage', '');

-- --------------------------------------------------------

--
-- Структура таблицы `general_purchase`
--

CREATE TABLE IF NOT EXISTS `general_purchase` (
  `id` int(11) NOT NULL,
  `ids` text,
  `pid` text,
  `purchase_code` text,
  `version` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `general_purchase`
--

INSERT INTO `general_purchase` (`id`, `ids`, `pid`, `purchase_code`, `version`) VALUES
(1, '8068ec7f79145fe55dea67dd63b012c3', '23595718', 'ab912eb7-569a-4c5c-83af-c81c4d100eab', '');

-- --------------------------------------------------------

--
-- Структура таблицы `general_sessions`
--

CREATE TABLE IF NOT EXISTS `general_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `general_sessions`
--

INSERT INTO `general_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('4b9anlgc6crgpf96cnsr7hu989qpnr37', '46.151.81.125', 1683055578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638333035353133323b7569647c733a323a223338223b757365725f63757272656e745f696e666f7c613a353a7b733a343a22726f6c65223b733a353a2261646d696e223b733a353a22656d61696c223b733a32303a227a6c616465793139383640676d61696c2e636f6d223b733a31303a2266697273745f6e616d65223b733a333a22536d6d223b733a393a226c6173745f6e616d65223b733a353a2250616e656c223b733a383a2274696d657a6f6e65223b733a31333a224575726f70652f4d6f73636f77223b7d6c616e6743757272656e747c4f3a383a22737464436c617373223a373a7b733a323a226964223b733a313a2232223b733a333a22696473223b733a33323a223766613936353234366431336336623562623264303963363462333333643566223b733a343a22636f6465223b733a323a227275223b733a31323a22636f756e7472795f636f6465223b733a323a225255223b733a31303a2269735f64656661756c74223b733a313a2231223b733a363a22737461747573223b733a313a2231223b733a373a2263726561746564223b733a31393a22323032312d31312d30392030323a33363a3535223b7d),
('0bqhj6co887qs9u624o4f76craqgmee3', '46.151.81.125', 1683055132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638333035353133323b7569647c733a323a223338223b757365725f63757272656e745f696e666f7c613a353a7b733a343a22726f6c65223b733a353a2261646d696e223b733a353a22656d61696c223b733a32303a227a6c616465793139383640676d61696c2e636f6d223b733a31303a2266697273745f6e616d65223b733a333a22536d6d223b733a393a226c6173745f6e616d65223b733a353a2250616e656c223b733a383a2274696d657a6f6e65223b733a31333a224575726f70652f4d6f73636f77223b7d6c616e6743757272656e747c4f3a383a22737464436c617373223a373a7b733a323a226964223b733a313a2232223b733a333a22696473223b733a33323a223766613936353234366431336336623562623264303963363462333333643566223b733a343a22636f6465223b733a323a227275223b733a31323a22636f756e7472795f636f6465223b733a323a225255223b733a31303a2269735f64656661756c74223b733a313a2231223b733a363a22737461747573223b733a313a2231223b733a373a2263726561746564223b733a31393a22323032312d31312d30392030323a33363a3535223b7d),
('duaumec8j0p4hqg8f85l1hlen710qui5', '46.151.81.125', 1683054177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638333035343137373b7569647c733a323a223338223b757365725f63757272656e745f696e666f7c613a353a7b733a343a22726f6c65223b733a353a2261646d696e223b733a353a22656d61696c223b733a32303a227a6c616465793139383640676d61696c2e636f6d223b733a31303a2266697273745f6e616d65223b733a333a22536d6d223b733a393a226c6173745f6e616d65223b733a353a2250616e656c223b733a383a2274696d657a6f6e65223b733a31333a224575726f70652f4d6f73636f77223b7d6c616e6743757272656e747c4f3a383a22737464436c617373223a373a7b733a323a226964223b733a313a2232223b733a333a22696473223b733a33323a223766613936353234366431336336623562623264303963363462333333643566223b733a343a22636f6465223b733a323a227275223b733a31323a22636f756e7472795f636f6465223b733a323a225255223b733a31303a2269735f64656661756c74223b733a313a2231223b733a363a22737461747573223b733a313a2231223b733a373a2263726561746564223b733a31393a22323032312d31312d30392030323a33363a3535223b7d),
('n05iio1aj93476dqnk64m0ij3a893ufr', '46.151.81.125', 1683053435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638333035333433353b6c616e6743757272656e747c4f3a383a22737464436c617373223a373a7b733a323a226964223b733a313a2232223b733a333a22696473223b733a33323a223766613936353234366431336336623562623264303963363462333333643566223b733a343a22636f6465223b733a323a227275223b733a31323a22636f756e7472795f636f6465223b733a323a225255223b733a31303a2269735f64656661756c74223b733a313a2231223b733a363a22737461747573223b733a313a2231223b733a373a2263726561746564223b733a31393a22323032312d31312d30392030323a33363a3535223b7d7569647c733a323a223338223b757365725f63757272656e745f696e666f7c613a353a7b733a343a22726f6c65223b733a353a2261646d696e223b733a353a22656d61696c223b733a32303a227a6c616465793139383640676d61696c2e636f6d223b733a31303a2266697273745f6e616d65223b733a333a22536d6d223b733a393a226c6173745f6e616d65223b733a353a2250616e656c223b733a383a2274696d657a6f6e65223b733a31333a224575726f70652f4d6f73636f77223b7d),
('0setpd721m6kqcgc34rj28ck8ko68mik', '46.151.81.125', 1683052827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638333035323832373b6c616e6743757272656e747c4f3a383a22737464436c617373223a373a7b733a323a226964223b733a313a2232223b733a333a22696473223b733a33323a223766613936353234366431336336623562623264303963363462333333643566223b733a343a22636f6465223b733a323a227275223b733a31323a22636f756e7472795f636f6465223b733a323a225255223b733a31303a2269735f64656661756c74223b733a313a2231223b733a363a22737461747573223b733a313a2231223b733a373a2263726561746564223b733a31393a22323032312d31312d30392030323a33363a3535223b7d7569647c733a323a223338223b757365725f63757272656e745f696e666f7c613a353a7b733a343a22726f6c65223b733a353a2261646d696e223b733a353a22656d61696c223b733a32303a227a6c616465793139383640676d61696c2e636f6d223b733a31303a2266697273745f6e616d65223b733a333a22536d6d223b733a393a226c6173745f6e616d65223b733a353a2250616e656c223b733a383a2274696d657a6f6e65223b733a31333a224575726f70652f4d6f73636f77223b7d),
('ll5d9freu99nr7q18c51e9nm9tqok4dq', '46.151.81.125', 1683052218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638333035323231383b6c616e6743757272656e747c4f3a383a22737464436c617373223a373a7b733a323a226964223b733a313a2232223b733a333a22696473223b733a33323a223766613936353234366431336336623562623264303963363462333333643566223b733a343a22636f6465223b733a323a227275223b733a31323a22636f756e7472795f636f6465223b733a323a225255223b733a31303a2269735f64656661756c74223b733a313a2231223b733a363a22737461747573223b733a313a2231223b733a373a2263726561746564223b733a31393a22323032312d31312d30392030323a33363a3535223b7d7569647c733a323a223338223b757365725f63757272656e745f696e666f7c613a353a7b733a343a22726f6c65223b733a353a2261646d696e223b733a353a22656d61696c223b733a32303a227a6c616465793139383640676d61696c2e636f6d223b733a31303a2266697273745f6e616d65223b733a333a22536d6d223b733a393a226c6173745f6e616d65223b733a353a2250616e656c223b733a383a2274696d657a6f6e65223b733a31333a224575726f70652f4d6f73636f77223b7d),
('dq6h25u1ikb82oq3fhmctpd99p4p588c', '46.151.81.125', 1683055283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638333035353238333b),
('ubifoend926rojflk78tco38e0lih5p2', '46.151.81.125', 1683055283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638333035353238333b6c616e6743757272656e747c4f3a383a22737464436c617373223a373a7b733a323a226964223b733a313a2232223b733a333a22696473223b733a33323a223766613936353234366431336336623562623264303963363462333333643566223b733a343a22636f6465223b733a323a227275223b733a31323a22636f756e7472795f636f6465223b733a323a225255223b733a31303a2269735f64656661756c74223b733a313a2231223b733a363a22737461747573223b733a313a2231223b733a373a2263726561746564223b733a31393a22323032312d31312d30392030323a33363a3535223b7d);

-- --------------------------------------------------------

--
-- Структура таблицы `general_subscribers`
--

CREATE TABLE IF NOT EXISTS `general_subscribers` (
  `id` int(11) NOT NULL,
  `ids` text,
  `first_name` text,
  `last_name` text,
  `email` text,
  `ip` text,
  `country` varchar(255) DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `general_transaction_logs`
--

CREATE TABLE IF NOT EXISTS `general_transaction_logs` (
  `id` int(11) NOT NULL,
  `ids` text,
  `uid` int(11) DEFAULT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `type` text,
  `transaction_id` text,
  `txn_fee` double DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  `data` text,
  `amount` float DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `general_users`
--

CREATE TABLE IF NOT EXISTS `general_users` (
  `id` int(11) NOT NULL,
  `ids` text,
  `role` enum('admin','user') DEFAULT 'user',
  `login_type` text,
  `first_name` text,
  `last_name` text,
  `email` text,
  `password` text,
  `timezone` text,
  `more_information` text,
  `settings` longtext,
  `desc` longtext,
  `balance` decimal(15,4) DEFAULT '0.0000',
  `custom_rate` int(11) NOT NULL DEFAULT '0',
  `api_key` varchar(191) DEFAULT NULL,
  `spent` varchar(225) DEFAULT NULL,
  `activation_key` text,
  `reset_key` text,
  `history_ip` text,
  `status` int(1) DEFAULT '1',
  `changed` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `general_users`
--

INSERT INTO `general_users` (`id`, `ids`, `role`, `login_type`, `first_name`, `last_name`, `email`, `password`, `timezone`, `more_information`, `settings`, `desc`, `balance`, `custom_rate`, `api_key`, `spent`, `activation_key`, `reset_key`, `history_ip`, `status`, `changed`, `created`) VALUES
(38, 'e7ace76210625c6880498190c0af2d58', 'admin', NULL, 'admin', 'admin', 'admin@admin.com', '$2a$08$Mi5Fjq4vCcn/bREJDrYUZO18.daW2v0V76qEvz90usXgpZG7h5Mxy', 'Europe/Moscow', NULL, '{"limit_payments":{"freekassa":"1"}}', '', 0.0000, 0, NULL, NULL, 'c4a78c5172c30e669bb05d9dse48d6f5', '89f50d405cc08a57ee479429af1ddfc9', '46.151.81.125', 1, '2023-05-03 00:52:34', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `general_users_price`
--

CREATE TABLE IF NOT EXISTS `general_users_price` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) NOT NULL,
  `ids` text CHARACTER SET utf8,
  `type` enum('direct','api') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direct',
  `cate_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_order_id` int(11) DEFAULT NULL,
  `service_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `api_provider_id` int(11) DEFAULT NULL,
  `api_service_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_order_id` int(11) DEFAULT '0',
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usernames` text COLLATE utf8mb4_unicode_ci,
  `username` text COLLATE utf8mb4_unicode_ci,
  `hashtags` text COLLATE utf8mb4_unicode_ci,
  `hashtag` text COLLATE utf8mb4_unicode_ci,
  `media` text COLLATE utf8mb4_unicode_ci,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `sub_posts` int(11) DEFAULT NULL,
  `sub_min` int(11) DEFAULT NULL,
  `sub_max` int(11) DEFAULT NULL,
  `sub_delay` int(11) DEFAULT NULL,
  `sub_expiry` text COLLATE utf8mb4_unicode_ci,
  `sub_response_orders` text COLLATE utf8mb4_unicode_ci,
  `sub_response_posts` text COLLATE utf8mb4_unicode_ci,
  `sub_status` enum('Active','Paused','Completed','Expired','Canceled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(15,4) DEFAULT NULL,
  `formal_charge` decimal(15,4) DEFAULT NULL,
  `profit` decimal(15,4) DEFAULT NULL,
  `status` enum('active','completed','processing','inprogress','pending','partial','canceled','refunded','awaiting','error','fail') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `start_counter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remains` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_drip_feed` int(1) DEFAULT '0',
  `runs` int(11) DEFAULT '0',
  `interval` int(2) DEFAULT '0',
  `dripfeed_quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `changed` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=389891 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(225) NOT NULL,
  `min` double NOT NULL,
  `max` double NOT NULL,
  `new_users` int(1) NOT NULL DEFAULT '0' COMMENT '1:Allowed, 0: Not Allowed',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1 -> ON, 0 -> OFF',
  `params` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`id`, `type`, `name`, `min`, `max`, `new_users`, `status`, `params`) VALUES
(13, 'paypal', 'Paypal Checkout', 50, 20000, 1, 0, '{"type":"paypal","name":"Paypal Checkout","min":"50","max":"20000","new_users":"1","status":"1","take_fee_from_user":"1","option":{"environment":"sandbox","client_id":"11111","secret_key":"1111"}}'),
(14, 'stripe', 'Stripe Checkout', 50, 20000, 1, 0, '{"type":"stripe","name":"Stripe Checkout","min":"50","max":"20000","new_users":"1","status":"1","option":{"tnx_fee":"5","environment":"sandbox","public_key":"111111111","secret_key":"111111"}}'),
(15, 'freekassa', 'Freekassa', 75, 20000, 1, 1, '{"type":"freekassa","name":"Freekassa","min":"75","max":"20000","new_users":"1","status":"1","take_fee_from_user":"1","option":{"merchant_id":"8878","secret_key_1":")8WaKN?Xnq=6F1P","secret_key_2":"8>^PCG]gpT*Eh$)"}}');

-- --------------------------------------------------------

--
-- Структура таблицы `payments_bonus`
--

CREATE TABLE IF NOT EXISTS `payments_bonus` (
  `id` int(11) NOT NULL,
  `ids` varchar(100) DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `percentage` double NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL,
  `ids` text,
  `uid` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `name` text,
  `desc` text,
  `price` decimal(15,4) DEFAULT NULL,
  `original_price` decimal(15,4) DEFAULT NULL,
  `min` int(50) DEFAULT NULL,
  `max` int(50) DEFAULT NULL,
  `add_type` enum('manual','api') DEFAULT 'manual',
  `type` varchar(100) DEFAULT 'default',
  `api_service_id` varchar(200) DEFAULT NULL,
  `api_provider_id` int(11) DEFAULT NULL,
  `dripfeed` int(1) DEFAULT '0',
  `status` int(1) DEFAULT '1',
  `changed` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=922 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(10) unsigned NOT NULL,
  `ids` text COLLATE utf8mb4_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('new','pending','closed','answered') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `user_read` double NOT NULL DEFAULT '0',
  `admin_read` double NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `changed` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `ticket_messages`
--

CREATE TABLE IF NOT EXISTS `ticket_messages` (
  `id` int(10) unsigned NOT NULL,
  `ids` text COLLATE utf8mb4_unicode_ci,
  `uid` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ticket_messages`
--

INSERT INTO `ticket_messages` (`id`, `ids`, `uid`, `ticket_id`, `message`, `is_read`, `changed`, `created`) VALUES
(1, 'a601afc6492b042428c62bd0ae43825d', 38, 6, 'Здравствуйте!\r\nПриняты в работу ваши заказы, ожидайте, небольшой сбой произошёл по заказу, извиняемся  за предоставленные неудобства.', 1, '2022-07-08 11:45:32', '2022-07-08 11:45:32');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `api_providers`
--
ALTER TABLE `api_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`uid`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_custom_page`
--
ALTER TABLE `general_custom_page`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_file_manager`
--
ALTER TABLE `general_file_manager`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_lang`
--
ALTER TABLE `general_lang`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_lang_list`
--
ALTER TABLE `general_lang_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_news`
--
ALTER TABLE `general_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`uid`);

--
-- Индексы таблицы `general_options`
--
ALTER TABLE `general_options`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_purchase`
--
ALTER TABLE `general_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_sessions`
--
ALTER TABLE `general_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Индексы таблицы `general_subscribers`
--
ALTER TABLE `general_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_transaction_logs`
--
ALTER TABLE `general_transaction_logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_users`
--
ALTER TABLE `general_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `general_users_price`
--
ALTER TABLE `general_users_price`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`uid`);

--
-- Индексы таблицы `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_messages_user_id_foreign` (`uid`),
  ADD KEY `ticket_messages_ticket_id_foreign` (`ticket_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `api_providers`
--
ALTER TABLE `api_providers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=176;
--
-- AUTO_INCREMENT для таблицы `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `general_custom_page`
--
ALTER TABLE `general_custom_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `general_file_manager`
--
ALTER TABLE `general_file_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=322;
--
-- AUTO_INCREMENT для таблицы `general_lang`
--
ALTER TABLE `general_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `general_lang_list`
--
ALTER TABLE `general_lang_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `general_news`
--
ALTER TABLE `general_news`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `general_options`
--
ALTER TABLE `general_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=152;
--
-- AUTO_INCREMENT для таблицы `general_purchase`
--
ALTER TABLE `general_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `general_subscribers`
--
ALTER TABLE `general_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `general_transaction_logs`
--
ALTER TABLE `general_transaction_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT для таблицы `general_users`
--
ALTER TABLE `general_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT для таблицы `general_users_price`
--
ALTER TABLE `general_users_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=389891;
--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=922;
--
-- AUTO_INCREMENT для таблицы `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
