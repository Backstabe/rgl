require 'test_helper'

require 'rgl/dijkstra'
require 'rgl/adjacency'

include RGL

class TestDijkstra < Test::Unit::TestCase

  def setup
    @graph = AdjacencyGraph[1,2, 1,3, 2,3, 2,4, 3,4]

    @edge_weights = {
        [1, 2] => 10,
        [1, 3] => 1,
        [2, 3] => 1,
        [2, 4] => 1,
        [3, 4] => 10
    }
  end

  def test_shortest_path_search
    assert_equal([1, 3, 2, 4], shortest_path(1, 4))
  end

  def test_path_for_unreachable_vertex
    @graph.add_vertex(5)
    assert_equal(nil, shortest_path(1, 5))
  end

  private

  def shortest_path(source, target)
    @graph.dijkstra_shortest_path(@edge_weights, source, target)
  end

end