<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<?php $language->load('rewardpoints/index')?>
	<div id="content"><?php echo $content_top; ?>
		<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <p style="margin-bottom: 5px"><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
  <span style="margin-bottom: 10px; display: block">
	  <?php echo $language->get('text_exchange_rate')?><b> <?php echo $exchange_rate['point']; ?></b> <?php echo $this->config->get('text_points_'.$language->get('code'))?> = <b><?php echo $exchange_rate['rate']; ?></b>
  </span>
  <table class="list">
    <thead>
      <tr>
        <td class="left"><?php echo $column_date_added; ?></td>
        <td class="left"><?php echo $column_description; ?></td>
        <td class="right"><?php echo $column_points; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php if ($rewards) { ?>
	      <?php foreach ($rewards  as $reward) { ?>
		      <?php if($reward['status'] == '1'){ ?>
			      <tr>
        <td class="left"><?php echo $reward['date_added']; ?></td>
        <td class="left"><?php if ($reward['order_id']) { ?>
		        <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
	        <?php } else { ?>
		        <?php echo $reward['description']; ?>
	        <?php } ?></td>
        <td class="right"><?php echo ($reward['points'] > 0 ? '+' : '').$reward['points']; ?></td>
      </tr>
		      <?php } ?>
	      <?php } ?>
      <?php } else { ?>
	      <tr>
        <td class="center" colspan="5"><?php echo $text_empty; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
  <div class="pagination"><?php echo $pagination; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
		<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>