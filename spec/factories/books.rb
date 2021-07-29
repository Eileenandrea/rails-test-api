FactoryBot.define do
  factory :book do
    sequence :title do |n| 
      "Harry Potter #{n}"
    end
    author {"JK Rowling"}
  end
end
