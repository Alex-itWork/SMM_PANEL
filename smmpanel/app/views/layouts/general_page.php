<!doctype html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Language" content="en" >
    <meta name="description" content="<?=get_option('website_desc', "SmartPanel - #1 SMM Reseller Panel - Best SMM Panel for Resellers. Also well known for TOP SMM Panel and Cheap SMM Panel for all kind of Social Media Marketing Services. SMM Panel for Facebook, Instagram, YouTube and more services!")?>">
    <meta name="keywords" content="<?=get_option('website_keywords', "smm panel, SmartPanel, smm reseller panel, smm provider panel, reseller panel, instagram panel, resellerpanel, social media reseller panel, smmpanel, panelsmm, smm, panel, socialmedia, instagram reseller panel")?>">
    <title><?=get_option('website_title', "SmartPanel - SMM Panel Reseller Tool")?></title>

    <link rel="shortcut icon" type="image/x-icon" href="<?=get_option('website_favicon', BASE."assets/images/favicon.png")?>">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">


    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
    
    <script src="<?=BASE?>assets/js/vendors/jquery-3.2.1.min.js"></script>

    <!-- Core -->
    <link href="<?=BASE?>assets/css/core.css" rel="stylesheet">
      
    <!-- toast -->
    <link rel="stylesheet" type="text/css" href="<?=BASE?>assets/plugins/jquery-toast/css/jquery.toast.css">
    <link rel="stylesheet" href="<?=BASE?>assets/plugins/boostrap/colors.css" id="theme-stylesheet">
    <link href="<?=BASE?>assets/css/util.css" rel="stylesheet">
    <link href="<?=BASE?>assets/css/general_page.css" rel="stylesheet">
    <link href="<?=BASE?>assets/css/layout.css" rel="stylesheet">
    <link href="<?=BASE?>assets/css/footer.css" rel="stylesheet">

    <script type="text/javascript">
      var token = '<?=$this->security->get_csrf_hash()?>',
          PATH  = '<?=PATH?>',
          BASE  = '<?=BASE?>';
      var    deleteItem = '<?=lang("Are_you_sure_you_want_to_delete_this_item")?>';
      var    deleteItems = '<?=lang("Are_you_sure_you_want_to_delete_all_items")?>';
    </script>
    <?=htmlspecialchars_decode(get_option('embed_head_javascript', ''), ENT_QUOTES)?>
  </head>
  <body>
    <div id="page-overlay" class="visible incoming">
      <div class="loader-wrapper-outer">
        <div class="loader-wrapper-inner">
          <div class="lds-double-ring">
            <div></div>
            <div></div>
            <div>
              <div></div>
            </div>
            <div>
              <div></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <header class="header fixed-top" id="headerNav">
      <div class="container">
        <nav class="navbar navbar-expand-lg ">
          <a class="navbar-brand" href="<?=cn()?>">
            <img class="site-logo" src="<?=get_option('website_logo', BASE."assets/images/logo.png")?>" alt="Webstie logo">
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span><i class="fe fe-menu"></i></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">

              <li class="nav-item ">
                <a class="nav-link js-scroll-trigger" href="<?=cn()?>#home"><?=lang("Home")?></a>
              </li>

              <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="<?=cn()?>#features"><?=lang("What_we_offer")?></a>
              </li>
              <?php
                if (get_option("enable_service_list_no_login") == 1) {
              ?>
              <li class="nav-item <?=(segment(1) == 'services') ? 'active' : ''?>">
                <a class="nav-link" href="<?=cn("services")?>"><?=lang("Services")?></a>
              </li>
              <?php }?>
            </ul> 
            <div class="nav-item d-md-flex btn-login-signup">
              <?php 
                if (!session('uid')) {
              ?>
              <a class="link btn-login" href="<?=cn('auth/login')?>"><?=lang("Login")?></a>
              <a href="<?=cn('auth/signup')?>" class="btn btn-pill btn-outline-primary sign-up"><?=lang("Sign_Up")?></a>
              <?php }else{?>
              <a href="<?=cn('statistics')?>" class="btn btn-pill btn-outline-primary btn-statistics text-uppercase"><?=lang("statistics")?></a>
              <?php }?>
            </div>
          </div>
        </nav>
      </div>
    </header>

    <div class="page p-t-70">
      <div class="page-main">
        <div class="my-3 my-md-5">
          <div class="container">
            <?=$template['body']?>
          </div>
        </div>
        <div id="modal-ajax" class="modal fade" tabindex="-1"></div>
      </div>
    </div>

    <?=Modules::run("blocks/footer");?>
    <script src="<?=BASE?>assets/js/vendors/bootstrap.bundle.min.js"></script>
    <script src="<?=BASE?>assets/js/vendors/jquery.sparkline.min.js"></script>
    <script src="<?=BASE?>assets/js/core.js"></script>
    <!-- general JS -->
    <script src="<?=BASE?>assets/js/process.js"></script>
    <script src="<?=BASE?>assets/js/general.js"></script>
        <!-- Yandex.Metrika counter -->
<script type="text/javascript" >
   (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

   ym(86445157, "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/86445157" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
  </body>
</html>

