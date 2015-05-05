/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var createComponent = require('createReactIOSNativeComponentClass');
var ReactIOSViewAttributes = require('ReactIOSViewAttributes');
var React = require('react-native');
var merge = require('merge');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var validAttributes = merge(
  {},
  ReactIOSViewAttributes.UIView
);

var ChatView = createComponent({
  validAttributes: validAttributes,
  uiViewClassName: 'ChatView',
});

var RNChat = React.createClass({
  render() {
    return (
      <ChatView someParameter="test" />
    );
  },
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('RNChat', () => RNChat);
