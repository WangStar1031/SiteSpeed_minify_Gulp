<div class="box_rewardpoints">
    <h2>
        <span class='icon'>
            <img src="media/rewardpoints/image/icon_gift.png" alt="reward points icon" style="width: 22px; vertical-align: middle" />
        </span>
        <?php echo $language->get('entry_point_redeem')?> <input type="text" size="5" id="input-with-keypress"/>
    </h2>
    <div style="float:left;min-width: 99%;padding: 10px 0;">
        <?php if($customer->isLogged()){ ?>
        <div id="range" style="margin: 0 16px;"></div>
        <div style="clear: both"></div>
        <div style="margin: 40px 10px 19px 12px" class="box_check_use_maxium">
            <input type="checkbox" class="use_maxium" <?php echo (isset($session->data['points_to_checkout']) && $session->data['points_to_checkout'] == $max_redeem_point ? 'checked="checked"' : '')?> value="<?php echo $max_redeem_point?>"/><span><?php echo sprintf( $language->get('entry_maximum_redeem'), number_format($max_redeem_point), $config->get('text_points_'.$language->get('code')) )?></span>
        </div>
        <?php } else { ?>
        <?php echo sprintf( $language->get('entry_login_redeem'), $url->link("account/account", "", 'SSL'), $config->get('text_points_'.$language->get('code')) )?>
        <?php } ?>
    </div>
</div>