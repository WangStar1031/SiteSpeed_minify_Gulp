<?php
	if($_SERVER['HTTPS'] != 1){	
		header('Location:'.$base);
		die;
	}
	
	$dayToday = strtolower(date('l'));
	$todayStatus = $alwaysStatusArr[$dayToday];
	
	if($todayStatus != 'on'){
		header('Location:'.$base);
		die;	
	}	
	
	if($store_status == 'open'){
		header('Location:'.$base);
		die;	
	}	
?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="upload/catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="upload/catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="upload/catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />


<link href="upload/catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/header-closed-stylesheet.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="upload/catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/carousel.css" />
<link rel="stylesheet" type="text/css" href="upload/catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/custom.css" />
<link rel="stylesheet" type="text/css" href="upload/catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="upload/catalog/view/javascript/flipclock/compiled/flipclock.css" />

<?php if($direction=='rtl'){ ?>
<link rel="stylesheet" type="text/css" href="upload/catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/rtl.css">
<?php }?>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo 'upload/'.$style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!-- Megnor www.templatemela.com - Start -->
<script type="text/javascript" src="upload/catalog/view/javascript/megnor/custom.js"></script>
<script type="text/javascript" src="upload/catalog/view/javascript/megnor/jstree.min.js"></script>
<script type="text/javascript" src="upload/catalog/view/javascript/megnor/carousel.min.js"></script>
<script type="text/javascript" src="upload/catalog/view/javascript/megnor/megnor.min.js"></script>
<script type="text/javascript" src="upload/catalog/view/javascript/megnor/jquery.custom.min.js"></script>
<script type="text/javascript" src="upload/catalog/view/javascript/megnor/scrolltop.min.js"></script>
<script type="text/javascript" src="upload/catalog/view/javascript/megnor/jquery.formalize.min.js"></script> 

<!-- Megnor www.templatemela.com - End -->

<script src="upload/catalog/view/javascript/common.js" type="text/javascript"></script>

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo 'upload/'.$script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>

<script>
 var remainingTimestamp = '<?php echo $remainingTimestamp; ?>';
 var base = '<?php echo $base; ?>';
</script> 
</head>

<?php if ($column_left && $column_right) { ?>
<?php $layoutclass = 'layout-3'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php if ($column_left){ ?>
<?php $layoutclass = 'layout-2 left-col'; ?>
<?php } elseif ($column_right) { ?>
<?php $layoutclass = 'layout-2 right-col'; ?>
<?php } ?>
<?php } else { ?>
<?php $layoutclass = 'layout-1'; ?>
<?php } ?>

<body class="<?php echo $class; echo " " ; echo $layoutclass; ?>">

<header>
<div id="header-container_main">
  <div class="container">
    <div class="row header">
     
	 <div class="header-left">
	
		
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
    </div>
	
    
	 </div>
	 
    </div>

  
 </div>

</header>
