module top_module (
    input d, 
    input ena,
    output reg q // 1. 'reg' lagana zaroori hai kyunki always block me assign ho raha hai
);

    // 2. Conditional logic ke liye 'always' block lagaya
    always @(*) begin
        if (ena) begin
            q = d;    // 3. Sahi direction: q me d ki value aayegi
        end
      
    end

endmodule
