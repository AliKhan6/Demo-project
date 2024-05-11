import UserDao from "../daos/user.dao";

export default class AuthService {
  private readonly userDao: UserDao;

  constructor() {
    this.userDao = new UserDao();
  }

  async login(email: string, password: string) {
    //TODO: implement logic
  }

  async signup() {
    //TODO: implement logic
  }
}
