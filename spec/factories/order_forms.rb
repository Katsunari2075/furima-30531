FactoryBot.define do
  factory :order_form do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '000-0000' }
    area_id { 2 }
    city { 'a' }
    address { 'a' }
    building { 'a' }
    tel { '00000000000' }
  end
end
