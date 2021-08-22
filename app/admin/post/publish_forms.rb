ActiveAdmin.register Post::PublishForm do
  actions :index, :new, :create

  belongs_to :post, class_name: "Post"

  permit_params :terms_of_service
  #
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :terms_of_service
  #
  # or
  #
  # permit_params do
  #   permitted = [:terms_of_service]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
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
      Post::PublishForm.new
    end

    def find_resource
      Post::PublishForm.new
    end
  end
end
