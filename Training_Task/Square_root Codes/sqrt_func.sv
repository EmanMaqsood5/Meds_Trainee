module sqrt_func (
    input  logic [31:0] x,            
    output logic [31:0] result    
);

    logic [31:0] low, high, mid;   
    logic [63:0] mid_squared; 
    integer i;

    always_comb begin
        result = 32'd0;
        low = 32'd0;
        high = x;
        mid = 32'd0;
        mid_squared = 64'd0;

        if (x == 32'd0 || x == 32'd1) begin
            result = x;
        end else begin
            for (i = 0; i < 32; i++) begin
                mid = (low + high) >> 1;
                mid_squared = (mid * mid) >> 16; 

                if (mid_squared == 64'(x)) begin
                    result = mid;
                    break;
                end else if (mid_squared < 64'(x)) begin
                    low = mid;
                end else begin
                    high = mid;
                end

                result = mid; 
            end
        end
    end

endmodule
