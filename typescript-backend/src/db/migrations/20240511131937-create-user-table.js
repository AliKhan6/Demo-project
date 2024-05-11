'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    // Create the Users table
    await queryInterface.createTable('users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      first_name: {
        type: Sequelize.STRING
      },
      last_name: {
        type: Sequelize.STRING
      },
      email: {
        type: Sequelize.STRING,
        unique: true
      },
      password: {
        type: Sequelize.STRING
      },
      created_at: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updated_at: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });

    // Add the creation of the stored procedure
    await queryInterface.sequelize.query(`
      CREATE OR REPLACE FUNCTION create_user(
          p_first_name VARCHAR,
          p_last_name VARCHAR,
          p_email VARCHAR,
          p_password VARCHAR,
          p_created_at TIMESTAMP,
          p_updated_at TIMESTAMP
      ) RETURNS INT AS
      $$
      DECLARE
          new_user_id INT;
      BEGIN
          INSERT INTO users (first_name, last_name, email, password, created_at, updated_at)
          VALUES (p_first_name, p_last_name, p_email, p_password, p_created_at, p_updated_at)
          RETURNING id INTO new_user_id;
          
          RETURN new_user_id;
      END;
      $$ LANGUAGE plpgsql;
    `);
  },

  async down(queryInterface, Sequelize) {
    // Funciton to drop table and stored procedure
    const dropProcedureAndTable = async () => {
      // Drop the stored procedure
      await queryInterface.sequelize.query(`
        DROP FUNCTION IF EXISTS create_user(p_first_name VARCHAR, p_last_name VARCHAR, p_email VARCHAR, p_password VARCHAR, p_created_at TIMESTAMP, p_updated_at TIMESTAMP);
      `);

      // Drop the Users table
      await queryInterface.dropTable('users');
    };

    // Call the async function
    await dropProcedureAndTable();
  }
};
