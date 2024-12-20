require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'book creation' do
    it 'should not allow creation without attributes' do
      expect{Book.create!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should validate presence of author' do
      expect{Book.create!(title: 'some title')}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should validate presence of publication_date' do
      expect{Book.create!(title: 'some title', author: 'John Doe')}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should validate rating to be in the range if present' do
      expect{Book.create!(title: 'some title', author: 'John Doe', publication_date: Date.today, rating: 6)}.to raise_error(ActiveRecord::RecordInvalid)
      expect{Book.create!(title: 'some title', author: 'John Doe', publication_date: Date.today, rating: 3, status: 'available')}.not_to raise_error
      expect{Book.create!(title: 'some title', author: 'John Doe', publication_date: Date.today, rating: 0, status: 'available')}.not_to raise_error
      expect{Book.create!(title: 'some title', author: 'John Doe', publication_date: Date.today, rating: 5, status: 'available')}.not_to raise_error
    end

    it 'should validate status to be in valid options' do
      expect{Book.create!(title: 'some title', author: 'John Doe', publication_date: Date.today, rating: 0, status: 'invalid_status')}.to raise_error(ActiveRecord::RecordInvalid)
      expect{Book.create!(title: 'some title', author: 'John Doe', publication_date: Date.today, rating: 0, status: 'available')}.not_to raise_error
      expect{Book.create!(title: 'some title', author: 'John Doe', publication_date: Date.today, rating: 0, status: 'checked_out')}.not_to raise_error
      expect{Book.create!(title: 'some title', author: 'John Doe', publication_date: Date.today, rating: 0, status: 'reserved')}.not_to raise_error
    end
  end
end
