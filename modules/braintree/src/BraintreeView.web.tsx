import * as React from 'react';

import { BraintreeViewProps } from './Braintree.types';

export default function BraintreeView(props: BraintreeViewProps) {
  return (
    <div>
      <span>{props.name}</span>
    </div>
  );
}
