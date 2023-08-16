import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { BraintreeViewProps } from './Braintree.types';

const NativeView: React.ComponentType<BraintreeViewProps> =
  requireNativeViewManager('Braintree');

export default function BraintreeView(props: BraintreeViewProps) {
  return <NativeView {...props} />;
}
