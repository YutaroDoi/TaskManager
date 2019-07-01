# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  describe 'Validation' do
    it '名前が入っていないラベルは作成できない' do
      label = Label.new
      expect(label).not_to be_valid
    end
  end
end
