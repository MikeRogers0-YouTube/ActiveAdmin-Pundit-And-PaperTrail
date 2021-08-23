ActiveAdmin.register Post::PublishForm do
  actions :index, :new, :create

  belongs_to :post, class_name: "Post"

  permit_params :terms_of_service

  form do |f|
    f.inputs do
      f.input :terms_of_service, as: :boolean
    end
    f.actions
  end

  controller do
    def index
      redirect_to([:admin, parent])
    end

    def build_new_resource
      Post::PublishForm.new(post: parent)
    end
  end
end
