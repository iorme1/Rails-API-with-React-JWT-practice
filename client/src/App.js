import React, { Component } from 'react'
import './App.css'
import $ from 'jquery'
import 'bootstrap/dist/css/bootstrap.min.css'
import {
  Form,
  Input,
  Label,
  Button,
  FormGroup,
  Container
} from 'reactstrap';

class App extends Component {
  state = {
    bananasReceived: ""
  }

  getBananas = (admin) => {
    let token = "Bearer " + localStorage.getItem("jwt")
    let url = admin ? 'http://localhost:3000/api/bananas' : 'http://localhost:3000/api/bananas/1'
    console.log(token)
    $.ajax({
      url: url,
      type: "GET",
      beforeSend: function(xhr){xhr.setRequestHeader('Authorization', token)},
      context: this, // Allows us to use this.setState inside success
      success: function (result) {
        console.log(result)
        this.setState({bananasReceived: JSON.stringify(result)})
      }
    })
  }

  login = (e) => {
      e.preventDefault();
      const email = $("#email").val()
      const password = $("#password").val()
      const request = {"auth": {"email": email, "password": password}}
      console.log(request)
      $.ajax({
        url: "http://localhost:3000/api/user_token",
        type: "POST",
        data: request,
        dataType: "json",
        success: function (result) {
          console.log(result)
          localStorage.setItem("jwt", result.jwt)
        }
      })
    }

  render() {
    return (
      <Container>
        <h1 style={{marginTop: "20vh", marginBottom: "5vh" }}>
          Banana Management System
        </h1>
        <Form onSubmit={this.login}>
          <FormGroup>
            <Label for="email">
              Email:
            </Label>
            <Input
              name="email"
              id="email"
              type="email"
            />
            <Label for="password">
            Password:
            </Label>
            <Input
              name="password"
              id="password"
              type="password"
            />
            <Button
              color="dark"
              style={{marginTop: '2rem'}}
              type="submit"
              block
            >
              Login
            </Button>
          </FormGroup>
        </Form>
        <Button
          onClick={ () => this.getBananas(true)}
          className="mr-2"
          >
          Get All Bananas
        </Button>
        <Button onClick={ () => this.getBananas(false)}>
          Get One Banana
        </Button>
        <p>{this.state.bananasReceived}</p>
      </Container>
    );
  }
}

export default App;
