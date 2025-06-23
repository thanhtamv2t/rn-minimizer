import Minimizer from './NativeMinimizer';

export const minimize = (): Promise<void> => {
  return Minimizer.minimize();
};

export const goBack = (): Promise<void> => {
  return Minimizer.goBack();
};

export const exit = (): Promise<void> => {
  return Minimizer.exit();
};
