import React from 'react';
import ReactOnRails from 'react-on-rails';
import { render } from 'react-dom';
import { AppContainer } from 'react-hot-loader';
import Sample from './components/Sample';

const RootDOM = () => {
  return (
    <AppContainer>
      <Sample />
    </AppContainer>
  );
}

window.onload = () => {
  setTimeout(() => {
    console.log('turbolinks:loaded');
    const main = document.getElementById('main');
    if (main) {
      render(<RootDOM />, main);
    }
    if (module.hot) {
      module.hot.accept('./components/Sample', () => {
        render(<RootDOM />, document.getElementById('main'));
      });
    }
  });
}

// window.Sample = Sample;
//
// ReactOnRails.register({
//   Sample,
// });
