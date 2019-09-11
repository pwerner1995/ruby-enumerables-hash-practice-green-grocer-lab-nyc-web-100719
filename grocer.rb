def consolidate_cart(cart)
  cart_hash= {}
  i = 0
  while cart.length>i do 
    cart[i].each_key do |key|
      count = cart.count(cart[i])
      cart[i][key][:count] = count 
    end
    cart_hash = cart_hash.merge(cart[i])
    i += 1 
  end
  p cart_hash
end

def apply_coupons(cart, coupons)
  i = 0 
  coupon_hash = {}
  while coupons.length> i do 
    cart.each_key do |key|
      if key == coupons[i][:item]
        coupon_hash={
          coup
        }
    end
  end 
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
