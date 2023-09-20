def infix_to_rpn(expression)
  precedence = {
    '^' => 3,
    '*' => 2,
    '/' => 2,
    '+' => 1,
    '-' => 1,
  }

  output = []
  stack = []

  expression.split.each do |token|
    if token.match?(/\d+/)
      output << token
    elsif token == '('
      stack.push(token)
    elsif token == ')'
      while !stack.empty? && stack.last != '('
        output << stack.pop
      end
      stack.pop if stack.last == '('
    else
      while !stack.empty? && precedence[token] <= precedence[stack.last]
        output << stack.pop
      end
      stack.push(token)
    end
  end

  while !stack.empty?
    output << stack.pop
  end

  return output.join(' ')
end

# Input mathematical expression
input = "2 + 1 * 4"
output = infix_to_rpn(input)
puts "Input: #{input}"
puts "Output: #{output}"
