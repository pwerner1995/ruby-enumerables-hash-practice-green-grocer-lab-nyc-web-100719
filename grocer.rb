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
  p coupons 
  while coupons.length> i do 
    cart.each_key do |key|
        
      if coupons[i][:item] == key && !coupon_hash.key?("#{key} W/COUPON")
        coupon_hash["#{key} W/COUPON"]={
            :price => (coupons[i][:cost]/coupons[i][:num]),
            :clearance => cart[key][:clearance],
            :count => coupons[i][:num]
        }
        cart[key][:count] -= coupons[i][:num]
      elsif coupons[i][:item] == key && coupon_hash.key?("#{key} W/COUPON")
        coupon_hash["#{key} W/COUPON"][:count] = (coupons[i][:num] * coupons.count(coupons[i]))
        cart[key][:count] -= coupons[i][:num]
      end
    end
    i +=1 
  end
  cart = cart.merge(coupon_hash)
  p cart 
end

def apply_clearance(cart)
  cart.each_key do |key|
    if cart[key][:clearance] == true 
      cart[key][:price] *= 0.80
    end 
  end
  p cart 
end

def checkout(cart, coupons)
  # code here
end
