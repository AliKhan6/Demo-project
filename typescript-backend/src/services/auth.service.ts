import { ApiResponse } from "@google-cloud/logging/build/src/log";
import UserDao from "../daos/user.dao";
import bcrypt from "bcrypt";
import { BaseResponse } from "../dtos/base.response";
import User, { UserInput, UserOutput } from "../db/models/user.model";
import { isNull } from "lodash";

export default class AuthService {
  private readonly userDao: UserDao;

  constructor() {
    this.userDao = new UserDao();
  }

  async login(email: string, password: string) {
    if (email == null || password == null) {
      return {
        success: false,
        message: "Content cona't be empty",
        data: null
      };
    }

    let newUser = await this.userDao.getUserByEmail(email);
    if (!isNull(newUser)) {
      console.log(newUser.password);
      console.log(password);
      let passwordIsValid = await bcrypt.compare(
        password,
        newUser.password
      );
      console.log(passwordIsValid);
      if (passwordIsValid) {
        return {
          success: true,
          message: "Got User!",
          data: newUser
        };
      } else {
        return {
          success: false,
          message: "Password is Invalid!",
          data: null
        };
      }
    } else {
      return {
        success: false,
        message: "User doesn't exist with this email!",
        data: null
      };
    }


  }


  async signup(userInput: UserInput): Promise<BaseResponse> {
    if (userInput.password == null || userInput.first_name == null) {
      return {
        success: false,
        message: "Content cona't be empty",
        data: null
      };
    }
    const encryptedPass = await bcrypt.hash(userInput.password || "testpass", 10);
    let newUser = await this.userDao.createUser({ ...userInput, password: encryptedPass });
    return {
      success: true,
      message: null,
      data: newUser
    };
  }
}
