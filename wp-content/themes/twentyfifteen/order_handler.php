<?php
/*
Template Name: Order handler
*/
?>

<?php get_header(); 

// GET PRODUCTS LIST FROM DB
	$printing_type = $_GET["type"];
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

					<?php
					$clients = $wpdb->get_results ( "SELECT * FROM  wp_customers");
					if($printing_type == "paper"){
						$allPapers = $wpdb->get_results( "SELECT * FROM wp_product_paper");
						$material = $wpdb->get_results( "SELECT * FROM wp_product_paper GROUP BY `name`");
						$density = $wpdb->get_results( "SELECT * FROM wp_product_paper GROUP BY `density`");
					?>
					<div class="order_paper">
						<form method="POST" action="" class="orderPaper">
						
							<p>
								<input type="date" name="date" data-date='{"startView": 2, "openOnMouseFocus": true}' placeholder="mm/dd/yyyy" required>
							</p>
						
							<p>
								<input type="text" name="customer_name" placeholder="ФИО" style="width:46%;" class="paperCustomerInput" required>
								<input type="hidden" name="customer_id" class="paperCustomerId">
								<select id="paper_customer" name="customer"  required style="width: 46%; margin-left: 0px">
									<option selected disabled>Список клиентов</option>
									<?php
										foreach ( $clients as $client ) {
									?>
										<option id="<?php echo $client->id;?>" value="<?php echo $client->name;?>"><?php echo $client->name;?></option>
									<?php } ?>
								</select>
							</p>
							<p>
							<input type="text" name="phone_number" placeholder="Номер телефона" style="width:46%;" >
							</p>
							<p>
								<input type="text" name="type" placeholder="Тип заказа" style="width:46%;" required>
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
								<input type="text" class="page_count" name="page_count" placeholder="Количество бумаги" style="width:46%;" required>
							</p>
							<p>
								<label>Цена одной бумаги</label>
								<input type="text" style="width:66%;" disabled class="oneCountPrice" name="oneCountPrice" placeholder="Цена одной бумаги + %">
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
								<input type="text" name="form_count" class="form_count" placeholder="Количество форм" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
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
								<input type="text" name="foil_count" class="foil_count" placeholder="Количество фольги" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
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
								<input type="text" name="rubber_count" class="rubber_count" placeholder="Количество резины" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
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
								<input type="text" name="lacquer_count" class="lacquer_count" placeholder="Количество лака" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							<p>
								<input type="hidden" name="type_of_order" value="Заказ">
							</p>
							<p>
								<select name="order_type" class="order_type" required>
									<option value="" selected="" disabled="">Выберите тип</option>
									<option value="Налич">Налич</option>
									<option value="Фактура">Фактура</option>
								</select>
								<label>Себестоимость</label>
								<input type="text" class="orderPriceSum" name="orderPriceSum" style="width: 25.5%;;" placeholder="общая цена заказа">
							</p>
							<p>
								<input type="text" name="debt" style="width:46%;" placeholder="Задолженность">
								<input type="text" name="selling_price" class="order_selling_price" style="width:46%;" placeholder="Цена продажи" required>
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
								"phone" => $_POST["phone_number"],
								"printing_count" => $_POST["printing_count"],
								"page_count" => $_POST["page_count"],
								"size_x" => $size_x,
								"size_y" => $size_y,
								"material" => $material_id,
								"form" => $_POST["form_count"],
								"foil" => $_POST["foil_count"],
								"rubber" => $_POST["rubber_count"],
								"lacquer" => $_POST["lacquer_count"],
								"type"=>$_POST["type"],
								"cost_price"=> $_POST["orderPriceSum"],
								"type_of_order" => $_POST['type_of_order'],
								"status" => "Оформлен"
							);
							$data["selling_price"] = $_POST["selling_price"] * $_POST["printing_count"];
							if($_POST["customer_id"] == ""){
								$data["customer"] = $_POST["customer_name"];
								$data["customer_id"] = null;
							} else {
								$data["customer_id"] = $_POST["customer_id"];
								$data["customer"] = null;
							}
							if($_POST["debt"] == ""){
								$data["debt"] = $data["selling_price"];
							} else {
								$data["debt"] = $_POST["debt"];
							}
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
						<form method="POST" action="" class="orderRoll">
						
							<p>
								<input type="date" name="date" data-date='{"startView": 2, "openOnMouseFocus": true}' placeholder="mm/dd/yyyy" required>
							</p>
						
							<p>
								<input type="text" name="customer_name" placeholder="ФИО" style="width:46%;" class="rollCustomerInput" required>
								<input type="hidden" name="customer_id" class="rollCustomerId">
								<select id="roll_customer" name="customer"  required style="width: 46%; margin-left: 0px">
									<option selected disabled>Список клиентов</option>
									<?php
										foreach ( $clients as $client ) {
									?>
										<option id="<?php echo $client->id;?>" value="<?php echo $client->name;?>"><?php echo $client->name;?></option>
									<?php } ?>
								</select>
							</p>
							<p>
								<input type="text" name="phone_number" placeholder="Номер телефона" style="width:46%;" >
							</p>
							<p>
								<input type="text" name="type" placeholder="Тип заказа" style="width:46%;" required>
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
								<input type="text" name="count_per_page" placeholder="Расходы" style="width:46%;" required class="page_count">
							</p>
							
							<p>
								<input type="text" name="step_lenght" placeholder="Длина шага" style="width:46%;" required>
								<input type="text" name="label_count" placeholder="Колличество этикеток" style="width:46%;" required>
							</p>
							<p>
							<label>Цена одного рулона</label>
								<input type="text" disabled name="oneCountPrice" placeholder="Цена одного рулона + %" class="oneCountPrice" class="page_count" style="width:66%;">
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
								<input type="text" name="form_count" class="form_count" placeholder="Количество форм" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
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
								<input type="text" name="foil_count" class="foil_count" placeholder="Количество фольги" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
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
								<input type="text" name="rubber_count" class="rubber_count" placeholder="Количество резины" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
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
								<input type="text" name="lacquer_count" class="lacquer_count"placeholder="Количество лака" style="width:46%;" <?php if(count($result_form) < 1) echo "disabled"; ?>>
							</p>
							<p>
								<input type="hidden" name="type_of_order" value="Заказ">
							</p>
							<p>
								<select name="order_type" class="order_type" required>
									<option value="" selected="" disabled="">Выберите тип</option>
									<option value="Налич">Налич</option>
									<option value="Фактура">Фактура</option>
								</select>
								<label>Себестоимость</label>
								<input type="text" class="orderPriceSum" name="orderPriceSum" style="width: 25.5%;;" placeholder="общая цена заказа">
							</p>
							<p>
								<input type="text" name="debt" style="width:46%;" placeholder="Задолженность">
								<input type="text" class="order_selling_price" name="selling_price" style="width:46%;" placeholder="Цена продажи" required>
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
								"phone" => $_POST["phone_number"],
								"printing_count" => $_POST["printing_count"],
								"count_per_page" => $_POST["count_per_page"],
								"step_lenght" => $_POST["step_lenght"],
								"label_count" => $_POST["label_count"],
								"cost_price" => $_POST["orderPriceSum"],
								"material" => $material_id,
								"type"=>$_POST["type"],
								"type_of_order" => $_POST['type_of_order'],
								"status" => "Оформлен"
							);
							$data["selling_price"] = $_POST["selling_price"] * $_POST["printing_count"];
							if($_POST["customer_id"] == ""){
								$data["customer"] = $_POST["customer_name"];
								$data["customer_id"] = null;
							} else {
								$data["customer_id"] = $_POST["customer_id"];
								$data["customer"] = null;
							}
							if($_POST["debt"] == ""){
								$data["debt"] = $data["selling_price"];
							} else {
								$data["debt"] = $_POST["debt"];
							}
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