function jumpingOnClouds(c, k) {
  let des = 0;
  let e = 100;
  do {
    des = (des + k) % c.length;
    e = e - (1 + (c[des] ? 2 : 0));
  } while (des !== 0);
  return e;
}
