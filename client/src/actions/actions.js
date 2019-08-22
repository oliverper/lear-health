// ACTIONS FOR LOGIN, SIGNUP AND LOGOUT


import axios from 'axios';
import { browserHistory } from 'react-router'
import * as types from '../constants/ActionTypes';

/***********************SIGN IN | SIGN IN | SIGN IN *****************************/


////////////////LOGIN LOGIN LOGIN ///////////////

requestLogin = (creds) => {
  return {
    type: types.LOGIN_REQUEST,
    isFetching: true,
    isAuthenticated: false,
    payload: creds
  }
};


verifiedLogin = (creds) =>{
  return {
      type: types.LOGIN_SUCCESS,
      isFetching: false,
      isAuthenticated: true,
      payload: creds
    }
};

failedLogin = (message) => {
  return {
    type: types.LOGIN_FAILURE,
    isFetching: false,
    isAuthenticated: false,
    payload: message
  }
};

//Action call below for sign in 
//Type is either patient or physician

export const signIn = (user, userType) => {
  return (dispatch) => {
    dispatch(requestLogin(user));

    let credentials = {
      email: user.email,
      password: user.password
    };

    axios.post(`api/${userType}/signin`, credentials).then(verified =>{
      dispatch(verifiedLogin(verified))
    })
    .catch(response => {
      dispatch(failedLogin(response));
    });
  }
}


////////////////SIGN UP | SIGN UP | SIGN UP ///////////////

requestSignUp = (creds) => {
  return {
    type: types.SIGNUP_REQUEST,
    isFetching: true,
    isAuthenticated: false,
    payload: creds
  }
};


verifiedSignUp = (creds) =>{
  return {
      type: types.SIGNUP_SUCCESS,
      isFetching: false,
      isAuthenticated: true,
      payload: creds
    }
};

failedSignUp = (message) => {
  return {
    type: types.SIGNUP_FAILURE,
    isFetching: false,
    isAuthenticated: false,
    payload: message
  }
};

//Action call below for sign up --> uncomment export default

export const signUp = (user, userType) => {
  return (dispatch) => {
    dispatch(requestSignUp(user));

    let credentials = {
      first: user.first,
      last: user.last,
      email: user.email,
      password: user.password
    };
    axios.post(`api/${userType}/signup`, credentials).then(verified =>{
      dispatch(verifiedSignUp(verified))
    })
    .catch(response => {
      dispatch(failedSignUp(response));
    });
  }
}


///////////////CONTACT INFO | CONTACT INFO | CONTACT INFO ///////////////

requestContactPost = (info) => {
  return {
    type: types.CONTACT_POST_REQUEST,
    payload: info
  }
};


verifiedContactPost = (info) =>{
  return {
      type: types.CONTACT_POST_SUCCESS,
      payload: info
    }
};

failedContactPost = (message) => {
  return {
    type: types.CONTACT_POST_FAILURE,
    payload: message
  }
};

//Action call below for sign up --> uncomment export default

export const contactPost = (id, info, userType) => {
  return (dispatch) => {
    dispatch(requestContactPost(info));

    let contactInformation = {
      phone: info.phone,
      address: info.address,
      city: info.city,
      state: info.state,
      zip: info.zip
    };
    axios.post(`api/contactinfo/${userType}/${id}`).then(verified =>{
      dispatch(verifiedContactPost(verified))
    })
    .catch(response => {
      dispatch(failedContactPost(response));
    });
  }
}





////////////////lOGOUT | LOGOUT | LOGOUT///////////////


requestLogout = () =>{
  return {
    type: types.LOGOUT_REQUEST,
    isFetching: true,
    isAuthenticated: false,
  }
}

// Called upon successfull logout request, info sent to reducers.

receiveLogout = () => {
  return {
    type: types.LOGOUT_SUCCESS,
    isFetching: false,
    isAuthenticated: false,
  }
}


receiveLogout = () => {
  return {
    type: types.LOGOUT_SUCCESS,
    isFetching: false,
    isAuthenticated: false,
  }
}

export const logout = () => {
  return dispatch => {
    dispatch(requestLogout());
  }
}




////////////////HEALTH POST INFO | HEALTH POST INFO | HEALTH POST INFO ///////////////

requestHealthPost = (health) => {
  return {
    type: types.HEALTH_POST_REQUEST,
    payload: health
  }
};


verifiedHealthPost = (health) =>{
  return {
      type: types.HEALTH_POST_SUCCESS,
      payload: health
    }
};

failedHealthPost = (message) => {
  return {
    type: types.HEALTH_POST_FAILURE,
    payload: message
  }
};

//Action call below for sign up --> uncomment export default

export const healthPost = (id, healthInfo) => {
  return (dispatch) => {
    dispatch(requestHealthPost(healthInfo));

    let healthInformation = {
      dob: healthInfo.dob,
      weight: healthInfo.weight,
      height: healthInfo.height,
      bloodType: healthInfo.bloodType
    };
    axios.post(`api/patient/healthinfo/${id}`, healthInformation).then(info =>{
      dispatch(verifiedHealthPost(info));
    })
    .catch(response => {
      dispatch(failedHealthPost(response));
    });
  }
}




///////////////EMERGENCY CONTACT INFO | EMERGENCY CONTACT INFO | EMERGENCY CONTACT INFO ///////////////

requestEmergencyContact = (contact) => {
  return {
    type: types.EMERGENCY_CONTACT_REQUEST,
    payload: contact
  }
};


verifiedEmergencyContact = (contact) =>{
  return {
      type: types.EMERGENCY_CONTACT_SUCCESS,
      payload: contact
    }
};

failedEmergencyContact = (message) => {
  return {
    type: types.EMERGENCY_CONTACT_FAILURE,
    payload: message
  }
};

//Action call below for sign up --> uncomment export default

export const emergencyContact = (id, contact) => {
  return (dispatch) => {
    dispatch(requestEmergencyContact(contact));

    let emergencyContact = {
      first: contact.first,
      last: contact.last,
      phone: contact.phone,
      email: contact.email,
      relationship: contact.relationship
    };
    axios.post(`api/patient/emergency_contacts/${id}`).then(contact =>{
      dispatch(verifiedEmergencyContact(contact));
    })
    .catch(response => {
      dispatch(failedEmergencyContact(response));
    });
  }
}


///////////////INSURANCE INFO | INSURANCE INFO | INSURANCE INFO ///////////////

requestInsurancePost = (insurance) => {
  return {
    type: types.INSURANCE_POST_REQUEST,
    payload: insurance
  }
};


verifiedInsurancePost = (insurance) =>{
  return {
      type: types.INSURANCE_POST_SUCCESS,
      payload: insurance
    }
};

failedInsurancePost = (message) => {
  return {
    type: types.INSURANCE_POST_FAILURE,
    payload: message
  }
};

//Action call below for sign up --> uncomment export default

export const insurancePost = (id, insurance) => {
  return (dispatch) => {
    dispatch(requestInsurancePost(insurance));

    let insurancePost = {
      id_patient: id,
      id_insurance_client: insurance.id,
      type: insurance.type,
      policy_number: insurance.policy
    };
    axios.post(`api/patient/insurance/${id}`, insurancePost).then(insured =>{
      dispatch(verifiedInsurancePost(insured));
    })
    .catch(response => {
      dispatch(failedInsurancePost(response));
    });
  }
}