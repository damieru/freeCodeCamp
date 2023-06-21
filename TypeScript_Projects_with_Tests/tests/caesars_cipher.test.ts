import {describe, expect, test} from "@jest/globals";
import rot13 from "../src/caesars_cipher";

describe("Encrypted message translator for Caesars Cipher", () =>{

    test("FREE CODE CAMP", () => {
        const message = rot13("SERR PBQR PNZC");
        expect(message).toEqual("FREE CODE CAMP")
    });

    test("FREE PIZZA!", () => {
        const message = rot13("SERR CVMMN!");
        expect(message).toEqual("FREE PIZZA!")
    });

    test("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.", () => {
        const message = rot13("GUR DHVPX OEBJA SBK WHZCF BIRE GUR YNML QBT.");
        expect(message).toEqual("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG.")
    });    
});