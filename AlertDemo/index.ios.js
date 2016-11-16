/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  NativeModules,
  Text,
  View
} from 'react-native';

export default class AlertDemo extends Component {
  _onCreatePressed() {
    NativeModules.RNCorrespond.createNativeWindow();
  }

  _onOpenPressed() {
    NativeModules.RNCorrespond.openNativeWindow();
  }

  _onAlertPressed() {
    alert('React Native Alert View');
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.button} onPress={() => this._onCreatePressed()}>
          Create native window
        </Text>
        <Text style={styles.button} onPress={() => this._onOpenPressed()}>
          Open native window
        </Text>
        <Text style={styles.button} onPress={() => this._onAlertPressed()}>
          Alert
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  button: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
    padding: 10,
    borderColor: '#ccc',
    borderWidth: 1
  },
});

AppRegistry.registerComponent('AlertDemo', () => AlertDemo);
