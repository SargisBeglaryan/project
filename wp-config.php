<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define('WP_CACHE', true); //Added by WP-Cache Manager
define( 'WPCACHEHOME', 'D:\wamp\www\wp-content\plugins\wp-super-cache/' ); //Added by WP-Cache Manager
define('DB_NAME', 'cf09127_main');

/** Имя пользователя MySQL */
define('DB_USER', 'cf09127_main');

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', 'Ao61mdE1');

/** Имя сервера MySQL */
define('DB_HOST', 'localhost');

/** Кодировка базы данных для создания таблиц. */
define('DB_CHARSET', 'utf8');

/** Схема сопоставления. Не меняйте, если не уверены. */
define('DB_COLLATE', '');

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'cY3kb$BADb,q(d+f,H2v6<%5F(}$}4N| ]?T!gUb8_v+C mJgn)@qN!<7}TtKNMh');
define('SECURE_AUTH_KEY',  'W`3Ovbf},)+&l#m }7W6}N8/HmQ*Fe(;Exin6AK@a#}s#GV2>!bCx.h=aXk`,+3x');
define('LOGGED_IN_KEY',    ';;K6y(k%=2=l_s.@;=#HO^]Zv)|Hu}n[%q*Dne}z9,~kO4|EKB6+-}SyX GDi(I~');
define('NONCE_KEY',        'a2CikQH8M!SJ&q5YfdCh!#wROT#-?]vQYc>/fyQ?3DPVWKS:Biq`-udx.NG)MCap');
define('AUTH_SALT',        'jQzuUoVAKeR:e>!WSfpAaT3F_]GT.4r2m(5YvwHuy!Z9VidsC_O.WyX>4D@z[T_-');
define('SECURE_AUTH_SALT', '=D+^}GoIV~&_1P&xN|&loFI4!Zs|D{Ng^i8iMs+TfPjpYCrOoBwD>49r|MYbM7RZ');
define('LOGGED_IN_SALT',   '@VsMNm6;^~+h?^lTolCDf~@Kq6~M]SVlX*jSEN`(+~r/Q_*~O&d}!FeS0Nbf}ViR');
define('NONCE_SALT',       'gh~VOE0FLnip^hQ`CFWfj+ez4O84*Z 9 ?Y+ZXXWs~96]FMz~m&R5,mq]`!3vQ?@');

define('WP_HOME',     'http://' . $_SERVER['HTTP_HOST']). 'project';
define('WP_SITEURL',  'http://' . $_SERVER['HTTP_HOST']).'project';

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix  = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 * 
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Инициализирует переменные WordPress и подключает файлы. */
require_once(ABSPATH . 'wp-settings.php');
