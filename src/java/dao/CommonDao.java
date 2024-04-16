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
import entity.Color;
import entity.Gender;
import entity.Image;
import entity.Invoice_Form;
import entity.Product_Detail;
import entity.Product_Form;
import entity.Account_Detail;
import entity.Cart;
import entity.Cart_Detail;
import entity.Discount;
import entity.Feedback;
import entity.Feedback_Form;
import entity.Invoice;
import entity.Invoice_Details;
import entity.Invoice_Status;
import entity.Product;
import entity.Size;
import helper.BCrypt;
import static helper.BCrypt.hashpw;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author admin
 */
public class CommonDao extends DBContext {

    BCrypt bcryp = new BCrypt();
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    public Account_Form checkExistOfAcc(Account account) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Account a "
                    + "JOIN Role r ON r.id = a.role_id "
                    + "WHERE a.status = 1 AND a.Email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getEmail());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String hashedPassword = resultSet.getString("password");

                // Kiem tra mat khau nhap vao voi mat khau ma hoa trong db
                if (hashedPassword != null && bcryp.checkpw(account.getPassword(), hashedPassword)) {
                    Account_Form af = new Account_Form();
                    af.setId(resultSet.getInt("Id"));
                    af.setEmail(resultSet.getString("Email"));
                    af.setPassword(account.getPassword());
                    af.setRole(resultSet.getString("Role"));
                    af.setRole_Id(resultSet.getInt("Role_Id"));
                    return af;
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

    public Account_Form checkExistOfAcc1(Account account) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Account a "
                    + "JOIN Role r ON r.id = a.role_id "
                    + "WHERE a.status = 1 AND a.Email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getEmail());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Account_Form af = new Account_Form();
                af.setId(resultSet.getInt("Id"));
                af.setEmail(resultSet.getString("Email"));
                af.setPassword(resultSet.getString("Password"));
                af.setRole(resultSet.getString("Role"));
                af.setRole_Id(resultSet.getInt("Role_Id"));
                return af;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean CheckAccount(Account account) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM [Account] WHERE Email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getEmail());

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean CheckAccount(Account_Form googlePojo) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM [Account] WHERE Email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, googlePojo.getEmail());

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean createAccountCustomer(Account account) {
        //Ma hoa mat khau khi them vao db
        String password = bcryp.hashpw(account.getPassword(), bcryp.gensalt());
        try {
            connection = this.getConnection();

            String sql = "INSERT INTO [dbo].[Account] ([Email], [Password], [Role_Id], [Created_on], [Status]) VALUES (?, ?, ?, ?, 1)";
            preparedStatement = connection.prepareStatement(sql);

            // Set parameters
            preparedStatement.setString(1, account.getEmail());
            preparedStatement.setString(2, password);
            preparedStatement.setInt(3, account.getRole_Id());
            preparedStatement.setDate(4, (Date) account.getCreated_on());

            // Execute the update
            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean createAccountCustomer(Account_Form googlePojo) {
        try {
            connection = this.getConnection();

            String sql = "INSERT INTO [dbo].[Account] ([Email], [Role_Id], [Created_on], [Status]) VALUES (?, ?, ?, 1)";
            preparedStatement = connection.prepareStatement(sql);

            // Set parameters
            preparedStatement.setString(1, googlePojo.getEmail());
            preparedStatement.setInt(2, googlePojo.getRole_Id());
            preparedStatement.setDate(3, (Date) googlePojo.getCreated_on());

            // Execute the update
            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product_Form> findByPage(int page) {
        List<Product_Form> productList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT p.*, cate.*, b.*, SUM(pd.Stock) as totalStockOfEachProduct FROM Product p JOIN Product_Detail pd ON pd.Product_Id = p.id \n"
                    + "JOIN Category cate ON cate.Id = p.Category_Id JOIN Brand b ON b.Id = p.Brand_Id \n"
                    + "WHERE p.status = 1 \n"
                    + "GROUP BY cate.status, b.status, p.id, p.Name, p.Image_path, p.Category_Id, p.Brand_Id, p.Price,p.Description, p.Create_on, p.Status,p.Status_date, cate.Id, cate.Category,  b.Id, b.Brand \n"
                    + "HAVING SUM(pd.Stock) > 0 ORDER BY p.create_on DESC "
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

    public int findTotalProducts() {
        int totalProduct = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) "
                    + "FROM ( "
                    + "    SELECT p.id "
                    + "    FROM Product p "
                    + "    JOIN Category c ON c.Id = p.Category_Id "
                    + "    JOIN Brand b ON b.Id = p.Brand_Id "
                    + "    JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "    WHERE p.status = 1 "
                    + "    GROUP BY p.id, p.Name, p.Image_path, p.Category_Id, p.Brand_Id, p.Price, p.Description, p.Create_on, p.Status, p.Status_date, c.Id, c.Category, b.Id, b.Brand "
                    + "    HAVING SUM(pd.Stock) > 0 "
                    + ") AS subquery";
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

    public List<Product_Form> getTop12ProductNewest() {
        List<Product_Form> productList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT TOP 12 p.*, cate.*, b.*, SUM(pd.Stock) as totalStockOfEachProduct "
                    + "FROM Product p "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "JOIN Category cate ON cate.Id = p.Category_Id "
                    + "JOIN Brand b ON b.Id = p.Brand_Id "
                    + "WHERE p.status = 1 "
                    + "GROUP BY b.status, cate.status, p.id, p.Name, p.Image_path, p.Category_Id, p.Brand_Id, p.Price,p.Description, p.Create_on, p.Status,p.Status_date, cate.Id, cate.Category,  b.Id, b.Brand "
                    + "HAVING SUM(pd.Stock) > 0 "
                    + "ORDER BY p.create_on DESC ";
            preparedStatement = connection.prepareStatement(sql);
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

    public List<Product_Form> getListProductRelated(String category, int id) {
        List<Product_Form> listPf = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT TOP 8 p.*, cate.*, b.*, SUM(pd.Stock) as totalStockOfEachProduct "
                    + "FROM Product p "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "JOIN Category cate ON cate.Id = p.Category_Id "
                    + "JOIN Brand b ON b.Id = p.Brand_Id "
                    + "WHERE p.status = 1 AND cate.category = ? AND p.id != ? "
                    + "GROUP BY cate.status, b.status, p.id, p.Name, p.Image_path, p.Category_Id, p.Brand_Id, p.Price,p.Description, p.Create_on, p.Status,p.Status_date, cate.Id, cate.Category,  b.Id, b.Brand "
                    + "HAVING SUM(pd.Stock) > 0 ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, category);
            preparedStatement.setInt(2, id);
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
                listPf.add(pf);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listPf;
    }

    public int getStockProductDetailByAllField(String productID, String colorId, String sizeId, String genderID) {
        int StockOfProductDetail = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT pd.Stock FROM Product_Detail pd "
                    + "WHERE pd.Product_Id = ? AND pd.Color_Id = ? AND pd.Gender_Id = ? AND pd.Size_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, colorId);
            preparedStatement.setString(3, genderID);
            preparedStatement.setString(4, sizeId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                StockOfProductDetail = resultSet.getInt("Stock");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return StockOfProductDetail;
    }

    public List<Gender> findGenderByColorAndSize(String productID, String colorId, String sizeId) {
        List<Gender> listG = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct g.Gender, pd.Gender_Id FROM Product_Detail pd "
                    + "JOIN Gender g ON g.Id = pd.Gender_Id "
                    + "WHERE pd.Product_Id = ? AND pd.Color_Id = ? AND pd.Size_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, colorId);
            preparedStatement.setString(3, sizeId);
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

    public List<Gender> findGenderBySize(String productID, String sizeId) {
        List<Gender> listG = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT distinct g.Gender, pd.Gender_Id FROM Product_Detail pd "
                    + "JOIN Gender g ON g.Id = pd.Gender_Id "
                    + "WHERE pd.Product_Id = ? AND pd.Size_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, productID);
            preparedStatement.setString(2, sizeId);
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

            String sql = "SELECT distinct s.Size, pd.Size_Id FROM Product_Detail pd "
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

//    public void addProductToCart(int accountID, Product_Form pf) {
//        try {
//            connection = this.getConnection();
//
//            String sql = "INSERT INTO [dbo].[Cart] ([Account_Id], [Address], [CartCode]) VALUES (?, ?, ?)";
//            preparedStatement = connection.prepareStatement(sql);
//
//            // Set parameters
//            preparedStatement.setString(1, account.getEmail());
//            preparedStatement.setString(2, password);
//            preparedStatement.setInt(3, account.getRole_Id());
//
//            // Execute the update
//            int affectedRows = preparedStatement.executeUpdate();
//            return affectedRows > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
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
                listG.add(gender);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listG;
    }

    public int changePassword(String password, int accountId) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Account SET Password = ? WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, password);
            preparedStatement.setInt(2, accountId);
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                return 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }

    public Account_Form editAccountDetails(Account_Form af) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Account_Detail SET Phone_Number = ?, "
                    + "Gender_Id = ?, "
                    + "Dob = ?, "
                    + "Address = ?, "
                    + "Username = ? "
                    + "WHERE Account_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, af.getPhone_number());
            preparedStatement.setInt(2, af.getGender_id());
            preparedStatement.setDate(3, (Date) af.getDob());
            preparedStatement.setString(4, af.getAddress());
            preparedStatement.setString(5, af.getUsername());
            preparedStatement.setInt(6, af.getId());

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                sql = "Select * FROM Account_Detail ad JOIN  Gender g ON ad.Gender_Id = g.Id WHERE Account_Id = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, af.getId());
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    af = new Account_Form();
                    af.setAddress(resultSet.getString("Address"));
                    af.setPhone_number(resultSet.getString("Phone_Number"));
                    af.setDob(resultSet.getDate("Dob"));
                    af.setGender(resultSet.getString("Gender"));
                    af.setGender_id(resultSet.getInt("Gender_Id"));
                    af.setUsername(resultSet.getString("Username"));
                    return af;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account_Form findProfileById(Account_Form account) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Account_Detail ad LEFT JOIN Gender g ON ad.Gender_Id = g.id WHERE Account_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, account.getId());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Account_Form af = new Account_Form();
                af.setAddress(resultSet.getString("Address"));
                af.setPhone_number(resultSet.getString("Phone_Number"));
                af.setDob(resultSet.getDate("Dob"));
                af.setGender(resultSet.getString("Gender"));
                af.setGender_id(resultSet.getInt("Gender_Id"));
                af.setUsername(resultSet.getString("Username"));
                return af;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkExistOfAccountDetail(Account_Form af) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Account_Detail ad WHERE ad.Account_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, af.getId());

            resultSet = preparedStatement.executeQuery();

            // Check if resultSet has any rows
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Account_Form insertAccountDetails(Account_Form af) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Account_Detail "
                    + "(Phone_Number, Gender_Id, Dob, Address, Username, Account_Id) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, af.getPhone_number());
            preparedStatement.setInt(2, af.getGender_id());
            preparedStatement.setDate(3, (Date) af.getDob());
            preparedStatement.setString(4, af.getAddress());
            preparedStatement.setString(5, af.getUsername());
            preparedStatement.setInt(6, af.getId());

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                sql = "Select * FROM Account_Detail ad LEFT JOIN Gender g ON ad.Gender_Id = g.id WHERE Account_Id = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, af.getId());
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    af = new Account_Form();
                    af.setAddress(resultSet.getString("Address"));
                    af.setPhone_number(resultSet.getString("Phone_Number"));
                    af.setDob(resultSet.getDate("Dob"));
                    af.setGender(resultSet.getString("Gender"));
                    af.setGender_id(resultSet.getInt("Gender_Id"));
                    af.setUsername(resultSet.getString("Username"));
                    return af;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Invoice_Form> findAllInvoiceByAccountId(int page, Account_Form account) {
        List<Invoice_Form> listIf = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT i.ID, i.CartCode, i.Invoice_Date, ad.Username, a.Email, i.address, i.Total_Price, ist.Id\n"
                    + "FROM Invoice i\n"
                    + "LEFT JOIN Account a ON i.Account_Id = a.ID \n"
                    + "LEFT JOIN Account_Detail ad ON a.ID = ad.Account_ID \n"
                    + "LEFT JOIN Invoice_Status ist ON i.Status_Id = ist.ID WHERE i.Account_Id = ? "
                    + "	ORDER BY i.Invoice_Date DESC "
                    + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, account.getId());
            preparedStatement.setInt(2, (page - 1) * 2);
            preparedStatement.setInt(3, 2);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Invoice_Form invoiceF = new Invoice_Form();
                invoiceF.setId(resultSet.getInt("ID"));
                invoiceF.setCartCode(resultSet.getString("CartCode"));
                invoiceF.setInvoice_date(resultSet.getDate("Invoice_Date"));
                invoiceF.setUsername(resultSet.getString("Username"));
                invoiceF.setEmail(resultSet.getString("Email"));
                invoiceF.setAddress(resultSet.getString("address"));
                invoiceF.setTotalPrice(resultSet.getFloat("Total_Price"));
                invoiceF.setStatus_id(resultSet.getInt("Id"));
                listIf.add(invoiceF);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return listIf;
    }

    public List<Invoice_Form> getInvoiceDetails(int page, String invoiceID) {
        List<Invoice_Form> listIf = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT ist.Id as Status_Id, p.Id as productID, i.Total_Price, p.Name, pd.Id , id.Quantity, id.Price, id.TotalPrice, c.Color, s.Size, g.Gender, b.Brand, cate.Category FROM Invoice i JOIN Invoice_Detail id ON id.Invoice_Id = i.Id \n"
                    + " JOIN Product p ON p.Id = id.Product_Id JOIN Product_Detail pd ON pd.Id = id.ProductDetail_Id \n"
                    + "JOIN Category cate ON cate.Id = p.Category_Id JOIN Brand b ON b.Id = p.Brand_Id \n"
                    + "JOIN Color c ON c.Id = pd.Color_Id JOIN Size s ON s.id = pd.Size_Id JOIN Gender g ON g.Id =pd.Gender_Id \n"
                    + "JOIN Invoice_Status ist ON ist.Id = i.Status_Id \n"
                    + " WHERE i.Id = ? \n"
                    + " GROUP BY ist.Id, p.Id, i.Total_Price, p.Name, id.Id, pd.Id, id.Quantity, id.Price, id.TotalPrice, c.Color, s.Size, g.Gender, b.Brand, cate.Category "
                    + "   Order by id.Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, invoiceID);
            preparedStatement.setInt(2, (page - 1) * 5);
            preparedStatement.setInt(3, 5);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Invoice_Form invoiceF = new Invoice_Form();
                invoiceF.setProductName(resultSet.getString("Name"));
                invoiceF.setProductQuantity(resultSet.getInt("Quantity"));
                invoiceF.setPrice(resultSet.getFloat("Price"));
                invoiceF.setTotalPrice(resultSet.getFloat("TotalPrice"));
                invoiceF.setProductColor(resultSet.getString("Color"));
                invoiceF.setProductSize(resultSet.getString("Size"));
                invoiceF.setProductGender(resultSet.getString("Gender"));
                invoiceF.setProductBrand(resultSet.getString("Brand"));
                invoiceF.setProductCategory(resultSet.getString("Category"));
                invoiceF.setProduct_id(resultSet.getInt("productID"));
                invoiceF.setStatus_id(resultSet.getInt("Status_Id"));
                listIf.add(invoiceF);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return listIf;
    }

    public int addToCart(int accountID, String address) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Cart (Account_Id, Address) VALUES (?, ?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, accountID);
            preparedStatement.setString(2, address);

            int rowsAffected = preparedStatement.executeUpdate();

            preparedStatement.close();

            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int getProductDetail(Product_Form pf) {
        int productDetailId = 0;
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product_Detail WHERE "
                    + "Product_Id = ? AND Color_Id = ? "
                    + "AND Size_Id = ? AND Gender_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, pf.getProduct_id());
            preparedStatement.setInt(2, pf.getColor_id());
            preparedStatement.setInt(3, pf.getSize_id());
            preparedStatement.setInt(4, pf.getGender_id());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                productDetailId = resultSet.getInt("Id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productDetailId;
    }

    public int getCartByAccId(int accountID) {
        int cartId = 0;
        try {
            connection = this.getConnection();
            String sql = "SELECT Id FROM Cart WHERE Account_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, accountID);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                cartId = resultSet.getInt("Id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartId;
    }

    public int addToCartDetail(int productDetailId, int cartId, Product_Form pf) {
        try {
            connection = this.getConnection();
            String sql = "INSERT INTO Cart_Detail(Product_Detail_Id, Create_at, Quantity, Cart_Id, Product_Id) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, productDetailId);
            preparedStatement.setDate(2, (Date) pf.getCreated_on());
            preparedStatement.setInt(3, pf.getQuantity());
            preparedStatement.setInt(4, cartId);
            preparedStatement.setInt(5, pf.getProduct_id());

            int rowsAffected = preparedStatement.executeUpdate();

            preparedStatement.close();

            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<Product_Form> findCartByAccountId(int accountID) {
        List<Product_Form> listPf = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT c.Id as CartID, c.Account_Id, p.Image_path, p.Name, SUM(p.Price * cd.Quantity) AS TotalPrice, co.Color, s.Size, g.Gender, cd.Product_Detail_Id, cd.Product_Id, SUM(cd.Quantity) AS TotalQuantity \n"
                    + "FROM Cart c JOIN Cart_Detail cd ON cd.Cart_Id = c.Id \n"
                    + "JOIN Product p ON p.Id = cd.Product_Id\n"
                    + "JOIN Product_Detail pd ON pd.Id = cd.Product_Detail_Id\n"
                    + "JOIN Color co ON co.Id = pd.Color_Id\n"
                    + "JOIN Size s ON s.Id = pd.Size_Id\n"
                    + "JOIN Gender g ON g.Id = pd.Gender_Id\n"
                    + "WHERE c.Account_Id = ? GROUP BY  c.Id, c.Account_Id, p.image_path, cd.Product_Detail_Id, cd.Product_Id, p.Name, p.Price, co.Color, s.Size, g.Gender";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, accountID);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product_Form pf = new Product_Form();
                pf.setImage_path(resultSet.getString("Image_path"));
                pf.setName(resultSet.getString("Name"));
                pf.setPrice(resultSet.getFloat("TotalPrice"));
                pf.setColor(resultSet.getString("Color"));
                pf.setSize(resultSet.getString("Size"));
                pf.setGender(resultSet.getString("Gender"));
                pf.setQuantity(resultSet.getInt("TotalQuantity"));
                pf.setAccount_id(resultSet.getInt("Account_Id"));
                pf.setProduct_id(resultSet.getInt("Product_Detail_Id"));
                pf.setId(resultSet.getInt("Product_Id"));
                pf.setCart_id(resultSet.getInt("CartID"));
                listPf.add(pf);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPf;
    }

    public int findTotalPriceInCart(int id) {
        int totalPrice = 0;
        try {
            connection = this.getConnection();
            String sql = "SELECT SUM(TotalPrice) AS TotalPriceAll FROM (\n"
                    + "    SELECT SUM(p.Price * cd.Quantity) AS TotalPrice FROM Cart c JOIN \n"
                    + "        Cart_Detail cd ON cd.Cart_Id = c.Id JOIN Product_Detail pd ON pd.Id = cd.Product_Detail_Id JOIN Product p ON p.Id = pd.Product_Id WHERE  c.Account_Id = ? GROUP BY cd.Product_Detail_Id\n" // Added space before GROUP BY
                    + ") AS Subquery;";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                totalPrice = resultSet.getInt("TotalPriceAll");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPrice;
    }

    public void removeItemInCartDetail(int productID, int productDetailID) {
        try {
            Connection connection = getConnection();

            String sql = "DELETE FROM Cart_Detail WHERE Product_Id = ? AND Product_Detail_Id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            preparedStatement.setInt(2, productDetailID);

            int rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean findExistCartByAccountId(int accountID) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Cart c "
                    + "WHERE c.Account_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, accountID);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean findExistCartDetail(int cartID, int productDetailID) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Cart_Detail cd "
                    + "WHERE cd.Cart_Id = ? AND productDetailID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, cartID);
            preparedStatement.setInt(2, productDetailID);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
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
                listC.add(color);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listC;
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
                listS.add(size);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listS;
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
                listB.add(brand);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listB;
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
                listC.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listC;
    }

    public List<Product_Form> findByPage(int page, String sortedByPrice, String sortedByDate, String[] brandID, String[] cateID, String[] colorID, String[] sizeID, String[] genderID) {
        List<Product_Form> productList = new ArrayList<>();
        try {
            connection = this.getConnection();
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT p.*, cate.*, b.*, SUM(pd.Stock) as totalStockOfEachProduct FROM Product p ");
            sqlBuilder.append("JOIN Product_Detail pd ON pd.Product_Id = p.id ");
            sqlBuilder.append("JOIN Category cate ON cate.Id = p.Category_Id ");
            sqlBuilder.append("JOIN Brand b ON b.Id = p.Brand_Id ");
            sqlBuilder.append("JOIN Color c ON c.Id = pd.Color_Id ");
            sqlBuilder.append("JOIN Size s ON s.Id = pd.Size_Id ");
            sqlBuilder.append("JOIN Gender g ON g.Id = pd.Gender_Id ");
            sqlBuilder.append("WHERE p.status = 1 ");

            if (brandID != null && brandID.length > 0) {
                sqlBuilder.append("AND b.Id IN (");
                for (int i = 0; i < brandID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < brandID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            if (cateID != null && cateID.length > 0) {
                sqlBuilder.append("AND cate.Id IN (");
                for (int i = 0; i < cateID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < cateID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            if (colorID != null && colorID.length > 0) {
                sqlBuilder.append("AND c.Id IN (");
                for (int i = 0; i < colorID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < colorID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            if (sizeID != null && sizeID.length > 0) {
                sqlBuilder.append("AND s.Id IN (");
                for (int i = 0; i < sizeID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < sizeID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            if (genderID != null && genderID.length > 0) {
                sqlBuilder.append("AND g.Id IN (");
                for (int i = 0; i < genderID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < genderID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            sqlBuilder.append("GROUP BY b.Status, cate.Status, p.id, p.Name, p.Image_path, p.Category_Id, p.Brand_Id, p.Price,p.Description, p.Create_on, p.Status,p.Status_date, cate.Id, cate.Category,  b.Id, b.Brand ");
            sqlBuilder.append("HAVING SUM(pd.Stock) > 0 ");

            sqlBuilder.append("ORDER BY CASE WHEN ? = 'desc' THEN p.price END DESC, "
                    + "CASE WHEN ? = 'asc' THEN p.price END ASC, "
                    + "CASE WHEN ? = 'desc' THEN p.Create_on END DESC, "
                    + "CASE WHEN ? = 'asc' THEN p.Create_on END ASC "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY ");

            preparedStatement = connection.prepareStatement(sqlBuilder.toString());
            int parameterIndex = 1;

            if (brandID != null && brandID.length > 0) {
                for (String brand : brandID) {
                    preparedStatement.setString(parameterIndex++, brand);
                }
            }
            if (cateID != null && cateID.length > 0) {
                for (String cate : cateID) {
                    preparedStatement.setString(parameterIndex++, cate);
                }
            }
            if (colorID != null && colorID.length > 0) {
                for (String color : colorID) {
                    preparedStatement.setString(parameterIndex++, color);
                }
            }
            if (sizeID != null && sizeID.length > 0) {
                for (String size : sizeID) {
                    preparedStatement.setString(parameterIndex++, size);
                }
            }
            if (genderID != null && genderID.length > 0) {
                for (String gender : genderID) {
                    preparedStatement.setString(parameterIndex++, gender);
                }
            }
            preparedStatement.setString(parameterIndex++, sortedByPrice);
            preparedStatement.setString(parameterIndex++, sortedByPrice);
            preparedStatement.setString(parameterIndex++, sortedByDate);
            preparedStatement.setString(parameterIndex++, sortedByDate);
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

    public int findTotalProducts(String[] brandID, String[] cateID, String[] colorID, String[] sizeID, String[] genderID) {
        int totalProduct = 0;
        try {
            connection = this.getConnection();
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT COUNT(*) AS TotalProduct\n"
                    + "FROM (\n"
                    + "    SELECT p.id\n"
                    + "    FROM Product p\n"
                    + "    JOIN Product_Detail pd ON pd.Product_Id = p.id\n"
                    + "    JOIN Category cate ON cate.Id = p.Category_Id \n"
                    + "    JOIN Brand b ON b.Id = p.Brand_Id \n"
                    + "    JOIN Color c ON c.Id = pd.Color_Id \n"
                    + "    JOIN Size s ON s.Id = pd.Size_Id \n"
                    + "    JOIN Gender g ON g.Id = pd.Gender_Id \n"
                    + "    WHERE p.status = 1 ");

            if (brandID != null && brandID.length > 0) {
                sqlBuilder.append("AND b.Id IN (");
                for (int i = 0; i < brandID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < brandID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            if (cateID != null && cateID.length > 0) {
                sqlBuilder.append("AND cate.Id IN (");
                for (int i = 0; i < cateID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < cateID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            if (colorID != null && colorID.length > 0) {
                sqlBuilder.append("AND c.Id IN (");
                for (int i = 0; i < colorID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < colorID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            if (sizeID != null && sizeID.length > 0) {
                sqlBuilder.append("AND s.Id IN (");
                for (int i = 0; i < sizeID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < sizeID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            if (genderID != null && genderID.length > 0) {
                sqlBuilder.append("AND g.Id IN (");
                for (int i = 0; i < genderID.length; i++) {
                    sqlBuilder.append("?");
                    if (i < genderID.length - 1) {
                        sqlBuilder.append(",");
                    }
                }
                sqlBuilder.append(") ");
            }
            sqlBuilder.append("GROUP BY p.id, p.Name, p.Image_path, p.Category_Id, p.Brand_Id, p.Price,p.Description, p.Create_on, p.Status,p.Status_date, cate.Id, cate.Category,  b.Id, b.Brand ");
            sqlBuilder.append("HAVING SUM(pd.Stock) > 0 ");
            sqlBuilder.append(") as query ");
            preparedStatement = connection.prepareStatement(sqlBuilder.toString());
            int parameterIndex = 1;

            if (brandID != null && brandID.length > 0) {
                for (String brand : brandID) {
                    preparedStatement.setString(parameterIndex++, brand);
                }
            }
            if (cateID != null && cateID.length > 0) {
                for (String cate : cateID) {
                    preparedStatement.setString(parameterIndex++, cate);
                }
            }
            if (colorID != null && colorID.length > 0) {
                for (String color : colorID) {
                    preparedStatement.setString(parameterIndex++, color);
                }
            }
            if (sizeID != null && sizeID.length > 0) {
                for (String size : sizeID) {
                    preparedStatement.setString(parameterIndex++, size);
                }
            }
            if (genderID != null && genderID.length > 0) {
                for (String gender : genderID) {
                    preparedStatement.setString(parameterIndex++, gender);
                }
            }
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalProduct = resultSet.getInt("TotalProduct");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalProduct;
    }

    public int countWomenProduct() {
        int totalProduct = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) "
                    + "FROM ( "
                    + "    SELECT p.id "
                    + "    FROM Product p "
                    + "    JOIN Category c ON c.Id = p.Category_Id "
                    + "    JOIN Brand b ON b.Id = p.Brand_Id "
                    + "    JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "    WHERE p.status = 1 AND pd.Gender_Id = 2 "
                    + "    GROUP BY p.id, p.Name, p.Image_path, p.Category_Id, p.Brand_Id, p.Price, p.Description, p.Create_on, p.Status, p.Status_date, c.Id, c.Category, b.Id, b.Brand "
                    + "    HAVING SUM(pd.Stock) > 0 "
                    + ") AS subquery";
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

    public int countMenProduct() {
        int totalProduct = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) "
                    + "FROM ( "
                    + "    SELECT p.id "
                    + "    FROM Product p "
                    + "    JOIN Category c ON c.Id = p.Category_Id "
                    + "    JOIN Brand b ON b.Id = p.Brand_Id "
                    + "    JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "    WHERE p.status = 1 AND pd.Gender_Id = 1 "
                    + "    GROUP BY p.id, p.Name, p.Image_path, p.Category_Id, p.Brand_Id, p.Price, p.Description, p.Create_on, p.Status, p.Status_date, c.Id, c.Category, b.Id, b.Brand "
                    + "    HAVING SUM(pd.Stock) > 0 "
                    + ") AS subquery";
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

    public List<Image> selectTop10DistinctImageProduct() {
        List<Image> listI = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT Distinct TOP 10 i.Product_Id, i.Image FROM Image i";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Image i = new Image();
                i.setProduct_Id(resultSet.getInt("Product_Id"));
                i.setImage(resultSet.getString("Image"));
                listI.add(i);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listI;
    }

    public void cancelInvoice(int invoiceId) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Invoice SET Status_Id = 4 WHERE Id = ?;";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int countAllInvoiceByAccountId(Account_Form account) {
        int countI = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) AS NumberOfInvoices FROM ( \n"
                    + "SELECT i.ID, i.CartCode, i.Invoice_Date, ad.Username, a.Email, i.address, i.Total_Price, ist.Status\n"
                    + "FROM Invoice i\n"
                    + "LEFT JOIN Account a ON i.Account_Id = a.ID \n"
                    + " LEFT JOIN Account_Detail ad ON a.ID = ad.Account_ID\n"
                    + " LEFT JOIN Invoice_Status ist ON i.Status_Id = ist.ID WHERE i.Account_Id = ?\n"
                    + " ) AS Subquery";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, account.getId());
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                countI = resultSet.getInt("NumberOfInvoices");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return countI;
    }

    public int countAllInvoiceDetails(String invoiceID) {
        int countInvoiceDetail = 0;
        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) AS countInvoiceDetails FROM Invoice_Detail id "
                    + "WHERE id.Invoice_Id = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, invoiceID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                countInvoiceDetail = resultSet.getInt("countInvoiceDetails");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return countInvoiceDetail;
    }

    /**
     * Methods description: Checks the existence of an account by email.
     *
     * @param email - The email to be checked.
     * @return true if the account with the specified email exists; otherwise,
     * false.
     */
    public boolean checkAccountExistByEmail(String email) {
        try {
            connection = this.getConnection();
            String query = "SELECT * FROM Account WHERE Email=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * Methods description: Gets the account ID based on the email given.
     *
     * @param email - The email for which the account ID is needed.
     * @return the account ID of the email given; otherwise, -1.
     */
    public int getAccountIdByEmail(String email) {
        try {
            String query = "SELECT id FROM Account WHERE Email=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public String getEmailByAccountId(int accId) {
        try {
            String query = "SELECT Email FROM Account WHERE id=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, accId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Email");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Methods description: Checks the existence of OTP Code by email.
     *
     * @param email - The email of account to be checked.
     * @return true if the OTP Code matched; otherwise, false.
     */
    public String getOTPByEmail(String email) {
        try {
            String query = "SELECT Verify_Code FROM Account WHERE Email=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Verify_Code");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Methods description: Updates the password for the specified account.
     *
     * @param newPassword - The new password to be set.
     * @param accountId - The ID of the account for which the password should be
     * updated.
     */
    public void updatePasswordById(String newPassword, int accountId) {
        String password = bcryp.hashpw(newPassword, bcryp.gensalt());
        String query = "UPDATE Account Set password = ? Where Id = ?";
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, password);
            preparedStatement.setInt(2, accountId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * Methods description: Add OTP Code for Account with the given Email, It
     * also includes a scheduled task to automatically delete the OTP code after
     * a specified delay in minutes.
     *
     * @param code - The OTP Code to be add.
     * @param email - The Email of the account for which the OTP Code added.
     */
    public void addOTPForAccountByEmail(String code, String email) {
        String query = "UPDATE Account Set Verify_Code = ? Where Email = ?";
        try {
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, code);
            preparedStatement.setString(2, email);
            preparedStatement.executeUpdate();

            //Schedule a task to delete the OTP associated with the given Email after a specified delay.
            scheduleTaskToDeleteOTP(email, 5);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * Methods description: Schedule a task to delete the OTP Code associated
     * with the given Email after a specified delay.
     *
     * @param email - The email for which the OTP Code is to be deleted
     * @param delayInMinutes - The delay in minutes before deleting the OTP
     * Code.
     */
    public void scheduleTaskToDeleteOTP(String email, int delayInMinutes) {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
        scheduler.schedule(() -> {
            try {
                deleteOTPByEmail(email);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }, delayInMinutes, TimeUnit.MINUTES);
    }

    /**
     * Methods description: Delete OTP Code associated with the given Email.
     *
     * @param email - The email for which the OTP Code is to be deleted.
     * @throws SQLException - If a database access error occurs.
     */
    public void deleteOTPByEmail(String email) throws SQLException {
        String deleteQuery = "UPDATE Account SET Verify_Code  = NULL WHERE Email = ?";
        preparedStatement = connection.prepareStatement(deleteQuery);
        preparedStatement.setString(1, email);
        preparedStatement.executeUpdate();
    }

    /**
     *
     * @param productId
     */
    public void deleteProductInCartDetailByProductId(int productId) {
        try {
            String query = "DELETE FROM Cart_Detail WHERE Product_Id = ?";
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * Method description: Generates a random password with 8 characters.
     *
     * @return A String representing the randomly generated password.
     */
    public String generateRandomPassword() {
        String capitalChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String smallChars = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String symbols = "!@#$%^&*?)";

        String values = capitalChars + smallChars + numbers + symbols;
        Random random = new Random();
        StringBuilder password = new StringBuilder(8);
        for (int i = 0; i < 8; i++) {
            password.append(values.charAt(random.nextInt(values.length())));
        }
        return password.toString();
    }

    /**
     * Method description: Generates a random OTP Code with 6 characters.
     *
     * @return A character array representing the randomly generated OTP Code.
     */
    public String generateRandomOTP() {
        int otpLength = 6;
        String digits = "0123456789";
        Random random = new Random();
        StringBuilder otp = new StringBuilder(otpLength);

        for (int i = 0; i < otpLength; i++) {
            otp.append(digits.charAt(random.nextInt(digits.length())));
        }
        return otp.toString();
    }

    /**
     * Method description: Generates a random Cart code with 12 characters.
     *
     * @return A character array representing the randomly generated Cart Code.
     */
    public String generateRandomCartCode() {
        String capitalChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String smallChars = "abcdefghijklmnopqrstuvwxyz";

        String values = capitalChars + smallChars;
        Random random = new Random();
        StringBuilder password = new StringBuilder(14);
        for (int i = 0; i < 12; i++) {
            password.append(values.charAt(random.nextInt(values.length())));
        }
        password.insert(4, '-');
        password.insert(9, '-');
        return password.toString();
    }

    /**
     * Method description: Retrieves a list of active discounts.
     *
     * @return List of active discounts.
     */
    public List<Discount> getActiveDiscountList() {
        List<Discount> DisList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String query = "Select * From Discount Where [Status] = 1 AND Quantity > 0";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Discount dis = Discount.builder()
                        .id(resultSet.getInt("Id"))
                        .create_at(resultSet.getDate("Create_at"))
                        .discount_percent(resultSet.getInt("Discount_percent"))
                        .status(resultSet.getInt("Status"))
                        .quantity(resultSet.getInt("Quantity"))
                        .build();
                DisList.add(dis);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return DisList;
    }

    /**
     * Method description: Retrieves account information based on the provided
     * account ID.
     *
     * @param accId - The ID of the account to retrieve information for.
     * @return Account information associated with the provided account ID.
     */
    public Account getAccountInformationByAccountId(int accId) {
        try {
            connection = this.getConnection();
            String query = "SELECT a.Id AS Account_Id, a.Email, a.Role_Id, \n"
                    + "ad.Id AS Account_Detail_Id, ad.[Address],ad.Dob,ad.Gender_Id,ad.Phone_Number,ad.Username\n"
                    + "                    FROM Account a LEFT JOIN Account_Detail ad ON a.Id=ad.Account_Id\n"
                    + "                    WHERE a.Id=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, accId);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Account_Detail account_detail = Account_Detail.builder()
                        .id(resultSet.getInt("Account_Detail_Id"))
                        .phone_number(resultSet.getString("Phone_Number"))
                        .dob(resultSet.getDate("Dob"))
                        .address(resultSet.getString("Address"))
                        .username(resultSet.getString("Username"))
                        .build();
                Account acc = Account.builder()
                        .id(resultSet.getInt("Account_Id"))
                        .email(resultSet.getString("Email"))
                        .role_Id(resultSet.getInt("Role_Id"))
                        .acc_det(account_detail)
                        .build();
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Method description: Retrieves the details of shopping carts associated
     * with a specific account ID.
     *
     * @param accId The ID of the account for which shopping cart details are to
     * be retrieved.
     * @return A list of Cart objects containing the details of the shopping
     * carts.
     */
    public List<Cart> getShoppingCartDetailsByAccountId(int accId) {
        List<Cart> CList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String query = "SELECT co.Id as colorID, s.Id as sizeID, g.Id as genderID, ad.Address, pd.Stock, p.Price, b.Brand, cate.Category, c.Id as CartID, c.Account_Id, p.Image_path, p.Name, SUM(p.Price * cd.Quantity) AS TotalPrice, co.Color, s.Size, g.Gender as GenderName, cd.Product_Detail_Id, cd.Product_Id, SUM(cd.Quantity) AS TotalQuantity\n"
                    + "FROM Cart c JOIN Cart_Detail cd ON cd.Cart_Id = c.Id \n"
                    + "JOIN Product p ON p.Id = cd.Product_Id\n"
                    + "JOIN Product_Detail pd ON pd.Id = cd.Product_Detail_Id\n"
                    + "JOIN Color co ON co.Id = pd.Color_Id\n"
                    + "JOIN Size s ON s.Id = pd.Size_Id\n"
                    + "JOIN Gender g ON g.Id = pd.Gender_Id\n"
                    + "JOIN Category cate ON cate.Id =p.Category_Id\n"
                    + "JOIN Brand b ON b.Id = p.Brand_Id\n"
                    + "JOIN Account_Detail ad ON ad.Account_Id  = c.Account_Id\n"
                    + " Where (c.Account_Id = ?) GROUP BY  co.Id, s.Id, g.Id, ad.Address, pd.Stock, p.Price, b.Brand, cate.Category, c.Id, c.Account_Id, p.image_path, cd.Product_Detail_Id, cd.Product_Id, p.Name, p.Price, co.Color, s.Size, g.Gender";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, accId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Color color = Color.builder()
                        .id(resultSet.getInt("colorID"))
                        .color(resultSet.getString("Color"))
                        .build();
                Size size = Size.builder()
                        .id(resultSet.getInt("sizeID"))
                        .size(resultSet.getString("Size"))
                        .build();
                Category category = Category.builder()
                        .category(resultSet.getString("Category"))
                        .build();
                Gender g = Gender.builder()
                        .id(resultSet.getInt("genderID"))
                        .gender(resultSet.getString("GenderName")).build();
                Product product = Product.builder()
                        .name(resultSet.getString("Name"))
                        .price(resultSet.getDouble("Price"))
                        .image_path(resultSet.getString("Image_path"))
                        .build();
                Product_Detail productDetail = Product_Detail.builder()
                        .id(resultSet.getInt("Product_Detail_Id"))
                        .stock(resultSet.getInt("Stock"))
                        .build();
                Cart_Detail cartDetail = Cart_Detail.builder()
                        .product_id(resultSet.getInt("Product_Id"))
                        .quantity(resultSet.getInt("TotalQuantity"))
                        .build();
                Cart c = Cart.builder()
                        .id(resultSet.getInt("CartID"))
                        .account_id(resultSet.getInt("Account_Id"))
                        .address(resultSet.getString("Address"))
                        .c_Det(cartDetail)
                        .p_Det(productDetail)
                        .p(product)
                        .c(color)
                        .cate(category)
                        .s(size)
                        .gen(g)
                        .build();
                CList.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return CList;
    }

    /**
     *
     * @param invoiceId
     * @return
     */
    public List<Invoice> getInvoiceListById(int invoiceId) {
        List<Invoice> IList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String query = "SELECT i.Id AS Invoice_Id, i.Account_Id, i.Invoice_Date, i.Total_Price , i.CartCode, i.[Address], i.Discount_percent,i.SubTotal_Price,\n"
                    + "id.Product_Id, id.Quantity, id.TotalPrice AS Total_Price_Per_Product, id.Id AS Invoice_Detail_Id,\n"
                    + "ist.[Status],\n"
                    + "p.[Name] AS Product_Name, p.Price AS Product_Price\n"
                    + "FROM Invoice i JOIN Invoice_Detail id ON i.Id = id.Invoice_Id\n"
                    + "               JOIN Invoice_Status ist ON i.Status_Id = ist.Id\n"
                    + "               JOIN Product p ON id.Product_Id = p.Id\n"
                    + "WHERE i.Id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, invoiceId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = Product.builder()
                        .name(resultSet.getString("Product_Name"))
                        .price(resultSet.getDouble("Product_Price"))
                        .build();
                Invoice_Status invoiceStatus = Invoice_Status.builder()
                        .status(resultSet.getString("Status"))
                        .build();
                Invoice_Details invoiceDetail = Invoice_Details.builder()
                        .product_id(resultSet.getInt("Product_Id"))
                        .quantity(resultSet.getInt("Quantity"))
                        .totalPrice(resultSet.getFloat("Total_Price_Per_Product"))
                        .id(resultSet.getInt("Invoice_Detail_Id"))
                        .build();
                Invoice invoice = Invoice.builder()
                        .id(resultSet.getInt("Invoice_Id"))
                        .account_id(resultSet.getInt("Account_Id"))
                        .invoice_date(resultSet.getDate("Invoice_Date"))
                        .total_price(resultSet.getFloat("Total_Price"))
                        .cartCode(resultSet.getString("CartCode"))
                        .address(resultSet.getString("Address"))
                        .discount_percent(resultSet.getDouble("Discount_percent"))
                        .subtotal_price(resultSet.getDouble("SubTotal_Price"))
                        .in_de(invoiceDetail)
                        .in_st(invoiceStatus)
                        .pro(product)
                        .build();
                IList.add(invoice);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return IList;
    }

    /**
     * Methods description: Updates the quantity of a product in the cart detail
     * based on the product ID.
     *
     * @param quantity - The new quantity of the product.
     * @param productId - The product ID to identify the product in the cart.
     */
    public void updateQuantityByProductId(int quantity, int productId) {
        String query = "UPDATE Cart_Detail Set quantity = ? Where Product_Id = ?";
        try {
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, productId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * Methods description: Add Cart code for Cart with the given Id.
     *
     * @param cartCode - The Cart code to be add.
     * @param accId - The id of the cart for which the Cart code added.
     */
    public void addCartCodeForCartByAccountId(String cartCode, int accId) {
        String query = "UPDATE Cart Set CartCode = ? Where Account_Id = ?";
        try {
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, cartCode);
            preparedStatement.setInt(2, accId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     *
     * @param accId
     * @param invoiceDate
     * @param totalPrice
     * @param cartCode
     * @param address
     * @param discountPercent
     */
    public void addInvoice(int accId, Date invoiceDate, double totalPrice, String cartCode, String address, double discountPercent, double subTotalPrice) {
        String query = "  INSERT INTO Invoice (Account_Id, Invoice_Date, Total_Price, CartCode, [Address], Status_Id, SubTotal_Price, Discount_Percent) \n"
                + "  VALUES (?,?,?,?,?,1,?,?)";
        try {
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, accId);
            preparedStatement.setDate(2, (java.sql.Date) invoiceDate);
            preparedStatement.setDouble(3, totalPrice);
            preparedStatement.setString(4, cartCode);
            preparedStatement.setString(5, address);
            preparedStatement.setDouble(6, subTotalPrice);
            preparedStatement.setDouble(7, discountPercent);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     *
     * @param cartCode
     * @return
     */
    public int getInvoiceIdByCartCode(String cartCode) {
        String query = "SELECT * FROM Invoice WHERE CartCode=?";
        try {
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, cartCode);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @param invoiceId
     * @param productId
     * @param quantity
     * @param unitPrice
     * @param totalPricePerProduct
     */
    public void addInvoiceDetail(int productDetailId, int invoiceId, int productId, int quantity, double unitPrice, double totalPricePerProduct) {
        String query = "  INSERT INTO Invoice_Detail (ProductDetail_Id, Invoice_Id, Product_Id, Quantity, Price, TotalPrice ) \n"
                + "  VALUES (?,?,?,?,?,?)";
        try {
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productDetailId);
            preparedStatement.setInt(2, invoiceId);
            preparedStatement.setInt(3, productId);
            preparedStatement.setInt(4, quantity);
            preparedStatement.setDouble(5, unitPrice);
            preparedStatement.setDouble(6, totalPricePerProduct);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     *
     * @param cartId
     */
    public void deleteCartDetailByCartId(int cartId) {
        try {
            String query = "DELETE FROM Cart_Detail WHERE Cart_Id = ?";
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, cartId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     *
     * @param Id
     */
    public void deleteCartById(int Id) {
        try {
            String query = "DELETE FROM Cart WHERE Id = ?";
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     *
     * @param stock
     * @param productId
     */
    public void updateProductDetailStock(int stock, int productId) {
        String query = "UPDATE Product_Detail Set Stock = ? Where Product_Id = ?";
        try {
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, stock);
            preparedStatement.setInt(2, productId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addNewFeedback(Feedback f) {
        try {
            connection = this.getConnection();
            String query = "  INSERT INTO Feedback (Account_Id, Product_Id, [Content], Star, Image, Date_Review) \n"
                    + "  VALUES (?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, f.getAccount_id());
            preparedStatement.setInt(2, f.getProduct_id());
            preparedStatement.setString(3, f.getContent());
            preparedStatement.setInt(4, f.getStar());
            preparedStatement.setString(5, f.getImage());
            preparedStatement.setDate(6, (Date) f.getDate_review());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getStarByProductId(int productID) {
        String query = "select SUM(Star) as star from Feedback WHERE Product_Id = ? ";
        try {
            connection = this.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("star");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int getFeedbackByProductId(int productID) {
        try {
            connection = this.getConnection();
            String sql = "SELECT COUNT(*) as feedback from Feedback WHERE Product_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("feedback");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public Feedback findFeedback(int accountID, int productID) {
        try {
            connection = this.getConnection();
            String query = "SELECT * from Feedback WHERE Product_Id = ? AND Account_Id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productID);
            preparedStatement.setInt(2, accountID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Feedback f = new Feedback();
                f.setId(resultSet.getInt("Id"));
                return f;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Feedback_Form> getAccountRatingByProductId(int productID) {
        List<Feedback_Form> listFf = new ArrayList<>();
        try {
            connection = this.getConnection();
            String query = "SELECT TOP 3 * FROM Feedback fb JOIN Account a on fb.Account_Id=a.Id WHERE Product_Id= ? ORDER BY fb.Id";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Feedback_Form ff = new Feedback_Form();
                ff.setId(resultSet.getInt("Id"));
                ff.setEmail(resultSet.getString("Email"));
                ff.setDate_review(resultSet.getDate("Date_Review"));
                ff.setContent(resultSet.getString("Content"));
                ff.setStar(resultSet.getInt("Star"));
                ff.setImage(resultSet.getString("Image"));
                listFf.add(ff);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFf;
    }

    public List<Feedback_Form> getNextAccountRatingByProductId(int productID, int amount) {
        List<Feedback_Form> listFf = new ArrayList<>();
        try {
            connection = this.getConnection();
            String query = "SELECT * FROM Feedback fb JOIN Account a on fb.Account_Id=a.Id WHERE Product_Id= ? ORDER BY fb.Id OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, productID);
            preparedStatement.setInt(2, amount);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Feedback_Form ff = new Feedback_Form();
                ff.setId(resultSet.getInt("Id"));
                ff.setEmail(resultSet.getString("Email"));
                ff.setDate_review(resultSet.getDate("Date_Review"));
                ff.setContent(resultSet.getString("Content"));
                ff.setStar(resultSet.getInt("Star"));
                ff.setImage(resultSet.getString("Image"));
                listFf.add(ff);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFf;
    }

    public Account getAccountById(int id) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Account a "
                    + "JOIN Role r ON r.id = a.role_id "
                    + "WHERE a.status = 1 AND a.Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Account af = new Account();
                af.setId(resultSet.getInt("Id"));
                af.setEmail(resultSet.getString("Email"));
                af.setPassword(resultSet.getString("Password"));
                af.setRole(resultSet.getString("Role"));
                af.setRole_Id(resultSet.getInt("Role_Id"));
                return af;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean createAccountCustomerByGoogle(Account googlePojo) {
        try {
            connection = this.getConnection();

            String sql = "INSERT INTO [dbo].[Account] ([Email], [Role_Id], [Created_on], [Status]) VALUES (?, ?, ?, 1)";
            preparedStatement = connection.prepareStatement(sql);

            // Set parameters
            preparedStatement.setString(1, googlePojo.getEmail());
            preparedStatement.setInt(2, googlePojo.getRole_Id());
            preparedStatement.setDate(3, (Date) googlePojo.getCreated_on());

            // Execute the update
            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int countCartByCartId(int cartId) {
        int count = 0;

        try {
            connection = this.getConnection();
            String sql = "SELECT COUNT(*) AS TotalCount FROM Cart_Detail cd "
                    + "WHERE cd.Cart_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, cartId);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                count = resultSet.getInt("TotalCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getQuantityProductDetails(Product_Form pf) {
        int stock = 0;

        try {
            connection = this.getConnection();
            String sql = "SELECT Stock FROM Product_Detail WHERE Product_Id = ? AND Size_Id = ? AND Color_Id = ? AND Gender_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, pf.getProduct_id());
            preparedStatement.setInt(2, pf.getSize_id());
            preparedStatement.setInt(3, pf.getColor_id());
            preparedStatement.setInt(4, pf.getGender_id());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                stock = resultSet.getInt("Stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stock;
    }

    public void updateQuantityProductDetails(int quantityAfterAddToCart, Product_Form pf) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Product_Detail SET Stock = ? WHERE Product_Id = ? AND Size_Id = ? AND Color_Id = ? AND Gender_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, quantityAfterAddToCart);
            preparedStatement.setInt(2, pf.getProduct_id());
            preparedStatement.setInt(3, pf.getSize_id());
            preparedStatement.setInt(4, pf.getColor_id());
            preparedStatement.setInt(5, pf.getGender_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getQuantityByProductDetailsId(int productDetailID) {
        int stock = 0;

        try {
            connection = this.getConnection();
            String sql = "SELECT Stock FROM Product_Detail WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, productDetailID);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                stock = resultSet.getInt("Stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stock;
    }

    public int getQuantityByCartDetail(int cartID, int productDetailId) {
        int stock = 0;

        try {
            connection = this.getConnection();
            String sql = "  SELECT SUM([Quantity]) FROM Cart_Detail WHERE [Cart_Id] = ? AND Product_Detail_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, cartID);
            preparedStatement.setInt(2, productDetailId);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                stock = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stock;
    }

    public void updateQuantityProductDetail(int quantityAfterDelete, int productDetailID) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Product_Detail SET Stock = ? WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, quantityAfterDelete);
            preparedStatement.setInt(2, productDetailID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product_Detail> getQuantityInvoiceDetail(int invoiceId) {
        List<Product_Detail> listPd = new ArrayList<>();
        try {
            connection = this.getConnection();
            String query = "SELECT ProductDetail_Id, Quantity FROM Invoice_Detail id WHERE Invoice_Id= ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, invoiceId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product_Detail pd = new Product_Detail();
                pd.setId(resultSet.getInt("ProductDetail_Id"));
                pd.setStock(resultSet.getInt("Quantity"));
                listPd.add(pd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listPd;
    }

    public int getQuantityOfProductDetail(Product_Detail product_Detail) {
        int stock = 0;

        try {
            connection = this.getConnection();
            String sql = "SELECT Stock FROM Product_Detail WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, product_Detail.getId());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                stock = resultSet.getInt("Stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stock;
    }

    public void deleteCartByAccId(int id) {
        try {
            Connection connection = getConnection();
            String sql = "DELETE FROM Cart WHERE Account_Id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            int rowsDeleted = preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void receiveInvoice(int invoiceId) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Invoice SET Status_Id = 3 WHERE Id = ?;";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int findCartId(int accountID) {
        int cart = 0;

        try {
            connection = this.getConnection();
            String sql = "SELECT Id FROM Cart c "
                    + "WHERE c.Account_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, accountID);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                cart = resultSet.getInt("Id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public Account_Form getAccountByEmail(Account googlePojo) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Account a "
                    + "JOIN Role r ON r.id = a.role_id "
                    + "WHERE a.status = 1 AND a.Email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, googlePojo.getEmail());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Account_Form af = new Account_Form();
                af.setId(resultSet.getInt("Id"));
                af.setEmail(resultSet.getString("Email"));
                af.setPassword(resultSet.getString("Password"));
                af.setRole(resultSet.getString("Role"));
                af.setRole_Id(resultSet.getInt("Role_Id"));
                return af;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
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

    public int getQuantityByDiscountPercent(int i) {
        int quantity = 0;

        try {
            connection = this.getConnection();
            String sql = "SELECT Quantity FROM Discount d "
                    + "WHERE d.Discount_percent = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, i);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                quantity = resultSet.getInt("Quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quantity;
    }

    public void updateQuantityDiscountByDiscountPercent(int i, int quantity) {
        try {
            connection = this.getConnection();
            String sql = "Update Discount SET Quantity = ? WHERE Discount_percent = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, i);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkCustomerBuyProductYet(int id, String productIdRaw) {
        try {
            connection = this.getConnection();

            String sql = "select * from Invoice i join Invoice_Detail id on i.id = id.invoice_id "
                    + "WHERE account_id = ? and product_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, productIdRaw);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Feedback> getFeedbackByAccountIdAndProductId(Account_Form account, List<Invoice_Form> listIf) {
        List<Feedback> listF = new ArrayList<>();
        try {
            connection = this.getConnection();
            StringBuilder sql = new StringBuilder("SELECT * FROM Feedback f WHERE Account_Id = ? AND Product_Id IN (");
            for (int i = 0; i < listIf.size(); i++) {
                sql.append("?");
                if(i<listIf.size()-1){
                    sql.append(",");
                }
            }
            sql.append(")");
            preparedStatement = connection.prepareStatement(sql.toString());
            int parameterIndex = 1;
            preparedStatement.setInt(parameterIndex++, account.getId());
            for (Invoice_Form invoice : listIf) {
                preparedStatement.setInt(parameterIndex++, invoice.getProduct_id());
            }
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Feedback f = new Feedback();
                f.setAccount_id(resultSet.getInt("Account_Id"));
                f.setProduct_id(resultSet.getInt("Product_Id"));
                listF.add(f);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listF;
    }



}
