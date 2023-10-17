def int32_to_ip(int32)
  binary_number = int32.to_s(2)
  binary_number32 = binary_number.prepend("0" * (32 - binary_number.length))
  octets = binary_number32.scan(/.{8}/)
  ip_numbers = octets.map { |octet| octet.to_i(2).to_s }
  ip_numbers.join('.')
end
