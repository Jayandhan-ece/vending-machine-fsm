module tb_vending_machine;
    // Inputs
    reg clk;
    reg rst;
    reg [4:0] coin_in;
    reg coin_valid;
    reg prod_sel_a;
    reg prod_sel_b;

    // Outputs
    wire dispense_a;
    wire dispense_b;
    wire [4:0] change_out;

    // Instantiate the Unit Under Test (UUT)
    vending_machine uut (
        .clk(clk), .rst(rst), .coin_in(coin_in), .coin_valid(coin_valid),
        .prod_sel_a(prod_sel_a), .prod_sel_b(prod_sel_b),
        .dispense_a(dispense_a), .dispense_b(dispense_b), .change_out(change_out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0; rst = 1; coin_in = 0; coin_valid = 0; 
        prod_sel_a = 0; prod_sel_b = 0;
        
        // Wait 20 ns for global reset to finish
        #20; rst = 0;

        // --------------------------------------------------
        // TEST CASE 1: Buy Product A (Price 15) with Exact Change
        // --------------------------------------------------
        // Insert coin: 10
        #10; coin_in = 10; coin_valid = 1; 
        #10; coin_valid = 0;
        
        // Insert coin: 5
        #10; coin_in = 5; coin_valid = 1; 
        #10; coin_valid = 0;
        
        // Select Product A
        #10; prod_sel_a = 1; 
        #10; prod_sel_a = 0;

        // Wait to observe outputs before ending simulation
        #50;
        // --------------------------------------------------
        // TEST CASE 2: Insufficient Funds (Try to buy with ?10)
        // --------------------------------------------------
        #20; coin_in = 10; coin_valid = 1; 
        #10; coin_valid = 0;
        #10; prod_sel_b = 1; // Try to buy Product B (Price 20)
        #10; prod_sel_b = 0; 
        // Machine should NOT dispense and should return to IDLE

        // --------------------------------------------------
        // TEST CASE 3: Overpayment & Change (Pay ?20 for ?15 item)
        // --------------------------------------------------
        #20; coin_in = 20; coin_valid = 1; 
        #10; coin_valid = 0;
        #10; prod_sel_a = 1; // Buy Product A (Price 15)
        #10; prod_sel_a = 0;
        // Machine SHOULD dispense_a and output change_out = 5
        $finish;
    end
endmodule