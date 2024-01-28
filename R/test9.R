countsum <- function(count)
{
  sum <- 0
  for (i in 1:count)
  {
    sum <- sum + i
  }
  browser()
  return (sum)
}
results <- countsum(100)
print(results) 
