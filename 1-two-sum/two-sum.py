class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)

        for i in range (n):
            sec_number = target - nums[i]
            
            for j in range (i+1, n):
                if sec_number == nums[j]:

                    return [i,j]