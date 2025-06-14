/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;
import java.util.*;

public class IngredientDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/addfood";
    private String jdbcUsername = "root"; 
    private String jdbcPassword = "admin";

    private static final String INSERT_INGREDIENT_SQL = "INSERT INTO ingredients (food_name, ingredient_name, quantity) VALUES (?, ?, ?);";
    private static final String SELECT_ALL_INGREDIENTS = "SELECT * FROM ingredients;";
    private static final String DELETE_INGREDIENT_SQL = "DELETE FROM ingredients WHERE id = ?;";
    private static final String UPDATE_INGREDIENT_SQL = "UPDATE ingredients SET food_name = ?, ingredient_name = ?, quantity = ? WHERE id = ?;";

    // Health Advice SQL
    private static final String INSERT_ADVICE_SQL = "INSERT INTO health_advice (food_name, benefit, advice, type) VALUES (?, ?, ?, ?);";
    private static final String SELECT_ALL_ADVICE = "SELECT * FROM health_advice;";
    private static final String DELETE_ADVICE_SQL = "DELETE FROM health_advice WHERE id = ?;";
    private static final String UPDATE_ADVICE_SQL = "UPDATE health_advice SET food_name = ?, benefit = ?, advice = ?, type = ? WHERE id = ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // CRUD for Ingredients
    public void insertIngredient(Ingredient ingredient) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INGREDIENT_SQL)) {
            preparedStatement.setString(1, ingredient.getFoodName());
            preparedStatement.setString(2, ingredient.getIngredientName());
            preparedStatement.setString(3, ingredient.getQuantity());
            preparedStatement.executeUpdate();
        }
    }
    
    public Ingredient selectIngredient(int id) {
        Ingredient ingredient = null;
        String SELECT_INGREDIENT_BY_ID = "SELECT * FROM ingredients WHERE id = ?";
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_INGREDIENT_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String foodName = rs.getString("food_name");
                String ingredientName = rs.getString("ingredient_name");
                String quantity = rs.getString("quantity");
                ingredient = new Ingredient();
                ingredient.setId(id);
                ingredient.setFoodName(foodName);
                ingredient.setIngredientName(ingredientName);
                ingredient.setQuantity(quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ingredient;
    }

    public List<Ingredient> selectAllIngredients() {
        List<Ingredient> ingredients = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_INGREDIENTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Ingredient ingredient = new Ingredient();
                ingredient.setId(rs.getInt("id"));
                ingredient.setFoodName(rs.getString("food_name"));
                ingredient.setIngredientName(rs.getString("ingredient_name"));
                ingredient.setQuantity(rs.getString("quantity"));
                ingredients.add(ingredient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ingredients;
    }

    public boolean deleteIngredient(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_INGREDIENT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateIngredient(Ingredient ingredient) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_INGREDIENT_SQL)) {
            statement.setString(1, ingredient.getFoodName());
            statement.setString(2, ingredient.getIngredientName());
            statement.setString(3, ingredient.getQuantity());
            statement.setInt(4, ingredient.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public HealthAdvice selectAdvice(int id) {
        HealthAdvice advice = null;
        String SELECT_ADVICE_BY_ID = "SELECT * FROM health_advice WHERE id = ?";
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADVICE_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String foodName = rs.getString("food_name");
                String benefit = rs.getString("benefit");
                String adviceText = rs.getString("advice");
                String type = rs.getString("type");
                advice = new HealthAdvice();
                advice.setId(id);
                advice.setFoodName(foodName);
                advice.setBenefit(benefit);
                advice.setAdvice(adviceText);
                advice.setType(type);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return advice;
    }

    // CRUD for Health Advice
    public void insertAdvice(HealthAdvice advice) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADVICE_SQL)) {
            preparedStatement.setString(1, advice.getFoodName());
            preparedStatement.setString(2, advice.getBenefit());
            preparedStatement.setString(3, advice.getAdvice());
            preparedStatement.setString(4, advice.getType());
            preparedStatement.executeUpdate();
        }
    }

    public List<HealthAdvice> selectAllAdvice() {
        List<HealthAdvice> adviceList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ADVICE)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                HealthAdvice advice = new HealthAdvice();
                advice.setId(rs.getInt("id"));
                advice.setFoodName(rs.getString("food_name"));
                advice.setBenefit(rs.getString("benefit"));
                advice.setAdvice(rs.getString("advice"));
                advice.setType(rs.getString("type"));
                adviceList.add(advice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adviceList;
    }

    public boolean deleteAdvice(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_ADVICE_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean foodIdExists(int foodId) throws SQLException {
    String sql = "SELECT COUNT(*) FROM food WHERE id = ?";
    try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, foodId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
        return false;
    }
}

    public boolean updateAdvice(HealthAdvice advice) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_ADVICE_SQL)) {
            statement.setString(1, advice.getFoodName());
            statement.setString(2, advice.getBenefit());
            statement.setString(3, advice.getAdvice());
            statement.setString(4, advice.getType());
            statement.setInt(5, advice.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
   


}
