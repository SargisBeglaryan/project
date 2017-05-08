<?php
/*
Template Name: Create Paper
*/
?>

<?php get_header(); ?>

	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">

			<section class="bla">	
				<div class="page-content">
					<h3 class="page-title"><?php _e( 'Создать Бумагу' ); ?></h3>
					
					<div class="DbRequesAction">
						<form method="POST" action="">
						
							<p>
								<input type="text" name="product_name" placeholder="Название" style="width:46%;" required>
								<input type="text" name="company" placeholder="Фирма" style="width:46%;" required>
							</p>
							
							<p>
								<input type="text" name="density" placeholder="Плотность" style="width:46%;" required>
								<input type="text" name="type" placeholder="Тип Бумаги" style="width:46%;">
							</p>
							
							<p>
								<input type="text" name="size_y" placeholder="Ширина" style="width:46%;" required>
								<input type="text" name="size_x" placeholder="Длина" style="width:46%;" required>
							</p>
							
							<p>
								<input type="text" name="weight_one_page" placeholder="Вес одного листа (гр)" style="width:46%;" required>
								<input type="text" name="description" placeholder="Описание" style="width:46%;">
							</p>
							<p>
								<input type="text" name="price" placeholder="Цена на одну единицу" style="width:46%;" required>
								<input type="number" name="percent" placeholder="Процент (%)" style="width:43%;padding:0.48em" min="0" required>
								<span>%</span>
							</p>
							
							<input type="submit" name="submit_create" value="Создать" style="margin-top:30px;">
						
						</form>
					</div>
					
					<?php
					if(isset($_POST["submit_create"]))
					{					
						//Get form fields value
						$var_name = $_POST["product_name"];
						$var_company = $_POST["company"];
						$var_density = $_POST["density"];
						$var_type = $_POST["type"];
						$var_size_x = $_POST["size_x"];
						$var_size_y = $_POST["size_y"];
						$var_weight_one_page = $_POST["weight_one_page"];
						$var_description = $_POST["description"];
						
					
						// Prepare array to insert in database
						$data = array(
						"name" => $var_name,
						"company" => $var_company,
						"density" => $var_density,
						"type" => $var_type,
						"size_x" => $var_size_x,
						"size_y" => $var_size_y,
						"one_page_weight" => $var_weight_one_page,
						"weight" => 0,
						"price"=> $_POST["price"],
						"percent"=> $_POST["percent"],
						"description" => $var_description
						);
						
						//Insert new row
						$wpdb->insert("wp_product_paper", $data);
					
					}?>
					
				</div>
			</section>
		</main>
	</div>
	
<?php get_footer(); ?>


