function taumBday(b: number, w: number, bc: number, wc: number, z: number): BigInt {
  const min = Math.min(bc, wc);
  const b_c = min + Math.min(bc - min, z);
  const w_c = min + Math.min(wc - min, z);
  const b_price = BigInt(b) * BigInt(b_c);
  const w_price = BigInt(w) * BigInt(w_c);
  return b_price + w_price;
}
