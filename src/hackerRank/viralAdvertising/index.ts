function viralAdvertising(days: number): number {
  let day = 1;
  let totalLikes = 0;
  let sharedToday = 5;

  while (day <= days) {
    const likesToday = Math.floor(sharedToday / 2);
    totalLikes += likesToday;
    sharedToday = likesToday * 3;
    day++;
  }

  return totalLikes;
}
