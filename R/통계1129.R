sum = 72 + 55 + 28 + 67
남 = 72 + 55
여 = 28 + 67
갤럭시 = 72 + 28
아이폰 = 55 + 67

남갤 = 72
남아 = 55
여갤 = 28
여아 = 67


남자갤럭시 = ((남/sum) * (갤럭시/sum)) * sum
여자갤럭시 = ((여/sum) * (갤럭시/sum)) * sum

남자아이폰 = ((남/sum) * (아이폰/sum)) * sum
여자아이폰 = ((여/sum) * (아이폰/sum)) * sum


result = (남갤-남자갤럭시) ** 2 / 남자갤럭시 +
  (남아-남자아이폰) ** 2 / 남자아이폰 +
  (여갤 - 여자갤럭시) ** 2 / 여자갤럭시 +
  (여아 - 여자아이폰) ** 2 / 여자아이폰

result
