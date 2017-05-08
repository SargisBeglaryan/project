<?php
/*
Template Name: Create New Order
*/
?>

<?php get_header();
if(get_current_user_role()!="administrator" && apply_filters( 'wp_nav_menu_args', '' )['menu'] != 'Заказ'){
	?>
	<script>
		location.href = "all-paper-orders/";
	</script>
	<?php
}
?>

	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">

			<section class="bla">	
				<div class="page-content">
					<h4 class="page-title"><?php _e('Выберите материал и тип печати'); ?></h4>
						
					<p>
					<div class="edit_button" style="margin-top:30px;">
						<button id="paper_button">Бумага</button>
						<button id="roll_button">Рулон</button>
					</div>
			
					<script type="text/javascript">
					document.getElementById("paper_button").onclick = function () {
						location.href = "order/?type=paper";
					};
					
					document.getElementById("roll_button").onclick = function () {
						location.href = "order/?type=roll";
					};
					</script>
					
				</div>
			</section>
		</main>
	</div>
	
<?php get_footer(); ?>


