<?php
/**
 * Twenty Fifteen functions and definitions
 *
 * Set up the theme and provides some helper functions, which are used in the
 * theme as custom template tags. Others are attached to action and filter
 * hooks in WordPress to change core functionality.
 *
 * When using a child theme you can override certain functions (those wrapped
 * in a function_exists() call) by defining them first in your child theme's
 * functions.php file. The child theme's functions.php file is included before
 * the parent theme's file, so the child theme functions would be used.
 *
 * @link https://codex.wordpress.org/Theme_Development
 * @link https://codex.wordpress.org/Child_Themes
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are
 * instead attached to a filter or action hook.
 *
 * For more information on hooks, actions, and filters,
 * {@link https://codex.wordpress.org/Plugin_API}
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */

/**
 * Set the content width based on the theme's design and stylesheet.
 *
 * @since Twenty Fifteen 1.0
 */
if ( ! isset( $content_width ) ) {
	$content_width = 660;
}

/**
 * Twenty Fifteen only works in WordPress 4.1 or later.
 */
if ( version_compare( $GLOBALS['wp_version'], '4.1-alpha', '<' ) ) {
	require get_template_directory() . '/inc/back-compat.php';
}

if ( ! function_exists( 'twentyfifteen_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 *
 * @since Twenty Fifteen 1.0
 */
function twentyfifteen_setup() {

	/*
	 * Make theme available for translation.
	 * Translations can be filed at WordPress.org. See: https://translate.wordpress.org/projects/wp-themes/twentyfifteen
	 * If you're building a theme based on twentyfifteen, use a find and replace
	 * to change 'twentyfifteen' to the name of your theme in all the template files
	 */
	load_theme_textdomain( 'twentyfifteen' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
	add_theme_support( 'title-tag' );

	/*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * See: https://codex.wordpress.org/Function_Reference/add_theme_support#Post_Thumbnails
	 */
	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size( 825, 510, true );

	// This theme uses wp_nav_menu() in two locations.
	register_nav_menus( array(
		'primary' => __( 'Primary Menu',      'twentyfifteen' ),
		'social'  => __( 'Social Links Menu', 'twentyfifteen' ),
	) );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form', 'comment-form', 'comment-list', 'gallery', 'caption'
	) );

	/*
	 * Enable support for Post Formats.
	 *
	 * See: https://codex.wordpress.org/Post_Formats
	 */
	add_theme_support( 'post-formats', array(
		'aside', 'image', 'video', 'quote', 'link', 'gallery', 'status', 'audio', 'chat'
	) );

	/*
	 * Enable support for custom logo.
	 *
	 * @since Twenty Fifteen 1.5
	 */
	add_theme_support( 'custom-logo', array(
		'height'      => 248,
		'width'       => 248,
		'flex-height' => true,
	) );

	$color_scheme  = twentyfifteen_get_color_scheme();
	$default_color = trim( $color_scheme[0], '#' );

	// Setup the WordPress core custom background feature.

	/**
	 * Filter Twenty Fifteen custom-header support arguments.
	 *
	 * @since Twenty Fifteen 1.0
	 *
	 * @param array $args {
	 *     An array of custom-header support arguments.
	 *
	 *     @type string $default-color     		Default color of the header.
	 *     @type string $default-attachment     Default attachment of the header.
	 * }
	 */
	add_theme_support( 'custom-background', apply_filters( 'twentyfifteen_custom_background_args', array(
		'default-color'      => $default_color,
		'default-attachment' => 'fixed',
	) ) );

	/*
	 * This theme styles the visual editor to resemble the theme style,
	 * specifically font, colors, icons, and column width.
	 */
	add_editor_style( array( 'css/editor-style.css', 'genericons/genericons.css', twentyfifteen_fonts_url() ) );

	// Indicate widget sidebars can use selective refresh in the Customizer.
	add_theme_support( 'customize-selective-refresh-widgets' );
}
endif; // twentyfifteen_setup
add_action( 'after_setup_theme', 'twentyfifteen_setup' );

/**
 * Register widget area.
 *
 * @since Twenty Fifteen 1.0
 *
 * @link https://codex.wordpress.org/Function_Reference/register_sidebar
 */
function twentyfifteen_widgets_init() {
	register_sidebar( array(
		'name'          => __( 'Widget Area', 'twentyfifteen' ),
		'id'            => 'sidebar-1',
		'description'   => __( 'Add widgets here to appear in your sidebar.', 'twentyfifteen' ),
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );
}
add_action( 'widgets_init', 'twentyfifteen_widgets_init' );

if ( ! function_exists( 'twentyfifteen_fonts_url' ) ) :
/**
 * Register Google fonts for Twenty Fifteen.
 *
 * @since Twenty Fifteen 1.0
 *
 * @return string Google fonts URL for the theme.
 */
function twentyfifteen_fonts_url() {
	$fonts_url = '';
	$fonts     = array();
	$subsets   = 'latin,latin-ext';

	/*
	 * Translators: If there are characters in your language that are not supported
	 * by Noto Sans, translate this to 'off'. Do not translate into your own language.
	 */
	if ( 'off' !== _x( 'on', 'Noto Sans font: on or off', 'twentyfifteen' ) ) {
		$fonts[] = 'Noto Sans:400italic,700italic,400,700';
	}

	/*
	 * Translators: If there are characters in your language that are not supported
	 * by Noto Serif, translate this to 'off'. Do not translate into your own language.
	 */
	if ( 'off' !== _x( 'on', 'Noto Serif font: on or off', 'twentyfifteen' ) ) {
		$fonts[] = 'Noto Serif:400italic,700italic,400,700';
	}

	/*
	 * Translators: If there are characters in your language that are not supported
	 * by Inconsolata, translate this to 'off'. Do not translate into your own language.
	 */
	if ( 'off' !== _x( 'on', 'Inconsolata font: on or off', 'twentyfifteen' ) ) {
		$fonts[] = 'Inconsolata:400,700';
	}

	/*
	 * Translators: To add an additional character subset specific to your language,
	 * translate this to 'greek', 'cyrillic', 'devanagari' or 'vietnamese'. Do not translate into your own language.
	 */
	$subset = _x( 'no-subset', 'Add new subset (greek, cyrillic, devanagari, vietnamese)', 'twentyfifteen' );

	if ( 'cyrillic' == $subset ) {
		$subsets .= ',cyrillic,cyrillic-ext';
	} elseif ( 'greek' == $subset ) {
		$subsets .= ',greek,greek-ext';
	} elseif ( 'devanagari' == $subset ) {
		$subsets .= ',devanagari';
	} elseif ( 'vietnamese' == $subset ) {
		$subsets .= ',vietnamese';
	}

	if ( $fonts ) {
		$fonts_url = add_query_arg( array(
			'family' => urlencode( implode( '|', $fonts ) ),
			'subset' => urlencode( $subsets ),
		), 'https://fonts.googleapis.com/css' );
	}

	return $fonts_url;
}
endif;

/**
 * JavaScript Detection.
 *
 * Adds a `js` class to the root `<html>` element when JavaScript is detected.
 *
 * @since Twenty Fifteen 1.1
 */
function twentyfifteen_javascript_detection() {
	echo "<script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>\n";
}
add_action( 'wp_head', 'twentyfifteen_javascript_detection', 0 );

/**
 * Enqueue scripts and styles.
 *
 * @since Twenty Fifteen 1.0
 */
function twentyfifteen_scripts() {
	// Add custom fonts, used in the main stylesheet.
	wp_enqueue_style( 'twentyfifteen-fonts', twentyfifteen_fonts_url(), array(), null );

	// Add Genericons, used in the main stylesheet.
	wp_enqueue_style( 'genericons', get_template_directory_uri() . '/genericons/genericons.css', array(), '3.2' );

	// Load our main stylesheet.
	wp_enqueue_style( 'twentyfifteen-style', get_stylesheet_uri() );

	// Load the Internet Explorer specific stylesheet.
	wp_enqueue_style( 'twentyfifteen-ie', get_template_directory_uri() . '/css/ie.css', array( 'twentyfifteen-style' ), '20141010' );
	wp_style_add_data( 'twentyfifteen-ie', 'conditional', 'lt IE 9' );

	// Load the Internet Explorer 7 specific stylesheet.
	wp_enqueue_style( 'twentyfifteen-ie7', get_template_directory_uri() . '/css/ie7.css', array( 'twentyfifteen-style' ), '20141010' );
	wp_style_add_data( 'twentyfifteen-ie7', 'conditional', 'lt IE 8' );

	wp_enqueue_script( 'twentyfifteen-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20141010', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}

	if ( is_singular() && wp_attachment_is_image() ) {
		wp_enqueue_script( 'twentyfifteen-keyboard-image-navigation', get_template_directory_uri() . '/js/keyboard-image-navigation.js', array( 'jquery' ), '20141010' );
	}

	wp_enqueue_script( 'twentyfifteen-script', get_template_directory_uri() . '/js/functions.js', array( 'jquery' ), '20150330', true );
	wp_localize_script( 'twentyfifteen-script', 'screenReaderText', array(
		'expand'   => '<span class="screen-reader-text">' . __( 'expand child menu', 'twentyfifteen' ) . '</span>',
		'collapse' => '<span class="screen-reader-text">' . __( 'collapse child menu', 'twentyfifteen' ) . '</span>',
	) );
}
add_action( 'wp_enqueue_scripts', 'twentyfifteen_scripts' );

/**
 * Add preconnect for Google Fonts.
 *
 * @since Twenty Fifteen 1.7
 *
 * @param array   $urls          URLs to print for resource hints.
 * @param string  $relation_type The relation type the URLs are printed.
 * @return array URLs to print for resource hints.
 */
function twentyfifteen_resource_hints( $urls, $relation_type ) {
	if ( wp_style_is( 'twentyfifteen-fonts', 'queue' ) && 'preconnect' === $relation_type ) {
		if ( version_compare( $GLOBALS['wp_version'], '4.7-alpha', '>=' ) ) {
			$urls[] = array(
				'href' => 'https://fonts.gstatic.com',
				'crossorigin',
			);
		} else {
			$urls[] = 'https://fonts.gstatic.com';
		}
	}

	return $urls;
}
add_filter( 'wp_resource_hints', 'twentyfifteen_resource_hints', 10, 2 );

/**
 * Add featured image as background image to post navigation elements.
 *
 * @since Twenty Fifteen 1.0
 *
 * @see wp_add_inline_style()
 */
function twentyfifteen_post_nav_background() {
	if ( ! is_single() ) {
		return;
	}

	$previous = ( is_attachment() ) ? get_post( get_post()->post_parent ) : get_adjacent_post( false, '', true );
	$next     = get_adjacent_post( false, '', false );
	$css      = '';

	if ( is_attachment() && 'attachment' == $previous->post_type ) {
		return;
	}

	if ( $previous &&  has_post_thumbnail( $previous->ID ) ) {
		$prevthumb = wp_get_attachment_image_src( get_post_thumbnail_id( $previous->ID ), 'post-thumbnail' );
		$css .= '
			.post-navigation .nav-previous { background-image: url(' . esc_url( $prevthumb[0] ) . '); }
			.post-navigation .nav-previous .post-title, .post-navigation .nav-previous a:hover .post-title, .post-navigation .nav-previous .meta-nav { color: #fff; }
			.post-navigation .nav-previous a:before { background-color: rgba(0, 0, 0, 0.4); }
		';
	}

	if ( $next && has_post_thumbnail( $next->ID ) ) {
		$nextthumb = wp_get_attachment_image_src( get_post_thumbnail_id( $next->ID ), 'post-thumbnail' );
		$css .= '
			.post-navigation .nav-next { background-image: url(' . esc_url( $nextthumb[0] ) . '); border-top: 0; }
			.post-navigation .nav-next .post-title, .post-navigation .nav-next a:hover .post-title, .post-navigation .nav-next .meta-nav { color: #fff; }
			.post-navigation .nav-next a:before { background-color: rgba(0, 0, 0, 0.4); }
		';
	}

	wp_add_inline_style( 'twentyfifteen-style', $css );
}
add_action( 'wp_enqueue_scripts', 'twentyfifteen_post_nav_background' );

/**
 * Display descriptions in main navigation.
 *
 * @since Twenty Fifteen 1.0
 *
 * @param string  $item_output The menu item output.
 * @param WP_Post $item        Menu item object.
 * @param int     $depth       Depth of the menu.
 * @param array   $args        wp_nav_menu() arguments.
 * @return string Menu item with possible description.
 */
function twentyfifteen_nav_description( $item_output, $item, $depth, $args ) {
	if ( 'primary' == $args->theme_location && $item->description ) {
		$item_output = str_replace( $args->link_after . '</a>', '<div class="menu-item-description">' . $item->description . '</div>' . $args->link_after . '</a>', $item_output );
	}

	return $item_output;
}
add_filter( 'walker_nav_menu_start_el', 'twentyfifteen_nav_description', 10, 4 );

/**
 * Add a `screen-reader-text` class to the search form's submit button.
 *
 * @since Twenty Fifteen 1.0
 *
 * @param string $html Search form HTML.
 * @return string Modified search form HTML.
 */
function twentyfifteen_search_form_modify( $html ) {
	return str_replace( 'class="search-submit"', 'class="search-submit screen-reader-text"', $html );
}
add_filter( 'get_search_form', 'twentyfifteen_search_form_modify' );

/**
 * Implement the Custom Header feature.
 *
 * @since Twenty Fifteen 1.0
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 *
 * @since Twenty Fifteen 1.0
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Customizer additions.
 *
 * @since Twenty Fifteen 1.0
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Created by Gevorg Poghosyan since 2/20/2017.
 */
 
function wps_change_role_name() {
    global $wp_roles;
    if (!isset($wp_roles))
		
    $wp_roles = new WP_Roles();
    $wp_roles->roles['administrator']['name'] = 'Директор';
    $wp_roles->role_names['administrator '] = 'Директор';
	
	$wp_roles->roles['editor']['name'] = 'Склад';
    $wp_roles->role_names['editor'] = 'Склад';
	
	$wp_roles->roles['author']['name'] = 'Типография';
    $wp_roles->role_names['author'] = 'Типография';
	
	$wp_roles->roles['contributor']['name'] = 'Резка';
    $wp_roles->role_names['contributor'] = 'Резка';
	
	$wp_roles->roles['subscriber ']['name'] = 'Заказ';
    $wp_roles->role_names['subscriber '] = 'Заказ';
}
add_action('init', 'wps_change_role_name');
 
function my_style_load() {
    wp_enqueue_style( 'component', get_template_directory_uri().'/css/component.css' );
	wp_enqueue_script( 'header_sticky', get_template_directory_uri() . '/js/jquery.stickyheader.js');
}
add_action( 'wp_enqueue_scripts', 'my_style_load' );

add_action ('wp_loaded', 'my_custom_redirect');
function my_custom_redirect() {
	$var_id = $_POST["product_id"];
	$var_wieght = $_POST["product_wieght"];
	$var_table = $_POST['product_table'];
	$var_price = $_POST['price'];
	$var_percent = $_POST['percent'];
	$one_page_weight = $_POST['one_page_weight'];
	$page_count = $_POST['page_count'];
    if (isset($_POST['submit_edit'])) {
		
		//Get form fields value
		
		//Prepare array to update row in table(db)
		 if($_POST["colum_name"] == "weight")
		 {
			$data = array(
				"page_count" => '(`page_count`+'.$page_count.')',
				$_POST["colum_name"] => '(`'.$_POST["colum_name"].'`+'.$var_wieght.')',
				"price" => '(`price`+'.$var_price.')',
				"percent" => '(`percent`+'.$var_percent.')'
			);
		 }
		 else
		 {
			$data = array(
				$_POST["colum_name"] => '(`'.$_POST["colum_name"].'`+'.$var_wieght.')',
				"price" => '(`price`+'.$var_price.')',
				"percent" => '(`percent`+'.$var_percent.')'
			);
		 }
		
		$where = array(
			"id" => $var_id
		);

		global $wpdb;
		if(count($data)>1){
			foreach ($data as $key=>$value) {
				switch ($key) {
					case "price":
						$setValue .= "`$key` = IF($value>=0 && `$key`!=$_POST[$key],$value,`$key`),";
						break;
					case "percent":
						$setValue .= "`$key` = IF($value>=0 && `$key`!=$_POST[$key],$value,`$key`),";
						break;
					default:
						$setValue .= "`$key` = IF($value>=0,$value,`$key`),";
						break;
				}
			}
			$setValue = rtrim($setValue,",");
		}else {
			$setValue = "`".key($data)."` = IF(".$data[key($data)].">=0,".$data[key($data)].",`".key($data)."`)";
		}
		$sql = "UPDATE `$var_table` SET $setValue WHERE `id` = $var_id";
		$wpdb->query($sql);
		
        wp_redirect($_POST['url']);
        exit;
    }
	if (isset($_POST['submit_remove'])) {
		
		global $wpdb;
		$wpdb->query( 
		$wpdb->prepare("DELETE FROM {$var_table} WHERE id = {$var_id}"));
        wp_redirect($_POST['url']);
        exit;
		
    }
}

	function calculate_stock_values($db_name, $id, $cost_income_value){
		global $wpdb;
		$result_db = $wpdb->get_results ("SELECT * FROM {$db_name} WHERE id={$id}");
		
		if ($db_name == "wp_product_paper")
		{
			foreach($result_db as $item)
				{
					$page_count = $item->page_count;
					$one_page = $item->one_page_weight;
				}
			
			$page_count -= $cost_income_value;
			$weight =  $page_count * $one_page;
			
			$data = array(
			"page_count" => $page_count,
			"weight" => $weight
			);
			
			
		}
		else if($db_name == "wp_product_roll")
		{
			foreach($result_db as $item){
				$page_count = $item->area;
			}
			
			$page_count -= $cost_income_value;
			
			$data = array(
				"area" => $page_count
			);
			
			
		}
		else if($db_name == "wp_product_other")
		{
			
		}
		
		$where = array(
		'id' => $id
		);


		$wpdb->update($db_name, $data, $where);
	}
	
	function redirect_user() {
	  if ( !is_user_logged_in()) {
		$return_url = esc_url( home_url( '/wp-login.php' ) );
		wp_redirect( $return_url );
		exit;
	  }
	}
	add_action( 'template_redirect', 'redirect_user' );
	
		 
	function login_redirect() {
	return '/index.php';
	}
	add_filter('login_redirect', 'login_redirect');
	
	function my_wp_nav_menu_args( $args = '' ) {
		$current_user_role = get_current_user_role(); 
		//echo $current_user_role;
		
		
		if ($current_user_role == 'administrator') 
		{ 
			$args['menu'] = 'Директор';
			$args['status'] = 'all';
		} 
		else  if ($current_user_role == 'editor')
		{ 
			$args['menu'] = 'Склад';
			$args['status'] = 'Оформлен';
		} 
		else  if ($current_user_role == 'author')
		{ 
			$args['menu'] = 'Типография';
			$args['status'] = 'Резка';
		} 
		else  if ($current_user_role == 'contributor')
		{ 
			$args['menu'] = 'Резка';
			$args['status'] = 'Склад';
		} 
		else  if ($current_user_role == 'subscriber')
		{ 
			$args['menu'] = 'Заказ';
			$args['status'] = 'all';
		} 
			return $args;
	}
	add_filter( 'wp_nav_menu_args', 'my_wp_nav_menu_args' );
	
	function get_current_user_role() {
		global $wp_roles;
		$current_user = wp_get_current_user();
		$roles = $current_user->roles;
		$role = array_shift($roles);
		return $role;
		//return $wp_roles->role_names[$role];
	}
	
	function get_role_names() {

		global $wp_roles;

		if ( ! isset( $wp_roles ) )
			$wp_roles = new WP_Roles();

		var_dump($wp_roles->get_names()); 
	
	}

	function material_filter_html() {
		global $wpdb;
		$filter = "";
		if($_POST["switchDensity"] == "true"){
			$dbTable = "wp_product_roll";
		}else {
			$dbTable = "wp_product_paper";
		}
		if(isset($_POST["material"]) && $_POST["material"] != ""){
			$material=$_POST["material"];
			if(isset($_POST["materialArray"]) && !empty($_POST["materialArray"])){
				foreach ($_POST["materialArray"] as $key=>$value) {
					$filter .= " AND ".$key." LIKE '%".$value."%'";
				}
			}
			if($_POST["selectField"] == "size_x"){
				$sizes = explode("x",$material);
				if($_POST["switchDensity"] == true){
					$result = $wpdb->get_results ( "SELECT * FROM {$dbTable} WHERE ".$_POST["selectField"]."='".$sizes[0]."' AND size_y LIKE '%".$sizes[1]."%'".$filter);
				}else {
					$result = $wpdb->get_results ( "SELECT * FROM {$dbTable} WHERE ".$_POST["selectField"]."='".$sizes[0]."' AND size_y='".$sizes[1]."'".$filter);
				}
			}else {
				$result = $wpdb->get_results ( "SELECT * FROM {$dbTable} WHERE ".$_POST["selectField"]." LIKE '%".$material."%'".$filter);
			}
			$resultHtml = [];
			foreach ( $result as $item ) {
				$material_name .= '<option value="'.$item->name.'">'.$item->name.'</option>';
				$material_size .= '<option value="'.$item->size_x.'x'.$item->size_y.'">'.$item->size_x.'x'.$item->size_y.'</option>';
				if($_POST["switchDensity"] == "true"){
					$type .= '<option value="'.$item->type.'">'.$item->type.'</option>';
				}else {
					$density .= '<option value="'.$item->density.'">'.$item->density.'</option>';
				}
			}
			switch ($_POST["selectField"]) {
				case "size_x":
					$resultHtml['material'] = $material_name;
					if($_POST["switchDensity"] == "true"){
						$resultHtml['type'] = $type;
					}else {
						$resultHtml['density'] = $density;
					}
					break;
				case "density":
					$resultHtml['material'] = $material_name;
					$resultHtml['material_size'] = $material_size;
					break;
				case "type":
					$resultHtml['material'] = $material_name;
					$resultHtml['material_size'] = $material_size;
				default:
					$resultHtml['material_size'] = $material_size;
					if($_POST["switchDensity"] == "true"){
						$resultHtml['type'] = $type;
					}else {
						$resultHtml['density'] = $density;
					}
					break;
			}
		} else {
			$result = $wpdb->get_results ( "SELECT * FROM {$dbTable}");
			$resultHtml = [];
			foreach ( $result as $item ) {
				$material_name .= '<option value="'.$item->name.'">'.$item->name.'</option>';
				$material_size .= '<option value="'.$item->size_x.'x'.$item->size_y.'">'.$item->size_x.'x'.$item->size_y.'</option>';
				if($_POST["switchDensity"] == true){
					$type .= '<option value="'.$item->type.'">'.$item->type.'</option>';
				}else {
					$density .= '<option value="'.$item->density.'">'.$item->density.'</option>';
				}
			}
			$resultHtml['material'] = $material_name;
			$resultHtml['material_size'] = $material_size;
			if($_POST["switchDensity"] == true){
				$resultHtml['type'] = $type;
			}else {
				$resultHtml['density'] = $density;
			}
		}

		wp_send_json($resultHtml);
		wp_die();
	}
	add_action('wp_ajax_nopriv_ajaxConversion', 'material_filter_html');
	add_action('wp_ajax_ajaxConversion', 'material_filter_html');

	function materialTransaction($form,$foil,$rubber,$lacquer,$db) {
		try {
			// First of all, let's begin a transaction
			$db->query('START TRANSACTION');

    		// A set of queries; if one fails, an exception should be thrown
			if($form) {
				$formFiled = key($form);
				updateProtuctCount($formFiled,$form[$formFiled],'Форма');
			}
			if($foil) {
				$foilFiled = key($foil);
				updateProtuctCount($foilFiled,$foil[$foilFiled],'Фольга');
			}
			if($rubber){
				$rubberFiled = key($rubber);
				updateProtuctCount($rubberFiled,$rubber[$rubberFiled],'Резина');	
			}
			if($lacquer){
				$lacquerFiled = key($lacquer);
				updateProtuctCount($lacquerFiled,$lacquer[$lacquerFiled],'Лак');	
			}

    		// If we arrive here, it means that no exception was thrown
			// i.e. no query has failed, and we can commit the transaction
			$db->query('COMMIT');
		} catch (Exception $e) {
			// An exception has been thrown
			// We must rollback the transaction
			$db->query('ROLLBACK');
		}
	}
	function checkProductCount($data) {
		global $wpdb;
		$column = ["Форма","Фольга","Резина","Лак"];
		foreach ($data as $key=>$value) {
			$field = key($value);
			$type = $column[$key];
			$balance = $wpdb->get_var("SELECT count FROM wp_product_other WHERE type = '".$type."' AND id = '".$field."'");
			if(intval($balance) < intval($value[key($value)])){
				return false;
			}
		}
		return true;
	}
	function updateProtuctCount($field,$value,$type){
		global $wpdb;
		$balance = $wpdb->get_var("SELECT count FROM wp_product_other WHERE type = '".$type."' AND id = '".$field."'");
		$newCount = intval($balance)-intval($value);
		$wpdb->update("wp_product_other",array('count'=>$newCount),array('id'=>$field,'type'=>$type));
	}
	/*Calculate each order cost price*/
	function costPrice($tableName){
		global $wpdb;
		$orderTableName = "wp_order_".$tableName;
		$productTableName = "wp_product_".$tableName;
		
		$returnResult = [];
		$order = $wpdb->get_results("SELECT * FROM {$orderTableName}",ARRAY_A);
		foreach ($order as $key=>$value) {
			$returnResult[$key]['id'] = $value['id'];
			$returnResult[$key]['customer'] = $value['customer'];
			if($value['customer'] == null){
				$customerWithTable = $wpdb->get_row( "SELECT name FROM wp_customers WHERE id ={$value['customer_id']}" );
				$returnResult[$key]['customer'] = $customerWithTable->name;
			}
			$returnResult[$key]['status'] = $value['status'];
			$returnResult[$key]['selling_price'] = $value['selling_price'];
			$material_id = $value['material'];
			$material = $wpdb->get_results("SELECT price,percent FROM {$productTableName} WHERE id = {$material_id}");
			if($tableName == "roll"){
				$totalCount = $value['count_per_page']*$material[0]->price;
				$percent = ($material[0]->percent/100)*$totalCount;
				$materialCost = $totalCount+$percent;
			} else {
				$totalSum = $value['page_count']*$material[0]->price;
				$percent = ($material[0]->percent/100)*$totalSum;
				$materialCost = $totalSum+$percent;
			}
			$otherPrices = otherProductPrice($value);
			$otherCost = 0;
			if(!empty($otherPrices)){
				foreach ($otherPrices as $p_key=>$p_value) {
					$totalSum = $value[$p_key]*$p_value['price'];
					$percent = ($p_value['percent']/100)*$totalSum;
					$otherCost += $totalSum+$percent;
				}
			}
			$totalCost = $materialCost+$otherCost;
			$returnResult[$key]['cost_price'] = $totalCost;
			$returnResult[$key]['earnings'] = $value['selling_price']-$totalCost;
			if($value['debt'] == 0 && $value['paid'] == 0){
				$wpdb->update($orderTableName,array('debt'=>$value['selling_price']),array('id'=>$value['id']));
				$returnResult[$key]['debt'] = $value['selling_price'];
			}else {
				$returnResult[$key]['debt'] = $value['debt'];
			}
			if($value['type'] != ''){
				$returnResult[$key]['type'] = $value['type'];
			}
		}
		return $returnResult;
	}

	/*Calculate each order cost price*/
	function costumerOrderPrice($tableName, $costumerName){
		global $wpdb;
		$orderTableName = "wp_order_".$tableName;
		$productTableName = "wp_product_".$tableName;
		$checkCustomer = $wpdb->get_row("SELECT id FROM wp_customers WHERE name ='$costumerName'");
		if($checkCustomer->id != null){
			$order = $wpdb->get_results("SELECT * FROM {$orderTableName} WHERE customer_id ={$checkCustomer->id}",ARRAY_A);
		} else {
			$order = $wpdb->get_results("SELECT * FROM {$orderTableName} WHERE customer = '".$costumerName."'",ARRAY_A);
		}
		$returnResult = [];
		foreach ($order as $key=>$value) {
			$returnResult[$key]['id'] = $value['id'];
			if($value['customer'] == null){
				$returnResult[$key]['customer'] = $costumerName;
			} else {
				$returnResult[$key]['customer'] = $value['customer'];;
			}
			$returnResult[$key]['status'] = $value['status'];
			$returnResult[$key]['selling_price'] = $value['selling_price'];
			$material_id = $value['material'];
			$material = $wpdb->get_results("SELECT price,percent FROM {$productTableName} WHERE id = {$material_id}");
			if($tableName == "roll"){
				$totalCount = $value['count_per_page']*$material[0]->price;
				$percent = ($material[0]->percent/100)*$totalCount;
				$materialCost = $totalCount+$percent;
			} else {
				$totalSum = $value['page_count']*$material[0]->price;
				$percent = ($material[0]->percent/100)*$totalSum;
				$materialCost = $totalSum+$percent;
			}
			$otherPrices = otherProductPrice($value);
			$otherCost = 0;
			if(!empty($otherPrices)){
				foreach ($otherPrices as $p_key=>$p_value) {
					$totalSum = $value[$p_key]*$p_value['price'];
					$percent = ($p_value['percent']/100)*$totalSum;
					$otherCost += $totalSum+$percent;
				}
			}
			$totalCost = $materialCost+$otherCost;
			$returnResult[$key]['cost_price'] = $totalCost;
			$returnResult[$key]['earnings'] = $value['selling_price']-$totalCost;
			if($value['debt'] == 0 && $value['paid'] == 0){
				$wpdb->update($orderTableName,array('debt'=>$value['selling_price']),array('id'=>$value['id']));
				$returnResult[$key]['debt'] = $value['selling_price'];
			}else {
				$returnResult[$key]['debt'] = $value['debt'];
			}
			if($value['type'] != ''){
				$returnResult[$key]['type'] = $value['type'];
			}
		}
		return $returnResult;
	}

	function otherProductPrice($order_data) {
		global $wpdb;
		$otherTableName = "wp_product_other";
		$other = $wpdb->get_results("SELECT * FROM {$otherTableName}",ARRAY_A);
		$otherPriceInfo = [];
		foreach ($other as $value) {
			if($order_data['form_id'] == $value['id']) {
				$otherPriceInfo['form']['price'] = $value['price'];
				$otherPriceInfo['form']['percent'] = $value['percent'];
			}
			if($order_data['foil_id'] == $value['id']) {
				$otherPriceInfo['foil']['price'] = $value['price'];
				$otherPriceInfo['foil']['percent'] = $value['percent'];
			}
			if($order_data['rubber_id'] == $value['id']) {
				$otherPriceInfo['rubber']['price'] = $value['price'];
				$otherPriceInfo['rubber']['percent'] = $value['percent'];
			}
			if($order_data['lacquer_id'] == $value['id']) {
				$otherPriceInfo['lacquer']['price'] = $value['price'];
				$otherPriceInfo['lacquer']['percent'] = $value['percent'];
			}
		}
		return $otherPriceInfo;
	}
	function updateCostData(){
		global $wpdb;
		$table = "wp_order_".$_POST['tableName'];
		$selling_data = intval($_POST['content_selling']);
		$debt_data = intval($_POST['debt']);
		$orderId= intval($_POST['orderId']);
		$orderData = $wpdb->get_row("SELECT debt,paid FROM {$table} WHERE id = {$orderId}");
		if(isset($_POST['customer_name']) && $_POST['customer_name'] != null){
			$deptTable = 'wp_debt_'.$_POST['tableName'].'_statistic';
			$deptData = array();
			$deptData['payed_number'] = intval($orderData->debt) - $debt_data;
			$deptData['order_id'] = $orderId;
			$deptData['date'] = date("Y-m-d");
			$deptData['customer'] = $_POST['customer_name'];
			$wpdb->insert($deptTable,$deptData);
		}
		$orderType = $_POST['order_type'];
		$data = array(
			'selling_price'=>$selling_data,
			'type'=>$orderType
		);
		if(intval($orderData->debt) != 0 && $debt_data == 0){
			$data['debt'] = $debt_data;
			$data['paid'] = 1;
		}else {
			$data['debt'] = $debt_data;
		}
		$wpdb->update($table,$data,array('id'=>$orderId));
		wp_send_json("The data was updated");
		wp_die();
	}
	add_action('wp_ajax_nopriv_ajaxCostUpdate', 'updateCostData');
	add_action('wp_ajax_ajaxCostUpdate', 'updateCostData');

	add_filter( 'wp_nav_menu_items', 'wti_loginout_menu_link', 10, 2 );

	function wti_loginout_menu_link( $items, $args ) {
		if ($args->theme_location == 'primary' && get_current_user_role() != 'administrator') {
			if (is_user_logged_in()) {
				$items .= '<li class="right logout"><a href="'. wp_logout_url() .'">'. __("Log Out") .'</a></li>';
			}
		}
		return $items;
	}