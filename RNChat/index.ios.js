const React = require('react-native');
const {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

const styles = StyleSheet.create({
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

const createComponent = require('createReactIOSNativeComponentClass');
const ReactIOSViewAttributes = require('ReactIOSViewAttributes');

const validAttributes = Object.assign({},
  ReactIOSViewAttributes.UIView, {
  someParameter: true,
});

const ChatView = createComponent({
  validAttributes: validAttributes,
  uiViewClassName: 'ChatView',
});

const RNChat = React.createClass({
  render() {
    return (
      <ChatView someParameter="test" />
    );
  },
});

AppRegistry.registerComponent('RNChat', () => RNChat);
