/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import constant.Constant;
import context.DBContext;
import entity.Account;
import entity.Account_Form;
import entity.Brand;
import entity.Category;
import entity.Chart;
import entity.ChartStar;
import entity.Color;
import entity.DateDashboard;
import entity.Discount;
import entity.Gender;
import entity.History;
import entity.Image;
import entity.Product;
import entity.Product_Detail;
import entity.Product_Form;
import entity.Role;
import entity.Size;
import helper.BCrypt;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public class AdminDao extends DBContext {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    BCrypt bcryp = new BCrypt();

    public Account_Form checkExistOfAdmin(Account_Form account) {
        try {
            connection = this.getConnection();

            String sql = "SELECT a.Id, a.Email, a.Password, a.Role_Id, r.Role "
                    + "FROM Account a "
                    + "JOIN Role r ON r.Id = a.Role_Id "
                    + "WHERE a.Email = ? AND a.status = 1";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getEmail());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String hashedPassword = resultSet.getString("password");
                // Kiem tra mat khau nhap vao voi mat khau ma hoa trong db
                if (hashedPassword != null && bcryp.checkpw(account.getPassword(), hashedPassword)) {
                    Account_Form foundAccount = new Account_Form();
                    foundAccount.setId(resultSet.getInt("Id"));
                    foundAccount.setEmail(resultSet.getString("email"));
                    foundAccount.setPassword(account.getPassword());
                    foundAccount.setRole_Id(resultSet.getInt("Role_Id"));
                    foundAccount.setRole(resultSet.getString("Role"));
                    return foundAccount;
                } else {
                    return null;
                }
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Color> findAllColor() {
        List<Color> listC = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Color c ORDER BY c.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Color color = new Color();
                color.setId(resultSet.getInt("Id"));
                color.setColor(resultSet.getString("Color"));
                color.setStatus(resultSet.getInt("Status"));
                listC.add(color);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listC;
    }

    public List<Brand> findAllBrand() {
        List<Brand> listB = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Brand b ORDER BY b.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Brand brand = new Brand();
                brand.setId(resultSet.getInt("Id"));
                brand.setBrand(resultSet.getString("Brand"));
                brand.setStatus(resultSet.getInt("Status"));
                listB.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listB;
    }

    public List<Gender> findAllGender() {
        List<Gender> listG = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Gender g ORDER BY g.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Gender gender = new Gender();
                gender.setId(resultSet.getInt("Id"));
                gender.setGender(resultSet.getString("Gender"));
                gender.setStatus(resultSet.getInt("Status"));
                listG.add(gender);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listG;
    }

    public List<Category> findAllCategory() {
        List<Category> listC = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Category c ORDER BY c.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("Id"));
                category.setCategory(resultSet.getString("Category"));
                category.setStatus(resultSet.getInt("Status"));
                listC.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listC;
    }

    public boolean findColorExist(String color) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Color WHERE Color = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, color);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean findColorExistByIdAndColor(int id, String color) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Color WHERE Color = ? AND Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, color);
            preparedStatement.setInt(2, id);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int addColor(String color) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Color (Color, Status) VALUES (?, 1);";

            // Create a PreparedStatement with the SQL query
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, color);

            int rowsAffected = preparedStatement.executeUpdate();

            // Close the PreparedStatement when you're done
            preparedStatement.close();

            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void changeStatusColorById(int id, String status) {
        try {
            Connection connection = getConnection();

            String sql = "Update Color SET Status = ? WHERE Id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            if (status.equals("1")) {
                preparedStatement.setString(1, "0");
            } else {
                preparedStatement.setString(1, "1");
            }
            preparedStatement.setInt(2, id);

            int rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editColor(Color c, String oldColorName) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Color "
                    + "SET Color = ? "
                    + "WHERE Id = ? AND Color = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, c.getColor());
            preparedStatement.setInt(2, c.getId());
            preparedStatement.setString(3, oldColorName);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findCateExist(String category) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Category WHERE Category = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, category);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean findCateExistByIdAndCate(int id, String cate) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Category WHERE Category = ? AND Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cate);
            preparedStatement.setInt(2, id);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addCategory(String category) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Category (Category, Status) VALUES (?, 1)";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, category);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editCate(Category c, String oldCategoryName) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Category "
                    + "SET Category = ? "
                    + "WHERE Id = ? AND Category = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, c.getCategory());
            preparedStatement.setInt(2, c.getId());
            preparedStatement.setString(3, oldCategoryName);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void changeStatusCateById(int id, String status) {
        try {
            Connection connection = getConnection();

            String sql = "UPDATE Category SET Status = ? WHERE Id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            if (status.equals("1")) {
                preparedStatement.setString(1, "0");
            } else {
                preparedStatement.setString(1, "1");
            }
            preparedStatement.setInt(2, id);

            int rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int addBrand(String brand) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Brand (Brand, Status) VALUES (?, 1)";

            // Create a PreparedStatement with the SQL query
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, brand);

            int rowsAffected = preparedStatement.executeUpdate();

            // Close the PreparedStatement when you're done
            preparedStatement.close();

            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean findBrandExist(String brand) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Brand WHERE Brand = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, brand);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean findBrandExistByBrandAndId(int id, String gender) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Brand WHERE Brand = ? AND Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, gender);
            preparedStatement.setInt(2, id);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void editCate(Brand b) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Brand "
                    + "SET Brand = ? "
                    + "WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, b.getBrand());
            preparedStatement.setInt(2, b.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editBrand(Brand b, String oldBrandName) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Brand "
                    + "SET brand = ? "
                    + "WHERE Id = ? AND brand = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, b.getBrand());
            preparedStatement.setInt(2, b.getId());
            preparedStatement.setString(3, oldBrandName);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void changeStatusBrandById(int id, String status) {
        try {
            Connection connection = getConnection();

            String sql = "Update Brand SET Status = ? WHERE Id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            if (status.equals("1")) {
                preparedStatement.setString(1, "0");
            } else {
                preparedStatement.setString(1, "1");
            }
            preparedStatement.setInt(2, id);

            int rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findGenderExist(String gender) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Gender WHERE Gender = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, gender);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean findGenderExistByIdAndGender(int id, String gender) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Gender WHERE Gender = ? AND Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, gender);
            preparedStatement.setInt(2, id);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int addGender(String gender) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Gender (Gender, Status) VALUES (?, 1)";

            // Create a PreparedStatement with the SQL query
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, gender);

            int rowsAffected = preparedStatement.executeUpdate();

            // Close the PreparedStatement when you're done
            preparedStatement.close();

            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void changeStatusGenderById(int id, String status) {
        try {
            Connection connection = getConnection();

            String sql = "UPDATE Gender SET Status = ? WHERE Id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            if (status.equals("1")) {
                preparedStatement.setString(1, "0");
            } else {
                preparedStatement.setString(1, "1");
            }
            preparedStatement.setInt(2, id);

            int rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editGender(Gender g, String oldGenderName) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Gender "
                    + "SET gender = ? "
                    + "WHERE Id = ? AND gender = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, g.getGender());
            preparedStatement.setInt(2, g.getId());
            preparedStatement.setString(3, oldGenderName);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Size> findAllSize() {
        List<Size> listS = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Size s ORDER BY s.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Size size = new Size();
                size.setId(resultSet.getInt("Id"));
                size.setSize(resultSet.getString("Size"));
                size.setStatus(resultSet.getInt("Status"));
                listS.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listS;
    }

    public int addSize(String size) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Size (Size, Status) VALUES (?, 1)";

            // Create a PreparedStatement with the SQL query
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, size);

            int rowsAffected = preparedStatement.executeUpdate();

            // Close the PreparedStatement when you're done
            preparedStatement.close();

            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean findSizeExist(String size) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Size WHERE Size = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, size);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean findSizeExistByIdAndSize(int id, String size) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Size WHERE Size = ? AND Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, size);
            preparedStatement.setInt(2, id);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void editSize(Size s, String oldSizeName) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Size "
                    + "SET size = ? "
                    + "WHERE Id = ? AND size = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, s.getSize());
            preparedStatement.setInt(2, s.getId());
            preparedStatement.setString(3, oldSizeName);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void changeStatusSizeById(int id, String status) {
        try {
            Connection connection = getConnection();

            String sql = "UPDATE Size SET Status = ? WHERE Id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            if (status.equals("1")) {
                preparedStatement.setString(1, "0");
            } else {
                preparedStatement.setString(1, "1");
            }
            preparedStatement.setInt(2, id);

            int rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> findAllProducts() {
        List<Product> listP = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product p";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product p = new Product();
                p.setId(resultSet.getInt("Id"));
                p.setName(resultSet.getString("Name"));
                p.setCreate_on(resultSet.getDate("Create_on"));
                p.setDescription(resultSet.getString("Description"));
                p.setPrice(resultSet.getDouble("Price"));
                listP.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listP;
    }

    public int findTotalProducts() {
        int totalProduct = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM Product p "
                    + "JOIN Category c ON c.Id = p.Category_Id "
                    + "JOIN Brand b ON b.Id = p.Brand_Id "
                    + "WHERE p.status = 1 ";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalProduct = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalProduct;
    }

    public int findTotalProducts(String keyword, String status) {
        int totalProduct = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM Product p "
                    + "JOIN Category c ON c.Id = p.Category_Id "
                    + "JOIN Brand b ON b.Id = p.Brand_Id ";
            if (keyword != null && !keyword.equals("null")) {
                sql += "WHERE p.Name LIKE ? ";
            }
            if (status != null && !status.equals("null")) {
                if (sql.contains("WHERE")) {
                    sql += "AND p.status = ? ";
                } else {
                    sql += "WHERE p.status = ? ";
                }
            }
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (keyword != null && !keyword.equals("null")) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
            }
            if (status != null && !status.equals("null")) {
                preparedStatement.setString(parameterIndex++, status);
            }
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalProduct = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalProduct;
    }

    public List<Product_Form> findByPage(int page) {
        List<Product_Form> productList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product p "
                    + "JOIN Category c ON c.Id = p.Category_Id "
                    + "JOIN Brand b ON b.Id = p.Brand_Id "
                    + "WHERE p.status = 1 "
                    + "ORDER BY p.id "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;
            preparedStatement.setInt(parameterIndex++, (page - 1) * Constant.RECORD_PER_PAGE);
            preparedStatement.setInt(parameterIndex++, Constant.RECORD_PER_PAGE);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Form pf = new Product_Form();
                pf.setId(resultSet.getInt("id"));
                pf.setName(resultSet.getString("Name"));
                pf.setCreate_on(resultSet.getDate("Create_on"));
                pf.setDescription(resultSet.getString("Description"));
                pf.setPrice(resultSet.getDouble("Price"));
                pf.setImage_path(resultSet.getString("Image_path"));
                pf.setCategory_id(resultSet.getInt("Category_Id"));
                pf.setCategory(resultSet.getString("Category"));
                pf.setBrand_id(resultSet.getInt("Brand_Id"));
                pf.setBrand(resultSet.getString("Brand"));
                pf.setStatus(resultSet.getInt("Status"));
                productList.add(pf);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product_Form> findPageByKeyword(int page, String sortedByPrice, String sortedByDate, String keyword, String status) {
        List<Product_Form> productList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product p "
                    + "JOIN Category cate ON p.Category_Id = cate.id "
                    + "JOIN Brand b ON b.Id = p.Brand_Id ";
            if (keyword != null && !keyword.equals("null")) {
                sql += "WHERE p.Name LIKE ? ";
            }
            if (status != null && !status.equals("null")) {
                if (sql.contains("WHERE")) {
                    sql += "AND p.status = ? ";
                } else {
                    sql += "WHERE p.status = ? ";
                }
            } else {
                if (sql.contains("WHERE")) {
                    sql += "AND p.status = 1 ";
                } else {
                    sql += "WHERE p.status = 1 ";
                }
            }
            sql += "ORDER BY CASE WHEN ? = 'desc' THEN p.price END DESC, "
                    + "CASE WHEN ? = 'asc' THEN p.price END ASC, "
                    + "CASE WHEN ? = 'desc' THEN p.Create_on END DESC, "
                    + "CASE WHEN ? = 'asc' THEN p.Create_on END ASC "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (keyword != null && !keyword.equals("null")) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
            }
            if (status != null && !status.equals("null")) {
                preparedStatement.setString(parameterIndex++, status);
            }
            preparedStatement.setString(parameterIndex++, sortedByPrice);
            preparedStatement.setString(parameterIndex++, sortedByPrice);
            preparedStatement.setString(parameterIndex++, sortedByDate);
            preparedStatement.setString(parameterIndex++, sortedByDate);
            preparedStatement.setInt(parameterIndex++, (page - 1) * Constant.RECORD_PER_PAGE);
            preparedStatement.setInt(parameterIndex++, Constant.RECORD_PER_PAGE);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Form p = new Product_Form();
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("Name"));
                p.setCreate_on(resultSet.getDate("Create_on"));
                p.setDescription(resultSet.getString("Description"));
                p.setPrice(resultSet.getDouble("Price"));
                p.setImage_path(resultSet.getString("Image_path"));
                p.setCategory_id(resultSet.getInt("Category_Id"));
                p.setCategory(resultSet.getString("Category"));
                p.setBrand_id(resultSet.getInt("Brand_Id"));
                p.setBrand(resultSet.getString("Brand"));
                p.setStatus(resultSet.getInt("Status"));
                productList.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public Product_Form findProductDetailByID(String productID, String colorID, String sizeID, String genderID) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product p "
                    + "JOIN Category cate ON p.Category_Id = cate.id "
                    + "JOIN Brand b ON p.Brand_Id = b.id "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "LEFT JOIN Color c ON pd.Color_Id = c.Id "
                    + "LEFT JOIN Size s ON pd.Size_Id = s.Id "
                    + "LEFT JOIN Gender g ON pd.Gender_Id = g.Id "
                    + "WHERE p.Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (productID != null && !productID.equals("null")) {
                preparedStatement.setString(parameterIndex++, productID);
            }
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Form pf = new Product_Form();
                pf.setId(resultSet.getInt("id"));
                pf.setName(resultSet.getString("Name"));
                pf.setCreate_on(resultSet.getDate("Create_on"));
                pf.setDescription(resultSet.getString("Description"));
                pf.setPrice(resultSet.getDouble("Price"));
                pf.setImage_path(resultSet.getString("Image_path"));
                pf.setProduct_id(resultSet.getInt("Product_Id"));
                pf.setColor_id(resultSet.getInt("Color_Id"));
                pf.setCategory_id(resultSet.getInt("Category_Id"));
                pf.setSize_id(resultSet.getInt("Size_Id"));
                pf.setBrand_id(resultSet.getInt("Brand_Id"));
                pf.setStock(resultSet.getInt("Stock"));
                pf.setGender_id(resultSet.getInt("Gender_Id"));
                pf.setColor(resultSet.getString("Color"));
                pf.setCategory(resultSet.getString("Category"));
                pf.setSize(resultSet.getString("Size"));
                pf.setBrand(resultSet.getString("Brand"));
                pf.setGender(resultSet.getString("Gender"));
                return pf;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product_Form> findListProductDetailByID(String productID, int page) {
        List<Product_Form> listPf = new ArrayList<>();

        try {
            connection = this.getConnection();
            String sql = "SELECT *, pd.Id as product_detail_id, pd.status as product_detail_status FROM Product p "
                    + "JOIN Category cate ON p.Category_Id = cate.id "
                    + "JOIN Brand b ON p.Brand_Id = b.id "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "LEFT JOIN Color c ON pd.Color_Id = c.Id "
                    + "LEFT JOIN Size s ON pd.Size_Id = s.Id "
                    + "LEFT JOIN Gender g ON pd.Gender_Id = g.Id "
                    + "WHERE pd.status = 1 AND p.Id = ? "
                    + "ORDER BY p.id "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;
            preparedStatement.setString(parameterIndex++, productID);
            preparedStatement.setInt(parameterIndex++, (page - 1) * Constant.RECORD_PER_PAGE);
            preparedStatement.setInt(parameterIndex++, Constant.RECORD_PER_PAGE);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Form pf = new Product_Form();
                pf.setId(resultSet.getInt("id"));
                pf.setName(resultSet.getString("Name"));
                pf.setCreate_on(resultSet.getDate("Create_on"));
                pf.setDescription(resultSet.getString("Description"));
                pf.setPrice(resultSet.getDouble("Price"));
                pf.setImage_path(resultSet.getString("Image_path"));
                pf.setProduct_id(resultSet.getInt("Product_Id"));
                pf.setProductDetailId(resultSet.getInt("product_detail_id"));
                pf.setColor_id(resultSet.getInt("Color_Id"));
                pf.setCategory_id(resultSet.getInt("Category_Id"));
                pf.setSize_id(resultSet.getInt("Size_Id"));
                pf.setBrand_id(resultSet.getInt("Brand_Id"));
                pf.setStock(resultSet.getInt("Stock"));
                pf.setGender_id(resultSet.getInt("Gender_Id"));
                pf.setColor(resultSet.getString("Color"));
                pf.setCategory(resultSet.getString("Category"));
                pf.setSize(resultSet.getString("Size"));
                pf.setBrand(resultSet.getString("Brand"));
                pf.setGender(resultSet.getString("Gender"));
                pf.setStatus(resultSet.getInt("product_detail_status"));
                pf.setCreated_on(resultSet.getDate("Created_on"));
                listPf.add(pf);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPf;
    }

    public boolean findProductExist(String productName, int cateID, int brandID) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Product p "
                    + "WHERE p.Name = ? AND p.Category_Id = ? AND p.Brand_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productName);
            preparedStatement.setInt(2, cateID);
            preparedStatement.setInt(3, brandID);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void insertNewProduct(Product product) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Product (Name, Create_on, Description, Price, Image_path, Category_Id, Brand_Id, Status) VALUES (?, ?, ?, ?, ?, ?, ?, 1)";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, product.getName());
            preparedStatement.setDate(2, (Date) product.getCreate_on());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getImage_path());
            preparedStatement.setInt(6, product.getCategory_id());
            preparedStatement.setInt(7, product.getBrand_id());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertProductDetail(Product_Detail productDetail) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Product_Detail (Product_Id, Color_Id, Category_Id, Size_Id, Brand_Id, Stock, Gender_Id) VALUES (?, ?, ?, ?, ?, ?, ?)";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, productDetail.getProduct_id());
            preparedStatement.setInt(2, productDetail.getColor_id());
            preparedStatement.setInt(3, productDetail.getCategory_id());
            preparedStatement.setInt(4, productDetail.getSize_id());
            preparedStatement.setInt(5, productDetail.getBrand_id());
            preparedStatement.setInt(6, productDetail.getStock());
            preparedStatement.setInt(7, productDetail.getGender_id());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Image> getImagesByProductID(int productID) {
        List<Image> images = new ArrayList<>();

        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Image WHERE Product_Id = ?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, productID);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Image image = Image.builder()
                            .id(resultSet.getInt("Id"))
                            .product_Id(resultSet.getInt("Product_Id"))
                            .image(resultSet.getString("Image"))
                            .build();

                    images.add(image);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }

    public boolean findProductDetailExist(String idProduct) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Product_Detail pd "
                    + "WHERE pd.Product_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idProduct);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean findProductExist(String idProduct) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Product p "
                    + "WHERE p.Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idProduct);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Discount> findAllDiscount() {
        List<Discount> listD = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Discount d";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Discount d = new Discount();
                d.setId(resultSet.getInt("Id"));
                d.setCreate_at(resultSet.getDate("Create_at"));
                d.setDiscount_percent(resultSet.getInt("Discount_percent"));
                d.setStatus(resultSet.getInt("Status"));
                listD.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listD;
    }

    public List<Image> getImagesToEditByProductID(String productId) {
        List<Image> images = new ArrayList<>();

        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Image WHERE Product_Id = ?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, productId);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Image image = Image.builder()
                            .id(resultSet.getInt("Id"))
                            .product_Id(resultSet.getInt("Product_Id"))
                            .image(resultSet.getString("Image"))
                            .build();

                    images.add(image);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }

    public void saveImage(Image image) {
        try {
            connection = this.getConnection();
            String[] individualPaths = image.getImage().split(",");
            for (String path : individualPaths) {
                String sql = "INSERT INTO Image (Product_Id, Image) VALUES (?, ?)";

                preparedStatement = connection.prepareStatement(sql);

                preparedStatement.setInt(1, image.getProduct_Id());
                preparedStatement.setString(2, path.trim());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findExistProduct(Product_Form productForm) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Product p "
                    + "WHERE p.Name = ? AND p.Category_Id = ? AND p.Brand_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productForm.getName());
            preparedStatement.setInt(2, productForm.getCategory_id());
            preparedStatement.setInt(3, productForm.getBrand_id());

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateProduct(Product_Form productForm, int cateIdOld, int brandIdOld) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Product SET Name = ?, Description = ?, Price = ?, Category_Id = ?, Brand_Id = ? "
                    + "WHERE Id = ? AND Category_Id = ? AND Brand_Id = ?";

            preparedStatement = connection.prepareStatement(sql);
            
            preparedStatement.setString(1, productForm.getName());
            preparedStatement.setString(2, productForm.getDescription());
            preparedStatement.setDouble(3, productForm.getPrice());
            preparedStatement.setInt(4, productForm.getCategory_id());
            preparedStatement.setInt(5, productForm.getBrand_id());
            preparedStatement.setInt(6, productForm.getId());
            preparedStatement.setInt(7, cateIdOld);
            preparedStatement.setInt(8, brandIdOld);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProductImageLayout(Product_Form productForm) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Product SET Image_path = ? WHERE id = ?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, productForm.getImage_path());
            preparedStatement.setInt(2, productForm.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteImagesExistAlready(Image image) {
        try {
            connection = this.getConnection();
            String[] individualPaths = image.getImage().split(",");
            for (String path : individualPaths) {
                String sql = "DELETE FROM Image WHERE Product_Id = ? AND Image = ?";

                preparedStatement = connection.prepareStatement(sql);

                preparedStatement.setInt(1, image.getProduct_Id());
                preparedStatement.setString(2, path.trim());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int countByProductID(int productID) {
        int count = 0;
        try {
            connection = this.getConnection();
            String sql = "SELECT COUNT(*) FROM Image WHERE Product_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public void deleteImagesProduct(int productIdToDeleteImage, String imagePathToDelete) {
        try {
            connection = this.getConnection();

            String sql = "DELETE FROM Image WHERE Product_Id = ? AND Image = ?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, productIdToDeleteImage);
            preparedStatement.setString(2, imagePathToDelete);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findDiscountExist(int discountData) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Discount WHERE Discount_percent = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, discountData);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addDiscount(Discount discount) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Discount (Create_at, Discount_percent, Status) VALUES (?, ?, ?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setDate(1, (Date) discount.getCreate_at());
            preparedStatement.setInt(2, discount.getDiscount_percent());
            preparedStatement.setInt(3, discount.getStatus());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDiscountById(int id) {
        try {
            Connection connection = getConnection();

            String sql = "DELETE FROM Discount WHERE Id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findDiscountExistByDiscount(int discountPercent) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Discount WHERE Discount_percent = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, discountPercent);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void editDiscount(Discount discount, int oldDiscount) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Discount "
                    + "SET Discount_percent = ? "
                    + "WHERE Id = ? AND Discount_percent = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, discount.getDiscount_percent());
            preparedStatement.setInt(2, discount.getId());
            preparedStatement.setInt(3, oldDiscount);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int countAllAccount() {
        int countAccount = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*)\n"
                    + "FROM Account\n"
                    + "WHERE CAST(Created_on AS DATE) = CAST(GETDATE() AS DATE)";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                countAccount = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return countAccount;
    }

    public int countAllInvoice() {
        int countInvoice = 0;
        try {
            connection = this.getConnection();

            String sql = "Select count(*) From Invoice";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                countInvoice = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return countInvoice;
    }

    public List<Account_Form> findAllAccount() {
        List<Account_Form> listAf = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "Select * from Account as a JOIN Account_Detail ad ON ad.Account_Id = a.Id "
                    + "JOIN Role r ON r.Id = a.Role_Id "
                    + "JOIN Gender g ON g.Id = ad.Gender_Id";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Account_Form af = new Account_Form();
                af.setId(resultSet.getInt("Id"));
                af.setEmail(resultSet.getString("Email"));
                af.setMember_code(resultSet.getString("Member_Code"));
                af.setPhone_number(resultSet.getString("Phone_Number"));
                af.setGender(resultSet.getString("Gender"));
                af.setDob((java.util.Date) resultSet.getDate("Dob"));
                af.setAddress(resultSet.getString("Address"));
                af.setUsername(resultSet.getString("Username"));
                af.setRole(resultSet.getString("Role"));
                af.setStatus(resultSet.getInt("Status"));
                listAf.add(af);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listAf;
    }

    public List<Color> findColorByProductId(int productID) {
        List<Color> listC = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT DISTINCT pd.Color_Id, c.Color FROM Product p "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.Id "
                    + "JOIN Color c ON c.Id = pd.Color_Id WHERE p.Id =? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Color c = new Color();
                c.setId(resultSet.getInt("Color_Id"));
                c.setColor(resultSet.getString("Color"));
                listC.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listC;
    }

    public List<Size> findSizeByProductId(int productID) {
        List<Size> listS = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT DISTINCT pd.Size_Id, s.Size FROM Product p "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.Id "
                    + "JOIN Size s ON s.Id = pd.Size_Id WHERE p.Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Size s = new Size();
                s.setId(resultSet.getInt("Size_Id"));
                s.setSize(resultSet.getString("Size"));
                listS.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listS;
    }

    public List<Gender> findGenderByProductId(int productID) {
        List<Gender> listG = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT DISTINCT pd.Gender_Id, g.gender FROM Product p "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.Id "
                    + "JOIN Gender g ON g.Id = pd.Gender_Id WHERE p.Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Gender g = new Gender();
                g.setId(resultSet.getInt("Gender_Id"));
                g.setGender(resultSet.getString("Gender"));
                listG.add(g);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listG;
    }

    public List<Product_Form> findGenderAndSizeByColorId(String productID, String colorId) {
        List<Product_Form> listPf = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT *  FROM Product_Detail pd "
                    + "JOIN Gender g ON g.Id = pd.Gender_Id "
                    + "JOIN Size s ON s.id = pd.Size_Id WHERE pd.Product_Id = ? AND pd.Color_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, colorId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Form pf = new Product_Form();
                pf.setGender(resultSet.getString("Gender"));
                pf.setSize(resultSet.getString("Size"));
                listPf.add(pf);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listPf;
    }

    public List<Size> findSizeByColorId(String productID, String colorId) {
        List<Size> listS = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct s.Size, pd.Size_Id FROM Product_Detail pd "
                    + "JOIN Size s ON s.id = pd.Size_Id WHERE pd.Product_Id = ? AND pd.Color_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, colorId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Size s = new Size();
                s.setId(resultSet.getInt("Size_Id"));
                s.setSize(resultSet.getString("Size"));
                listS.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listS;
    }

    public List<Gender> findGenderByColorId(String productID, String colorId) {
        List<Gender> listG = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct g.Gender, pd.Gender_Id FROM Product_Detail pd "
                    + "JOIN Gender g ON g.Id = pd.Gender_Id "
                    + "WHERE pd.Product_Id = ? AND pd.Color_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, colorId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Gender g = new Gender();
                g.setId(resultSet.getInt("Gender_Id"));
                g.setGender(resultSet.getString("Gender"));
                listG.add(g);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listG;
    }

    public List<Color> findColorBySize(String productID, String sizeId) {
        List<Color> listC = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct c.Color, pd.Color_Id FROM Product_Detail pd "
                    + "JOIN Color c ON c.Id = pd.Color_Id "
                    + "WHERE pd.Product_Id = ? AND pd.Size_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, sizeId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Color c = new Color();
                c.setId(resultSet.getInt("Color_Id"));
                c.setColor(resultSet.getString("Color"));
                listC.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listC;
    }

    public List<Color> findColorByGender(String productID, String genderID) {
        List<Color> listC = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct c.Color, pd.Color_Id FROM Product_Detail pd "
                    + "JOIN Color c ON c.Id = pd.Color_Id "
                    + "WHERE pd.Product_Id = ? AND pd.Gender_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, genderID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Color c = new Color();
                c.setId(resultSet.getInt("Color_Id"));
                c.setColor(resultSet.getString("Color"));
                listC.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listC;
    }

    public List<Size> findSizeByGender(String productID, String genderID) {
        List<Size> listS = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct c.Size, pd.Size_Id FROM Product_Detail pd "
                    + "JOIN Size s ON s.Id = pd.Size_Id "
                    + "WHERE pd.Product_Id = ? AND pd.Gender_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, genderID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Size s = new Size();
                s.setId(resultSet.getInt("Size_Id"));
                s.setSize(resultSet.getString("Size"));
                listS.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listS;
    }

    public List<Size> findSizeByColorAndGender(String productID, String colorId, String genderID) {
        List<Size> listS = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct s.Size, pd.Size_Id FROM Product_Detail pd "
                    + "JOIN Size s ON s.Id = pd.Size_Id "
                    + "WHERE pd.Product_Id = ? AND pd.Color_Id = ? AND pd.Gender_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, colorId);
            preparedStatement.setString(3, genderID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Size s = new Size();
                s.setId(resultSet.getInt("Size_Id"));
                s.setSize(resultSet.getString("Size"));
                listS.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listS;
    }

    public List<Color> findColorByGenderAndSize(String productID, String genderID, String sizeId) {
        List<Color> listC = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct c.Color, pd.Color_Id FROM Product_Detail pd "
                    + "JOIN Color c ON c.Id = pd.Color_Id "
                    + "WHERE pd.Product_Id = ? AND pd.Gender_Id = ? AND pd.Size_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, genderID);
            preparedStatement.setString(3, sizeId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Color c = new Color();
                c.setId(resultSet.getInt("Color_Id"));
                c.setColor(resultSet.getString("Color"));
                listC.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listC;
    }

    public int getStockProductDetailByAllField(String productID, String colorId, String sizeId) {
        int StockOfProductDetail = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT pd.Stock FROM Product_Detail pd "
                    + "WHERE pd.Product_Id = ? AND pd.Color_Id = ? AND pd.Size_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, colorId);
            preparedStatement.setString(3, sizeId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                StockOfProductDetail = resultSet.getInt("Stock");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return StockOfProductDetail;
    }

    public int findTotalProductDetailsById(String productID) {
        int totalProductDetails = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM Product_Detail pd "
                    + "WHERE pd.status = 1 AND pd.Product_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            preparedStatement.setString(parameterIndex++, productID);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalProductDetails = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalProductDetails;
    }

    public List<Product_Form> findProductDetails(int page, String productID, String colorId, String sizeID, String genderID, String sortedByDate, String status) {

        List<Product_Form> listPf = new ArrayList<>();
        try {
            connection = this.getConnection();
            StringBuilder sql = new StringBuilder("SELECT p.Id, p.Name, pd.created_on, p.description, p.price,p.image_path, pd.Id as productDetailId, pd.product_id,pd.color_id, p.category_id,pd.size_id "
                    + ",p.brand_id, pd.stock, pd.gender_id, c.color, cate.category "
                    + ", s.size, b.brand,g.gender,pd.status "
                    + " FROM Product p ");
            sql.append("JOIN Category cate ON p.Category_Id = cate.id ");
            sql.append("JOIN Brand b ON p.Brand_Id = b.id ");
            sql.append("JOIN Product_Detail pd ON pd.Product_Id = p.id ");
            sql.append("LEFT JOIN Color c ON pd.Color_Id = c.Id ");
            sql.append("LEFT JOIN Size s ON pd.Size_Id = s.Id ");
            sql.append("LEFT JOIN Gender g ON pd.Gender_Id = g.Id ");
            sql.append("WHERE pd.Product_Id = ? ");

            if (status != null && !status.isEmpty()) {
                sql.append("AND pd.status = ? ");
            } else {
                sql.append("AND pd.status = 1 ");
            }
            if (colorId != null && !colorId.isEmpty()) {
                sql.append("AND pd.Color_Id = ? ");
            }
            if (sizeID != null && !sizeID.isEmpty()) {
                sql.append("AND pd.Size_Id = ? ");
            }
            if (genderID != null && !genderID.isEmpty()) {
                sql.append("AND g.Id = ? ");
            }
            sql.append("ORDER BY CASE WHEN ? = 'desc' THEN pd.Created_on END DESC, ");
            sql.append("CASE WHEN ? = 'asc' THEN pd.Created_on END ASC ");
            sql.append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ");
            preparedStatement = connection.prepareStatement(sql.toString());
            int parameterIndex = 1;

            if (productID != null && !productID.isEmpty()) {
                preparedStatement.setString(parameterIndex++, productID);
            }
            if (status != null && !status.isEmpty()) {
                preparedStatement.setString(parameterIndex++, status);
            }
            if (colorId != null && !colorId.isEmpty()) {
                preparedStatement.setString(parameterIndex++, colorId);
            }
            if (sizeID != null && !sizeID.isEmpty()) {
                preparedStatement.setString(parameterIndex++, sizeID);
            }
            if (genderID != null && !genderID.isEmpty()) {
                preparedStatement.setString(parameterIndex++, genderID);
            }
            preparedStatement.setString(parameterIndex++, sortedByDate);
            preparedStatement.setString(parameterIndex++, sortedByDate);
            preparedStatement.setInt(parameterIndex++, (page - 1) * Constant.RECORD_PER_PAGE);
            preparedStatement.setInt(parameterIndex++, Constant.RECORD_PER_PAGE);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Form pf = new Product_Form();
                pf.setId(resultSet.getInt("id"));
                pf.setName(resultSet.getString("Name"));
                pf.setCreated_on(resultSet.getDate("Created_on"));
                pf.setDescription(resultSet.getString("Description"));
                pf.setPrice(resultSet.getDouble("Price"));
                pf.setImage_path(resultSet.getString("Image_path"));
                pf.setProductDetailId(resultSet.getInt("productDetailId"));
                pf.setColor_id(resultSet.getInt("Color_Id"));
                pf.setCategory_id(resultSet.getInt("Category_Id"));
                pf.setSize_id(resultSet.getInt("Size_Id"));
                pf.setBrand_id(resultSet.getInt("Brand_Id"));
                pf.setStock(resultSet.getInt("Stock"));
                pf.setGender_id(resultSet.getInt("gender_id"));
                pf.setColor(resultSet.getString("Color"));
                pf.setCategory(resultSet.getString("Category"));
                pf.setSize(resultSet.getString("Size"));
                pf.setBrand(resultSet.getString("Brand"));
                pf.setGender(resultSet.getString("Gender"));
                pf.setStatus(resultSet.getInt("Status"));
                listPf.add(pf);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPf;
    }

    public int findTotalProductDetailsById(String productID, String colorId, String sizeId, String genderID, String status) {
        int totalProductDetails = 0;

        try {
            connection = this.getConnection();

            StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM Product_Detail pd ");
            sql.append("WHERE pd.Product_Id = ? ");
            if (colorId != null && !colorId.isEmpty()) {
                sql.append("AND pd.Color_Id = ? ");
            }
            if (sizeId != null && !sizeId.isEmpty()) {
                sql.append("AND pd.Size_Id = ? ");
            }
            if (genderID != null && !genderID.isEmpty()) {
                sql.append("AND pd.Gender_Id = ? ");
            }
            if (status != null && !status.isEmpty()) {
                sql.append("AND pd.status = ? ");
            } else {
                sql.append("AND pd.status = 1 ");
            }
            preparedStatement = connection.prepareStatement(sql.toString());
            int parameterIndex = 1;
            preparedStatement.setString(parameterIndex++, productID);
            if (colorId != null && !colorId.isEmpty()) {
                preparedStatement.setString(parameterIndex++, colorId);
            }
            if (sizeId != null && !sizeId.isEmpty()) {
                preparedStatement.setString(parameterIndex++, sizeId);
            }
            if (genderID != null && !genderID.isEmpty()) {
                preparedStatement.setString(parameterIndex++, genderID);
            }
            if (status != null && !status.isEmpty()) {
                preparedStatement.setString(parameterIndex++, status);
            }
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                totalProductDetails = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalProductDetails;
    }

    public void deleteProductImageById(String idProduct) {
        try {
            connection = this.getConnection();

            String sql = "DELETE FROM Image WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, idProduct);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getProductNameById(int productID) {
        String name = "";
        try {
            connection = this.getConnection();

            String sql = "SELECT p.name FROM Product p WHERE p.id = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                name = resultSet.getString("Name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public int getProductID(String productName) {
        int id = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT p.id FROM Product p WHERE p.name = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productName);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("Id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public String getImageLayoutByProductId(int productID) {
        String imageLayout = "";
        try {
            connection = this.getConnection();

            String sql = "SELECT p.Image_path FROM Product p WHERE p.id = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                imageLayout = resultSet.getString("Image_path");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imageLayout;
    }

    public Product_Form getProductById(int productID) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Product p "
                    + "JOIN Category c ON c.id = p.Category_Id "
                    + "JOIN Brand b ON b.id = p.Brand_Id "
                    + "WHERE p.id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Form pf = new Product_Form();
                pf.setId(resultSet.getInt("Id"));
                pf.setName(resultSet.getString("Name"));
                pf.setDescription(resultSet.getString("Description"));
                pf.setPrice(resultSet.getFloat("Price"));
                pf.setImage_path(resultSet.getString("Image_path"));
                pf.setCategory_id(resultSet.getInt("Category_Id"));
                pf.setCategory(resultSet.getString("Category"));
                pf.setBrand_id(resultSet.getInt("Brand_Id"));
                pf.setBrand(resultSet.getString("Brand"));
                return pf;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean findExistProductDetails(int productID, int colorId, int sizeId, int genderId) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Product_Detail pd "
                    + "WHERE pd.Product_Id = ? AND pd.Color_Id = ? AND pd.Size_Id = ? AND pd.Gender_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            preparedStatement.setInt(2, colorId);
            preparedStatement.setInt(3, sizeId);
            preparedStatement.setInt(4, genderId);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addNewProductDetail(Product_Detail pd, Date currentTime) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Product_Detail (Product_Id, Color_Id, Size_Id, Gender_Id, Stock, Status, Created_on) VALUES (?, ?, ?, ?, ?, 1, ?)";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, pd.getProduct_id());
            preparedStatement.setInt(2, pd.getColor_id());
            preparedStatement.setInt(3, pd.getSize_id());
            preparedStatement.setInt(4, pd.getGender_id());
            preparedStatement.setInt(5, pd.getStock());
            preparedStatement.setDate(6, currentTime);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProductStatus(int idProduct, int statusProduct, Date currentTimestamp) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Product SET Status = ?, Status_date = ? WHERE Id = ?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, statusProduct);
            preparedStatement.setDate(2, currentTimestamp);
            preparedStatement.setInt(3, idProduct);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProductDetailsStatus(int idProductDetail, int statusProduct, Date currentTimestamp) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Product_Detail SET Status = ?, Status_date = ? WHERE Id = ? ";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, statusProduct);
            preparedStatement.setDate(2, currentTimestamp);
            preparedStatement.setInt(3, idProductDetail);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProductDetailsStatus1(int idProduct, int status, Date currentTimestamp) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Product_Detail SET Status = ?, Status_date = ? WHERE Product_Id = ? ";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, status);
            preparedStatement.setDate(2, currentTimestamp);
            preparedStatement.setInt(3, idProduct);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product_Form findProductByID(int productIdToUpdate) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product p "
                    + "JOIN Category cate ON p.Category_Id = cate.id "
                    + "JOIN Brand b ON p.Brand_Id = b.id "
                    + "WHERE p.Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            preparedStatement.setInt(parameterIndex++, productIdToUpdate);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Form pf = new Product_Form();
                pf.setId(resultSet.getInt("id"));
                pf.setName(resultSet.getString("Name"));
                pf.setDescription(resultSet.getString("Description"));
                pf.setPrice(resultSet.getDouble("Price"));
                pf.setImage_path(resultSet.getString("Image_path"));
                pf.setCategory_id(resultSet.getInt("Category_Id"));
                pf.setBrand_id(resultSet.getInt("Brand_Id"));
                pf.setCategory(resultSet.getString("Category"));
                pf.setBrand(resultSet.getString("Brand"));
                return pf;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int checkIsProductOfThisDisplay(int idProduct) {
        int status = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT p.status FROM Product p WHERE p.Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idProduct);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                status = resultSet.getInt("status");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public int findTotalAccount() {
        int totalAccount = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM Account a "
                    + "JOIN Account_Detail ad ON a.Id = ad.Account_Id "
                    + "JOIN Role r ON r.id = a.Role_Id "
                    + "WHERE r.role IN ('Seller', 'Customer') "
                    + "AND a.status = 1";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                totalAccount = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalAccount;
    }

    public List<Account_Form> findAccountByPage(int page) {
        List<Account_Form> listAf = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Account a "
                    + "LEFT JOIN Account_Detail ad ON ad.Account_Id = a.id "
                    + "JOIN Role r ON r.id = a.role_id "
                    + "LEFT JOIN Gender g ON g.id = ad.gender_id "
                    + "WHERE a.status = 1 AND r.role IN ('Seller', 'Customer') "
                    + "ORDER BY a.id "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;
            preparedStatement.setInt(parameterIndex++, (page - 1) * Constant.RECORD_PER_PAGE);
            preparedStatement.setInt(parameterIndex++, Constant.RECORD_PER_PAGE);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Account_Form af = new Account_Form();
                af.setId(resultSet.getInt("Id"));
                af.setEmail(resultSet.getString("Email"));
                af.setRole(resultSet.getString("Role"));
                af.setRole_Id(resultSet.getInt("Role_Id"));
                af.setStatus(resultSet.getInt("Status"));
                af.setPhone_number(resultSet.getString("Phone_Number"));
                af.setGender(resultSet.getString("Gender"));
                af.setGender_id(resultSet.getInt("Gender_Id"));
                af.setDob(resultSet.getDate("Dob"));
                af.setAddress(resultSet.getString("Address"));
                af.setUsername(resultSet.getString("Username"));
                listAf.add(af);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listAf;
    }

    public List<Role> findAllRole() {
        List<Role> listR = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Role r ORDER BY r.id ";

            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Role r = new Role();
                r.setId(resultSet.getInt("Id"));
                r.setRole(resultSet.getString("Role"));
                listR.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listR;
    }

    public int findTotalAccountBySearch(String keyword, String status, String roleId, String genderId) {
        int totalAccount = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM Account a JOIN Account_Detail ad ON a.Id = ad.Account_Id "
                    + "JOIN Role r ON r.id = a.Role_Id WHERE r.role IN ('Seller', 'Customer') ";
            if (keyword != null && !keyword.equals("null")) {
                sql += "AND ad.Username LIKE ? ";
            }
            if (status != null && !status.equals("null")) {
                sql += "AND a.status = ? ";

            } else {
                sql += "AND a.status = 1 ";
            }
            if (roleId != null && !roleId.equals("null")) {
                sql += "AND a.role_id = ? ";

            }
            if (genderId != null && !genderId.equals("null")) {
                sql += "AND ad.gender_id = ? ";
            }

            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (keyword != null && !keyword.equals("null")) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
            }
            if (status != null && !status.equals("null")) {
                preparedStatement.setString(parameterIndex++, status);
            }
            if (roleId != null && !roleId.equals("null")) {
                preparedStatement.setString(parameterIndex++, roleId);
            }
            if (genderId != null && !genderId.equals("null")) {
                preparedStatement.setString(parameterIndex++, genderId);
            }

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalAccount = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalAccount;
    }

    public List<Account_Form> findPageBySearch(int page, String keyword, String status, String roleId, String genderId, int pageSize) {
        List<Account_Form> listAf = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Account a "
                    + "LEFT JOIN Account_Detail ad ON a.Id = ad.Account_Id "
                    + "JOIN Role r ON r.Id = a.Role_Id "
                    + "LEFT JOIN Gender g ON g.Id = ad.Gender_Id WHERE r.role IN ('Seller', 'Customer') ";
            if (keyword != null && !keyword.equals("null")) {
                sql += "AND ad.Username LIKE ? ";
            }
            if (status != null && !status.equals("null")) {
                sql += "AND a.status = ? ";
            } else {
                sql += "AND a.status = 1 ";
            }
            if (roleId != null && !roleId.equals("null")) {
                sql += "AND a.role_id = ? ";
            }
            if (genderId != null && !genderId.equals("null")) {
                sql += "AND ad.gender_id = ? ";
            }
            sql += "ORDER BY a.id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (keyword != null && !keyword.equals("null")) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
            }
            if (status != null && !status.equals("null")) {
                preparedStatement.setString(parameterIndex++, status);
            }
            if (roleId != null && !roleId.equals("null")) {
                preparedStatement.setString(parameterIndex++, roleId);
            }
            if (genderId != null && !genderId.equals("null")) {
                preparedStatement.setString(parameterIndex++, genderId);
            }
            if (pageSize == 0) {
                preparedStatement.setInt(parameterIndex++, (page - 1) * Constant.RECORD_PER_PAGE);
                preparedStatement.setInt(parameterIndex++, Constant.RECORD_PER_PAGE);
            } else {
                preparedStatement.setInt(parameterIndex++, (page - 1) * pageSize);
                preparedStatement.setInt(parameterIndex++, pageSize);
            }

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Account_Form af = new Account_Form();
                af.setId(resultSet.getInt("Id"));
                af.setEmail(resultSet.getString("Email"));
                af.setRole(resultSet.getString("Role"));
                af.setRole_Id(resultSet.getInt("Role_Id"));
                af.setStatus(resultSet.getInt("Status"));
                af.setPhone_number(resultSet.getString("Phone_Number"));
                af.setGender(resultSet.getString("Gender"));
                af.setGender_id(resultSet.getInt("Gender_Id"));
                af.setDob(resultSet.getDate("Dob"));
                af.setAddress(resultSet.getString("Address"));
                af.setUsername(resultSet.getString("Username"));
                listAf.add(af);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listAf;
    }

    public void updateAccountStatus(int idAccount, int status, Date currentTimestamp) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Account SET Status = ?, Status_date = ? WHERE Id = ?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, status);
            preparedStatement.setDate(2, currentTimestamp);
            preparedStatement.setInt(3, idAccount);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAccountDetailsStatus(int idAccount, int status, Date currentTimestamp) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Account_Detail SET Status = ?, Status_date = ? WHERE Id = ?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, status);
            preparedStatement.setDate(2, currentTimestamp);
            preparedStatement.setInt(3, idAccount);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Account_Form getAccountByID(int accountID) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Account a "
                    + "JOIN Account_Detail ad ON a.id = ad.Account_Id "
                    + "JOIN Role r ON r.id = a.Role_Id "
                    + "JOIN Gender g ON g.id = ad.Gender_Id WHERE a.id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, accountID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Account_Form af = new Account_Form();
                af.setId(resultSet.getInt("Id"));
                af.setEmail(resultSet.getString("Email"));
                af.setRole_Id(resultSet.getInt("Role_Id"));
                af.setRole(resultSet.getString("Role"));
                af.setPhone_number(resultSet.getString("phone_number"));
                af.setGender_id(resultSet.getInt("gender_id"));
                af.setGender(resultSet.getString("gender"));
                af.setDob(resultSet.getDate("Dob"));
                af.setAddress(resultSet.getString("Address"));
                af.setUsername(resultSet.getString("Username"));
                return af;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkExistOfAccount(String emailRaw) {
        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) AS count "
                    + "FROM Account a "
                    + "JOIN Account_Detail ad ON ad.Account_Id = a.id "
                    + "JOIN Role r ON r.Id = a.Role_Id "
                    + "WHERE a.Email = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, emailRaw);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt("count");
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateAccount(Account_Form af) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Account SET Email = ? "
                    + "WHERE Id = ?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, af.getEmail());
            preparedStatement.setInt(2, af.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAccountDetail(Account_Form af) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Account_Detail SET Phone_Number = ?, Gender_Id = ?, "
                    + "Dob = ?, Address = ?, Username = ? "
                    + "WHERE Account_Id = ?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, af.getPhone_number());
            preparedStatement.setInt(2, af.getGender_id());
            preparedStatement.setDate(3, (Date) af.getDob());
            preparedStatement.setString(4, af.getAddress());
            preparedStatement.setString(5, af.getUsername());
            preparedStatement.setInt(6, af.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAccountRole(Account_Form af) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Account SET Role_Id = ? "
                    + "WHERE Id = ?";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, af.getRole_Id());
            preparedStatement.setInt(2, af.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Role> findRoleForSellerAndCustomer() {
        List<Role> listR = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Role r WHERE r.role IN ('Seller', 'Customer') ORDER BY r.id ";

            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Role r = new Role();
                r.setId(resultSet.getInt("Id"));
                r.setRole(resultSet.getString("Role"));
                listR.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listR;
    }

    public void insertHistoryUpdate(Account_Form af, Date currentTimestamp) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO History (Account_Id, Username, Email, Phone_number, Update_date) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, af.getId());
            preparedStatement.setString(2, af.getUsername());
            preparedStatement.setString(3, af.getEmail());
            preparedStatement.setString(4, af.getPhone_number());
            preparedStatement.setDate(4, currentTimestamp);

            int rowsAffected = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertHistoryUpdateIfEmailNotExist(Account_Form af, Date currentTimestamp, String oldEmail) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO History (Account_Id, Email, Username, Phone_number, Update_date) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, af.getId());
            preparedStatement.setString(2, af.getEmail());
            preparedStatement.setString(3, af.getUsername());
            preparedStatement.setString(4, af.getPhone_number());
            preparedStatement.setDate(5, currentTimestamp);

            int rowsAffected = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int findTotalHistory(String accountIdRaw) {
        int totalHistory = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM History h WHERE account_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, accountIdRaw);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalHistory = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalHistory;
    }

    public List<History> findHistoryByPage(int page, String accountIdRaw) {
        List<History> listH = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM History h "
                    + "WHERE h.account_id = ? "
                    + "ORDER BY h.id "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;
            preparedStatement.setString(parameterIndex++, accountIdRaw);
            preparedStatement.setInt(parameterIndex++, (page - 1) * Constant.RECORD_PER_PAGE);
            preparedStatement.setInt(parameterIndex++, Constant.RECORD_PER_PAGE);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                History h = new History();
                h.setUpdate_date(resultSet.getDate("Update_date"));
                h.setEmail(resultSet.getString("Email"));
                h.setUsername(resultSet.getString("Username"));
                h.setPhone_number(resultSet.getString("Phone_number"));
                listH.add(h);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listH;
    }

    public void updateProductImageStatus(int idProduct, int status, Date currentTimestamp) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Image SET Status = ?, Status_date = ? WHERE Product_Id = ? ";

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, status);
            preparedStatement.setDate(2, currentTimestamp);
            preparedStatement.setInt(3, idProduct);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateQuantity(int productDetailId, int quantity) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Product_Detail SET stock = ? WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, productDetailId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addNewSeller(String email, String password) {
        String passwordEncode = bcryp.hashpw(password, bcryp.gensalt());
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Account (Email, Password, Role_Id, Status) VALUES (?, ?, 3, 1)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, passwordEncode);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Account findAccountByEmail(String email) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Account WHERE email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Account a = new Account();
                a.setEmail(resultSet.getString("Email"));
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getAccountIdSellerByEmail(String email) {
        int id = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT Id FROM Account WHERE email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("Id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public void insertAccountDetail(int accountID, String gender) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Account_Detail (Account_Id, Gender_Id) VALUES (?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, accountID);
            preparedStatement.setString(2, gender);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public DateDashboard get7day() {
        try {
            connection = this.getConnection();
            String sql = "select GETDATE(), GETDATE()-6";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DateDashboard date = DateDashboard.builder()
                        .start(rs.getDate(2))
                        .end(rs.getDate(1))
                        .build();
                return date;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int CountDayByStartEnd(String start, String end) {
        try {
            connection = this.getConnection();
            String sql = "SELECT DATEDIFF(day, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, start);
            st.setString(2, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalProduct(String end) {
        try {
            connection = this.getConnection();
            String sql = "select COUNT(*) from Product where Create_on < ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalProduct(int i, String end) {
        try {
            connection = this.getConnection();
            String sql = "select COUNT(*) from Product where category_id = ? and Create_on < ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, i);
            st.setString(2, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "Select * from Category";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = Category.builder()
                        .id(rs.getInt(1))
                        .category(rs.getString(2))
                        .build();

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Chart> getChartRevenueArea(String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String sql = "select sum(Total_Price) from Invoice where Status_Id = 3 AND Invoice_Date <= DATEADD(DAY, ?, ?) and Invoice_Date >= ?";
            try {
                connection = this.getConnection();
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                st.setString(3, start);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                sql = "select  DATEADD(DAY, ?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                rs = st.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public List<Chart> getChartCustomerArea(String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            String sql = "select count(*) from Account where Role_Id = 1 AND Created_on <= DATEADD(DAY, ?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    value = rs.getInt(1);
                }
                sql = "select  DATEADD(DAY, ?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                rs = st.executeQuery();
                while (rs.next()) {
                    Chart c = Chart.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public List<ChartStar> getChartAvgStar(String start, int day) {
        List<ChartStar> list = new ArrayList<>();
        for (int i = 1; i <= day; i++) {
            double value = 0;
            String sql = "  select CAST(AVG(Star) AS DECIMAL(10,1)) from Feedback where Date_Review < DATEADD(DAY, ?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    value = rs.getDouble(1);
                }
                sql = "select  DATEADD(DAY, ?, ?)";
                st = connection.prepareStatement(sql);
                st.setInt(1, i);
                st.setString(2, start);
                rs = st.executeQuery();
                while (rs.next()) {
                    ChartStar c = ChartStar.builder()
                            .date(rs.getDate(1))
                            .value(value)
                            .build();
                    list.add(c);
                }

            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public int countInvoiceTodays() {
        int countInvoice = 0;
        try {
            connection = this.getConnection();
            LocalDate today = LocalDate.now();
            Date todayDate = Date.valueOf(today);

            String sql = "SELECT COUNT(*) FROM Invoice WHERE Invoice_Date = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setDate(1, todayDate);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                countInvoice = resultSet.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return countInvoice;
    }

    public List<Category> getTotalCategoryID(String end) {
        List<Category> listC = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "Select Distinct Category_Id from Product where Create_on < ? AND Category_Id IS NOT NULL";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt(1));
                listC.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listC;
    }

    public List<Brand> findAllBrandWorking() {
        List<Brand> listB = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Brand b WHERE Status = 1 ORDER BY b.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Brand brand = new Brand();
                brand.setId(resultSet.getInt("Id"));
                brand.setBrand(resultSet.getString("Brand"));
                brand.setStatus(resultSet.getInt("Status"));
                listB.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listB;
    }

    public List<Category> findAllCategoryWorking() {
        List<Category> listC = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Category c WHERE Status = 1 ORDER BY c.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("Id"));
                category.setCategory(resultSet.getString("Category"));
                category.setStatus(resultSet.getInt("Status"));
                listC.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listC;
    }

    public List<Color> findAllColorWorking() {
        List<Color> listC = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Color c WHERE Status = 1 ORDER BY c.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Color color = new Color();
                color.setId(resultSet.getInt("Id"));
                color.setColor(resultSet.getString("Color"));
                color.setStatus(resultSet.getInt("Status"));
                listC.add(color);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listC;
    }

    public List<Size> findAllSizeWorking() {
        List<Size> listS = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Size s WHERE Status = 1 ORDER BY s.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Size size = new Size();
                size.setId(resultSet.getInt("Id"));
                size.setSize(resultSet.getString("Size"));
                size.setStatus(resultSet.getInt("Status"));
                listS.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listS;
    }

    public List<Gender> findAllGenderWorking() {
        List<Gender> listG = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Gender g WHERE Status = 1 ORDER BY g.id";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Gender gender = new Gender();
                gender.setId(resultSet.getInt("Id"));
                gender.setGender(resultSet.getString("Gender"));
                gender.setStatus(resultSet.getInt("Status"));
                listG.add(gender);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listG;
    }

    public void updateProductWithoutName(Product_Form productForm, int cateIdOld, int brandIdOld) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Product SET Description = ?, Price = ?, Category_Id = ?, Brand_Id = ? "
                    + "WHERE Id = ? AND Category_Id = ? AND Brand_Id = ?";

            preparedStatement = connection.prepareStatement(sql);
            
            preparedStatement.setString(1, productForm.getDescription());
            preparedStatement.setDouble(2, productForm.getPrice());
            preparedStatement.setInt(3, productForm.getCategory_id());
            preparedStatement.setInt(4, productForm.getBrand_id());
            preparedStatement.setInt(5, productForm.getId());
            preparedStatement.setInt(6, cateIdOld);
            preparedStatement.setInt(7, brandIdOld);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
