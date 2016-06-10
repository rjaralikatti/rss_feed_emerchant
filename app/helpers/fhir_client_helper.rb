module FhirClientHelper
  
  def highlight(text, words)
    words.each do |word|
      text = text.gsub(/#{word}/i, "<hlt>#{word}</hlt>")
    end
    text
  end
end
