<?php
/*
Template Name: Sale Handle
*/
?>

<?php get_header(); 

	// GET PRODUCTS LIST FROM DB
	$type = $_GET["type"];
	$material_name = $_GET["material"];
	global $wpdb;	
	
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
			<div class="order_paper">
			
			<?php if($type == "paper") { 
				$allPapers = $wpdb->get_results ( "SELECT * FROM wp_product_paper");
				$material = $wpdb->get_results ( "SELECT * FROM wp_product_paper GROUP BY `name`");
				$density = $wpdb->get_results ( "SELECT * FROM wp_product_paper GROUP BY `density`");
			?>
			<form method="POST" action="" autocomplete="off">
				<p>
					<input type="date" name="date" data-date='{"startView": 2, "openOnMouseFocus": true}' placeholder="mm/dd/yyyy">
				</p>
				<p>
					<select id="material" name="material" required>
						<option value="" disabled selected>Материал</option>
						<?php
							foreach ( $material as $item ) {
						?>
							<option value="<?php echo $item->name;?>"><?php echo $item->name;?></option>
						<?php } ?>
					</select>
					
					<select id="material_size"  name="material_size"  required>
						<option value="" disabled selected>Формат</option>
						<?php
							foreach ( $allPapers as $item ) {
						?>
						<option value="<?php echo $item->size_x;?>x<?php echo $item->size_y;?>"><?php echo $item->size_x;?>x<?php echo $item->size_y;?></option>
						<?php } ?>
					</select>
				</p>
				
				<p>
					<select id="density" name="density"  required>
						<option value="" disabled selected>Плотность</option>
						<?php
							foreach ( $density as $item ) {
						?>
						<option value="<?php echo $item->density;?>"><?php echo $item->density;?></option>
						<?php } ?>
					</select>
					<input type="text" name="count" placeholder="Количество(шт.)" style="width:46%;" required>
				</p>
					<input type="submit" name="submit_sale" value="Оформить" style="margin-top:30px;">
			</form>
				<?php
					if(isset($_POST["submit_sale"]))
					{
						$sizes = explode("x", $_POST["material_size"]);
						$size_x = $sizes[0];
						$size_y = $sizes[1];
						
						$material_id = $wpdb->get_results("SELECT id FROM wp_product_paper WHERE name LIKE '%{$_POST["material"]}%' and size_x = {$size_x} and size_y = {$size_y} and density = {$_POST["density"]} ");
						
						
						foreach($material_id as $item)
						{
							$id = $item->id;
						}
						
						$data = array(
							"date" => $_POST["date"],
							"material_id" => $id,
							"count" => $_POST["count"],
							"status" => $_POST["Оформлен"]
						);
						$wpdb->insert("wp_sale_paper", $data);
					
					}?>
				
				
			<?php } else if($type == "roll") {
					$allRoll = $wpdb->get_results ( "SELECT * FROM wp_product_roll");
					$material = $wpdb->get_results ( "SELECT * FROM wp_product_roll GROUP BY `name`");
					$type = $wpdb->get_results ( "SELECT * FROM wp_product_roll GROUP BY `type`");
			?>
					<form method="POST" action="">
								
						<p>
							<input type="date" name="date" data-date='{"startView": 2, "openOnMouseFocus": true}' placeholder="mm/dd/yyyy">
						</p>
						
						<p>
							
							<select id="material" name="material"  required>
								<option value="" disabled selected>Материал</option>
								<?php
									foreach ( $material as $item ) {
								?>
									<option value="<?php echo $item->name;?>"><?php echo $item->name;?></option>
								<?php } ?>
							</select>
							<select id="material_size"  name="material_size"  required>
								<option value="" disabled selected>Формат</option>
								<?php
									foreach ( $allRoll as $item ) {
								?>
								<option value="<?php echo $item->size_x;?>x<?php echo $item->size_y;?>"><?php echo $item->size_x;?>x<?php echo $item->size_y;?></option>
								<?php } ?>
							</select>
						</p>
						<p>
							<select id="type" name="type"  required>
								<option value="" disabled selected>Тип</option>
								<?php
									foreach ( $type as $item ) {
								?>
								<option value="<?php echo $item->type;?>"><?php echo $item->type;?></option>
								<?php } ?>
							</select>
							<input type="text" name="area" placeholder="Количество(м²)"  style="width:46%;" required>
						</p>
						
							<input type="submit" name="submit_sale" value="Оформить" style="margin-top:30px;">	
								
						</form>
				<?php
					if(isset($_POST["submit_sale"]))
					{
						$sizes = explode("x", $_POST["material_size"]);
						$size_x = $sizes[0];
						$size_y = $sizes[1];
						
						$material_id = $wpdb->get_var("SELECT id FROM wp_product_roll WHERE name LIKE '%{$_POST["material"]}%' and size_x = {$size_x} and size_y LIKE {$size_y} and type = '{$_POST["type"]}' ");
						
						$data = array(
							"date" => $_POST["date"],
							"material_id" => $material_id,
							"area" => $_POST["area"],
							"status" => "Оформлен"
						);
						
						$wpdb->insert("wp_sale_roll", $data);
					
					}?>

			<?php } else if($type == "other") {?>
					<div class="order_paper">
						<form method="POST" action="" autocomplete="off">
						
							<p>
								<input type="date" name="date" data-date='{"startView": 2, "openOnMouseFocus": true}' placeholder="mm/dd/yyyy">
							</p>
							
							<p>
								<?php
								$result_paint = $wpdb->get_results ( "SELECT * FROM wp_product_other WHERE type = 'Краска'");
								?>
								<select id="paint" name="paint" <?php if(count($result_paint) < 1) echo "disabled"; ?>>
									<option value="" disabled selected>Краска</option>
									<?php
										foreach ( $result_paint as $item ) {
									?>
									<option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
									<?php } ?>
								</select>
								<input type="text" name="paint_count" placeholder="Количество краски" style="width:46%;" <?php if(count($result_paint) < 1) echo "disabled"; ?>>
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
							
							<input type="submit" name="submit_create" value="Оформить" style="margin-top:30px;">

						</form>
						<?php
						if(isset($_POST["submit_create"]))
						{
							$data['date'] = $_POST["date"];
							$data['paint_count'] = ($_POST["paint_count"])?$_POST["paint_count"]:'0';
							$data['form_count'] = ($_POST["form_count"])?$_POST["form_count"]:'0';
							$data['foil_count'] = ($_POST["foil_count"])?$_POST["foil_count"]:'0';
							$data['rubber_count'] = ($_POST["rubber_count"])?$_POST["rubber_count"]:'0';
							$data['lacquer_count'] = ($_POST["lacquer_count"])?$_POST["lacquer_count"]:'0';
							$data['paint_id'] = ($_POST["paint"])?$_POST["paint"]:'0';
							$data['form_id'] = ($_POST["form"])?$_POST["form"]:'0';
							$data['foil_id'] = ($_POST["foil"])?$_POST["foil"]:'0';
							$data['rubber_id'] = ($_POST["rubber"])?$_POST["rubber"]:'0';
							$data['lacquer_id'] = ($_POST["lacquer"])?$_POST["lacquer"]:'0';
							$data['status'] = "Оформлен";
							
							//Insert new row
							$wpdb->insert("wp_sale_other", $data);
						
							} 
						} ?>
					</div>
				</div>
			</div>
		</section>
	</main>
</div>
	
<?php get_footer(); ?>