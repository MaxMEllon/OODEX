import React from 'react';
import ReactOnRails from 'react-on-rails';

const Sample = () => (
  <div>hoge</div>
);

window.Sample = Sample;

ReactOnRails.register({
  Sample,
});
