
<div id="main-modal-content">
  <div class="modal-right">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <?php
          $ids = (!empty($api->ids))? $api->ids: '';
        ?>
        <form class="form actionSyncApiServices" action="<?=cn($module."/ajax_sync_services/$ids")?>" data-redirect="<?=cn($module)?>" method="POST">
          <div class="modal-header bg-pantone">
            <h4 class="modal-title"><i class="fe fe-refresh-cw"></i> <?=lang("sync_services")?></h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            </button>
          </div>
          <div class="modal-body">
            <div class="form-body">
              <div class="row justify-content-md-center">

                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="form-group">
                    <label ><?=lang("api_provider_name")?></label>
                    <input type="text" class="form-control square" name="name" value="<?=(!empty($api->name))? $api->name: ''?>" disabled>
                  </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="form-group">
                    <label ><?=lang("api_url")?></label>
                    <input type="text" class="form-control square" name="api_url" value="<?=(!empty($api->url))? $api->url: ''?>" disabled>
                  </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="form-group">
                    <label ><?=lang("api_key")?></label>
                    <input type="text" class="form-control square" name="api_key" value="<?=($api->key)? hide_api_key($api->key) : ''?>">
                  </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="form-group">
                    <label><?=lang("price_percentage_increase")?> <?=sprintf(lang('auto_rounding_to_X_decimal_places'), get_option("auto_rounding_x_decimal_places", 2))?></label>
                    <select name="price_percentage_increase" class="form-control square">
                      <?php
                        for ($i = 0; $i <= 1000; $i++) {
                      ?>
                      <option value="<?=$i?>" <?=(get_option("default_price_percentage_increase", 30) == $i)? "selected" : ''?>><?=$i?>%</option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="form-group">
                    <label><?=lang("synchronous_request")?></label>
                    <select name="request" class="form-control square">
                      <option value="0"><?=lang("current_service")?></option>
                      <option value="1"><?=lang("All")?></option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label class=" custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" name="enable_sync_options[new_price]">
                      <span class="custom-control-label"> <?php echo lang("sync_new_price"); ?></span>
                    </label>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label class=" custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" name="enable_sync_options[original_price]" checked>
                      <span class="custom-control-label"> <?php echo lang("sync_original_price"); ?></span>
                    </label>
                  </div>
                </div>


                <div class="col-md-12">
                  <div class="form-group">
                    <label class=" custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" name="enable_sync_options[service_name]">
                      <span class="custom-control-label"> <?php echo lang("sync_service_name"); ?></span>
                    </label>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label class=" custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" name="enable_sync_options[old_services]">
                      <span class="custom-control-label"> Sync old service status with provider</span>
                    </label>
                  </div>
                </div>
                
                <div class="col-md-12">
                  <div class="form-group">
                    <label class=" custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" name="enable_sync_options[min_max_dripfeed]">
                      <span class="custom-control-label"> <?php echo lang("sync_min_max_dripfeed"); ?></span>
                    </label>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label class=" custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" name="enable_sync_options[description]">
                      <span class="custom-control-label"> <?php echo lang("sync_services_description_only_support_hq_smartpanel"); ?></span>
                    </label>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" name="is_convert_to_new_currency" <?=(get_option("is_auto_currency_convert", 0) == 1) ? "checked" : ""?>>
                      <span class="custom-control-label"><?=lang("auto_convert_to_new_currency_with_currency_rate_like_in")?><a href="<?=cn("setting")."?t=currency"?>" target="_blank"><?=lang("currency_setting_page")?></a></span>
                    </label>
                  </div>
                </div>

                <div class="col-md-12">
                    <span class="text-primary small"><?=lang("note")?></span>
                    <ul class="text-primary small">
                      <li><?=lang("current_service_sync_all_the_current_services")?></li>
                      <li><?=lang("all_auto_add_new_service_if_the_service_doesnt_exists")?></li>
                    </ul>
                </div>


              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn round btn-primary btn-min-width mr-1 mb-1"><?=lang("Submit")?></button>
            <button type="button" class="btn round btn-default btn-min-width mr-1 mb-1" data-dismiss="modal"><?=lang("Cancel")?></button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
