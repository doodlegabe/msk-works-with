require 'rails_helper'

RSpec.describe DistributorLinksController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/distributor_links').to route_to('distributor_links#index')
    end

    it 'routes to #new' do
      expect(:get => '/distributor_links/new').to route_to('distributor_links#new')
    end

    it 'routes to #show' do
      expect(:get => '/distributor_links/1').to route_to('distributor_links#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(:get => '/distributor_links/1/edit').to route_to('distributor_links#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/distributor_links').to route_to('distributor_links#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/distributor_links/1').to route_to('distributor_links#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/distributor_links/1').to route_to('distributor_links#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/distributor_links/1').to route_to('distributor_links#destroy', :id => '1')
    end

  end
end