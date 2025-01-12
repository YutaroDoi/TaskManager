# frozen_string_literal: true

require 'rails_helper'

describe TasksController, type: :controller do
  describe 'GET #index' do
    it 'render the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end
end
