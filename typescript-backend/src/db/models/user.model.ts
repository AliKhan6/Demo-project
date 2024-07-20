import { Table, Column, Model, PrimaryKey, AutoIncrement, DataType } from 'sequelize-typescript';

interface UserAttributes {
  id: number;
  first_name: string;
  last_name: string;
  email: string;
  password: string;
  created_at: Date;
  updated_at: Date;
}

export interface UserInput extends Partial<UserAttributes> { }
export interface UserOutput extends Required<UserAttributes> { }

@Table({
  tableName: 'users',
  timestamps: false
})
export default class User extends Model<UserAttributes, UserInput> {
  @PrimaryKey
  @AutoIncrement
  @Column(DataType.INTEGER)
  id!: number;

  @Column({
    type: DataType.STRING,
    allowNull: true,
    field: 'first_name'
  })
  first_name!: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
    field: 'last_name'
  })
  last_name!: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
    unique: true,
    validate: {
      isEmail: true,
    },
    field: 'email'
  })
  email!: string;


  @Column({
    type: DataType.STRING,
    allowNull: true,
    field: 'password'
  })
  password!: string;

  @Column({
    type: DataType.DATE,
    allowNull: false,
    field: 'created_at'
  })
  created_at!: Date;

  @Column({
    type: DataType.DATE,
    allowNull: false,
    field: 'updated_at'
  })
  updated_at!: Date;


  toJSON() {
    const values = Object.assign({}, this.get());
    delete values.password;
    return values;
  }
}
