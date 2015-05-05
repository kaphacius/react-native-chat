/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var createComponent = require('createReactIOSNativeComponentClass');
var ReactIOSViewAttributes = require('ReactIOSViewAttributes');
var React = require('react-native');
var merge = require('merge');
var window = require('Dimensions').get('window');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var validAttributes = merge({},
  ReactIOSViewAttributes.UIView
);

var ChatView = createComponent({
  validAttributes: validAttributes,
  uiViewClassName: 'ChatView',
});

var RNChat = React.createClass({
  render() {
    return (
      <ChatView
        style={styles.container}
        someParameter="test" />
    );
  },
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    width: window.width,
    height: window.height,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
});

AppRegistry.registerComponent('RNChat', () => RNChat);
