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
					<div class="salePaperFormContent"></div>
					<div class="saleRollFormContent"></div>
					<div class="saleOtherFormContent"></div>
				</div>
			</section>
		</main>
	</div>
	<div class="salePaperFormStructure" style="display:none">
	<?php
		$allPapers = $wpdb->get_results ( "SELECT * FROM wp_product_paper");
		$paperMaterial = $wpdb->get_results ( "SELECT * FROM wp_product_paper GROUP BY `name`");
		$paperDensity = $wpdb->get_results ( "SELECT * FROM wp_product_paper GROUP BY `density`");
	?>
		<form method="POST" action="" id="1" autocomplete="off" class="salePaperForm">
		<p class="salePageTitle">Продажа бумаги</p>
			<p>
				<select id="sale_material" name="material"  required>
					<option value="" disabled selected>Материал</option>
					<?php
						foreach ( $paperMaterial as $item ) {
					?>
						<option value="<?php echo $item->name;?>"><?php echo $item->name;?></option>
					<?php } ?>
				</select>
				<select id="sale_material_size"  name="material_size"  required>
					<option value="" disabled selected>Формат</option>
					<?php
						foreach ( $allPapers as $item ) {
					?>
					<option value="<?php echo $item->size_x;?>x<?php echo $item->size_y;?>"><?php echo $item->size_x;?>x<?php echo $item->size_y;?></option>
					<?php } ?>
				</select>
				<select id="sale_density" name="density"  required>
					<option value="" disabled selected>Плотность</option>
					<?php
						foreach ( $paperDensity as $item ) {
					?>
					<option value="<?php echo $item->density;?>"><?php echo $item->density;?></option>
					<?php } ?>
				</select>
				<input type="number" class="sale_page_count" name="page_count" placeholder="Количество бумаги" style="width:20%;height: 40px;font-size: 17px;" required>
				<i class="fa fa-minus-circle" aria-hidden="true"></i>
				<i class="fa fa-plus-circle" aria-hidden="true"></i>
				<button type="button" id="saleProductButton" name="submit_create" style="width: 20%;height: 43px; padding: 12px 10px;">Сохранить</button>
			</p>
		</form>
	</div>
	<div class="saleRollFormStructure">
	<?php
	$allRoll = $wpdb->get_results ( "SELECT * FROM wp_product_roll");
	$material = $wpdb->get_results ( "SELECT * FROM wp_product_roll GROUP BY `name`");
	$type = $wpdb->get_results ( "SELECT * FROM wp_product_roll GROUP BY `type`");
	?>
		<form method="POST" action="" class="saleRollForm">
		<p class="salePageTitle">Продажа рулона</p>
			<p>
				<select id="sale_material" name="material"  required>
					<option value="" disabled selected>Материал</option>
					<?php
						foreach ( $material as $item ) {
					?>
						<option value="<?php echo $item->name;?>"><?php echo $item->name;?></option>
					<?php } ?>
				</select>
				<select id="sale_material_size"  name="material_size"  required>
					<option value="" disabled selected>Формат</option>
					<?php
						foreach ( $allRoll as $item ) {
					?>
					<option value="<?php echo $item->size_x;?>x<?php echo $item->size_y;?>"><?php echo $item->size_x;?>x<?php echo $item->size_y;?></option>
					<?php } ?>
				</select>
				<select id="sale_type" name="type"  required>
					<option value="" disabled selected>Тип</option>
					<?php
						foreach ( $type as $item ) {
					?>
					<option value="<?php echo $item->type;?>"><?php echo $item->type;?></option>
					<?php } ?>
				</select>
				<input type="number" name="label_count" class="sale_page_count" placeholder="Колличество этикеток" style="width:20%;height: 40px;font-size: 17px;" required>
				<i class="fa fa-minus-circle" aria-hidden="true"></i>
				<i class="fa fa-plus-circle" aria-hidden="true"></i>
				<button type="button" id="saleProductButton" name="submit_create" style="width: 20%;height: 43px; padding: 12px 10px;">Сохранить</button>
			</p>
		</form>
	</div>
	<div class="saleOtherFormStructure" style="display:none">
	<?php
		$otherName = $wpdb->get_results ( "SELECT * FROM wp_product_other GROUP BY `name`");
		$otherType = $wpdb->get_results ( "SELECT * FROM wp_product_other GROUP BY `type`");
	?>
		<form method="POST" action="" autocomplete="off" class="saleOtherForm">
		<p class="salePageTitle">Продажа другие</p>
			<p>
				<select id="otherType" name="otherName" >
					<option value="" disabled selected>Kатегория</option>
					<?php
						foreach ( $otherType as $category ) {
					?>
					<option value="<?php echo $category->type;?>"><?php echo $category->type;?></option>
					<?php } ?>
				</select>
				<select id="otherName" name="otherName" >
					<option value="" disabled selected>Имя</option>
					<?php
						foreach ( $otherName as $item ) {
					?>
					<option value="<?php echo $item->name;?>"><?php echo $item->name;?></option>
					<?php } ?>
				</select>
				<input type="number" class="sale_page_count" name="page_count" placeholder="Количество" style="width:20%;height: 40px;font-size: 17px;" required>
				<i class="fa fa-minus-circle" aria-hidden="true"></i>
				<i class="fa fa-plus-circle" aria-hidden="true"></i>
				<button type="button" id="saleProductButton" name="submit_create" style="width: 20%;height: 43px; padding: 12px 10px;">Сохранить</button>
			</p>
		</form>
	</div>
<?php get_footer(); ?>