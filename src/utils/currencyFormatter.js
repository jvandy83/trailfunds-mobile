const feePercentage = 0.029;
const feeFixed = 0.3;

// (price + flat_rate) / (1 - percent)
// (100 + .3) / (1 - .029)

function truncate(number, decimals) {
  const factor = Math.pow(10, decimals);
  const truncatedNumber = Math.floor(number * factor) / factor;
  return truncatedNumber.toFixed(2); // Ensure two digits after the decimal point
}

export const formatCurrency = (amount) => {
  console.log("AMOUNT: ", amount);
  let amountPlusFee = amount;
  if (amount > 0) {
    amountPlusFee = (amount + feeFixed) / (1 - feePercentage);
    console.log("AMOUNT PLUS FEE: ", amountPlusFee);
  }
  const parsedAmount = truncate(amountPlusFee, 2);
  console.log("PARSED AMOUNT: ", parsedAmount);
  let parsedNumber = String(parsedAmount).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
  console.log("PARSED NUMBER : ", parsedNumber);
  if (amount === 0) {
    parsedNumber = parseFloat(parsedAmount).replace(
      /(\d)(?=(\d{3})+\.)/g,
      "$1,"
    );
  }
  const parsedForUI = `$${parsedAmount}`;
  const convertToPennies = parseFloat(amountPlusFee) * 100;

  console.log("PARSED FOR UI: ", parsedForUI);

  return { parsedForUI, convertToPennies, amountPlusFee, parsedAmount };
};
