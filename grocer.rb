def consolidate_cart(cart)
  # code here
  final_hash = {}
  cart.each do |element_hash|
    element_name = element_hash.keys[0]

    if final_hash.has_key?(element_name)
      final_hash[element_name][:count] += 1
    else
      final_hash[element_name] = {
        count: 1,
        price: element_hash[element_name][:price],
        clearance: element_hash[element_name][:clearance]
      }
    end
  end
  final_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item]][:count] >= coupon[:num]
        new_name = "#{coupon[:item]} W/COUPON"
        if cart[new_name]
          cart[new_name][:count] += coupon[:num]
        else
          cart[new_name] = {
            count: coupon[:num],
            price: coupon[:cost]/coupon[:num],
            clearance: cart[coupon[:item]][:clearance]
          }
        end
        cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
  cart.keys.each do |item|
  if cart[item][:clearance]
    cart[item][:price] = (cart[item][:price]*0.80).round(2)
  end
end
cart
end

def checkout(cart, coupons)
  # code here
end
