p(
  [[[1], [], [3], [4]], [['a'], ['b'], ['']]].map do |element1|
  # mapping over 2 subarrays:
  # [[1], [], [3], [4]]
  # [['a'], ['b'], ['']]

    element1.select do |element2|
    # iterating over each array in the above arrays:
    # [1]
    # []
    # [3]
    # [4]
      element2.map do |element3|
      # partitioning based on value of the elements in arrays above:
      # 1
      # nil?
      # 3
      # 4
      p element3
      p element3.size > 0
    end
  end
end
)