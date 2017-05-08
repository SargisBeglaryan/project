<? 
/* 
Template Name: Stock edit
*/ 
?>
<?php get_header(); 
 global $wpdb;
 $index = $_GET["index"];
 $type = $_GET["type"];
 
 switch ($type) {
    case 'paper':
		$table = 'wp_product_paper';
		$unit = "weight";
		$url = "/stock-paper";
		$db_result = $wpdb->get_results ("SELECT * FROM wp_product_paper WHERE id={$index}");
        break;                                   
    case 'roll':                                 
		$table = 'wp_product_roll';  
		$unit = "area";	
		$url = "/stock-roll";
		$db_result = $wpdb->get_results ("SELECT * FROM wp_product_roll WHERE id={$index}");
        break;                                  
    case 'other':                               
        $table = 'wp_product_other';   
		$unit = "count";
		$url = "/stock-other";		
		$db_result = $wpdb->get_results ("SELECT * FROM wp_product_other WHERE id={$index}");
        break;
	}

?>

	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">
			<section class="bla">	
				<div class="page-content">
					<h3 class="page-title"><? _e( 'Редактировать товар на складе' ); ?></h3>
					
					<div class="stock_edit_paper">
						
						<!-- reques to function. -> my_custom_redirect() handler END -->
						<?php foreach ($db_result as $item) { ?>
							<form method="POST" action="">
					
							<input type="hidden" id="one_page_weight" name="one_page_weight" value="<?php echo $item->one_page_weight; ?>">
					
							<?php if($type == 'paper'){ ?>
							
							<p style="width:46%;margin-right:30px;display:inline-block;">
								Листы: <input type="text" name="page_count" value="0" 
								onchange ="document.querySelector('input[name=product_wieght]').value=this.value?this.value*getElementById('one_page_weight').value:''" required>
							</p>
							
							<p style="width:46%;display:inline-block;">
								Кг:<input type="text" name="product_wieght" value="0" 
								onchange="document.querySelector('input[name=page_count]').value=this.value?(this.value/getElementById('one_page_weight').value).toFixed():''" required>
							</p>
							<p style="width:46%;margin-right:30px;display:inline-block;">
									<label for="price">Цена на одну единицу:</label>
									<input type="text" name="price" id="price" placeholder="Цена на одну единицу"   value="<?= $item->price ?>">
								</p>
								<p style="width:46%;display:inline-block;">
									<label for="percent">Процент (%):</label>
									<input type="number" name="percent" id="percent" placeholder="Процент (%)" value="<?= $item->percent ?>" style="padding:0.48em;width:100%">
								</p>
							
							<?php } else if ($type == 'roll') { ?>
								<p>
									<span>М<sup><small>2</small></sup>:</span>
									<input type="text" name="product_wieght" value="0" required>
								</p>
								<p style="width:50%;margin-right:15px;display:inline-block;">
									<label for="price">Цена на одну единицу:</label>
									<input type="text" name="price" id="price" placeholder="Цена на одну единицу"   value="<?= $item->price ?>">
								</p>
								<p style="width:46%;display:inline-block;">
									<label for="percent">Процент (%):</label>
									<input type="number" name="percent" id="percent" placeholder="Процент (%)" value="<?= $item->percent ?>" style="padding:0.48em;width:100%">
								</p>
								
							<?php }  else if ($type == 'other') { ?>
								<p>
									<label for="product_wieght">Колличество:</label>
									<input type="text" name="product_wieght" id="product_wieght" value="0" required>
								</p>
								<p style="width:50%;margin-right:15px;display:inline-block;">
									<label for="price">Цена на одну единицу:</label>
									<input type="text" name="price" id="price" placeholder="Цена на одну единицу"   value="<?= $item->price ?>">
								</p>
								<p style="width:46%;display:inline-block;">
									<label for="percent">Процент (%):</label>
									<input type="number" name="percent" id="percent" placeholder="Процент (%)" value="<?= $item->percent ?>" style="padding:0.48em;width:100%">
								</p>
								
							<?php } ?>
							
							<input type="hidden" name="url" value="<?php echo $url;?>">
							<input type="hidden" name="product_table" value="<php echo $table; ?>">
							<input type="hidden" name="product_id" value="<?php echo $item->id; ?>">
							<input type="hidden" name="colum_name" value="<?php echo $unit; ?>">
							<input type="hidden" name="one_page_weight" value="<?php echo $item->one_page_weight; ?>">
						
							<p>
								<input type="submit" name="submit_edit" value="Сохранить" style="margin-top:30px;">
								<input type="submit" name="submit_remove" value="Удалить" style="margin-top:30px;">
							</p>
						
							</form>
								
							
						<?php } ?>
					</div>
				</div>
			</section>
		</main>
	</div>
	
<?php get_footer(); ?>


