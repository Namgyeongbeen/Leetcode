class Solution:
    def isPalindrome(self, x: int) -> bool:
        x_array=list(str(x))
        x_reverse=x_array.copy()
        x_reverse.reverse()
        if x_array == x_reverse:
            return True
        return False 