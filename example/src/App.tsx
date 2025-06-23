import { Text, View, StyleSheet, Button } from 'react-native';
import { minimize, exit, goBack } from 'react-native-minimizer';

export default function App() {
  return (
    <View style={styles.container}>
      <Button title="minimized" onPress={() => minimize()} />
      <Button title="exit" onPress={() => exit()} />
      <Button title="goBack" onPress={() => goBack()} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
