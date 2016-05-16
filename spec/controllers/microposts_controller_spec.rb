require 'spec_helper'

describe MicropostsController do

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user, no_capybara: true }

  describe 'creating a micropost' do

    it 'should increment the Micropost count' do
      expect do
        post :create, micropost: {content: 'Test'}
      end.to change(Micropost, :count).by(1)
    end
    
    it 'should increment the Micropost count if image_url is provided' do
      expect do
        post :create, micropost: {content: 'Test', image_url: 'https://www.nasa.gov/mission_pages/apollo/images.html'}
        expect(Micropost.last.image_url).to eq('https://www.nasa.gov/mission_pages/apollo/images.html')
      end.to change(Micropost, :count).by(1)
    end
  end

  describe 'destroying a micropost' do

    before { @micropost = Micropost.create!(user: user, content: 'Test') }

    it 'should decrement the Micropost count' do
      expect do 
        delete :destroy, id: @micropost.id
      end.to change(Micropost, :count).by(-1)
    end
  end
end