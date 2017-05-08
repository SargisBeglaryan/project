<?php
/*
Template Name: Order handler
*/
?>

<?php get_header(); 

// GET PRODUCTS LIST FROM DB
	$printing_type = $_GET["type"];
	$material_name = $_GET["material"];
	global $wpdb;	
	//$index = array_search ('paper200', $materials_array);
?>
<script src="//cdn.jsdelivr.net/webshim/1.14.5/polyfiller.js"></script>
<script>
//configure forms features
webshim.setOptions("forms", {
	lazyCustomMessages: true,
	replaceValidationUI: true,
	customselect: "auto",
	list: {
		"filter": "^"
	}
});

//configure forms-ext features
webshim.setOptions("forms-ext", {
	// replaceUI: "auto",
	types: "date",
	date: {
		startView: 2,
		openOnFocus: true,
		classes: "show-week"
	},
	number: {
		calculateWidth: false
	},
	range: {
		classes: "show-activevaluetooltip"
	}
});

webshim.setOptions('details', {animate: true});
webshims.polyfill('forms forms-ext');
</script>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">

			<section class="bla">	
				<div class="page-content">
					<h4 class="page-title"><?php _e('Оформления заказа'); ?></h4>

					<?php if($printing_type == "paper"){ 
						$allPapers = $wpdb->get_results ( "SELECT * FROM wp_product_paper");
						$material = $wpdb->get_results ( "SELECT * FROM wp_product_paper GROUP BY `name`");
						$density = $wpdb->get_results ( "SELECT * FROM wp_product_paper GROUP BY `density`");
					?>
					<div class="order_paper">
						<form method="POST" action="" autocomplete="off">
						
							<p>
								<input type="date" name="date" data-date='{"startView": 2, "openOnMouseFocus": true}' placeholder="mm/dd/yyyy" required>
							</p>
						
							<p>
								<input type="text" name="customer_name" placeholder="ФИО" style="width:46%;" required>
								<input type="text" name="phone_number" placeholder="Номер телефона" style="width:46%;" >
							</p>
							
							<p>
								<input type="text" name="order_type" placeholder="Тип заказа" style="width:46%;" required>
								<select id="material" name="material"  required>
									<option value="" disabled selected>Материал</option>
									<?php
										foreach ( $material as $item ) {
									?>
										<option value="<?php echo $item->name;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
							</p>
							<p>
								<select id="material_size"  name="material_size"  required>
									<option value="" disabled selected>Формат</option>
									<?php
										foreach ( $allPapers as $item ) {
									?>
									<option value="<?php echo $item->size_x;?>x<?php echo $item->size_y;?>"><?php echo $item->size_x;?>x<?php echo $item->size_y;?></option>
									<?php } ?>
								</select>
								<select id="density" name="density"  required>
									<option value="" disabled selected>Плотность</option>
									<?php
										foreach ( $density as $item ) {
									?>
									<option value="<?php echo $item->density;?>"><?php echo $item->density;?></option>
									<?php } ?>
								</select>
							</p>
							
							<p>
								<input type="text" name="printing_count" placeholder="Тираж" style="width:46%;" required>
								<input type="text" name="page_count" placeholder="Количество бумаги" style="width:46%;" required>
							</p>
							
							<p>
								<input type="text" name="size_x" placeholder="Длина(Режущий)" style="width:46%;" required>
								<input type="text" name="size_y" placeholder="Ширина(Режущий)" style="width:46%;" required>
							</p>
							
							<p>
								<?php
								$result_form = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Форма'");
								?>
								<select id="form" name="form" <?php if(count($result_form) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Формы</option>
									<?php
										foreach ( $result_form as $item ) {
									?>
									<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								<input type="text" name="form_count" placeholder="Количество форм" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							
							<p>
								<?php
								$result_form = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Фольга'");
								?>
								<select id="foil" name="foil"   <?php if(count($result_form) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Фольга</option>
									<?php
										foreach ( $result_form as $item ) {
									?>
									<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								<input type="text" name="foil_count" placeholder="Количество фольги" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							
							<p>
								<?php
								$result_form = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Резина'");
								?>
								<select id="rubber" name="rubber"  <?php if(count($result_form) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Резина</option>
									<?php
										foreach ( $result_form as $item ) {
									?>
									<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								<input type="text" name="rubber_count" placeholder="Количество резины" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							
							<p>
								<?php
								$result_form = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Лак'");
								?>
								<select id="lacquer" name="lacquer"  <?php if(count($result_form) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Лак</option>
									<?php 
										foreach ( $result_form as $item ) {
									?>
									<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								<input type="text" name="lacquer_count" placeholder="Количество лака" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							<p>
								<select name="type_of_order" required class="type_of_order">
									<option value="" disabled selected>Выберите тип</option>
									<option value="Продажа">Продажа</option>
									<option value="Заказ">Заказ</option>
								</select>
							</p>
							
							<input type="submit" name="submit_create" value="Оформить" style="margin-top:30px;">

						</form>
						
						<?php
						if(isset($_POST["submit_create"]))
						{
							$sizes = explode("x", $_POST["material_size"]);
							$size_x = $sizes[0];
							$size_y = $sizes[1];
							if($_POST["material"] != ""){
								$material_id = $wpdb->get_var( "SELECT id FROM wp_product_paper WHERE name LIKE '%{$_POST["material"]}%' and size_x = {$size_x} and size_y = {$size_y} and density = {$_POST["density"]} ");
							}else {
								$material_id = 0;
							}
							$data = array(
								"date" => $_POST["date"],
								"order_type" =>  $_POST["order_type"],
								"customer" => $_POST["customer_name"],
								"phone" => $_POST["phone_number"],
								"printing_count" => $_POST["printing_count"],
								"page_count" => $_POST["page_count"],
								"size_x" => $_POST["size_x"],
								"size_y" => $_POST["size_y"],
								"material" => $material_id,
								"form" => $_POST["form_count"],
								"foil" => $_POST["foil_count"],
								"rubber" => $_POST["rubber_count"],
								"lacquer" => $_POST["lacquer_count"],
								"type_of_order" => $_POST['type_of_order'],
								"status" => "Оформлен"
							);
							
							$data['form'] = ($_POST["form_count"])?$_POST["form_count"]:'0';
							$data['foil'] = ($_POST["foil_count"])?$_POST["foil_count"]:'0';
							$data['rubber'] = ($_POST["rubber_count"])?$_POST["rubber_count"]:'0';
							$data['lacquer'] = ($_POST["lacquer_count"])?$_POST["lacquer_count"]:'0';
							$data['form_id'] = ($_POST["form"])?$_POST["form"]:'0';
							$data['foil_id'] = ($_POST["foil"])?$_POST["foil"]:'0';
							$data['rubber_id'] = ($_POST["rubber"])?$_POST["rubber"]:'0';
							$data['lacquer_id'] = ($_POST["lacquer"])?$_POST["lacquer"]:'0';
							
							//Insert new row
							$wpdb->insert("wp_order_paper", $data);
						
						} else if(isset($_POST["submit_remove"])) {?>
						 
						
						<?php } ?>
						
					</div>
					
					<?php } else { 
						$allRoll = $wpdb->get_results ( "SELECT * FROM wp_product_roll");
						$material = $wpdb->get_results ( "SELECT * FROM wp_product_roll GROUP BY `name`");
						$type = $wpdb->get_results ( "SELECT * FROM wp_product_roll GROUP BY `type`");
					?>
					<div class="order_roll">
						<form method="POST" action="">
						
							<p>
								<input type="date" name="date" data-date='{"startView": 2, "openOnMouseFocus": true}' placeholder="mm/dd/yyyy" required>
							</p>
						
							<p>
								<input type="text" name="customer_name" placeholder="ФИО" style="width:46%;" required>
								<input type="text" name="phone_number" placeholder="Номер телефона" style="width:46%;" >
							</p>
							
							<p>
								<input type="text" name="order_type" placeholder="Тип заказа" style="width:46%;" required>
								<select id="material" name="material"  required>
									<option value="" disabled selected>Материал</option>
									<?php
										foreach ( $material as $item ) {
									?>
										<option value="<?php echo $item->name;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								
							</p>
							<p>
								<select id="material_size"  name="material_size"  required>
									<option value="" disabled selected>Формат</option>
									<?php
										foreach ( $allRoll as $item ) {
									?>
									<option value="<?php echo $item->size_x;?>x<?php echo $item->size_y;?>"><?php echo $item->size_x;?>x<?php echo $item->size_y;?></option>
									<?php } ?>
								</select>
								<select id="type" name="type"  required>
									<option value="" disabled selected>Тип</option>
									<?php
										foreach ( $type as $item ) {
									?>
									<option value="<?php echo $item->type;?>"><?php echo $item->type;?></option>
									<?php } ?>
								</select>
							</p>
							
							<p>
								<input type="text" name="printing_count" placeholder="Тираж" style="width:46%;" required>
								<input type="text" name="count_per_page" placeholder="Расходы" style="width:46%;" required>
							</p>
							
							<p>
								<input type="text" name="step_lenght" placeholder="Длина шага" style="width:46%;" required>
								<input type="text" name="label_count" placeholder="Колличество этикеток" style="width:46%;" required>
							</p>
							
							<p>
								<?php
								$result_form = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Форма'");
								?>
								<select id="form" name="form" <?php if(count($result_form) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Формы</option>
									<?php
										foreach ( $result_form as $item ) {
									?>
									<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								<input type="text" name="form_count" placeholder="Количество форм" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							
							<p>
								<?php
									$result_form = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Фольга'");
								?>
								<select id="foil" name="foil"   <?php if(count($result_form) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Фольга</option>
									<?php
										foreach ( $result_form as $item ) {
									?>
									<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								<input type="text" name="foil_count" placeholder="Количество фольги" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							
							<p>
								<?php
									$result_form = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Резина'");
								?>
								<select id="rubber" name="rubber"  <?php if(count($result_form) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Резина</option>
									<?php
										foreach ( $result_form as $item ) {
									?>
									<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								<input type="text" name="rubber_count" placeholder="Количество резины" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							
							<p>
								<?php
									$result_form = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Лак'");
								?>
								<select id="lacquer" name="lacquer"  <?php if(count($result_form) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Лак</option>
									<?php 
									foreach ( $result_form as $item ) {
										?>
										<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
										<?php } ?>
								</select>
								<input type="text" name="lacquer_count" placeholder="Количество лака" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							<p>
								<select name="type_of_order" required class="type_of_order">
									<option value="" disabled selected>Выберите тип</option>
									<option value="Продажа">Продажа</option>
									<option value="Заказ">Заказ</option>
								</select>
							</p>
							
							<input type="submit" name="submit_create" value="Оформить" style="margin-top:30px;">	
						
						</form>
						
						<?php
						if(isset($_POST["submit_create"]))
						{
							// Prepare array to insert in database
							$sizes = explode("x", $_POST["material_size"]);
							$size_x = $sizes[0];
							$size_y = $sizes[1];
							if($_POST["material"] != ''){
								$material_id = $wpdb->get_var( "SELECT id FROM wp_product_roll WHERE name LIKE '%{$_POST["material"]}%' and size_x = {$size_x} and size_y LIKE '%{$size_y}%' and type = '{$_POST["type"]}' ");
							}else {
								$material_id = 0;
							}
							$data = array(
								"date" => $_POST["date"],
								"order_type" =>  $_POST["order_type"],
								"customer" => $_POST["customer_name"],
								"phone" => $_POST["phone_number"],
								"printing_count" => $_POST["printing_count"],
								"count_per_page" => $_POST["count_per_page"],
								"step_lenght" => $_POST["step_lenght"],
								"label_count" => $_POST["label_count"],
								"material" => $material_id,
								"type_of_order" => $_POST['type_of_order'],
								"status" => "Оформлен"
							);
							$data['form'] = ($_POST["form_count"])?$_POST["form_count"]:'0';
							$data['foil'] = ($_POST["foil_count"])?$_POST["foil_count"]:'0';
							$data['rubber'] = ($_POST["rubber_count"])?$_POST["rubber_count"]:'0';
							$data['lacquer'] = ($_POST["lacquer_count"])?$_POST["lacquer_count"]:'0';
							$data['form_id'] = ($_POST["form"])?$_POST["form"]:'0';
							$data['foil_id'] = ($_POST["foil"])?$_POST["foil"]:'0';
							$data['rubber_id'] = ($_POST["rubber"])?$_POST["rubber"]:'0';
							$data['lacquer_id'] = ($_POST["lacquer"])?$_POST["lacquer"]:'0';

							//Insert new row
							$wpdb->insert("wp_order_roll", $data);
						
						} else if(isset($_POST["submit_remove"])) {?>
						 
						 
						<?php } ?>
					</div>
					<?php }?>
				</div>
			</section>
		</main>
	</div>
	
<?php get_footer(); ?>