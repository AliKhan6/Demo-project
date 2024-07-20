import User, { UserInput, UserOutput } from "../db/models/user.model";
import BaseDao from "./base.dao";

export default class UserDao extends BaseDao<UserOutput> {
  constructor() {
    super(User);
  }


  async createUser(userInput: UserInput): Promise<User | string> {
    userInput.created_at = new Date();
    userInput.updated_at = new Date();
    let newUser = await User.create(userInput);
    return newUser;
  }

  async getUserByEmail(email: string): Promise<User | null> {
    let newUser = await User.findOne({ where: { email: email } });
    return newUser;
  }
}
