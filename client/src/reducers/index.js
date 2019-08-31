import { combineReducers } from 'redux';

import { reducer as formReducer } from 'redux-form';

import authentication from './authentication-reducer.js';
import messages from './messages-reducer.js';

const rootReducer = combineReducers({
    authentication: authentication,
    form: formReducer,
    messages: messages
});

export default rootReducer;