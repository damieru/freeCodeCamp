import {describe, expect, test} from "@jest/globals";
import cash_register from "../src/cash_register";

describe("cash_register function", ()=>{
    test("Correct change with OPEN status", ()=>{
        let change = cash_register(
            3.26,
            100, 
            [
                ["PENNY"      , 1.01], 
                ["NICKEL"     , 2.05], 
                ["DIME"       , 3.10], 
                ["QUARTER"    , 4.25], 
                ["ONE"        , 90  ], 
                ["FIVE"       , 55  ], 
                ["TEN"        , 20  ], 
                ["TWENTY"     , 60  ], 
                ["ONE HUNDRED", 100 ]
            ]
        );
        expect(change).toEqual({
            status: "OPEN", 
            change: [
                ["TWENTY" , 60  ], 
                ["TEN"    , 20  ], 
                ["FIVE"   , 15  ], 
                ["ONE"    , 1   ], 
                ["QUARTER", 0.5 ], 
                ["DIME"   , 0.2 ], 
                ["PENNY"  , 0.04]
            ]
        });

        change = cash_register(
            19.5, 
            20, 
            [ 
                ["PENNY", 1.01], 
                ["NICKEL", 2.05], 
                ["DIME", 3.1], 
                ["QUARTER", 4.25], 
                ["ONE", 90], 
                ["FIVE", 55], 
                ["TEN", 20], 
                ["TWENTY", 60], 
                ["ONE HUNDRED", 100]
            ]
        );
        expect(change).toEqual({status: "OPEN", change: [["QUARTER", 0.5]]});
    })

    test("No change due to insufficient funds.", ()=>{
        let change = cash_register(
            19.5, 
            20, 
            [
                ["PENNY"      , 0.01], 
                ["NICKEL"     , 0   ], 
                ["DIME"       , 0   ], 
                ["QUARTER"    , 0   ], 
                ["ONE"        , 1   ], 
                ["FIVE"       , 0   ], 
                ["TEN"        , 0   ], 
                ["TWENTY"     , 0   ], 
                ["ONE HUNDRED", 0   ]
            ]
        );
        expect(change).toEqual({status: "INSUFFICIENT_FUNDS", change: []})

        change = cash_register(
            19.5, 
            20, 
            [ 
                ["PENNY"      , 0.01], 
                ["NICKEL"     , 0   ], 
                ["DIME"       , 0   ], 
                ["QUARTER"    , 0   ], 
                ["ONE"        , 1   ], 
                ["FIVE"       , 0   ], 
                ["TEN"        , 0   ], 
                ["TWENTY"     , 0   ], 
                ["ONE HUNDRED", 0   ]
            ]
        );
        expect(change).toEqual({status: "INSUFFICIENT_FUNDS", change: []});

        change = cash_register(
            19.5, 
            20, 
            [
                ["PENNY"      , 0.01], 
                ["NICKEL"     , 0.10], 
                ["DIME"       , 0.30], 
                ["QUARTER"    , 0   ], 
                ["ONE"        , 0   ], 
                ["FIVE"       , 0   ], 
                ["TEN"        , 0   ], 
                ["TWENTY"     , 0   ], 
                ["ONE HUNDRED", 0   ]
            ]);
        expect(change).toEqual({status: "INSUFFICIENT_FUNDS", change: []});
    });

    test("Correct change with CLOSED status", ()=>{
        let change = cash_register(
            19.5, 
            20, 
            [    
                ["PENNY"      , 0.5], 
                ["NICKEL"     , 0  ], 
                ["DIME"       , 0  ], 
                ["QUARTER"    , 0  ], 
                ["ONE"        , 0  ], 
                ["FIVE"       , 0  ], 
                ["TEN"        , 0  ], 
                ["TWENTY"     , 0  ], 
                ["ONE HUNDRED", 0  ]
            ]
        );
        expect(change).toEqual({
            status: "CLOSED", 
            change: [
                ["PENNY"      , 0.5], 
                ["NICKEL"     , 0  ], 
                ["DIME"       , 0  ], 
                ["QUARTER"    , 0  ], 
                ["ONE"        , 0  ], 
                ["FIVE"       , 0  ], 
                ["TEN"        , 0  ], 
                ["TWENTY"     , 0  ], 
                ["ONE HUNDRED", 0  ]
            ]
        });
    });
})

