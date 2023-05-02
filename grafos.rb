class Person
    attr_accessor :name, :connections
  
    def initialize(name)
      @name = name
      @connections = []
    end
  
    def add_connection(person)
      @connections << person
    end
  end
  
  class Graph
    def initialize
      @vertices = []
    end
  
    def add_vertex(person)
      @vertices << person
    end
  end
  
  # Adicionando pessoas ao grafo
  alice = Person.new("Alice")
  bob = Person.new("Bob")
  charlie = Person.new("Charlie")
  graph = Graph.new
  graph.add_vertex(alice)
  graph.add_vertex(bob)
  graph.add_vertex(charlie)
  
  # Adicionando conexões entre as pessoas
  alice.add_connection(bob)
  bob.add_connection(charlie)
  charlie.add_connection(alice)
  
  # Buscando conexões usando busca em largura
  def find_connections_bfs(person)
    queue = [person]
    visited = []
  
    while !queue.empty?
      current_person = queue.shift
      visited << current_person
  
      current_person.connections.each do |connection|
        if !visited.include?(connection)
          queue << connection
        end
      end
    end
  
    return visited - [person]
  end
  
  # Encontrando conexões de Alice usando BFS
  puts "Conexões de Alice:"
  find_connections_bfs(alice).each do |person|
    puts person.name
  end
  
  # Buscando conexões usando busca em profundidade
  def find_connections_dfs(person, visited=[])
    visited << person
  
    person.connections.each do |connection|
      if !visited.include?(connection)
        find_connections_dfs(connection, visited)
      end
    end
  
    return visited - [person]
  end
  
  # Encontrando conexões de Alice usando DFS
  puts "Conexões de Alice:"
  find_connections_dfs(alice).each do |person|
    puts person.name
  end