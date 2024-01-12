export const formatCurrency = (amount) => {
  let amountPlusFee;
  let fee;
  if (amount > 0) {
    fee = parseFloat(amount * 0.029 + 0.3).toFixed(2);
    amountPlusFee = amount + Number(fee);
  }
  const parsedNumber = parseFloat(amount)
    .toFixed(2)
    .replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
  const parsedForUI = `$${parsedNumber}`;
  const convertToPennies = parseFloat(amount) * 100;

  return { parsedForUI, convertToPennies, amountPlusFee };
};
