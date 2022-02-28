require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validation tests' do
     before(:example) do
      @article = Article.new(title: 'text title', description: 'text description of new article')
     end

    it 'ensures title presence' do
      @article.title=''
      expect(@article.save).to eq(false)
    end

    it 'ensures description presence' do
      @article.description=''
      expect(@article.save).to eq(false)
    end

    it 'ensures title is not too short' do
      @article.title='a'
      expect(@article.save).to eq(false)
    end

    it 'ensures title is not too long' do
      @article.title='a'*101
      expect(@article.save).to eq(false)
    end

    it 'ensures description is not too short' do
      @article.description='t'
      expect(@article.save).to eq(false)
    end

    it 'ensures description is not too long' do
      @article.description='a'*3001
      expect(@article.save).to eq(false)
    end

    it 'should be saved sucessfully' do
      expect(@article.save).to eq(true)
    end

  end

  context 'scope tests' do
  end

end



