require_relative'./label.rb'

class LabelApp
def initialize
  @labels = []
end

def create_label
  puts 'Input the label color'
  color = gets.chomp
  puts 'Input the label title'
  title = gets.chomp
  add_label(color, title)
end

def add_label(color, title)
  label = Label.new(color, title)
  @labels << label unless @labels.include? (label)
end

def list_all_labels
    puts 'List all labels'
    puts 'No labels added yet.' if @labels == []
    @labels.each do |item|
      puts " the label title: #{item.title}
      the label color: #{item.color}
      the label items: #{item.items}"
    end
  end
end