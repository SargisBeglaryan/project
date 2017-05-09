<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the "site-content" div and all content after.
 *
 * @package WordPress
 * @subpackage Twenty_Fifteen
 * @since Twenty Fifteen 1.0
 */
?>

	</div><!-- .site-content -->

	<footer id="colophon" class="site-footer" role="contentinfo">
	</footer><!-- .site-footer -->

</div><!-- .site -->
<?php wp_enqueue_script( 'custom', get_template_directory_uri() . '/js/custom.js');?>
<?php wp_footer(); ?>
</body>
</html>
