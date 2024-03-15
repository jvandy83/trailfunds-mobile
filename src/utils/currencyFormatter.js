const feePercentage = 0.029;
const feeFixed = 0.3;

// (price + flat_rate) / (1 - percent)
// (100 + .3) / (1 - .029)

function truncate(number, decimals) {
  if (number === 0) {
    return "0.00";
  }
  const factor = Math.pow(10, decimals);
  const truncatedNumber = (number * factor) / factor;
  return truncatedNumber.toFixed(2); // Ensure two digits after the decimal point
}

export const formatCurrency = (amount) => {
  amountPlusFee = (amount + feeFixed) / (1 - feePercentage);

  const parsedAmountWithFee = truncate(amountPlusFee, 2);

  const parsedAmountWithoutFee = truncate(amount, 2);

  const parsedForUIWithFee = `$${parsedAmountWithFee}`;
  const parsedForUIWithoutFee = `$${parsedAmountWithoutFee}`;
  const convertToPennies = parseFloat(amountPlusFee) * 100;
  const convertToPenniesWithoutFee = parseFloat(amount) * 100;

  return {
    parsedForUI: parsedForUIWithFee,
    convertToPennies,
    amountPlusFee,
    parsedAmount: parsedAmountWithFee,
    convertToPenniesForDonation: convertToPenniesWithoutFee,
    parsedForUIDonation: parsedForUIWithoutFee,
  };
};
