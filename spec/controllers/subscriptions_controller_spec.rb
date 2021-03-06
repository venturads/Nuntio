require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  # render_views

  login_user

  let(:tower) { create(:tower, :with_category) }

  describe 'POST #create' do

    it 'redirect to edit' do
      post :create, params: { subscription: { tower_id: tower.id, owner_id: controller.view_context.current_user } }
      expect(response).to redirect_to(edit_subscription_url)
    end

  end

  describe 'GET #edit' do
    let(:subscription) { create(:subscription, tower: tower, owner: controller.view_context.current_user) }

    it 'http status success' do
      session[:current_subscription_id] = subscription.id

      get :edit
      expect(response).to have_http_status(:success)
    end

    it 'failed and redirect to dashboard' do
      get :edit
      expect(response).to redirect_to(dashboard_url)
    end
  end

  describe 'POST #simulate' do

    it 'http state success' do
      post :simulate, params: { subscription: { tower_id: tower.id, owner_id: controller.view_context.current_user, quantity: 10, commitment: Subscription::COMMITMENTS.first } }
      expect(response).to have_http_status(:success)
    end
  end
end
