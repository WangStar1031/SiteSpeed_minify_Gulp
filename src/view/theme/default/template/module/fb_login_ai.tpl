<div id="fb-login-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
	    <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><i class="fa fa-fw fa-facebook"></i> <?php echo $text_modal_title; ?></h4>
			</div>
			<div class="modal-body">
				<form id="fb-login-form" class="form-horizontal">
					<div class="alert alert-info"><?php echo $text_explain_info; ?></div>
					
					<fieldset id="fb-login-account">
					    <div class="form-group required" style="display: none;">
							<label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
							<div class="col-sm-10">
							  <div class="radio">
								<label>
								  <input type="radio" name="fb_login_customer_group_id" value="<?php echo $customer_group_id; ?>" checked="checked" />choosed in FB Login Settings</label>
							  </div>
							</div>
					    </div>					
					
						<?php if ($telephone_required) { ?>
					    <div class="form-group required">
							<label class="col-sm-3 control-label" for="input-fb-login-telephone"><?php echo $entry_telephone; ?></label>
							<div class="col-sm-8">
							  <input type="tel" name="fb_login_telephone" value="" placeholder="<?php echo $entry_telephone; ?>" id="input-fb-login-telephone" class="form-control" />
							</div>
					    </div>
						<?php } ?>
						
						<?php if ($fax_required) { ?>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="input-fb-login-fax"><?php echo $entry_fax; ?></label>
							<div class="col-sm-8">
							  <input type="text" name="fb_login_fax" value="" placeholder="<?php echo $entry_fax; ?>" id="input-fb-login-fax" class="form-control" />
							</div>
						</div>
						<?php } ?>  
						  
						<?php foreach ($custom_fields as $custom_field) { ?>
						<?php if ($custom_field['location'] == 'account') { ?>
						<?php if ($custom_field['type'] == 'select') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <select name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
								<?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
								<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
								<?php } ?>
								<?php } ?>
							  </select>
							</div>
						</div>
						<?php } ?>
						<?php if ($custom_field['type'] == 'radio') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <div>
								<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
								<div class="radio">
								  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
								  <label>
									<input type="radio" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
									<?php echo $custom_field_value['name']; ?></label>
								  <?php } else { ?>
								  <label>
									<input type="radio" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
									<?php echo $custom_field_value['name']; ?></label>
								  <?php } ?>
								</div>
								<?php } ?>
							  </div>
							</div>
						</div>
						<?php } ?>
						<?php if ($custom_field['type'] == 'checkbox') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <div>
								<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
								<div class="checkbox">
								  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
								  <label>
									<input type="checkbox" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
									<?php echo $custom_field_value['name']; ?></label>
								  <?php } else { ?>
								  <label>
									<input type="checkbox" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
									<?php echo $custom_field_value['name']; ?></label>
								  <?php } ?>
								</div>
								<?php } ?>
							  </div>
							</div>
						</div>
						<?php } ?>
						<?php if ($custom_field['type'] == 'text') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <input type="text" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
							</div>
						</div>
						<?php } ?>
						<?php if ($custom_field['type'] == 'textarea') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <textarea name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
							</div>
						</div>
						<?php } ?>
						<?php if ($custom_field['type'] == 'file') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
							  <input type="hidden" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
							</div>
						</div>
						<?php } ?>
						<?php if ($custom_field['type'] == 'date') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <div class="input-group date">
								<input type="text" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
								</span></div>
							</div>
						</div>
						<?php } ?>
						<?php if ($custom_field['type'] == 'time') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <div class="input-group time">
								<input type="text" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
								</span></div>
							</div>
						  </div>
						<?php } ?>
						<?php if ($custom_field['type'] == 'datetime') { ?>
						<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
							<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
							<div class="col-sm-8">
							  <div class="input-group datetime">
								<input type="text" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
								<span class="input-group-btn">
								<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
								</span></div>
							</div>
						</div>
						<?php } ?>
						<?php } ?>
						<?php } ?>
						</fieldset>
						
						<fieldset id="fb-login-address">
							<?php if ($company_required) {?>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="input-fb-login-company"><?php echo $entry_company; ?></label>
								<div class="col-sm-8">
								  <input type="text" name="fb_login_company" value="" placeholder="<?php echo $entry_company; ?>" id="input-fb-login-company" class="form-control" />
								</div>
							</div>
							<?php } ?>
							
							<?php if ($address_1_required) { ?>
							<div class="form-group required">
								<label class="col-sm-3 control-label" for="input-fb-login-address-1"><?php echo $entry_address_1; ?></label>
								<div class="col-sm-8">
									<input type="text" name="fb_login_address_1" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-fb-login-address-1" class="form-control" />
								</div>
						    </div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for="input-fb-login-address-2"><?php echo $entry_address_2; ?></label>
								<div class="col-sm-8">
								  <input type="text" name="fb_login_address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-fb-login-address-2" class="form-control" />
								</div>
							</div>
						   <?php } ?>
						   
							<?php if ($city_required) { ?>
							<div class="form-group required">
								<label class="col-sm-3 control-label" for="input-fb-login-city"><?php echo $entry_city; ?></label>
								<div class="col-sm-8">
								  <input type="text" name="fb_login_city" value="" placeholder="<?php echo $entry_city; ?>" id="input-fb-login-city" class="form-control" />
								</div>
						    </div>
							<?php } ?>
							
							<?php if ($postcode_required) { ?>
							<div class="form-group required">
								<label class="col-sm-3 control-label" for="input-fb-login-postcode"><?php echo $entry_postcode; ?></label>
								<div class="col-sm-8">
								  <input type="text" name="fb_login_postcode" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-fb-login-postcode" class="form-control" />
								</div>
							</div>
							<?php } ?>
							
							<?php if ($country_id_required) { ?>
							<div class="form-group required">
								<label class="col-sm-3 control-label" for="input-fb-login-country"><?php echo $entry_country; ?></label>
								<div class="col-sm-8">
								  <select name="fb_login_country_id" id="input-fb-login-country" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($countries as $country) { ?>
									<?php if ($country['country_id'] == $country_id) { ?>
									<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>
									<?php } ?>
								  </select>
								</div>
							</div>
							<?php } ?>

							<?php if ($zone_id_required) { ?>	
							<div class="form-group required">
								<label class="col-sm-3 control-label" for="input-fb_login_zone"><?php echo $entry_zone; ?></label>
								<div class="col-sm-8">
								  <select name="fb_login_zone_id" id="input-fb-login-zone" class="form-control">
								  </select>
								</div>
							</div>
							<?php } ?>
							
						    <?php foreach ($custom_fields as $custom_field) { ?>
							<?php if ($custom_field['location'] == 'address') { ?>
							<?php if ($custom_field['type'] == 'select') { ?>
							<div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <select name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
									<option value=""><?php echo $text_select; ?></option>
									<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
									<?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
									<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
									<?php } ?>
									<?php } ?>
								  </select>
								</div>
							  </div>
							  <?php } ?>
							  <?php if ($custom_field['type'] == 'radio') { ?>
							  <div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <div>
									<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
									<div class="radio">
									  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
									  <label>
										<input type="radio" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
										<?php echo $custom_field_value['name']; ?></label>
									  <?php } else { ?>
									  <label>
										<input type="radio" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
										<?php echo $custom_field_value['name']; ?></label>
									  <?php } ?>
									</div>
									<?php } ?>
								  </div>
								</div>
							  </div>
							  <?php } ?>
							  <?php if ($custom_field['type'] == 'checkbox') { ?>
							  <div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <div>
									<?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
									<div class="checkbox">
									  <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
									  <label>
										<input type="checkbox" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
										<?php echo $custom_field_value['name']; ?></label>
									  <?php } else { ?>
									  <label>
										<input type="checkbox" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
										<?php echo $custom_field_value['name']; ?></label>
									  <?php } ?>
									</div>
									<?php } ?>
								  </div>
								</div>
							  </div>
							  <?php } ?>
							  <?php if ($custom_field['type'] == 'text') { ?>
							  <div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <input type="text" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
								</div>
							  </div>
							  <?php } ?>
							  <?php if ($custom_field['type'] == 'textarea') { ?>
							  <div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <textarea name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
								</div>
							  </div>
							  <?php } ?>
							  <?php if ($custom_field['type'] == 'file') { ?>
							  <div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
								  <input type="hidden" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
								</div>
							  </div>
							  <?php } ?>
							  <?php if ($custom_field['type'] == 'date') { ?>
							  <div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <div class="input-group date">
									<input type="text" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
							  </div>
							  <?php } ?>
							  <?php if ($custom_field['type'] == 'time') { ?>
							  <div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <div class="input-group time">
									<input type="text" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
							  </div>
							  <?php } ?>
							  <?php if ($custom_field['type'] == 'datetime') { ?>
							  <div id="fb-login-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group fb-login-custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
								<label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
								<div class="col-sm-8">
								  <div class="input-group datetime">
									<input type="text" name="fb_login_custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span></div>
								</div>
							</div>
							<?php } ?>
							<?php } ?>
							<?php } ?>          
						</fieldset>
					<input type="hidden" name="fb_additional_info" value="1" />
				</form>	
			</div>
			<div class="modal-footer">
				<button type="button" id="fb-login-register-now" class="btn btn-success"><?php echo $button_register_now; ?></button>
			</div>
		</div>
    </div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('#fb-login-account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#fb-login-account .form-group').length) {
		$('#fb-login-account .form-group').eq($(this).attr('data-sort')).before(this);
	} 
	
	if ($(this).attr('data-sort') > $('#fb-login-account .form-group').length) {
		$('#fb-login-account .form-group:last').after(this);
	}
		
	if ($(this).attr('data-sort') < -$('#fb-login-account .form-group').length) {
		$('#fb-login-account .form-group:first').before(this);
	}
});

$('#fb-login-address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#fb-login-address .form-group').length) {
		$('#fb-login-address .form-group').eq($(this).attr('data-sort')).before(this);
	} 
	
	if ($(this).attr('data-sort') > $('#fb-login-address .form-group').length) {
		$('#fb-login-address .form-group:last').after(this);
	}
		
	if ($(this).attr('data-sort') < -$('#fb-login-address .form-group').length) {
		$('#fb-login-address .form-group:first').before(this);
	}
});

$('input[name=\'fb_login_customer_group_id\']').on('change', function() {
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.fb-login-custom-field').hide();
			$('.fb-login-custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#fb-login-custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#fb-login-custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
			

		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('input[name=\'fb_login_customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: '<?php echo BASE; ?>index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
	
					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'fb_login_country_id\']').on('change', function() {
	$.ajax({
		url: '<?php echo BASE; ?>index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'fb_login_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'fb_login_postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'fb_login_postcode\']').parent().parent().removeClass('required');
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}
				
					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'fb_login_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'fb_login_country_id\']').trigger('change');
//--></script>