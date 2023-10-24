def solution(string)
  string.gsub(/[A-Z]/) { |match| ' ' + match}
end
