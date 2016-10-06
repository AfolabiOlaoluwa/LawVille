module Admin
  class LawyersController < Admin::ApplicationController
    layout 'admin_actions_layout', :only => [:new, :edit]
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Lawyer.all.paginate(10, params[:page])
    # end


    # Define a custom finder by overriding the `find_resource` method:
    def find_resource(param)
      Lawyer.find_by_token!(param)
    end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
