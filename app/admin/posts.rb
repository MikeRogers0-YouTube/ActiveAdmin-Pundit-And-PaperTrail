ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :title, :body

  action_item :publish, only: :show do
    if authorized?(ActiveAdmin::Auth::CREATE, Post::PublishForm.new(post: resource))
      link_to "Publish Post", [:new, :admin, resource, :post_publish_form]
    end
  end

  form do |f|
    f.inputs :title, :body
    f.actions
  end
end
