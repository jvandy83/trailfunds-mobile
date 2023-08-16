import { NativeModulesProxy, EventEmitter, Subscription } from 'expo-modules-core';

// Import the native module. On web, it will be resolved to Braintree.web.ts
// and on native platforms to Braintree.ts
import BraintreeModule from './src/BraintreeModule';
import BraintreeView from './src/BraintreeView';
import { ChangeEventPayload, BraintreeViewProps } from './src/Braintree.types';

// Get the native constant value.
export const PI = BraintreeModule.PI;

export function hello(): string {
  return BraintreeModule.hello();
}

export async function setValueAsync(value: string) {
  return await BraintreeModule.setValueAsync(value);
}

const emitter = new EventEmitter(BraintreeModule ?? NativeModulesProxy.Braintree);

export function addChangeListener(listener: (event: ChangeEventPayload) => void): Subscription {
  return emitter.addListener<ChangeEventPayload>('onChange', listener);
}

export { BraintreeView, BraintreeViewProps, ChangeEventPayload };
