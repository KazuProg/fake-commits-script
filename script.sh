#!/bin/bash

start_date="2024-01-01"
end_date="2024-12-31"
current_date="$start_date"
history_file="history.txt"

# ファイルが存在する場合は削除
if [ -f "$history_file" ]; then
  rm "$history_file"
fi

while [ "$current_date" != "$(date -d "$end_date + 1 day" +%Y-%m-%d)" ]; do
  echo "$(date -d "$current_date" +%Y-%m-%d): Changed something" >> "$history_file"
  git add "$history_file"
  git commit --date="$(date -d "$current_date 10:00:00" +%s)" -m "Update history for $current_date"
  current_date=$(date -d "$current_date + 1 day" +%Y-%m-%d)
done

echo "Generated fake commit history in Git repository with $history_file."
