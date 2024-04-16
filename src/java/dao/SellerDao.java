/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import constant.Constant;
import context.DBContext;
import entity.Account;
import entity.Account_Detail;
import entity.Account_Form;
import entity.Brand;
import entity.Category;
import entity.Chart;
import entity.Color;
import entity.DateDashboard;
import entity.Discount;
import entity.Feedback;
import entity.Feedback_Form;
import entity.Gender;
import entity.Image;
import entity.Invoice;
import entity.Invoice_Form;
import entity.Invoice_Status;
import entity.Product_Form;
import entity.Size;
import helper.BCrypt;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.AccountDetailUM;
import model.ProductVM;

/**
 *
 * @author Win 10
 */
public class SellerDao extends DBContext {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    BCrypt bcryp = new BCrypt();

    public Account checkExistOfSeller(Account account) {
        try {
            connection = this.getConnection();

            String sql = "SELECT a.Email, a.Password, a.Role_Id "
                    + "FROM Account a "
                    + "WHERE a.Email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getEmail());

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String hashedPassword = resultSet.getString("password");

                // Kiem tra mat khau nhap vao voi mat khau ma hoa trong db
                if (bcryp.checkpw(account.getPassword(), hashedPassword)) {
                    Account foundAccount = new Account();
                    foundAccount.setEmail(resultSet.getString("email"));
                    foundAccount.setPassword(hashedPassword);
                    foundAccount.setRole_Id(resultSet.getInt("Role_Id"));
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

    /**
     * Method description: Check account seller existed or net
     *
     * @param account - account to be checked
     * @return
     */
    public boolean CheckSellerAccount(Account account) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM [Account] WHERE Email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getEmail());

            resultSet = preparedStatement.executeQuery();

            return resultSet.next(); // Trả về true nếu tìm thấy tài khoản, ngược lại trả về false

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Account_Detail getAccountDetailByAccountId(int accountId) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Account_Detail WHERE Account_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, accountId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Account_Detail accountDetail = new Account_Detail();
                accountDetail.setId(resultSet.getInt("Id"));
                accountDetail.setUsername(resultSet.getString("Username"));
                accountDetail.setAccount_id(resultSet.getInt("Account_Id"));
                accountDetail.setPhone_number(resultSet.getString("Phone_Number"));
                accountDetail.setGender(resultSet.getBoolean("Gender"));
                accountDetail.setDob(resultSet.getDate("Dob"));
                accountDetail.setAddress(resultSet.getString("Address"));
                return accountDetail;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * Method description: Edit user profile
     *
     * @param accountDetailUM - account to be update
     * @return
     */
    public AccountDetailUM editProfile(AccountDetailUM accountDetailUM) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Account_Detail SET Phone_Number = ?, "
                    + "Gender = ?, "
                    + "Dob = ?, "
                    + "Address = ?, "
                    + "Username = ? "
                    + "WHERE Account_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, accountDetailUM.getPhone_number());
            preparedStatement.setBoolean(2, accountDetailUM.isGender());
            preparedStatement.setString(3, accountDetailUM.getDob());
            preparedStatement.setString(4, accountDetailUM.getAddress());
            preparedStatement.setString(5, accountDetailUM.getUserName());
            preparedStatement.setInt(6, accountDetailUM.getAccount_id());

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                sql = "Select * FROM Account_Detail ad JOIN  Account a ON ad.Account_Id = a.Id WHERE Account_Id = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, accountDetailUM.getAccount_id());
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    accountDetailUM = new AccountDetailUM();
                    accountDetailUM.setAddress(resultSet.getString("Address"));
                    accountDetailUM.setPhone_number(resultSet.getString("Phone_Number"));
                    accountDetailUM.setDob(resultSet.getString("Dob"));
                    accountDetailUM.setGender(resultSet.getBoolean("Gender"));
                    accountDetailUM.setUserName(resultSet.getString("Username"));
                    accountDetailUM.setEmail(resultSet.getString("Email"));

                    return accountDetailUM;
                }
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    /**
     * Method description: Change seller password
     *
     * @param password - Password that seller wanna change
     * @param accountId - accountId seller
     * @return
     */
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

    public List<Brand> countProductsByBrand() {
        List<Brand> brandCounts = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT b.Brand, b.id, COUNT(*) AS Count "
                    + "FROM Product_Detail pd "
                    + "INNER JOIN Brand b ON pd.brand_id = b.id "
                    + "GROUP BY b.Brand, b.id";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Brand b = new Brand();
                b.setId(resultSet.getInt("Id"));
                b.setBrand(resultSet.getString("Brand"));
                b.setCountEachBrand(resultSet.getInt("Count"));
                brandCounts.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brandCounts;
    }

    /**
     * Method description: Paging for product
     *
     * @param index
     * @return
     */
    public List<ProductVM> getListProductPaging(int index) {
        try {
            List<ProductVM> listProduct = new ArrayList();
            connection = this.getConnection();
            String sql = "SELECT  p.Id, p.Name, p.Create_on, p.Description, p.Price, im.Image "
                    + "from dbo.Product p JOIN dbo.Image im ON im.Product_Id = p.Id  "
                    + "Order By Create_on Desc OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, (index - 1) * 8);
//            preparedStatement.setInt(1, accountId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ProductVM productVM = new ProductVM();
                productVM.setImageLink(resultSet.getString("Image"));
                productVM.setName(resultSet.getString("Name"));
                productVM.setDescription(resultSet.getString("Description"));
                productVM.setCreate_on(resultSet.getDate("Create_on"));
                productVM.setPrice(resultSet.getDouble("Price"));
                productVM.setId(resultSet.getInt("Id"));
                listProduct.add(productVM);
            }
            return listProduct;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * Method description: Find product by ID
     *
     * @param productID: Product ID
     * @param colorID: Color ID
     * @param categoryID: Category ID
     * @param sizeID: Size ID
     * @param brandID: Brand ID
     * @param genderID: Gender ID
     * @return
     */
    public Product_Form findProductByID(String productID, String colorID, String categoryID, String sizeID, String brandID, String genderID) {
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product p "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "LEFT JOIN Color c ON pd.Color_Id = c.Id "
                    + "LEFT JOIN Category cate ON pd.Category_Id = cate.id "
                    + "LEFT JOIN Size s ON pd.Size_Id = s.Id "
                    + "LEFT JOIN Brand b ON pd.Brand_Id = b.Id "
                    + "LEFT JOIN Gender g ON pd.Gender_Id = g.Id "
                    + "WHERE p.Id = ? ";
            if (brandID != null && !brandID.equals("null")) {
                sql += "AND pd.Brand_Id = ? ";
            }
            if (categoryID != null && !categoryID.equals("null")) {
                sql += "AND pd.Category_Id = ? ";
            }
            if (colorID != null && !colorID.equals("null") && !colorID.equals("0")) {
                sql += "AND pd.Color_Id = ? ";
            }
            if (sizeID != null && !sizeID.equals("null")) {
                sql += "AND pd.Size_Id = ? ";
            }
            if (genderID != null && !genderID.equals("null")) {
                sql += "AND pd.Gender_Id = ? ";

            }

            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (productID != null && !productID.equals("null")) {
                preparedStatement.setString(parameterIndex++, productID);
            }
            if (brandID != null && !brandID.equals("null")) {
                preparedStatement.setString(parameterIndex++, brandID);
            }
            if (categoryID != null && !categoryID.equals("null")) {
                preparedStatement.setString(parameterIndex++, categoryID);
            }
            if (colorID != null && !colorID.equals("null") && !colorID.equals("0")) {
                preparedStatement.setString(parameterIndex++, colorID);
            }
            if (sizeID != null && !sizeID.equals("null")) {
                preparedStatement.setString(parameterIndex++, sizeID);
            }
            if (genderID != null && !genderID.equals("null")) {
                preparedStatement.setString(parameterIndex++, genderID);
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

    public List<Image> getImagesByProductID(String productID) {
        List<Image> images = new ArrayList<>();

        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM Image WHERE Product_Id = ?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, productID);

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

    public int findTotalProducts() {
        int totalProduct = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM dbo.Product";
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

    public int findTotalProducts(String keyword) {
        int totalProduct = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT COUNT(*) FROM Product p "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.id ";

            if (keyword != null && !keyword.equals("null")) {
                sql += "WHERE p.Name LIKE ? ";
            }
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (keyword != null && !keyword.equals("null")) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
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

    public int findTotalProducts(String[] brandID, String[] cateID, String priceRange, String minPrice, String maxPrice, String[] colorID, String[] sizeID, String[] genderID) {
        int totalProduct = 0;

        try {
            connection = this.getConnection();

            StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM Product p ");
            sql.append("LEFT JOIN Product_Detail pd ON pd.Product_Id = p.id ");

            if (brandID != null && brandID.length > 0) {
                sql.append("WHERE pd.Brand_Id IN (");
                for (int i = 0; i < brandID.length; i++) {
                    sql.append("?");
                    if (i < brandID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }
            if (cateID != null && cateID.length > 0) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND pd.Category_Id IN (");
                } else {
                    sql.append("WHERE pd.Category_Id IN (");
                }
                for (int i = 0; i < cateID.length; i++) {
                    sql.append("?");
                    if (i < cateID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }
            if (colorID != null && colorID.length > 0) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND pd.Color_Id IN (");
                } else {
                    sql.append("WHERE pd.Color_Id IN (");
                }
                for (int i = 0; i < colorID.length; i++) {
                    sql.append("?");
                    if (i < colorID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }
            if (sizeID != null && sizeID.length > 0) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND pd.Size_Id IN (");
                } else {
                    sql.append("WHERE pd.Size_Id IN (");
                }
                for (int i = 0; i < sizeID.length; i++) {
                    sql.append("?");
                    if (i < sizeID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }
            if (genderID != null && genderID.length > 0) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND pd.Gender_Id IN (");
                } else {
                    sql.append("WHERE pd.Gender_Id IN (");
                }
                for (int i = 0; i < genderID.length; i++) {
                    sql.append("?");
                    if (i < genderID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }

            if (priceRange == null || priceRange.isEmpty()) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND p.price BETWEEN 0 AND 1000000 ");
                } else {
                    sql.append("WHERE p.price BETWEEN 0 AND 1000000 ");
                }
            } else {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND p.price BETWEEN ? AND ? ");
                } else {
                    sql.append("WHERE p.price BETWEEN ? AND ? ");
                }
            }

            preparedStatement = connection.prepareStatement(sql.toString());
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

            if (priceRange != null && !priceRange.isEmpty()) {
                preparedStatement.setString(parameterIndex++, minPrice);
                preparedStatement.setString(parameterIndex++, maxPrice);
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

    public List<Product_Form> findPageByKeyword(int page, String sorted, String keyword) {
        List<Product_Form> productList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product p "
                    + "JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "LEFT JOIN Color c ON pd.Color_Id = c.Id "
                    + "LEFT JOIN Category cate ON pd.Category_Id = cate.id "
                    + "LEFT JOIN Size s ON pd.Size_Id = s.Id "
                    + "LEFT JOIN Brand b ON pd.Brand_Id = b.Id "
                    + "LEFT JOIN Gender g ON pd.Gender_Id = g.Id ";
            if (keyword != null && !keyword.equals("null")) {
                sql += "WHERE p.Name LIKE ? ";
            }

            sql += "ORDER BY CASE WHEN ? = 'desc' THEN p.price END DESC, "
                    + "CASE WHEN ? = 'asc' THEN p.price END ASC "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            preparedStatement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (keyword != null && !keyword.equals("null")) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
            }

            preparedStatement.setString(parameterIndex++, sorted);
            preparedStatement.setString(parameterIndex++, sorted);
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
                productList.add(pf);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product_Form> findByPage(int page, String sorted, String[] brandID, String[] cateID, String priceRange, String minPrice, String maxPrice, String[] colorID, String[] sizeID, String[] genderID) {
        List<Product_Form> productList = new ArrayList<>();
        try {
            connection = this.getConnection();
            StringBuilder sql = new StringBuilder("SELECT * FROM Product p ");
            sql.append("LEFT JOIN Product_Detail pd ON pd.Product_Id = p.id ");
            sql.append("LEFT JOIN Color c ON pd.Color_Id = c.Id ");
            sql.append("LEFT JOIN Category cate ON pd.Category_Id = cate.id ");
            sql.append("LEFT JOIN Size s ON pd.Size_Id = s.Id ");
            sql.append("LEFT JOIN Brand b ON pd.Brand_Id = b.Id ");
            sql.append("LEFT JOIN Gender g ON pd.Gender_Id = g.Id ");

            if (brandID != null && brandID.length > 0) {
                sql.append("WHERE pd.Brand_Id IN (");
                for (int i = 0; i < brandID.length; i++) {
                    sql.append("?");
                    if (i < brandID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }
            if (cateID != null && cateID.length > 0) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND pd.Category_Id IN (");
                } else {
                    sql.append("WHERE pd.Category_Id IN (");
                }
                for (int i = 0; i < cateID.length; i++) {
                    sql.append("?");
                    if (i < cateID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }
            if (colorID != null && colorID.length > 0) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND pd.Color_Id IN (");
                } else {
                    sql.append("WHERE pd.Color_Id IN (");
                }
                for (int i = 0; i < colorID.length; i++) {
                    sql.append("?");
                    if (i < colorID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }
            if (sizeID != null && sizeID.length > 0) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND pd.Size_Id IN (");
                } else {
                    sql.append("WHERE pd.Size_Id IN (");
                }
                for (int i = 0; i < sizeID.length; i++) {
                    sql.append("?");
                    if (i < sizeID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }
            if (genderID != null && genderID.length > 0) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND pd.Gender_Id IN (");
                } else {
                    sql.append("WHERE pd.Gender_Id IN (");
                }
                for (int i = 0; i < genderID.length; i++) {
                    sql.append("?");
                    if (i < genderID.length - 1) {
                        sql.append(",");
                    }
                }
                sql.append(") ");
            }

            if (priceRange == null || priceRange.isEmpty()) {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND p.price BETWEEN 0 AND 1000000 ");
                } else {
                    sql.append("WHERE p.price BETWEEN 0 AND 1000000 ");
                }
            } else {
                if (sql.toString().contains("WHERE")) {
                    sql.append("AND p.price BETWEEN ? AND ? ");
                } else {
                    sql.append("WHERE p.price BETWEEN ? AND ? ");
                }
            }

            sql.append("ORDER BY CASE WHEN ? = 'desc' THEN p.price END DESC, CASE WHEN ? = 'asc' THEN p.price END ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

            preparedStatement = connection.prepareStatement(sql.toString());
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

            if (priceRange != null && !priceRange.isEmpty()) {
                preparedStatement.setString(parameterIndex++, minPrice);
                preparedStatement.setString(parameterIndex++, maxPrice);
            }

            preparedStatement.setString(parameterIndex++, sorted);
            preparedStatement.setString(parameterIndex++, sorted);
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
                productList.add(pf);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product_Form> findByPage(int page) {
        List<Product_Form> productList = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Product p "
                    + "LEFT JOIN Product_Detail pd ON pd.Product_Id = p.id "
                    + "LEFT JOIN Color c ON pd.Color_Id = c.Id "
                    + "LEFT JOIN Category cate ON pd.Category_Id = cate.id "
                    + "LEFT JOIN Size s ON pd.Size_Id = s.Id "
                    + "LEFT JOIN Brand b ON pd.Brand_Id = b.Id "
                    + "LEFT JOIN Gender g ON pd.Gender_Id = g.Id "
                    + "ORDER BY p.price OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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
                productList.add(pf);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Invoice_Form> findTotalInvoice(String status) {
        List<Invoice_Form> listIf = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT i.ID, i.CartCode, i.Invoice_Date, ad.Username, a.Email, i.address, i.Total_Price, ist.Status "
                    + "FROM Invoice i "
                    + "LEFT JOIN Account a ON i.Account_Id = a.ID "
                    + "LEFT JOIN Account_Detail ad ON a.ID = ad.Account_ID "
                    + "LEFT JOIN Invoice_Status ist ON i.Status_Id = ist.ID ";

            if (status != null && !status.isEmpty()) {
                sql += "WHERE ist.ID = ?";
            }

            preparedStatement = connection.prepareStatement(sql);
            if (status != null || !status.isEmpty()) {
                preparedStatement.setString(1, status);
            }
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Invoice_Form invoiceForm = new Invoice_Form();
                invoiceForm.setId(resultSet.getInt("ID"));
                invoiceForm.setCartCode(resultSet.getString("CartCode"));
                invoiceForm.setInvoice_date(resultSet.getDate("Invoice_Date"));
                invoiceForm.setUsername(resultSet.getString("Username"));
                invoiceForm.setEmail(resultSet.getString("Email"));
                invoiceForm.setAddress(resultSet.getString("address"));
                invoiceForm.setTotalPrice(resultSet.getFloat("Total_Price"));
                invoiceForm.setStatus(resultSet.getString("Status"));
                listIf.add(invoiceForm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return listIf;
    }

    public List<Invoice_Form> findTotalInvoice() {
        List<Invoice_Form> listIf = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT i.ID, i.CartCode, i.Invoice_Date, ad.Username, a.Email, i.address, i.Total_Price, ist.Status "
                    + "FROM Invoice i "
                    + "LEFT JOIN Account a ON i.Account_Id = a.ID "
                    + "LEFT JOIN Account_Detail ad ON a.ID = ad.Account_ID "
                    + "LEFT JOIN Invoice_Status ist ON i.Status_Id = ist.ID ";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Invoice_Form invoiceForm = new Invoice_Form();
                invoiceForm.setId(resultSet.getInt("ID"));
                invoiceForm.setCartCode(resultSet.getString("CartCode"));
                invoiceForm.setInvoice_date(resultSet.getDate("Invoice_Date"));
                invoiceForm.setUsername(resultSet.getString("Username"));
                invoiceForm.setEmail(resultSet.getString("Email"));
                invoiceForm.setAddress(resultSet.getString("address"));
                invoiceForm.setTotalPrice(resultSet.getFloat("Total_Price"));
                invoiceForm.setStatus(resultSet.getString("Status"));
                listIf.add(invoiceForm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return listIf;
    }

    public int countTotalInvoice() {
        int totalInvoice = 0;

        try {
            connection = this.getConnection();

            String sql = "SELECT Count (*) FROM [Invoice]";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalInvoice = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalInvoice;
    }

    public List<Invoice_Form> getListInvoiceDetailByID(int invoiceID) {
        List<Invoice_Form> listIf = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "  SELECT i.Total_Price, p.Name, pd.Id , id.Quantity, id.Price, id.TotalPrice, c.Color, s.Size, g.Gender, b.Brand, cate.Category FROM Invoice i JOIN Invoice_Detail id ON id.Invoice_Id = i.Id \n"
                    + " JOIN Product p ON p.Id = id.Product_Id JOIN Product_Detail pd ON pd.Id = id.ProductDetail_Id \n"
                    + "JOIN Category cate ON cate.Id = p.Category_Id JOIN Brand b ON b.Id = p.Brand_Id \n"
                    + "JOIN Color c ON c.Id = pd.Color_Id JOIN Size s ON s.id = pd.Size_Id JOIN Gender g ON g.Id =pd.Gender_Id \n"
                    + " WHERE i.Id = ? \n"
                    + " GROUP BY i.Total_Price, p.Name, id.Id, pd.Id, id.Quantity, id.Price, id.TotalPrice, c.Color, s.Size, g.Gender, b.Brand, cate.Category ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Invoice_Form invoiceForm = new Invoice_Form();
                invoiceForm.setPrice(resultSet.getFloat("Price"));
                invoiceForm.setTotalPrice(resultSet.getFloat("Total_Price"));
                invoiceForm.setProductName(resultSet.getString("Name"));
                invoiceForm.setTotalPrice(resultSet.getFloat("TotalPrice"));
                invoiceForm.setProductColor(resultSet.getString("Color"));
                invoiceForm.setProductSize(resultSet.getString("Size"));
                invoiceForm.setProductGender(resultSet.getString("Gender"));
                invoiceForm.setProductQuantity(resultSet.getInt("Quantity"));
                listIf.add(invoiceForm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return listIf;
    }

    public Invoice_Form getInvoiceDetailByID(int invoiceID) {
        try {
            connection = this.getConnection();
            String sql = "Select i.ID, i.CartCode, p.Name, id.Price, id.Quantity, id.Price, id.TotalPrice, i.Invoice_Date, ad.Username, a.Email, i.[address], i.Total_Price, ad.Phone_Number \n"
                    + "  from Invoice i join Account a on i.Account_Id = a.ID \n"
                    + "  join Invoice_Detail id on i.ID = id.Invoice_Id\n"
                    + "  join Product p on id.product_Id = p.id\n"
                    + "  join Account_Detail ad on a.ID = ad.Account_ID \n"
                    + "  Where i.ID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Invoice_Form invoiceForm = new Invoice_Form();
                invoiceForm.setId(resultSet.getInt("ID"));
                invoiceForm.setCartCode(resultSet.getString("CartCode"));
                invoiceForm.setInvoice_date(resultSet.getDate("Invoice_Date"));
                invoiceForm.setUsername(resultSet.getString("Username"));
                invoiceForm.setEmail(resultSet.getString("Email"));
                invoiceForm.setAddress(resultSet.getString("address"));
                invoiceForm.setPrice(resultSet.getFloat("Price"));
                invoiceForm.setTotalPrice(resultSet.getFloat("Total_Price"));
                invoiceForm.setProductName(resultSet.getString("Name"));
                invoiceForm.setPrice(resultSet.getFloat("Price"));
                invoiceForm.setTotalPrice(resultSet.getFloat("TotalPrice"));
                invoiceForm.setProductQuantity(resultSet.getInt("Quantity"));
                invoiceForm.setPhoneNumber(resultSet.getString("Phone_Number"));
                return invoiceForm;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public List<Invoice_Status> getAllInvoiceStatus() {
        List<Invoice_Status> listIs = new ArrayList();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM [Invoice_Status]";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Invoice_Status is = new Invoice_Status();
                listIs.add(is);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return listIs;

    }

    public boolean findInvoiceDetailExist(int invoiceID) {
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM [Invoice_Detail] where invoice_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceID);

            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void deleteInvoiceDetailByInvoiceID(int invoiceID) {
        try {
            connection = this.getConnection();

            String sql = "Delete from [Invoice_Detail] where Invoice_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceID);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteInvoiceByID(int invoiceID) {
        try {
            connection = this.getConnection();

            String sql = "Delete from Invoice where Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceID);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Invoice_Status> findAllInvoiceStatus() {
        List<Invoice_Status> listIs = new ArrayList<>();
        try {
            connection = this.getConnection();

            String sql = "SELECT * FROM [Invoice_Status]";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Invoice_Status is = new Invoice_Status();
                is.setId(resultSet.getInt("Id"));
                is.setStatus(resultSet.getString("Status"));
                listIs.add(is);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listIs;
    }

    public int updateInvoiceStatus(int invoiceID, int statusID) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Invoice SET Status_Id = ? WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, statusID);
            preparedStatement.setInt(2, invoiceID);
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

    public void deleteInvoiceByInvoiceID(int invoiceID) {
        try {
            connection = this.getConnection();

            String sql = "Delete from [Invoice] where Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceID);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Account_Form getProfileByAccountID(int id) {
        try {
            connection = this.getConnection();

            String sql = "SELECT *, a.Status as Status_Account FROM Account a "
                    + "JOIN Account_Detail ad ON a.id = ad.Account_Id "
                    + "JOIN Role r ON r.id = a.Role_Id "
                    + "JOIN Gender g ON g.id = ad.Gender_Id WHERE a.id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
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
                af.setStatus(resultSet.getInt("Status_Account"));
                return af;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateProfile(Account_Form afToUpdate) {
        try {
            connection = this.getConnection();

            String sql = "UPDATE Account_Detail SET Phone_Number = ?, Gender_Id = ?, "
                    + "Dob = ?, Address = ?, Username = ? "
                    + "WHERE Account_Id = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, afToUpdate.getPhone_number());
            preparedStatement.setInt(2, afToUpdate.getGender_id());
            preparedStatement.setDate(3, (Date) afToUpdate.getDob());
            preparedStatement.setString(4, afToUpdate.getAddress());
            preparedStatement.setString(5, afToUpdate.getUsername());
            preparedStatement.setInt(6, afToUpdate.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Feedback_Form> findAllFeedback() {
        List<Feedback_Form> listF = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "select f.Id, f.Content, f.Date_Review, f.Image, f.Star, a.Email, p.Name from Feedback f \n"
                    + "JOIN Account a ON a.Id = f.Account_Id\n"
                    + "JOIN Product p ON p.Id = f.Product_Id ";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Feedback_Form f = new Feedback_Form();
                f.setId(resultSet.getInt("Id"));
                f.setContent(resultSet.getString("Content"));
                f.setDate_review(resultSet.getDate("Date_Review"));
                f.setImage(resultSet.getString("Image"));
                f.setStar(resultSet.getInt("Star"));
                f.setProductName(resultSet.getString("Name"));
                f.setEmail(resultSet.getString("Email"));
                listF.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listF;
    }

    public List<Feedback_Form> findFeedbackByDate(Date dateFrom, Date dateTo) {
        List<Feedback_Form> listF = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = " SELECT f.Id, f.Content, f.Date_Review, f.Image, f.Star, a.Email, p.Name \n"
                    + "FROM Feedback f \n"
                    + "JOIN Account a ON a.Id = f.Account_Id\n"
                    + "JOIN Product p ON p.Id = f.Product_Id \n"
                    + "WHERE f.Date_Review <= ? AND f.Date_Review >= ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setDate(1, dateTo);
            preparedStatement.setDate(2, dateFrom);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Feedback_Form f = new Feedback_Form();
                f.setId(resultSet.getInt("Id"));
                f.setContent(resultSet.getString("Content"));
                f.setDate_review(resultSet.getDate("Date_Review"));
                f.setImage(resultSet.getString("Image"));
                f.setStar(resultSet.getInt("Star"));
                f.setProductName(resultSet.getString("Name"));
                f.setEmail(resultSet.getString("Email"));
                listF.add(f);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listF;
    }

    public void deleteFeedbackById(String idFeedback) {
        try {
            connection = this.getConnection();

            String[] ids = idFeedback.split(",");

            StringBuilder placeholders = new StringBuilder();
            for (int i = 0; i < ids.length; i++) {
                placeholders.append("?");
                if (i < ids.length - 1) {
                    placeholders.append(",");
                }
            }

            String sql = "DELETE FROM Feedback WHERE Id IN (" + placeholders.toString() + ")";
            preparedStatement = connection.prepareStatement(sql);

            for (int i = 0; i < ids.length; i++) {
                preparedStatement.setInt(i + 1, Integer.parseInt(ids[i]));
            }

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
                DateDashboard dateDb = DateDashboard.builder()
                        .start(rs.getDate(2))
                        .end(rs.getDate(1))
                        .build();
                return dateDb;
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

    public int getTotalOrderPending(String start, String end) {
        try {
            connection = this.getConnection();
            String sql = "select count(*) from Invoice where Invoice_Date <= ? and Invoice_Date >= ? and Status_Id= 1 ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrderDelivery(String start, String end) {
        try {
            connection = this.getConnection();
            String sql = "select count(*) from Invoice where Invoice_Date <= ? and Invoice_Date >= ? and Status_Id= 2 ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrderSuccesful(String start, String end) {
        try {
            connection = this.getConnection();
            String sql = "select count(*) from Invoice where Invoice_Date <= ? and Invoice_Date >= ? and Status_Id= 3 ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalOrderCanceled(String start, String end) {
        try {
            connection = this.getConnection();
            String sql = "select count(*) from Invoice where Invoice_Date <= ? and Invoice_Date >= ? and Status_Id= 4 ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Chart> getChartOrderBar(String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            try {
                connection = this.getConnection();
                String sql = "select count(*) from Invoice where Invoice_Date  = DATEADD(DAY, ?, ?)";
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

    public List<Chart> getChartRevenueBar(String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            try {
                connection = this.getConnection();
                String sql = "select sum(Total_Price) from Invoice where Status_Id = 3 AND Invoice_Date = DATEADD(DAY, ?, ?)";
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

    public List<Chart> getChartRevenueArea(String start, int day) {
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            try {
                connection = this.getConnection();
                String sql = "select sum(Total_Price) from Invoice where Status_Id = 3 AND Invoice_Date <= DATEADD(DAY, ?, ?) and Invoice_Date >= ?";
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

    public int getTotalOrder(String start, String end) {
        try {
            connection = this.getConnection();
            String sql = "select count(*) from Invoice where Invoice_Date <= ? and Invoice_Date >= ? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, end);
            st.setString(2, start);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
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
                if (bcryp.checkpw(account.getPassword(), hashedPassword)) {
                    Account_Form af = new Account_Form();
                    af.setId(resultSet.getInt("Id"));
                    af.setEmail(resultSet.getString("Email"));
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

    public List<Discount> findAllDiscountWorking() {
        List<Discount> listD = new ArrayList<>();
        try {
            connection = this.getConnection();
            String sql = "SELECT * FROM Discount d WHERE Status = 1";
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Discount d = new Discount();
                d.setId(resultSet.getInt("Id"));
                d.setCreate_at(resultSet.getDate("Create_at"));
                d.setDiscount_percent(resultSet.getInt("Discount_percent"));
                d.setStatus(resultSet.getInt("Status"));
                d.setQuantity(resultSet.getInt("Quantity"));
                listD.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listD;
    }

    public int getQuantityBeforeUpdate(int discountID) {
        int quantity = 0;
        try {
            connection = this.getConnection();
            String sql = "SELECT Quantity FROM Discount d WHERE d.Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, discountID);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                quantity = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quantity;
    }

    public int updateQuantityDiscount(int quantityAfterUpdate, int discountID) {
        try {
            connection = this.getConnection();
            String sql = "UPDATE Discount SET Quantity = ? WHERE Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, quantityAfterUpdate);
            preparedStatement.setInt(2, discountID);
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

    public Invoice_Form getAccountByInvoiceID(int invoiceID) {
        try {
            connection = this.getConnection();
            String sql = "select i.Id AS InvoiceId, ad.Username, ad.[Address], ad.Phone_Number, a.Email\n"
                    + "from Invoice i join Account a on i.Account_Id = a.Id\n"
                    + "			   join	Account_Detail ad on ad.Account_Id = a.Id\n"
                    + "Where i.Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, invoiceID);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Invoice_Form iF = new Invoice_Form();
                iF.setId(resultSet.getInt("InvoiceId"));
                iF.setUsername(resultSet.getString("Username"));
                iF.setAddress(resultSet.getString("Address"));
                iF.setPhoneNumber(resultSet.getString("Phone_Number"));
                iF.setEmail(resultSet.getString("Email"));
                return iF;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
