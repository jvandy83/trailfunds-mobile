export class Validator {
	constructor(name, value) {
		this.name = name;
		this.value = value;
		this.errors = { [name]: [] };
	}

	minLen(len) {
		if (this.value.length < len) {
			const formattedName = this.name[0].toUpperCase() + this.name.slice(1);
			this.errors[this.name].push(
				`${formattedName} must be at least ${len} characters`,
			);
		}
		return this;
	}

	isNull() {
		const formattedName = this.name[0].toUpperCase() + this.name.slice(1);
		if (!this.value) {
			this.errors[this.name].push(`${formattedName} cannot be empty`);
		}
		return this;
	}

	isEmail() {
		if (this.value.indexOf('@') < 0) {
			this.errors[this.name].push(`email address is not valid`);
		}
		return this;
	}
	run() {
		return this.errors;
	}
}
