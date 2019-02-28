<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $not_verified_text ?></div>
  <div class="row">
    <div id="content" class="col-sm-12">
      <h1><?php echo $heading_title; ?></h1>
      <p><?php echo $text_description; ?></p>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<?php exit ?>