class A

  def index

    i,j = 5,5

    mat = Array.new(i) { Array.new(j) }

          x=0.1

    for i in 0..4

	for j in 0..4

		mat[i][j] = x
		 x=x+0.4

	end

      end

       puts "The given Matrix is :"


      for i in 0..4

        for j in 0..4

        print "#{mat[i][j]}\t"

   end
 puts"\t"
 end

end
end


a1 = A.new
a1.index
