<?php
/*
Template Name: Create Roll
*/
?>

<?php get_header(); ?>

	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">

			<section class="bla">	
				<div class="page-content">
					<h3 class="page-title"><?php _e( 'Создать Рулон' ); ?></h3>
					
					<div class="DbRequesAction">
						<form method="POST" action="">
						
							<p>
								<input type="text" name="product_name" placeholder="Название" style="width:46%;" required>
								<input type="text" name="company" placeholder="Фирма" style="width:46%;" required>
							</p>
							
							<p>
								<input type="text" name="size_y" placeholder="Ширина" style="width:46%;" required>
								<input type="text" name="size_x" placeholder="Длина" style="width:46%;" required>
							</p>
							
							<p>
								<input type="text" name="price" placeholder="Цена на одну единицу" style="width:46%;" required>
								<input type="number" name="percent" placeholder="Процент (%)" style="width:43%;padding:0.48em" min="0" required>
								<span>%</span>
							</p>
							<p>
								<input type="text" name="type" placeholder="Тип Бумаги" style="width:46%;" >
							</p>
							
							<input type="submit" name="submit_create" value="Создать" style="margin-top:30px;">
						
						</form>
					</div>
					
					<?php
					if(isset($_POST["submit_create"]))
					{			
						// Prepare array to insert in database
						$data = array(
						"name" => $_POST["product_name"],
						"company" => $_POST["company"],
						"type" => $_POST["type"],
						"size_x" => $_POST["size_x"],
						"size_y" => $_POST["size_y"],
						"area" => ($_POST["size_x"] * $_POST["size_y"]),
						"price"=> $_POST["price"],
						"percent"=> $_POST["percent"],
						);
						//Insert new row
						$wpdb->insert("wp_product_roll", $data);
					
					}?>
					
				</div>
			</section>
		</main>
	</div>
	
<?php get_footer(); ?>


