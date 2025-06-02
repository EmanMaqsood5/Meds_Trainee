
module sqrt_func (
    input  logic [31:0] x,            
    output logic [31:0] result    
);

    logic [31:0] low, high, mid;   
    logic [31:0] mid_squared, diff; 
    integer i;

    always_comb begin
        
        result = 32'd0;
        low = 32'd0;
        high = 32'd0;  
        mid = 32'd0;
        mid_squared = 32'd0;
        diff = 32'd0;

        // Handle simple cases
        if (x == 0 || x == 1) begin
            result = x; 
        end else if (x > 1) begin
            high = x;  
            
            low = 32'd0;
            mid = (low + high) / 2; 
            
            
            for (i = 0; i < 32; i++) begin  
                mid_squared = mid * mid;

                
                if (mid_squared > high)
                    diff = mid_squared - high;
                else
                    diff = high - mid_squared;

                
                if (diff <= 32'd1) begin 
                    result = mid;
                    break;
                end else if (mid_squared < high) begin
                    low = mid;
                end else begin
                    high = mid;
                end
                
                
                mid = (low + high) / 2;
            end
        end
    end

endmodule
