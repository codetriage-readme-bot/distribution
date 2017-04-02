require 'rails_helper'

RSpec.describe DroneController, type: :controller do
  describe 'GET #index' do
    it 'redirect to show page if drone name given' do
      get :index, params: { name: 'drone' }
      is_expected.to redirect_to drone_path(1)
    end

    it 'show login page if drone not detected' do
      get :index
      is_expected.to render_template :index
    end
  end

  describe 'GET #show' do
    it 'redirect_to to index page if drone not found' do
      get :show, params: { id: 2 }
      is_expected.to redirect_to drones_path
    end

    context 'with existing drone' do
      before do
        @drone = FactoryGirl.create(:drone)
        get :show, params: { id: 1 }
      end
      it { is_expected.to render_template :show }
      it { expect(assigns(:activity)).to eq(nil) }
    end

    it 'with existing activity' do
      activity = FactoryGirl.create(:activity, progress: 0)
      get :show, params: { id: 1 }
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe 'GET #item_activity' do
    it 'existing drone with no item' do
      drone = FactoryGirl.create(:drone)
      get :item_activity, params: { id: 1 }
      is_expected.to redirect_to drone_path(drone)
    end

    it 'should pick new item which not initated after completed first item' do
      FactoryGirl.create(:activity, progress: 4)
      FactoryGirl.create(:item)
      get :item_activity, params: { id: 1 }
      expect(assigns(:activity).id).to eq(2)
    end

    it 'return nil for no new item found' do
      item = FactoryGirl.create(:item, status: 2)
      FactoryGirl.create(:activity, progress: 4, item: item)
      get :item_activity, params: { id: 1 }
      expect(assigns(:activity)).to eq(nil)
    end

    it 'return last completed activity' do
      activity1 = FactoryGirl.create(:activity, progress: 4)
      activity2 = FactoryGirl.create(:activity, progress: 0, item: activity1.item, drone: activity1.drone)
      get :item_activity, params: { id: 1 }
      expect(assigns(:activity)).to eq(activity2)
    end
  end

  describe 'POST #update_activity' do
    it 'should throw error if no message given' do
      FactoryGirl.create(:activity)
      post :update_activity, params: { id: 1, format: :js }
      expect(assigns(:error)).to match(/Your next process should/)
    end

    context 'with existing drone' do
      before do
        item = FactoryGirl.create(:item, status: 1)
        FactoryGirl.create(:activity, progress: 3, item: item)
      end

      it 'throw error if skip process' do
        post :update_activity, params: { id: 1, message: 'delivered', format: :js }
        expect(assigns(:error)).to match(/Your next process should/)
      end

      it 'give next instruction' do
        post :update_activity, params: { id: 1, message: 'arrived', format: :js }
        expect(assigns(:activity).id).to eq(2)
      end

      it 'show flash message for last instruction' do
        post :update_activity, params: { id: 1, message: 'arrived', format: :js }
        expect(flash[:success]).to be_present
      end
    end
  end
end
