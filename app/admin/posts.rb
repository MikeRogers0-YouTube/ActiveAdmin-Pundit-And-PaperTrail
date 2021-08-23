ActiveAdmin.register Post do
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
