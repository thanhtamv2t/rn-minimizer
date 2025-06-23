import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  minimize: () => Promise<void>;
  goBack: () => Promise<void>;
  exit: () => Promise<void>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('Minimizer');
