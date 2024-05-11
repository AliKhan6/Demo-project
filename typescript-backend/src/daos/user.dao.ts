import User, { UserOutput } from "../db/models/user.model";
import BaseDao from "./base.dao";

export default class UserDao extends BaseDao<UserOutput> {
  constructor() {
    super(User);
  }
}
