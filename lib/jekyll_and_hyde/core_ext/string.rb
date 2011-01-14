class String
  def titlecase
    gsub(/([a-zA-Z]*)/).map { |m| m.capitalize }.join
  end
end