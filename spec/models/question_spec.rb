require 'rails_helper'

describe Question do
  let(:question) { Question.new(title: "Test Title", content: "Test Content")}
  let(:notitle) { Question.new(content: "it does not have a title")}
  let(:nocontent) { Question.new(title: "it does not have a title")}

  it "has a title" do
    expect(question.title).to eq("Test Title")
  end

  it "has content" do
    expect(question.content).to eq("Test Content")
  end

  it "must have a title" do
      expect{notitle.save!}.to raise_error
  end

  it "must have content" do
      expect{nocontent.save!}.to raise_error
  end

end
