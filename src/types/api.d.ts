declare type BaseApiResponse = {
  success: boolean;
  message?: string;
  statusCode?: number;
};

declare type BaseApiResponseWithData<T> = BaseApiResponse & {
  data?: T;
};

declare type BaseInvestmentRequest = {
  gender: Gender;
  currentAge: number;
  withdrawalAge: number;
  averageReturn: number;
};

declare type InvestmentRequest = BaseInvestmentRequest & {
  fundingAmount: number;
};

declare type InvestmentWithInstallmentsRequest = BaseInvestmentRequest & {
  monthlyInstallment: number;
  installmentYears: number;
  installmentPercentageIncrease?: number;
};

declare type InvestmentSimulation = {
  gender: Gender;
  current_age: number;
  average_return: number;
  payout_age: number;
  total: number;
  withoutRounded: number;
  investment: number;
  savvly_upside: number;
  index_fund_alone: number;
  total_savvly_upside: number;
  total_index_fund_alone: number;
  amount_already_paid: number;
  amount_to_get_back: number;
  market_distribution: number;
  savvly_distribution: number;
};

declare type InvestmentSimulationResults = InvestmentSimulation[];

declare type LeadVerificationRequest = {
  email: string;
  verificationCode: string;
};

declare type InvestmentDetailsRequest = {
  firstName: string;
  lastName: string;
  fundingPlan: FundingOption;
  fundingAmount: number;
  gender: Gender;
  birthDate: string;
  installmentMonths: number;
};

declare type PersonalInformationRequest = {
  street1: string;
  street2?: string;
  city: string;
  state: string;
  zipCode: string;
  ssn: string;
  country: string;
  isUSCitizen: boolean;
  isPermanentResident?: boolean;
  maritalStatus: MaritalStatus;
};

declare type SpouseInformationRequest = {
  firstName: string;
  lastName: string;
  email: string;
  country: string;
  birthDate: string;
};
