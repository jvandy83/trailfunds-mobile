export const formatCurrency = (amount) => {
	const parsedNumber = parseFloat(amount)
		.toFixed(2)
		.replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
	const parsedForUI = `$${parsedNumber}`;
	const convertToPennies = parsedNumber * 100;
	const convertToDollars = parsedNumber / 100;
	return { parsedForUI, convertToPennies, convertToDollars };
};
