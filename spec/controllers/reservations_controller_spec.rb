require 'spec_helper'

  describe ReservationsController do

    describe "GET #index" do
    it "renders the :index view" do
        get :index
        response.should render_template :index
      end
    end

    # describe "GET #new" do
    #   it "renders the :new template"do
    #     get :new
    #      response.should render_template :new
    #   end
    # end
  end