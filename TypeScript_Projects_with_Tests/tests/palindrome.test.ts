import {describe, expect, test} from "@jest/globals";
import palindromeChecker from "../src/palindrome";

describe("palindrome checker function", () => {

    test("A palindrome word in lower case", () => {
        const is_palindrome = palindromeChecker("eye");

        expect(is_palindrome).toEqual(true);
    });
    test("A palindrome word preceded by underscore", () => {
        const is_palindrome = palindromeChecker("_eye");

        expect(is_palindrome).toEqual(true);
    });

    test("A two-word palindrome expression", () => {
        const is_palindrome = palindromeChecker("race car");

        expect(is_palindrome).toEqual(true);
    });

    test("not a palindrome word", () => {
        const is_palindrome = palindromeChecker("word");

        expect(is_palindrome).toEqual(false);
    });

    test("not a palindrome sentence", () => {
        const is_palindrome = palindromeChecker("not a palindrome sentence");

        expect(is_palindrome).toEqual(false);
    });

    test("A palindrome sentence without punctuation", () => {
        const is_palindrome = palindromeChecker("never odd or even");

        expect(is_palindrome).toEqual(true);
    });

    test("A palindrome sentence with punctuation", () => {
        const is_palindrome = palindromeChecker("Doc, note I dissent: a fast never prevents a fatness. I diet on cod!");

        expect(is_palindrome).toEqual(true);
    });

    test("Almost a palindrome", () => {
        const is_palindrome = palindromeChecker("almostomla");

        expect(is_palindrome).toEqual(false);
    });

    test("A palindrome with numbers and punctuation", () => {
        const is_palindrome = palindromeChecker("My age is 0, 0 si ega ym.");

        expect(is_palindrome).toEqual(true);
    });

    test("A palindrome with only numbers and special characters", () => {
        const is_palindrome = palindromeChecker("*_* 0_0 (: /-\ :) 0-0 ¬¬");

        expect(is_palindrome).toEqual(true);
    });

    test("A non-palindrome with letters and special characters", () => {
        const is_palindrome = palindromeChecker("five|\_/|four");

        expect(is_palindrome).toEqual(false);
    });

    test("A palindrome sentence with lots of trash", () => {
        const is_palindrome = palindromeChecker("Pull_up,#*%Eva!&we’re)(here!@Wave!?Pull+up!");

        expect(is_palindrome).toEqual(true);
    });

});