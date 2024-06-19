-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 19 2024 г., 07:27
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `VSTStore`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `cust_id` int NOT NULL,
  `cust_name` varchar(100) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `cust_password` varchar(100) NOT NULL,
  `cust_token` varchar(255) NOT NULL,
  `cust_datetime` varchar(100) NOT NULL,
  `cust_timestamp` varchar(100) NOT NULL,
  `cust_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_customer`
--

INSERT INTO `tbl_customer` (`cust_id`, `cust_name`, `cust_email`, `cust_password`, `cust_token`, `cust_datetime`, `cust_timestamp`, `cust_status`) VALUES
(3, 'Jean Collins', 'jean@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '6b3439bf95644a36a1ed92bef374ebb7', '2022-03-20 10:29:39', '1647797379', 1),
(4, 'Annie Young', 'annie@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'fc8f07537cdd6b3f89eb94f1cad78060', '2022-03-20 10:31:35', '1647797495', 1),
(5, 'Matthew Morales', 'matthew@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'c391105908fe01a636bfa5fc39eed33d', '2022-03-20 10:33:15', '1647797595', 1),
(6, 'August F. Freels', 'august@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'decc1fc2c5dd9935df82c0233002ce66', '2022-03-20 10:34:08', '1647797648', 1),
(7, 'Carl M. Dineen', 'carl@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'c79bac688e70cc9665a2164c57ec172c', '2022-03-20 10:35:02', '1647797702', 1),
(8, 'Benjamin B. Louque', 'benjamin@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '5a0e096368f9669508af7b7203382b07', '2022-03-20 10:36:31', '1647797791', 1),
(9, 'Joe K. Richardson', 'joe@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'e74ac0178d7833988d4b1625c42ba26e', '2022-03-20 10:37:18', '1647797838', 1),
(10, 'Will Williams', 'williams@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '941c9265fb920f691cf01b12a15f80f8', '2022-03-20 11:15:59', '1647800159', 1),
(13, 'sdfsf', 'adminklkl@mail.com', '21232f297a57a5a743894a0e4a801fc3', 'b2ff8430ef276125303c3b6b685569f9', '2024-06-01 02:49:57', '1717669854', 1),
(14, 'svfv', 'aaddminklkl@mail.com', '21232f297a57a5a743894a0e4a801fc3', 'ec132c08f2ca767255d85b936803536a', '2024-06-04 11:20:33', '1717532433', 1),
(15, 'erergve', 'ervre@gmail.ru', '21232f297a57a5a743894a0e4a801fc3', '55ba5f119c2f76f523d0f79f7c3cd11e', '2024-06-04 11:22:52', '1717532572', 1),
(16, 'erergve', 'ervref@gmail.ru', 'e00cf25ad42683b3df678c61f42c6bda', '', '2024-06-04 11:24:16', '', 1),
(17, 'dmitriy', 'savarovskiy.dima@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'ee841f828b6a1414e6246745b11568c4', '2024-06-07 02:53:05', '1717723825', 1),
(18, 'Dmitry', 'vststore@bk.ru', 'e00cf25ad42683b3df678c61f42c6bda', '', '2024-06-07 04:18:08', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_customer_message`
--

CREATE TABLE `tbl_customer_message` (
  `customer_message_id` int NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `order_detail` text NOT NULL,
  `cust_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_customer_message`
--

INSERT INTO `tbl_customer_message` (`customer_message_id`, `subject`, `message`, `order_detail`, `cust_id`) VALUES
(9, 'fewfwe', 'wfwefwef', '\nCustomer Name: Dmitry<br>\nCustomer Email: vststore@bk.ru<br>\nPayment Method: <br>\nPayment Date: 2024-06-07 05:15:13<br>\nPayment Details: <br><br>\nPaid Amount: 198<br>\nPayment Status: Completed<br>\nShipping Status: <br>\nPayment Id: 7588404442<br>\n            \n<br><b><u>Product Item 1</u></b><br>\nProduct Name: <br>\nSize: <br>\nColor: <br>\nQuantity: 4<br>\nUnit Price: 35<br>\n            \n<br><b><u>Product Item 2</u></b><br>\nProduct Name: <br>\nSize: <br>\nColor: <br>\nQuantity: 2<br>\nUnit Price: 29<br>\n            ', 18),
(10, 'fewfwe', 'wfwefwef', '\nCustomer Name: Dmitry<br>\nCustomer Email: vststore@bk.ru<br>\nPayment Method: <br>\nPayment Date: 2024-06-07 05:15:13<br>\nPayment Details: <br><br>\nPaid Amount: 198<br>\nPayment Status: Completed<br>\nShipping Status: <br>\nPayment Id: 7588404442<br>\n            \n<br><b><u>Product Item 1</u></b><br>\nProduct Name: <br>\nSize: <br>\nColor: <br>\nQuantity: 4<br>\nUnit Price: 35<br>\n            \n<br><b><u>Product Item 2</u></b><br>\nProduct Name: <br>\nSize: <br>\nColor: <br>\nQuantity: 2<br>\nUnit Price: 29<br>\n            ', 18),
(11, 'fewfwe', 'wfwefwef', '\nCustomer Name: Dmitry<br>\nCustomer Email: vststore@bk.ru<br>\nPayment Method: <br>\nPayment Date: 2024-06-07 05:15:13<br>\nPayment Details: <br><br>\nPaid Amount: 198<br>\nPayment Status: Completed<br>\nShipping Status: <br>\nPayment Id: 7588404442<br>\n            \n<br><b><u>Product Item 1</u></b><br>\nProduct Name: <br>\nSize: <br>\nColor: <br>\nQuantity: 4<br>\nUnit Price: 35<br>\n            \n<br><b><u>Product Item 2</u></b><br>\nProduct Name: <br>\nSize: <br>\nColor: <br>\nQuantity: 2<br>\nUnit Price: 29<br>\n            ', 18);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_end_category`
--

CREATE TABLE `tbl_end_category` (
  `ecat_id` int NOT NULL,
  `ecat_name` varchar(255) NOT NULL,
  `mcat_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_end_category`
--

INSERT INTO `tbl_end_category` (`ecat_id`, `ecat_name`, `mcat_id`) VALUES
(1, 'Chorus', 1),
(2, 'Compressor', 1),
(3, 'Delay', 1),
(4, 'Distortion', 1),
(5, 'EQ', 1),
(6, 'Flanger', 1),
(7, 'Limiter', 1),
(8, 'Mastering', 1),
(9, '8bit', 2),
(10, 'Bass Synth', 2),
(11, 'Guitar', 2),
(12, 'Modular', 2),
(13, 'Organ', 2),
(14, 'Pads', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `faq_id` int NOT NULL,
  `faq_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `faq_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_faq`
--

INSERT INTO `tbl_faq` (`faq_id`, `faq_title`, `faq_content`) VALUES
(1, 'Как найти плагин?', '<h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; margin: 0.2rem 0px 0.5rem; padding: 0px; line-height: 1.4; background-color: rgb(250, 250, 250);\"><span style=\"color: inherit;\">1. Если вы ищете конкретный плагин, воспользуйтесь полем поиска по ключевым словам, расположенным в верхней части сайта. Просто введите то, что вы ищете.</span><br></h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; margin: 0.2rem 0px 0.5rem; padding: 0px; line-height: 1.4; background-color: rgb(250, 250, 250);\">2. Если вы хотите просмотреть категории плагинов, используйте вкладку «Плагины VST» в верхнем меню и перемещайтесь по любимым категориям.</h3>\r\n'),
(2, 'Как зарегистрироваться?', '<h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; line-height: 1.4; color: rgb(0, 0, 0); margin: 0.2rem 0px 0.5rem; text-rendering: optimizelegibility; padding: 0px; background-color: rgb(250, 250, 250);\">1. Необходимо кликнуть на кнопку зарегистрироваться.</h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; line-height: 1.4; color: rgb(0, 0, 0); margin: 0.2rem 0px 0.5rem; text-rendering: optimizelegibility; padding: 0px; background-color: rgb(250, 250, 250);\">2. Нужно заполнить форму и отправить ее.</h3>\r\n'),
(3, 'Что делать, если забыл пароль?', '<h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; line-height: 1.4; color: rgb(0, 0, 0); margin: 0.2rem 0px 0.5rem; text-rendering: optimizelegibility; padding: 0px; background-color: rgb(250, 250, 250);\">Если вы забыли пароль, то свяжитесь с нами по электронной почте - support@vststore.com или телефону +791 10 101 0010, также можно заполнить форму на странице \"связаться с нами\".</h3>');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_language`
--

CREATE TABLE `tbl_language` (
  `lang_id` int NOT NULL,
  `lang_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_language`
--

INSERT INTO `tbl_language` (`lang_id`, `lang_name`, `lang_value`) VALUES
(1, 'Валюта', '₽'),
(2, 'Искать VST', 'Искать VST'),
(3, 'Поиск', 'Поиск'),
(4, 'Войти', 'Войти'),
(5, 'Обновить', 'Обновить'),
(6, 'Читать больше', 'Читать больше'),
(7, 'Серия', 'Серия'),
(8, 'Фото', 'Фото'),
(9, 'Войти', 'Войти'),
(10, 'Вход клиента в систему', 'Вход клиента в систему'),
(11, 'Нажмите, чтобы войти', 'Нажмите, чтобы войти'),
(12, 'Назад на страницу входа', 'Назад на страницу входа'),
(13, 'Вошли как ', 'Вошли как '),
(14, 'Выйти', 'Выйти'),
(15, 'Регистрация', 'Регистрация'),
(16, 'Регистрация клиента', 'Регистрация клиента'),
(17, 'Успешная регистрация', 'Успешная регистрация'),
(18, 'Корзина', 'Корзина'),
(19, 'Посмотреть корзину', 'Посмотреть корзину'),
(20, 'Обновление корзины', 'Обновление корзины'),
(21, 'Обратно в корзину', 'Обратно в корзину'),
(22, 'Оформление Заказа', 'Оформление Заказа'),
(23, 'Перейти к оформлению заказа', 'Перейти к оформлению заказа'),
(24, 'Покупки', 'Покупки'),
(25, 'История покупок', 'История покупок'),
(26, 'Детали покупки', 'Детали покупки'),
(27, 'Время и дата оплаты', 'Время и дата оплаты'),
(28, 'ID Транзакции', 'ID Транзакции'),
(29, 'Выплаченная сумма', 'Выплаченная сумма'),
(30, 'Статус платежа', 'Статус платежа'),
(31, 'Способ оплаты', 'Способ оплаты'),
(32, 'ID платежа', 'ID платежа'),
(33, 'Раздел оплаты', 'Раздел оплаты'),
(34, 'Select Payment Method', 'Select Payment Method'),
(35, 'Select a Method', 'Select a Method'),
(36, 'PayPal', 'PayPal'),
(37, 'Stripe', 'Stripe'),
(38, 'Bank Deposit', 'Bank Deposit'),
(39, 'Card Number', 'Card Number'),
(40, 'CVV', 'CVV'),
(41, 'Month', 'Month'),
(42, 'Year', 'Year'),
(43, 'Send to this Details', 'Send to this Details'),
(44, 'Transaction Information', 'Transaction Information'),
(45, 'Include transaction id and other information correctly', 'Include transaction id and other information correctly'),
(46, 'Pay Now', 'Pay Now'),
(47, 'Наименование', 'Наименование'),
(48, 'Детали покупки', 'Детали покупки'),
(49, '', ''),
(50, 'Категории:', 'Категории:'),
(51, 'Все', 'Все'),
(52, 'Select Size', 'Select Size'),
(53, 'Select Color', 'Select Color'),
(54, 'Цена', 'Цена'),
(55, 'Количество', 'Количество'),
(56, 'Распродано', 'Распродано'),
(57, 'Share This', 'Share This'),
(58, 'Поделиться этим плагином', 'Поделиться этим плагином'),
(59, 'Описание', 'Описание'),
(60, 'Features', 'Features'),
(61, 'Conditions', 'Conditions'),
(62, 'Системные требования', 'Системные требования'),
(63, 'Отзывы', 'Отзывы'),
(64, 'Отзыв', 'Отзыв'),
(65, 'Оставить отзыв', 'Оставить отзыв'),
(66, 'Write your comment (Optional)', 'Write your comment (Optional)'),
(67, 'Submit Review', 'Submit Review'),
(68, 'You already have given a rating!', 'You already have given a rating!'),
(69, 'You must have to login to give a review', 'You must have to login to give a review'),
(70, 'Не найдено описание', 'Не найдено описание'),
(71, 'Функция не найдена', 'Функция не найдена'),
(72, '-', '-'),
(73, 'Системные требования не найдены', 'Системные требования не найдены'),
(74, 'Review not found', 'Review not found'),
(75, 'Customer Name', 'Customer Name'),
(76, 'Comment', 'Comment'),
(77, 'Comments', 'Comments'),
(78, 'Rating', 'Rating'),
(79, 'Previous', 'Previous'),
(80, 'Далее', 'Далее'),
(81, 'Промежуточный итог', 'Промежуточный итог'),
(82, 'Итого', 'Итого'),
(83, 'Удаление', 'Удаление'),
(84, 'Shipping Cost', 'Shipping Cost'),
(85, 'Продолжить покупать', 'Продолжить покупать'),
(86, 'Update Billing Address', 'Update Billing Address'),
(87, 'Update Shipping Address', 'Update Shipping Address'),
(88, 'Обновить информацию', 'Обновить информацию'),
(89, 'Панель', 'Панель'),
(90, 'Добро пожаловать на панель управления', 'Добро пожаловать на панель управления'),
(91, 'Вернуться к панели', 'Вернуться к панели'),
(92, 'Подписаться', 'Подписаться'),
(93, 'ПОДПИСЫВАЙТЕСЬ НА НАШУ НОВОСТНУЮ РАССЫЛКУ', 'ПОДПИСЫВАЙТЕСЬ НА НАШУ НОВОСТНУЮ РАССЫЛКУ'),
(94, 'Email адрес', 'Email адрес'),
(95, 'Введите свой email', 'Введите свой email'),
(96, 'Пароль', 'Пароль'),
(97, 'Забыли пароль', 'Забыли пароль'),
(98, 'Повторите пароль', 'Повторите пароль'),
(99, 'Обновить пароль', 'Обновить пароль'),
(100, 'Новый пароль', 'Новый пароль'),
(101, 'Введите повторно новый пароль', 'Введите повторно новый пароль'),
(102, 'Полное имя', 'Полное имя'),
(103, 'Company Name', 'Company Name'),
(104, 'Номер телефона', 'Номер телефона'),
(105, 'Адресс', 'Адресс'),
(106, 'Страна', 'Страна'),
(107, 'Город', 'Город'),
(108, 'State', 'State'),
(109, 'Zip Code', 'Zip Code'),
(110, 'О нас', 'О нас'),
(111, 'Featured Posts', 'Featured Posts'),
(112, 'Popular Posts', 'Popular Posts'),
(113, 'Recent Posts', 'Recent Posts'),
(114, 'Contact Information', 'Contact Information'),
(115, 'Contact Form', 'Contact Form'),
(116, 'Our Office', 'Our Office'),
(117, 'Обновить имя', 'Обновить имя'),
(118, 'Отправить сообщение', 'Отправить сообщение'),
(119, 'Сообщение', 'Сообщение'),
(120, 'Найдите нас на карте', 'Найдите нас на карте'),
(121, 'Поздравляем! Оплата прошла успешно.', 'Поздравляем! Оплата прошла успешно.'),
(122, 'Billing and Shipping Information is updated successfully.', 'Billing and Shipping Information is updated successfully.'),
(123, 'Customer Name can not be empty.', 'Customer Name can not be empty.'),
(124, 'Phone Number can not be empty.', 'Phone Number can not be empty.'),
(125, 'Address can not be empty.', 'Address can not be empty.'),
(126, 'You must have to select a country.', 'You must have to select a country.'),
(127, 'City can not be empty.', 'City can not be empty.'),
(128, 'State can not be empty.', 'State can not be empty.'),
(129, 'Zip Code can not be empty.', 'Zip Code can not be empty.'),
(130, 'Информация профиля успешно обновлена.', 'Информация профиля успешно обновлена.'),
(131, 'Адрес электронной почты не может быть пустым', 'Адрес электронной почты не может быть пустым'),
(132, 'Email and/or Password can not be empty.', 'Email and/or Password can not be empty.'),
(133, 'Email Address does not match.', 'Email Address does not match.'),
(134, 'Адрес электронной почты должен быть действительным.', 'Адрес электронной почты должен быть действительным.'),
(135, 'Ваш адрес электронной почты не найден в нашей системе.', 'Ваш адрес электронной почты не найден в нашей системе.'),
(136, 'Please check your email and confirm your subscription.', 'Please check your email and confirm your subscription.'),
(137, 'Your email is verified successfully. You can now login to our website.', 'Your email is verified successfully. You can now login to our website.'),
(138, 'Пароль не может быть пустым.', 'Пароль не может быть пустым.'),
(139, 'Пароли не совпадают.', 'Пароли не совпадают.'),
(140, 'Пожалуйста, введите новый пароль и повторите его.', 'Пожалуйста, введите новый пароль и повторите его.'),
(141, 'Пароль успешно обновлен.', 'Пароль успешно обновлен.'),
(142, 'To reset your password, please click on the link below.', 'To reset your password, please click on the link below.'),
(143, 'PASSWORD RESET REQUEST - YOUR WEBSITE.COM', 'PASSWORD RESET REQUEST - YOUR WEBSITE.COM'),
(144, 'Время отправки письма для сброса пароля (24 часа) истекло. Пожалуйста, попробуйте еще раз сбросить пароль.', 'Время отправки письма для сброса пароля (24 часа) истекло. Пожалуйста, попробуйте еще раз сбросить пароль.'),
(145, 'A confirmation link is sent to your email address. You will get the password reset information in there.', 'A confirmation link is sent to your email address. You will get the password reset information in there.'),
(146, 'Пароль успешно сброшен. Теперь вы можете войти.', 'Пароль успешно сброшен. Теперь вы можете войти.'),
(147, 'Email Address Already Exists', 'Email Address Already Exists.'),
(148, 'Sorry! Your account is inactive. Please contact to the administrator.', 'Sorry! Your account is inactive. Please contact to the administrator.'),
(149, 'Изменить пароль', 'Изменить пароль'),
(150, 'Registration Email Confirmation for YOUR WEBSITE', 'Registration Email Confirmation for YOUR WEBSITE.'),
(151, 'Спасибо за регистрацию! Ваш аккаунт был создан.', 'Спасибо за регистрацию! Ваш аккаунт был создан.'),
(152, 'Успешно', 'Успешно'),
(153, 'Плагин не найден', 'Плагин не найден'),
(154, 'Добавить в корзину', 'Добавить в корзину'),
(155, 'Другие плагины из этой категории', 'Другие плагины из этой категории'),
(156, 'Посмотрите все похожие плагины внизу', 'Посмотрите все похожие плагины внизу'),
(157, 'Вес', 'Вес'),
(158, 'Версия', 'Версия'),
(159, 'Цена', 'Цена'),
(160, 'Зарегистрируйтесь для оформления', 'Зарегистрируйтесь для оформления'),
(161, 'Billing Address', 'Billing Address'),
(162, 'Адрес доставки', 'Адрес доставки'),
(163, 'Rating is Submitted Successfully!', 'Rating is Submitted Successfully!'),
(164, 'Оплатить', 'Оплатить');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_mid_category`
--

CREATE TABLE `tbl_mid_category` (
  `mcat_id` int NOT NULL,
  `mcat_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tcat_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_mid_category`
--

INSERT INTO `tbl_mid_category` (`mcat_id`, `mcat_name`, `tcat_id`) VALUES
(1, 'Эффекты', 1),
(2, 'Инструменты', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int NOT NULL,
  `p_id` int NOT NULL,
  `p_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `quantity` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `unit_price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `p_id`, `p_name`, `quantity`, `unit_price`, `payment_id`) VALUES
(1, 83, 'Men\'s Ultra Cotton T-Shirt, Multipack', '1', '19', '1647629329'),
(2, 92, 'Travelpro Laptop Carry-on Travel Tote Bag', '1', '91', '1647798593'),
(4, 101, 'Digital Infrared Thermometer for Adults and Kids', '1', '70', '1647799174'),
(5, 94, 'WD 5TB Elements Portable External Hard Drive HDD', '1', '149', '1647800902'),
(8, 99, 'Action Delay', '7', '29', '7133174605'),
(9, 85, 'OSL Multi Chorus', '3', '35', '7133174605'),
(10, 84, 'SpeakerSim', '2', '29', '7133174605'),
(11, 99, 'Action Delay', '6', '29', '4737776463'),
(12, 87, 'Pivot', '4', '11', '4737776463'),
(13, 85, 'OSL Multi Chorus', '4', '35', '7588404442'),
(14, 99, 'Action Delay', '2', '29', '7588404442'),
(15, 83, 'Ultimate FireSonic Bundle', '1', '199', '2396014310'),
(16, 86, 'Dynamic Delay', '7', '19', '9761773149'),
(17, 85, 'OSL Multi Chorus', '1', '35', '4867657858'),
(18, 85, 'OSL Multi Chorus', '1', '3900', '1308979250'),
(19, 104, 'miniVerb', '1', '123', '1761406917'),
(20, 85, 'OSL Multi Chorus', '1', '3900', '2925953825'),
(21, 83, 'Ultimate FireSonic Bundle', '1', '32500', '2925953825'),
(22, 84, 'SpeakerSim', '2', '7000', '3400379371');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_page`
--

CREATE TABLE `tbl_page` (
  `id` int NOT NULL,
  `about_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `about_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `about_banner` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `about_meta_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `about_meta_keyword` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `about_meta_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `faq_title` varchar(255) NOT NULL,
  `faq_banner` varchar(255) NOT NULL,
  `faq_meta_title` varchar(255) NOT NULL,
  `faq_meta_keyword` text NOT NULL,
  `faq_meta_description` text NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `blog_banner` varchar(255) NOT NULL,
  `blog_meta_title` varchar(255) NOT NULL,
  `blog_meta_keyword` text NOT NULL,
  `blog_meta_description` text NOT NULL,
  `contact_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_banner` varchar(255) NOT NULL,
  `contact_meta_title` varchar(255) NOT NULL,
  `contact_meta_keyword` text NOT NULL,
  `contact_meta_description` text NOT NULL,
  `pgallery_title` varchar(255) NOT NULL,
  `pgallery_banner` varchar(255) NOT NULL,
  `pgallery_meta_title` varchar(255) NOT NULL,
  `pgallery_meta_keyword` text NOT NULL,
  `pgallery_meta_description` text NOT NULL,
  `vgallery_title` varchar(255) NOT NULL,
  `vgallery_banner` varchar(255) NOT NULL,
  `vgallery_meta_title` varchar(255) NOT NULL,
  `vgallery_meta_keyword` text NOT NULL,
  `vgallery_meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_page`
--

INSERT INTO `tbl_page` (`id`, `about_title`, `about_content`, `about_banner`, `about_meta_title`, `about_meta_keyword`, `about_meta_description`, `faq_title`, `faq_banner`, `faq_meta_title`, `faq_meta_keyword`, `faq_meta_description`, `blog_title`, `blog_banner`, `blog_meta_title`, `blog_meta_keyword`, `blog_meta_description`, `contact_title`, `contact_banner`, `contact_meta_title`, `contact_meta_keyword`, `contact_meta_description`, `pgallery_title`, `pgallery_banner`, `pgallery_meta_title`, `pgallery_meta_keyword`, `pgallery_meta_description`, `vgallery_title`, `vgallery_banner`, `vgallery_meta_title`, `vgallery_meta_keyword`, `vgallery_meta_description`) VALUES
(1, 'О нас', '<h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; line-height: 1.4; color: rgb(0, 0, 0); margin: 0.2rem 0px 0.5rem; text-rendering: optimizelegibility; padding: 0px; background-color: rgb(250, 250, 250);\">Добро пожаловать на страницу \"О нас\" нашего онлайн-магазина VST-плагинов! Мы - команда энтузиастов музыки и звукозаписи, которые помогут вам воплощать музыкальные идеи в жизнь.</h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; line-height: 1.4; color: rgb(0, 0, 0); margin: 0.2rem 0px 0.5rem; text-rendering: optimizelegibility; padding: 0px; background-color: rgb(250, 250, 250);\">Наш магазин предлагает широкий выбор качественных VST-плагинов от ведущих разработчиков для создания уникального звукового оформления ваших композиций. Мы стремимся предложить вам лучшие инструменты для работы в сфере звукозаписи, обеспечивая высокое качество и надежность каждого предлагаемого продукта.</h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; line-height: 1.4; color: rgb(0, 0, 0); margin: 0.2rem 0px 0.5rem; text-rendering: optimizelegibility; padding: 0px; background-color: rgb(250, 250, 250);\">Наша цель - сделать ваш процесс создания музыки более удобным, эффективным и вдохновляющим. Мы постоянно обновляем ассортимент VST-плагинов, чтобы вы могли расширять свои творческие возможности и достигать новых высот в своем музыкальном творчестве.</h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; line-height: 1.4; color: rgb(0, 0, 0); margin: 0.2rem 0px 0.5rem; text-rendering: optimizelegibility; padding: 0px; background-color: rgb(250, 250, 250);\">Не стесняйтесь обращаться к нам с вопросами, предложениями или пожеланиями. Наша команда всегда готова помочь вам выбрать и приобрести идеальный VST-плагин для ваших потребностей. Благодарим вас за выбор нашего магазина и надеемся, что наши продукты помогут вам достигнуть новых музыкальных вершин!</h3>', 'about-banner.jpg', 'VST Store - О нас', 'О нас', 'О нас', 'FAQ', 'faq-banner.jpg', 'VST Store - FAQ', '', '', 'Blog', 'blog-banner.jpg', 'VST Store - Blog', '', '', 'Связаться с нами', 'contact-banner.jpg', 'VST Store - Contact', '', '', 'Photo Gallery', 'pgallery-banner.jpg', 'Ecommerce - Photo Gallery', '', '', 'Video Gallery', 'vgallery-banner.jpg', 'Ecommerce - Video Gallery', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `payment_date` varchar(50) NOT NULL,
  `paid_amount` int NOT NULL,
  `payment_status` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_payment`
--

INSERT INTO `tbl_payment` (`id`, `customer_id`, `customer_name`, `customer_email`, `payment_date`, `paid_amount`, `payment_status`, `payment_id`, `link`) VALUES
(51, 2, 'Chad N. Carney', 'chad@mail.com', '2022-03-18 22:48:49', 19, 'Completed', '1647629329', '0'),
(52, 3, 'Jean Collins', 'jean@mail.com', '2022-03-20 10:49:53', 91, 'Completed', '1647798593', ''),
(54, 6, 'August F. Freels', 'august@mail.com', '2022-03-20 10:59:34', 70, 'Completed', '1647799174', ''),
(55, 10, 'Will Williams', 'williams@mail.com', '2022-03-20 11:28:22', 149, 'Completed', '1647800902', 'Download.com/1'),
(58, 13, 'sdfsf', 'adminklkl@mail.com', '2024-06-07 02:16:30', 366, 'Успешно', '7133174605', '-'),
(59, 13, 'sdfsf', 'adminklkl@mail.com', '2024-06-07 02:41:26', 218, 'Успешно', '4737776463', 'https://cloud.mail.ru/public/j6u7/8t5jXWxGy'),
(60, 18, 'Dmitry', 'vststore@bk.ru', '2024-06-07 05:15:13', 198, 'Успешно', '7588404442', ''),
(61, 13, 'sdfsf', 'adminklkl@mail.com', '2024-06-07 07:56:38', 199, 'Успешно', '2396014310', ''),
(62, 17, 'dmitriy', 'savarovskiy.dima@gmail.com', '2024-06-07 11:13:20', 133, 'Успешно', '9761773149', 'https://cloud.mail.ru/public/5Hbw/fG8rZAy1b'),
(63, 16, 'erergve', 'ervref@gmail.ru', '2024-06-07 11:19:34', 35, 'Успешно', '4867657858', 'eferf'),
(64, 16, 'erergve', 'ervref@gmail.ru', '2024-06-07 14:28:50', 3900, 'Успешно', '1308979250', ''),
(65, 16, 'erergve', 'ervref@gmail.ru', '2024-06-07 14:36:34', 123, 'Успешно', '1761406917', ''),
(66, 16, 'erergve', 'ervref@gmail.ru', '2024-06-07 14:37:23', 123, 'Успешно', '4811250803', ''),
(67, 17, 'dmitriy', 'savarovskiy.dima@gmail.com', '2024-06-08 10:54:46', 36400, 'Успешно', '2925953825', 'https://cloud.mail.ru/public/j6u7/8t5jXWxGy'),
(68, 17, 'dmitriy', 'savarovskiy.dima@gmail.com', '2024-06-10 22:32:01', 14000, 'Успешно', '3400379371', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_photo`
--

CREATE TABLE `tbl_photo` (
  `id` int NOT NULL,
  `caption` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_photo`
--

INSERT INTO `tbl_photo` (`id`, `caption`, `photo`) VALUES
(1, 'Photo 1', 'photo-1.jpg'),
(2, 'Photo 2', 'photo-2.jpg'),
(3, 'Photo 3', 'photo-3.jpg'),
(4, 'Photo 4', 'photo-4.jpg'),
(5, 'Photo 5', 'photo-5.jpg'),
(6, 'Photo 6', 'photo-6.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_product`
--

CREATE TABLE `tbl_product` (
  `p_id` int NOT NULL,
  `p_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `p_old_price` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `p_current_price` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `p_qty` int NOT NULL,
  `p_featured_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `p_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `p_short_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `p_system_require` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `p_total_view` int NOT NULL,
  `p_is_featured` int NOT NULL,
  `p_is_active` int NOT NULL,
  `ecat_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_product`
--

INSERT INTO `tbl_product` (`p_id`, `p_name`, `p_old_price`, `p_current_price`, `p_qty`, `p_featured_photo`, `p_description`, `p_short_description`, `p_system_require`, `p_total_view`, `p_is_featured`, `p_is_active`, `ecat_id`) VALUES
(83, 'Ultimate FireSonic Bundle', '40360', '32500', 7, '4.jpg', '<p style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"overflow-wrap: break-word; display: block;\"></span></p><p style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"overflow-wrap: break-word; display: block;\">FireSonic — разработчик средств расширения номер один для UnitedPlugins. Они любят разрабатывать умные и простые в использовании инструменты, которые можно использовать в любом треке, чтобы он звучал лучше! Обычно вам нужно настроить всего одну ручку, чтобы услышать значительное улучшение ваших треков. Независимо от того, нужно ли вам настроить бас, гитару, вокал, ударные или мастер-трек, эти инструменты помогут вам достичь цели за несколько секунд. В комплект входят FireCobra, интеллектуальный усилитель звука, FirePresser, блендер с четырьмя классическими компрессорами, FireMaster, идеальный финишер и FireCharger — активатор трека.</span></p>', '<p><span style=\"color: rgb(15, 17, 17); font-family: \"Amazon Ember\", Arial, sans-serif; font-size: 14px;\">United Plugins собрали пакет FIRE. 4 плагина за небольшую цену. Содержит FireCobra, интеллектуальный усилитель звука, FirePresser, блендер с четырьмя классическими компрессорами, FireMaster, идеальный финишер и FireCharger — активатор трека.</span><br></p>', '<p><span style=\"color: rgb(15, 17, 17); font-family: \"Amazon Ember\", Arial, sans-serif; font-size: 14px;\">Windows: 8/10/11 64 Bit Intel/AMD Processor with SSE2 support\r\nMac: MacOs 10.10+ Intel/AMD/M1 Processor with SSE2 support</span><br></p>', 37, 0, 1, 2),
(84, 'SpeakerSim', '8000', '7000', 26, '6.jpg', ' <span style=\"color: rgb(51, 51, 51); font-family: \"Amazon Ember\", Arial, sans-serif; font-size: small;\">Этот процессор можно использовать для следующих целей: проверка вашего микса на различных мониторных системах, музыкальная продукция, аудиопост-продукция телепередач или фильмов. <br>ХАРАКТЕРИСТИКИ ПРОДУКТА <br>Волшебный и быстрый DSP-движок NoiseAsh Упрощенное управление, множество творческих возможностей. <br>Блок искажений Lo-Fi. <br>Встроенный интеллектуальный ограничитель. <br>3-полосный твердотельный эквалайзер (Low Shelf – Mid – High Shelf) <br>Аналоговые фильтры низкого и высокого давления <br>18 уникальных механизмов моделирования динамиков. <br>3 типа Мегафона (Мегафон), Старый компьютер, Мобильный телефон, Винтажный телефон.</span>', '<p style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"overflow-wrap: break-word; display: block;\">SpeakerSim представляет собой реалистичную эмуляцию различных типов динамиков с собственной акустикой и окружением. Этот плагин поможет вам проверить ваш микс в различных системах мониторов, музыкальных произведениях, аудиопост-продукции для телепередач или фильмов.</span></p>', '<p style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"overflow-wrap: break-word; display: block;\">macOS Included: VST3, AU, AAX plug-in versions (64-bit only)\r\nmacOS 10.9.5 or above\r\nVST3 / AU / AAX host\r\nIntel I3 2ghz or above – Native Apple Silicon is also supported\r\n4 GB RAM / 2 GB free space on the system drive\r\nMin. 1024×768 Screen Resolution\r\nAbility to download<br>\r\nWindows Included: VST3, AAX plug-in versions (64-bit only)\r\nWindows 7 64-bit or above\r\nVST3 / AAX host\r\nIntel I3 2ghz / AMD Athlon 64 X2 or above\r\n4 GB RAM / 2 GB free space on the system drive\r\nMin. 1024×768 Screen Resolution\r\nAbility to download</span></p>', 56, 1, 1, 4),
(85, 'OSL Multi Chorus', '4800', '3900', 32, '3.jpg', '<p><span style=\"color: rgb(51, 51, 51); font-family: \"Amazon Ember\", Arial, sans-serif; font-size: small;\">OSL Multi Chorus — это цифровой эффект, вдохновленный топологией четырех знаковых модулей модуляции. Помимо записи звука оригинального OSL Chorus, этот плагин включает в себя три новых режима, каждый из которых имеет свой характер звука. Каждый режим полностью редактируем, что позволяет создавать эффекты от едва уловимых до экстремальных. Изучите заводские пресеты или настройте свой собственный припев, чтобы мгновенно добавить толщину и ширину любому источнику, включая гитары, ударные, бас, вокал и синтезаторы.</span><br></p>', '<p style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"overflow-wrap: break-word; display: block;\">OSL Multi Chorus — это цифровой эффект, вдохновленный топологией четырех знаковых модулей модуляции. 4 режима хоруса, расширение стереобазы и середины и многое другое.</span></p>', '<p><span style=\"margin: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\"></span><span style=\"margin: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\"></span><span style=\"margin: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\"> Windows 8–11 – Форматы плагинов: 64-битный VST3. OS X 10.11–macOS 14 — Форматы плагинов: 64-битный VST3/AU (собственный Arm64/M1)</span><br></p>', 111, 0, 1, 1),
(86, 'Dynamic Delay', '3000', '2600', 32, '1.jpg', '<p style=\"padding: 0px; margin-top: 0px; text-rendering: optimizelegibility; margin-bottom: 0px !important; line-height: 32px !important;\">Dynamic Delay — это именно то, что написано: плагин динамической задержки. Он имеет внутреннюю боковую цепь, которая подавляет громкость генерируемых задержек. Как только входной звук опускается ниже порогового значения, задержки становятся отчетливо слышны. Это трюк, который используют многие профессиональные продюсеры, но его настройка в вашей сигнальной цепи требует времени и обычно требует отдельного компрессора боковой цепи. Dynamic Delay объединяет эту технику в одном простом в использовании плагине, экономя время и деньги. Боковая цепочка — очень полезная техника микширования, позволяющая звукам проникать в микс, делая другие звуки более тихим. Динамическая задержка особенно хороша для вокала, позволяя вокалу действительно проявиться и не конкурировать за пространство с задержанным вокалом. Тишина между вокалами может быть заполнена хорошей задержкой, оставляя исходный вокал чистым и незатронутым задержкой.<br></p>', '<p style=\"padding: 0px; margin-top: 0px; text-rendering: optimizelegibility; margin-bottom: 0px !important; line-height: 32px !important;\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important; font-family: Roboto;\">Создавайте сложные задержки звучания с индивидуальными таймингами и величиной обратной связи для каждого канала. Встречайте новую задержку. Динамическая задержка начального звука. Имеет высококачественные эффекты, стерео задержку и динамическую задержку.</span></p>', '<p><span style=\"margin: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\"> </span><span style=\"margin: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\">\r\nWindows 7 или выше (64-bit только)\r\n4GB Ram\r\nVST, и AAX Compatible.</span><br></p>', 53, 1, 1, 3),
(87, 'Pivot', '2100', '1750', 68, '8.jpg', 'Pivot — это мощный эквалайзер наклона, позволяющий быстро изменять спектральный состав вашего звука. Режимы Mid/Side позволяют вам отдельно настраивать стереоконтент вашего звука, позволяя очистить мутные стереобасы или сделать более четкими высокие высокие частоты в ваших мастер-треках. Измените свой вес Pivot — это простой в использовании эквалайзер наклона, позволяющий сдвигать спектральный состав трека вокруг средней точки, как на качелях. Немного тяжеловат бас? Поверните циферблат влево. Высокие частоты немного громкие? Переместите его вправо. Он имеет регулируемый наклон и среднюю точку, чтобы получить точный баланс, который вам нужен. Средний/боковой эквалайзер Наряду с обычной моно- или стереообработкой Pivot предлагает режим Mid/Side. Чтобы сделать ваш основной звук более захватывающим, вы можете сделать боковой канал ярче для более яркого и широкого ощущения или уменьшить уровень стереобаса, упорядочив стереораспространение басовых частот. Легкий Что касается потребления вашего процессора, Pivot не голоден. Вы можете загружать несколько экземпляров на несколько дорожек, не останавливая рабочую станцию. Он также имеет возможность выполнять простое усиление и понижение громкости, что означает, что вы можете заменить свои вялые и неинтуитивные эквалайзеры, когда вам просто нужна быстрая настройка.', 'Pivot — это мощный эквалайзер, позволяющий быстро изменять спектральный состав вашего звука. Pivot — это эквалайзер с регулируемым наклоном и средним/боковым режимами. Мощный эквалайзер, все просто.', 'Windows 8.1+\r\n64-bit VST / VST3 / AAX compatible DAW\r\nMacOS\r\n<br>\r\nOSX 10.9+\r\nApple M1 supported\r\n64-bit VST / VST3 / AU / AAX compatible DAW\r\n<br>\r\nUbuntu\r\n18.04+\r\n64-bit VST / VST3 Compatible DAW', 19, 0, 1, 5),
(95, 'RealGuitar 6', '23400', '20500', 53, '10.jpg', 'Существует три способа использования виртуального инструмента RealGuitar.<br>Интуитивно понятная раскладка клавиатуры позволяет играть на Live/MIDI-клавиатуре с многочисленными артикуляциями, шумами, специфичными для гитары трюками, приемами игры на клавиатуре и игры пальцами.<br> Любое гитарное исполнение, созданное на MIDI-клавиатуре, можно записать или напрямую запрограммировать на MIDI-дорожке любой DAW. <br>Встроенный секвенсор песен предназначен для аранжировки всей песни путем простой вставки символов аккордов и выбора предварительно записанных гитарных ритм-паттернов.', 'Поднимите свою музыку на новый уровень с помощью невероятно реалистичной виртуальной акустической гитары с более чем 200 аутентичными звуками и полной интеграцией с симуляторами усилителей и пресетами, и все это у вас под рукой с помощью всего 43 клавиш на вашем MIDI-контроллере.', 'MacOS 10.12 Sierra and above<br>\r\nWindows 10 and above (64-bit only)<br>\r\nIntel, AMD, or Apple Silicon CPU<br>\r\n2GB RAM or more<br>\r\n5GB free storage space<br>', 19, 1, 1, 11),
(97, 'Elka Panther', '19000', '15000', 53, '11.jpg', 'Elka Panther 300, также известный как Capri, — классический итальянский комбо-орган 60-х годов. <br>Инструмент производит смелые, насыщенные звуки органа и имеет широкий диапазон тональных вариаций (13).<br> Уровни звука Panthers 16’, 8’, 4’ Stops и Mixture регулируются. Каждая нота охватывает три октавы, есть расширение баса на серые клавиши и отдельный регулятор громкости для басовых октав. Tone Decay добавляет перкуссионный эффект к голосам Mixture. Panther обладает мощным вибрато с контролем скорости и интенсивности.<br> Доступная еще в 1966 году модель Elka Panther была спроектирована так, чтобы иметь все это. Настраиваемые и универсальные семейства звуков будут активироваться с помощью пластиковых переключателей – эквивалент включения/выключения органа. Переключатели контролировали, какое семейство звуков активируется, и располагались горизонтально в порядке их высоты.', 'Представляем Elka Panther 300, винтажный итальянский комбо-орган 60-х годов. Благодаря смелым звукам органа, регулируемым уровням голоса и уникальным функциям, таким как Tone Decay и мощное вибрато, этот классический инструмент придаст вашей музыке вневременное очарование.', 'Mac:\r\n<br>\r\nMac OS 10.13+<br><br>\r\nWindows:<br>\r\n\r\nWindows 7+<br>\r\nFormat: Mac: AU, AAX, VST3, and standalone app Windows: AAX, VST3, and standalone app RAM: 8GB<br>\r\n\r\nDisk space: 2.4GB', 25, 1, 1, 13),
(99, 'Action Delay', '7400', '3900', 46, '2.jpg', '<p><span style=\"color: rgb(51, 51, 51); font-family: \"Amazon Ember\", Arial, sans-serif; font-size: small;\">Это не просто блок задержки. Это очень продвинутая комбинация: <br>1.Задержка <br>2.Хор <br>3.Реверберация <br>4.LoFi-процессор<br></span><br></p>', '<p style=\"padding: 0px; margin-top: 0px; text-rendering: optimizelegibility; margin-bottom: 0px !important; line-height: 32px !important;\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important; font-family: Roboto;\">Просто подключите Action Delay к своему треку и, покрутив пару ручек, — бум. Вы получите процессоры Delay, Chorus, Reverb и LoFi.</span></p>', '<p><span style=\"margin: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\"> </span><span style=\"margin: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\"></span><span style=\"margin: 0px; padding: 0px; color: rgb(32, 33, 36); font-family: arial, sans-serif; font-size: 16px;\">версии подключаемых модулей VST3, AAX (только 64-разрядная версия). Windows 7 64-битная или выше Хост VST3/AAX Intel I3 2 ГГц/AMD Athlon 64 X2 или выше 4 ГБ ОЗУ / 2 ГБ свободного места на системном диске Мин. Разрешение экрана 1024×768 Возможность скачивания.</span><br></p>', 38, 1, 1, 3),
(100, 'Prestige Racks', '12800', '7900', 78, '5.jpg', '<p style=\"padding: 0px; margin-top: 0px; text-rendering: optimizelegibility; margin-bottom: 0px !important; line-height: 32px !important;\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important;\">Объединение 5 классических моделей эквалайзеров, винтажного аналогового оборудования и многого другого в одном цельном интерфейсе Специальный уникальный эквалайзер, сочетающий в себе лучшие характеристики 5 различных классических популярных моделей эквалайзеров! Британский компрессор полосы каналов Solid 4G. Теплый винтажный аналоговый предусилитель. Подробный Де-эссер с расширенными возможностями. Классические блоки реверберации и задержки с функцией приглушения. Винтажный оптический компрессор и гейт… Представьте себе специальную коллекцию, которая объединяет все эти устройства в одном пользовательском интерфейсе с простой и быстрой функцией переключения маршрутизации. Улучшите свой звук Цель сведения и мастеринга: 8 классических моделей с современными функциями. Переключаемая маршрутизация стойки для быстрого и простого рабочего процесса Более 200 профессиональных пресетов</span></p>', '<p style=\"padding: 0px; margin-top: 0px; text-rendering: optimizelegibility; margin-bottom: 0px !important; line-height: 32px !important;\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important;\">Представляем вам Prestige Racks! Непревзойденное сочетание вневременных тонов и современных функций. Prestige Racks предлагает вам очень простой и быстрый рабочий процесс, достоверно воспроизводя захватывающие тона классического аналогового оборудования.</span></p>', '<p style=\"padding: 0px; margin-top: 0px; text-rendering: optimizelegibility; margin-bottom: 0px !important; line-height: 32px !important;\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important;\">Mac Версии плагинов VST3, AU, AAX (только 64-разрядные версии) macOS 10.9.5 или новее Хост VST3/AU/AAX Intel I3 2 ГГц или выше/родной Apple Silicon 4 ГБ ОЗУ / 2 ГБ свободного места на системном диске <br>Windows Включено: версии подключаемых модулей VST3, AAX (только 64-разрядная версия). Windows 7 64-битная или выше Хост VST3/AAX Intel I3 2 ГГц или выше/AMD Athlon 64 X2 или выше 4 ГБ ОЗУ / 2 ГБ свободного места на системном диске</span></p>', 11, 0, 1, 2),
(101, 'CrushStation', '8800', '4450', 28, '7.jpg', '<p class=\"a-spacing-base\" style=\"padding: 0px; color: rgb(15, 17, 17); font-family: \"Amazon Ember\", Arial, sans-serif; font-size: 14px; margin-bottom: 14px !important;\">CrushStation — это универсальная, лучшая в своем классе платформа стерео искажений для вашего Mac или ПК. Его элементы управления могут изменить ваш тон от сливочного насыщения до брутальной звуковой атаки. Но искажение — это только отправная точка. CrushStation привносит в микс мультиэффекты, добавляя трехполосный эквалайзер, компрессию, Octave Mix и уникальный подход Eventide к неисправному оборудованию — регулятор Sag. Используйте MIX Control, чтобы смешать необработанный сигнал с CrushStation для создания параллельного сжатия, искажения и других творческих эффектов.</p>', '<p style=\"padding: 0px; margin-top: 0px; text-rendering: optimizelegibility; margin-bottom: 0px !important; line-height: 32px !important;\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important;\">CrushStation — это универсальная, лучшая в своем классе платформа стерео искажений для вашего Mac или ПК. Его элементы управления могут изменить ваш тон от сливочного насыщения до брутальной звуковой атаки. Но искажение — это только отправная точка. CrushStation привносит в микс мультиэффекты, добавляя трехполосный эквалайзер, компрессию, Octave Mix и уникальный подход Eventide к неисправному оборудованию — регулятор Sag.</span></p>', '<p style=\"padding: 0px; margin-top: 0px; text-rendering: optimizelegibility; margin-bottom: 0px !important; line-height: 32px !important;\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important;\">PC Windows 8 and later (32 / 64bit)\r\nAAX, VST2, VST3 (32 / 64-bit)\r\n<br>MacOS 10.9 and later (64-bit only) (macOS 11 Big Sur only supported on Intel-based Mac systems)\r\nAAX, AU, VST2, VST3 (64-bit)</span></p>', 21, 1, 1, 4),
(102, 'NEED Preamp and Eq Collection', '31200', '13400', 112, '9.jpg', 'Консольные предусилители и эквалайзеры в британском стиле были самым востребованным оборудованием с первых дней их появления. Queen, Nirvana, Red Hot Chilli Peppers, Дэвид Боуи, Foo Fighters, Slipknot, Metallica, Адель, Дрейк… и т. д. это всего лишь несколько примеров. Они использовались на бесчисленных классических альбомах, ставших платиновыми, а также до сих пор широко используются, что подтверждает статус этих легендарных модулей — столь востребованных классических устройств, которые нужны каждой среде микширования/мастеринга.', 'Bключает в себя 7 выдающихся плагинов предусилителя/эквалайзера в британском стиле! Коллекция предусилителей и эквалайзеров NEED — настоящая жемчужина! Консольные предусилители и эквалайзеры в британском стиле были самым востребованным оборудованием с первых дней их появления.', 'macOSIncluded: VST3, AU, AAX plug-in versions (64-bit only)\r\nmacOS 10.9.5 or above\r\nVST3 / AU / AAX host\r\nIntel I3 2ghz or above – Native Apple Silicon is also supported\r\n4 GB RAM / 2 GB free space on the system drive\r\nMin. 1024×768 Screen Resolution\r\nAbility to download <br>\r\nWindows Included: VST3, AAX plug-in versions (64-bit only)\r\nWindows 7 64-bit or above\r\nVST3 / AAX host\r\nIntel I3 2ghz / AMD Athlon 64 X2 or above\r\n4 GB RAM / 2 GB free space on the system drive\r\nMin. 1024×768 Screen Resolution\r\nAbility to download', 16, 1, 1, 5),
(104, 'miniVerb', '213', '123', 123, 'product-featured-104.jpg', '<p>sxed</p>', '<p>ewdx</p>', '<p>wedx</p>', 4, 0, 1, 9),
(105, 'Xhun ZeroBox', '50000', '45000', 10, 'product-featured-105.jpg', '<p>aerfaef</p>', '<p>EWFw</p>', '<p>AFEGRSEвы</p>', 0, 1, 1, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_product_photo`
--

CREATE TABLE `tbl_product_photo` (
  `pp_id` int NOT NULL,
  `photo` varchar(255) NOT NULL,
  `p_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_product_photo`
--

INSERT INTO `tbl_product_photo` (`pp_id`, `photo`, `p_id`) VALUES
(106, '7.jpg', 101),
(108, '6.jpg', 84),
(110, '3.jpg', 85),
(112, '1120.jpg', 86),
(114, '8.jpg', 87),
(116, '116.jpg', 88),
(117, '117.jpg', 88),
(118, '118.jpg', 89),
(119, '119.jpg', 89),
(120, '120.jpg', 90),
(121, '121.jpg', 91),
(122, '122.jpg', 92),
(123, '123.jpg', 92),
(124, '124.jpg', 93),
(125, '125.jpg', 94),
(126, '10.jpg', 95),
(127, '127.jpg', 96),
(128, '11.jpg', 97),
(129, '129.jpg', 98),
(130, '130.jpg', 98),
(131, '5.jpg', 100),
(132, '9.jpg', 102),
(133, '133.jpg', 105);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `footer_about` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `footer_copyright` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receive_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receive_email_subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receive_email_thank_you_message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `forget_password_message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_recent_post_footer` int NOT NULL,
  `total_popular_post_footer` int NOT NULL,
  `total_recent_post_sidebar` int NOT NULL,
  `total_popular_post_sidebar` int NOT NULL,
  `total_featured_product_home` int NOT NULL,
  `total_latest_product_home` int NOT NULL,
  `total_popular_product_home` int NOT NULL,
  `meta_title_home` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `meta_keyword_home` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `meta_description_home` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_registration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_forget_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_reset_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_search` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_cart` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_checkout` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_product_category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_blog` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cta_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cta_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cta_read_more_text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cta_read_more_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cta_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `featured_product_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `featured_product_subtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `latest_product_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `latest_product_subtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `popular_product_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `popular_product_subtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `testimonial_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `testimonial_subtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `testimonial_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `before_head` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `after_body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `before_body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `home_service_on_off` int NOT NULL,
  `home_welcome_on_off` int NOT NULL,
  `home_featured_product_on_off` int NOT NULL,
  `home_latest_product_on_off` int NOT NULL,
  `home_popular_product_on_off` int NOT NULL,
  `home_testimonial_on_off` int NOT NULL,
  `ads_above_welcome_on_off` int NOT NULL,
  `ads_above_featured_product_on_off` int NOT NULL,
  `ads_above_latest_product_on_off` int NOT NULL,
  `ads_above_popular_product_on_off` int NOT NULL,
  `ads_above_testimonial_on_off` int NOT NULL,
  `ads_category_sidebar_on_off` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `logo`, `favicon`, `footer_about`, `footer_copyright`, `contact_address`, `contact_email`, `contact_phone`, `receive_email`, `receive_email_subject`, `receive_email_thank_you_message`, `forget_password_message`, `total_recent_post_footer`, `total_popular_post_footer`, `total_recent_post_sidebar`, `total_popular_post_sidebar`, `total_featured_product_home`, `total_latest_product_home`, `total_popular_product_home`, `meta_title_home`, `meta_keyword_home`, `meta_description_home`, `banner_login`, `banner_registration`, `banner_forget_password`, `banner_reset_password`, `banner_search`, `banner_cart`, `banner_checkout`, `banner_product_category`, `banner_blog`, `cta_title`, `cta_content`, `cta_read_more_text`, `cta_read_more_url`, `cta_photo`, `featured_product_title`, `featured_product_subtitle`, `latest_product_title`, `latest_product_subtitle`, `popular_product_title`, `popular_product_subtitle`, `testimonial_title`, `testimonial_subtitle`, `testimonial_photo`, `before_head`, `after_body`, `before_body`, `home_service_on_off`, `home_welcome_on_off`, `home_featured_product_on_off`, `home_latest_product_on_off`, `home_popular_product_on_off`, `home_testimonial_on_off`, `ads_above_welcome_on_off`, `ads_above_featured_product_on_off`, `ads_above_latest_product_on_off`, `ads_above_popular_product_on_off`, `ads_above_testimonial_on_off`, `ads_category_sidebar_on_off`) VALUES
(1, 'logo.png', 'favicon.png', '<p>Lo</p>\r\n', '2024 - VSTStore', 'Ростов-на-Дону', 'support@vststore.com', '+791101010010', 'support@vststore.com', ' +791101010010', 'Спасибо за отправку. Мы свяжемся с вами в скором времени.', 'Ссылка для подтверждения будет отправлена ​​на ваш адрес электронной почты. Там вы получите информацию для сброса пароля.', 4, 4, 5, 5, 3, 6, 8, 'VST Store', 'Интернет-магазин', 'vststore.ru', 'banner_login.jpg', 'banner_registration.jpg', 'banner_forget_password.jpg', 'banner_reset_password.jpg', 'banner_search.jpg', 'banner_cart.jpg', 'banner_checkout.jpg', 'banner_product_category.jpg', 'banner_blog.jpg', 'Welcome To Our Ecommerce Website', 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens expetenda id sit, \r\nat usu eius eligendi singulis. Sea ocurreret principes ne. At nonumy aperiri pri, nam quodsi copiosae intellegebat et, ex deserunt euripidis usu. ', 'Read More', '#', 'cta.jpg', 'Featured Products', 'Our list on Top Featured Products', 'Latest Products', 'Our list of recently added products', 'Popular Products', 'Popular products based on customer\'s choice', 'Testimonials', 'See what our clients tell about us', 'testimonial.jpg', '', '', '', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `id` int NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `button_text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `button_url` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_slider`
--

INSERT INTO `tbl_slider` (`id`, `photo`, `heading`, `content`, `button_text`, `button_url`, `position`) VALUES
(1, 'slider1.png', 'Добро пожаловать на VST Store!', 'Интернет магазин VST плагинов', 'Смотреть предложения', 'https://vststore.ru/product-category.php?id=1&type=top-category', 'Center'),
(2, 'slider2.jpg', 'Всегда большие скидки!', 'На все плагины скидки не менее 50%', 'Перейти', 'https://vststore.ru/product-category.php?id=1&type=top-category', 'Center'),
(4, 'slider-4.jpg', 'fdsbd', 'dfbd', 'zdfbz', 'zrdbr.php', 'Left');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_social`
--

CREATE TABLE `tbl_social` (
  `social_id` int NOT NULL,
  `social_name` varchar(30) NOT NULL,
  `social_url` varchar(255) NOT NULL,
  `social_icon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_social`
--

INSERT INTO `tbl_social` (`social_id`, `social_name`, `social_url`, `social_icon`) VALUES
(1, 'Facebook', '', 'fa fa-facebook'),
(2, 'Twitter', '', 'fa fa-twitter'),
(3, 'LinkedIn', '', 'fa fa-linkedin'),
(4, 'Google Plus', '', 'fa fa-google-plus'),
(5, 'Pinterest', '', 'fa fa-pinterest'),
(6, 'YouTube', 'https://www.youtube.com/#', 'fa fa-youtube'),
(7, 'Instagram', '', 'fa fa-instagram'),
(8, 'Tumblr', '', 'fa fa-tumblr'),
(9, 'Flickr', '', 'fa fa-flickr'),
(10, 'Reddit', '', 'fa fa-reddit'),
(11, 'Snapchat', '', 'fa fa-snapchat'),
(12, 'WhatsApp', 'https://www.whatsapp.com/#', 'fa fa-whatsapp'),
(13, 'Quora', '', 'fa fa-quora'),
(14, 'StumbleUpon', '', 'fa fa-stumbleupon'),
(15, 'Delicious', '', 'fa fa-delicious'),
(16, 'Digg', '', 'fa fa-digg');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_subscriber`
--

CREATE TABLE `tbl_subscriber` (
  `subs_id` int NOT NULL,
  `subs_email` varchar(255) NOT NULL,
  `subs_date` varchar(100) NOT NULL,
  `subs_date_time` varchar(100) NOT NULL,
  `subs_hash` varchar(255) NOT NULL,
  `subs_active` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_subscriber`
--

INSERT INTO `tbl_subscriber` (`subs_id`, `subs_email`, `subs_date`, `subs_date_time`, `subs_hash`, `subs_active`) VALUES
(1, 'ruth@mail.com', '2022-03-20', '2022-03-20 10:25:18', 'f4eabc1afed38a08da8d1c6e5fb42187', 1),
(2, 'kimberly@mail.com', '2022-03-20', '2022-03-20 10:26:07', '61f3af9cac686555a4bff9e565f88c47', 1),
(3, 'gregobn@mail.com', '2022-03-20', '2022-03-20 10:27:21', '72d6fc3a9e9ed33dfc30b10f4de82f34', 1),
(4, 'morgan.sarahh5@mail.com', '2022-03-20', '2022-03-20 10:27:48', 'bcdeda095a6c882803fc3aaf4a17f08e', 1),
(5, 'greenwd1154@mail.com', '2022-03-20', '2022-03-20 10:28:09', '279ecfe9debbb091c664641f534857ee', 1),
(6, 'awsm785@mail.com', '2022-03-20', '2022-03-20 10:28:21', '94096ae01fc65e71c50c7843d096e041', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_top_category`
--

CREATE TABLE `tbl_top_category` (
  `tcat_id` int NOT NULL,
  `tcat_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `show_on_menu` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_top_category`
--

INSERT INTO `tbl_top_category` (`tcat_id`, `tcat_name`, `show_on_menu`) VALUES
(1, 'VST плагины', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `full_name`, `email`, `phone`, `password`, `photo`, `role`, `status`) VALUES
(1, 'Administrator', 'admin@mail.com', '7777777777', 'd00f5d5217896fb7fd601412cb890830', 'user-1.png', 'Super Admin', 'Active'),
(2, 'Christine', 'christine@mail.com', '4444444444', '81dc9bdb52d04dc20036dbd8313ed055', 'user-13.jpg', 'Admin', 'Active');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Индексы таблицы `tbl_customer_message`
--
ALTER TABLE `tbl_customer_message`
  ADD PRIMARY KEY (`customer_message_id`);

--
-- Индексы таблицы `tbl_end_category`
--
ALTER TABLE `tbl_end_category`
  ADD PRIMARY KEY (`ecat_id`);

--
-- Индексы таблицы `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`faq_id`);

--
-- Индексы таблицы `tbl_language`
--
ALTER TABLE `tbl_language`
  ADD PRIMARY KEY (`lang_id`);

--
-- Индексы таблицы `tbl_mid_category`
--
ALTER TABLE `tbl_mid_category`
  ADD PRIMARY KEY (`mcat_id`);

--
-- Индексы таблицы `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_photo`
--
ALTER TABLE `tbl_photo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`p_id`);

--
-- Индексы таблицы `tbl_product_photo`
--
ALTER TABLE `tbl_product_photo`
  ADD PRIMARY KEY (`pp_id`);

--
-- Индексы таблицы `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_social`
--
ALTER TABLE `tbl_social`
  ADD PRIMARY KEY (`social_id`);

--
-- Индексы таблицы `tbl_subscriber`
--
ALTER TABLE `tbl_subscriber`
  ADD PRIMARY KEY (`subs_id`);

--
-- Индексы таблицы `tbl_top_category`
--
ALTER TABLE `tbl_top_category`
  ADD PRIMARY KEY (`tcat_id`);

--
-- Индексы таблицы `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `cust_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `tbl_customer_message`
--
ALTER TABLE `tbl_customer_message`
  MODIFY `customer_message_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `tbl_end_category`
--
ALTER TABLE `tbl_end_category`
  MODIFY `ecat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT для таблицы `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `faq_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tbl_language`
--
ALTER TABLE `tbl_language`
  MODIFY `lang_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT для таблицы `tbl_mid_category`
--
ALTER TABLE `tbl_mid_category`
  MODIFY `mcat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT для таблицы `tbl_photo`
--
ALTER TABLE `tbl_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `p_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT для таблицы `tbl_product_photo`
--
ALTER TABLE `tbl_product_photo`
  MODIFY `pp_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT для таблицы `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tbl_social`
--
ALTER TABLE `tbl_social`
  MODIFY `social_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `tbl_subscriber`
--
ALTER TABLE `tbl_subscriber`
  MODIFY `subs_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `tbl_top_category`
--
ALTER TABLE `tbl_top_category`
  MODIFY `tcat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
