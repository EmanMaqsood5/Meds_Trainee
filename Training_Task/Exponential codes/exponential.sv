module my_exp (
    input  real x,
    input  int n,
    output real result
);

    real sum, power, fact, term;
    int i;

    always_comb begin
        sum = 1.0;
        power = 1.0;
        fact = 1.0;

        for (i = 1; i < n; i++) begin
            power = power * x;
            fact  = fact * i;
            term  = power / fact;
            sum   = sum + term;
        end

        result = sum;
    end

endmodule
