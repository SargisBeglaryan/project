<?php
/*
Template Name: Create New Client
*/
?>

<?php get_header(); ?>
<?php
if(isset($_GET["id"])){
	$id = filter_var($_GET["id"], FILTER_SANITIZE_STRING);
	$customer =  $wpdb->get_row ( "SELECT * FROM wp_customers WHERE id=$id" );
	$buttonText = 'Изменить';
} else {
	$buttonText = 'Создать';
}

if(isset($_POST["submit_create"]))
{	
	if(isset($_GET["id"])){
		//Get form fields value
		$var_name = $_POST["clientName"];
		$var_id = $_POST["clientId"];					
	
		// Prepare array to insert in database
		$data = array(
		"name" => $var_name,
		);
		$where = array("id" => $var_id,);
		$updateResult = $wpdb->update("wp_customers", $data, $where);
	} else {
		//Get form fields value
		$var_name = $_POST["clientName"];					
	
		// Prepare array to insert in database
		$data = array(
		"name" => $var_name,
		);
		
		//Insert new row
		$insertResult = $wpdb->insert("wp_customers", $data);
	}
}
?>
	<div id="primary" class="content-area">	
		<main id="main" class="site-main" role="main">

			<section class="bla">	
				<div class="page-content">
					<h3 class="page-title">
						<?php 
							if(isset($_GET["id"])){
								_e( 'Изменить клиента' );
							} else {
								_e( 'Создать клиента' );
							}
						?>
					</h3>
					<div class="DbRequesAction">
						<form method="POST" action="">
							<p>
								<?php  if(isset($_GET["id"])):
										if(isset($_POST['clientName'])){
											$customer->name = $_POST['clientName'];
										}
								?>
									<input type="text" name="clientName" placeholder="Имя клиента" style="width:46%;" value="<?= $customer->name; ?>" required>
									<input type="hidden" name="clientId" value="<?= $customer->id; ?>">
								<?php else:
								if(isset($_POST['clientName'])):
								?>
								<input type="text" value="<?= $_POST['clientName'] ?>" name="clientName" placeholder="Имя клиента" style="width:46%;" required>
								<?php else: ?>
									<input type="text" name="clientName" placeholder="Имя клиента" style="width:46%;" required>
								<?php endif; ?>
								<?php endif; ?>
							</p>	
							<input type="submit" name="submit_create" value="<?= $buttonText; ?>" style="margin-top:30px;">
						</form>
						<?php 
						if($_POST["submit_create"]){
							if($_GET["id"]) {
								if($updateResult) {
									echo "<p style='margin-top: 25px;color: #008000;'>".$var_name. " удачно изменено"."</p>";
								} else {
									echo "<p style='margin-top: 25px;color: #b30000;'>".$var_name. " не изменено! Возможно это имя уже существует."."</p>";
								}
							} else {
								if($insertResult) {
									// wp_redirect( 'stock-customer' );
									// wp_die();
									echo "<p style='margin-top: 25px;color: #008000;'>".$var_name. " удачно добавлено"."</p>";
								} else {
									echo "<p style='margin-top: 25px;color: #b30000;'>".$var_name. " не добавлено! Возможно это имя уже существует."."</p>";
								}
							}
						}

						?>
					</div>
				</div>
			</section>
		</main>
	</div>
	
<?php get_footer(); ?>
