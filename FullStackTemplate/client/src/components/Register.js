import React, { useState, useContext } from "react";
import { Button, Form, FormGroup, Label, Input, Card, CardBody } from 'reactstrap';
import { useHistory } from "react-router-dom";
import { UserProfileContext } from "../providers/UserProfileProvider";
import "./Login.css"

export default function Register() {
  const history = useHistory();
  const { register } = useContext(UserProfileContext);

  const [name, setName] = useState();
  const [displayName, setDisplayName] = useState();
  const [email, setEmail] = useState();
  const [bio, setBio] = useState();
  const [imageLocation, setImageLocation] = useState();
  const [password, setPassword] = useState();
  const [confirmPassword, setConfirmPassword] = useState();

  const registerClick = (e) => {
    e.preventDefault();
    if (password && password !== confirmPassword) {
      alert("Passwords don't match. Try again.");
    } else {
      const userProfile = { name, email, displayName, bio, imageLocation };
      register(userProfile, password)
        .then(() => history.push("/"));
    }
  };

  return (
    <div>
      <Card className="col-sm-12 col-lg-6 loginCard">
      <CardBody className="loginCardBody">
    <Form onSubmit={registerClick}>
      <fieldset>
        <FormGroup>
          <Label htmlFor="name">Name</Label>
          <Input style={{background: "#FFFFF6"}} id="name" type="text" onChange={e => setName(e.target.value)} />
        </FormGroup>
        <FormGroup>
          <Label  htmlFor="displayName">User Name</Label>
          <Input style={{background: "#FFFFF6"}} id="displayName" type="text" onChange={e => setDisplayName(e.target.value)} />
        </FormGroup>
        <FormGroup>
          <Label for="email">Email</Label>
          <Input style={{background: "#FFFFF6"}} id="email" type="text" onChange={e => setEmail(e.target.value)} />
        </FormGroup>
        <FormGroup>
          <Label for="password">Password</Label>
          <Input style={{background: "#FFFFF6"}} id="password" type="password" onChange={e => setPassword(e.target.value)} />
        </FormGroup>
        <FormGroup>
          <Label for="confirmPassword">Confirm Password</Label>
          <Input style={{background: "#FFFFF6"}} id="confirmPassword" type="password" onChange={e => setConfirmPassword(e.target.value)} />
        </FormGroup>
        <FormGroup>
          <Label htmlFor="bio">Bio</Label>
          <Input style={{background: "#FFFFF6"}} id="bio" type="text" onChange={e => setBio(e.target.value)} />
        </FormGroup> 
        <FormGroup>
          <Label htmlFor="imageLocation">Profile Image URL</Label>
          <Input style={{background: "#FFFFF6"}} id="imageLocation" type="text" onChange={e => setImageLocation(e.target.value)} />
        </FormGroup>
        <FormGroup></FormGroup>
        <FormGroup>   
          <Button className="LoginButton">Register</Button>
        </FormGroup>
      </fieldset>
    </Form>
    </CardBody>
    </Card>
    </div>
  );
}