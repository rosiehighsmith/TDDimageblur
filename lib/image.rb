class Image
    attr_accessor :data, :final_data

    def initialize(data)
        @data = data
        @final_data = Marshal.load(Marshal.dump(data))
    end

    def blur
        @data.each_with_index do |subarray, r|
            subarray.each_with_index do |value, c|
                if value ==1 
                  @final_data[r-1][c] = 1 if r-1 >= 0
                  @final_data[r][c-1] = 1 if c-1 >= 0
                  @final_data[r][c+1] = 1 if c+1 <= subarray.length-1
                  @final_data[r+1][c] = 1 if r+1 <= @data.length-1
                end
            end
        end
        return Image.new(@final_data)
    end

    def output_image
        @final_data.each_index do |i|
        joined = @final_data[i].join
        puts joined
        end
    end
end

