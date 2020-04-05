# Disclaimer: I looked up Leetcode's answer to learn from the best method after failing to come up with an answer. 
# And added some minor tweaks.

def possible_bipartition(graph)
  # holds "color" per node
  # 1 and -1 represent the two groups
  colors = []
    
  graph.length.times do |i|
    if colors[i].nil?
      # doesn't matter what you assign to start
      # if the node has not been touched by the recursion below,
      # then there are node (clusters) completely separate with no connections
      colors[i] = 1
      # dfs checks whether adjacent nodes alternate color
      return false if !dfs(graph, i, colors)
    end
  end
    
  return true
end

def dfs(graph, i, colors)
  # iterates through neighbors
  graph[i].each do |neighbor|
    # if neighbor is not assigned a color, assign it the opposite color
    if colors[neighbor].nil?
      colors[neighbor] = -colors[i]
      return false if !dfs(graph, neighbor, colors)
    # if a color exists, check if it is the opposite color
    elsif colors[neighbor] == colors[i]
      return false
    end 
  end
    
  return true
end