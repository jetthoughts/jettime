class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource

    resource.company.owner = resource

    if resource.save
      if resource.active_for_authentication?
        #set_flash_message :notice, :signed_up if is_navigational_format?
        #sign_in(resource_name, resource)
        respond_with resource, location: new_user_session_url(subdomain: resource.company.subdomain)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render :new }
    end
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_url(subdomain: resource.company.subdomain)
  end

end
