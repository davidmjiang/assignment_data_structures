Node = Struct.new(:word,:definition,:next_node)

class LinkedList
  attr_reader :first, :last

  def initialize
    @first=nil
    @last=nil
  end

  def add_node(word,definition)
    if @first.nil?
      @first=Node.new(word,definition,nil)
      @last=@first
    else
      new_node=Node.new(word,definition,nil)
      @last.next_node=new_node
      @last=new_node
    end
  end

  def find_last_node
    pointer=@first.next_node
    until pointer.nil?
      pointer=pointer.next_node
    end
    pointer
  end

  #The method below uses O(n) to find the specific indexed node
  def find_node(index)
      counter = 0
      current_node = @first
      while counter < index + 1
        puts "The #{counter} node is #{current_node.word} : #{current_node.definition}"
        current_node = current_node.next_node
        counter += 1
      end
      current_node
  end

  def insert_node(index, word, definition)
    node_before_index = find_node(index - 1)
    node_at_current_index = find_node(index)
    new_node = Node.new(word, definition,node_at_current_index)
    node_before_index.next_node = new_node
    puts find_node(index)
  end


  def reverse
  end

end

my_list=LinkedList.new
my_list.add_node("cat","animal that meows")
my_list.add_node("sun", "orange sphere")
my_list.add_node("dog","animal that barks")
my_list.add_node("flower", "plant-type that smells")
my_list.add_node("container","object that holds things")
my_list.add_node("chair", "object to sit in")

#p my_list.first
#p my_list.first.next_node
#p my_list.last
#my_list.find_node(3)
my_list.insert_node(1, "banana", "I am a fruit rich in potassium")