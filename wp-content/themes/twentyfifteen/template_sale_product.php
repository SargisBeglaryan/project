<?php 
/* 
Template Name: Sale Product
*/
?>
<?php get_header(); ?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<section class="bla">	
				<div class="sale-product-content page-content">
					<h4 class="page-title"><?php _e('Выберите материал для продажа'); ?></h4>
						
					<div class="button_content" style="margin-top:30px;">
						<button id="sale_paper">Бумага</button>
						<button id="sale_roll">Рулон</button>
						<button id="sale_other">Разное</button>
					</div>
					<div class="sale_paperFormContent"></div>
					<div class="sale_rollFormContent"></div>
					<div class="sale_otherFormContent"></div>	
				</div>
			</section>
		</main>
	</div>

<?php get_footer(); ?>