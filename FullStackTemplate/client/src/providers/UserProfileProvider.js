import React, { useState, useEffect, createContext } from "react";
import { Spinner } from "reactstrap";
import firebase from "firebase/app";
import "firebase/auth";

export const UserProfileContext = createContext();

export function UserProfileProvider(props) {
    const apiUrl = "/api/users";
  
    const userProfile = sessionStorage.getItem("userProfile");
    const [isLoggedIn, setIsLoggedIn] = useState(userProfile != null);
    const [isFirebaseReady, setIsFirebaseReady] = useState(false);
    const [users, setUsers] = useState([]);
    const [currentUser, setCurrentUser] = useState({});
    const [aUser, setAUser] = useState({});
    
    useEffect(() => {
      firebase.auth().onAuthStateChanged((u) => {
        setIsFirebaseReady(true);
      });
    }, []);
  
    const login = (email, pw) => {
      return firebase.auth().signInWithEmailAndPassword(email, pw)
        .then((signInResponse) => getUserProfile(signInResponse.user.uid))
        .then((userProfile) => {
          sessionStorage.setItem("userProfile", JSON.stringify(userProfile));
          setIsLoggedIn(true);
        });
    };
  
    const logout = () => {
      return firebase.auth().signOut()
        .then(() => {
          sessionStorage.clear()
          setIsLoggedIn(false);
        });
    };
  
    const register = (userProfile, password) => {
      return firebase.auth().createUserWithEmailAndPassword(userProfile.email, password)
        .then((createResponse) => saveUser({ ...userProfile, firebaseUserId: createResponse.user.uid }))
        .then((savedUserProfile) => {
          sessionStorage.setItem("userProfile", JSON.stringify(savedUserProfile))
          setIsLoggedIn(true);
        });
    };
  
    const getToken = () => firebase.auth().currentUser.getIdToken();
  
    const getUserProfile = (firebaseUserId) => {
      return getToken().then((token) =>
        fetch(`${apiUrl}/${firebaseUserId}`, {
          method: "GET",
          headers: {
            Authorization: `Bearer ${token}`
          }
        }).then(resp => resp.json()));
    };
  
    const saveUser = (userProfile) => {
      return getToken().then((token) =>
        fetch(apiUrl, {
          method: "POST",
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json"
          },
          body: JSON.stringify(userProfile)
        }).then(resp => resp.json()));
    };

    const getAllUsers = () =>
    getToken().then((token) =>
      fetch(apiUrl, {
        method: "GET",
        headers: {
          Authorization: `Bearer ${token}`
        },
      }).then((resp) => resp.json())
      .then(setUsers)
      );

      const getCurrentUser = (firebaseUserId) => {
        return getToken().then((token) =>
          fetch(`${apiUrl}/${firebaseUserId}`, {
            method: "GET",
            headers: {
              Authorization: `Bearer ${token}`
            }
          }).then(resp => resp.json()
          .then(setCurrentUser)));
      };

      const getUserById = (id) => {
       return getToken().then((token) =>
        fetch(`${apiUrl}/${id}/details`, {
          headers: {
            Authorization: `Bearer ${token}`
          }
        }).then((resp) => resp.json()))
      };
      

      const updateUser = (user) =>
        getToken().then((token) =>
          fetch(`${apiUrl}/${user.id}`, {
            method: "PUT",
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json"
            },
            body: JSON.stringify(user)
          }));
  
    return (
      <UserProfileContext.Provider value={{ isLoggedIn, users, currentUser, aUser, login, logout, register, getToken, getAllUsers, getCurrentUser, getUserById, updateUser }}>
        {isFirebaseReady
          ? props.children
          : <Spinner className="app-spinner dark"/>}
      </UserProfileContext.Provider>
    );
  }