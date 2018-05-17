package zhike;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.wang.mapper.IndexCategoryMapper;
import com.wang.mapper.OrdersMapper;
import com.wang.mapper.UserShopMapper;
import com.wang.model.IndexCategory;
import com.wang.model.Item;
import com.wang.model.OrderItem;
import com.wang.model.Orders;
import com.wang.model.UserShop;
import com.wang.service.IItemService;
import com.wang.service.IUserService;
import com.wang.util.PropertiesUtil;
import com.wang.util.RandomUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
public class UserServiceTest {
	
    @Autowired
    private IUserService userService;
    
    @Autowired
    private IItemService itemService;
    
    @Autowired
    private UserShopMapper userShopMapper;
    
    @Autowired
    private IndexCategoryMapper indexCategoryMapper;
 
    @Autowired
    private OrdersMapper ordersMapper;
    
    @Test
    public void UUID() {
    	UUID uuid = UUID.randomUUID();
        String str = uuid.toString(); 
        System.out.println(str);
        String uuidStr = str.replace("-", "");
        System.out.println(uuidStr);
        //String path = request.getSession().getServletContext().getRealPath("static/upload");  
        //System.out.println(path);
    }
    
    @Test
    public void PropertiesUtil(){
    	PropertiesUtil.readProperties("db.properties");
        System.out.println(PropertiesUtil.getProperty("db.url"));

    }
    
    @Test
    public void Random(){
    	Random rand = new Random();
    	/*for(int i=0; i<100; i++) {
    		System.out.println(rand.nextInt(900));
    	}*/
    	Date d = new Date();  
        System.out.println(d);  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");  
        String dateNowStr = sdf.format(d);
        int random = rand.nextInt(900) + 100;
        System.out.println("格式化后的日期：" + dateNowStr + random);  
    }
    
    @Test
    public void CheckCode(){
    	Random rand = new Random();
        int random = rand.nextInt(9000) + 1000;
        System.out.println("格式化后的日期：" + random);  
    }
    
    @Test
    public void UserShopTest(){
    	List<UserShop> userShops = userShopMapper.findUserShopList(null);
		for(int i=0;i<userShops.size();i++){
			UserShop userShop = userShops.get(i);
			
			System.out.println(userShop.getItem().getId());
			System.out.println(userShop.getItem().getName());
			System.out.println(userShop.getItem().getItemDetail());
		}
    }
    
    @Test
    public void OrdersTest(){
        Page<Orders> page = new Page<Orders>(1, 5);
        List<Orders> selectPage = ordersMapper.findOrdersList(page, null);
        Orders Orders = selectPage.get(0);
        List<OrderItem> orderItems = Orders.getOrderItems();
        for(int i=0;i<orderItems.size();i++){
        	OrderItem orderItem = orderItems.get(i);
			//System.out.println(orderItem.getPrice());
			System.out.println(orderItem.getItem_id());
			System.out.println(orderItem.getItem().getId());
			System.out.println(orderItem.getItem().getName());
		}
    }
    
    @Test
    public void TestWrapper(){
    	EntityWrapper<Item> ew = new EntityWrapper<Item>();
        //ew.setEntity(new User(1));
        ew.where("user_name={0}", "'zhangsan'").and("id=1")
                .orNew("user_status={0}", "0").or("status=1")
                .notLike("user_nickname", "notvalue")
                .andNew("new=xx").like("hhh", "ddd")
                .andNew("pwd=11").isNotNull("n1,n2").isNull("n3")
                .groupBy("x1").groupBy("x2,x3")
                .having("x1=11").having("x3=433")
                .orderBy("dd").orderBy("d1,d2");
        System.out.println(ew.getSqlSegment());
    }
    
    @Test
    public void TestWrapper1(){
    	Page<Item> page = new Page<Item>(1, 16);
    	EntityWrapper<Item> searchKey = new EntityWrapper<Item>();
        //ew.setEntity(new User(1));
    	searchKey.where("1={0}", "1").like("name", "%"+"d"+"%").orderBy("addtime desc");
        Page<Item> selectPage = itemService.findItemListWrapper(page, searchKey);
        System.out.println(searchKey.getSqlSegment());
    }
    
    @Test
    public void TestWrapper2(){
    	Page<Item> page = new Page<Item>(1, 8);
        // 查询按时间倒序商品
        EntityWrapper<Item> ewTimeDesc = new EntityWrapper<Item>();
        //ew.setEntity(new User(1));
        ewTimeDesc.where("1={0}", "1").orderBy("addtime desc");
        itemService.findItemListWrapper(page, ewTimeDesc);
        //List<Item> selectPageTimeDesc = itemService.findItemListWrapper(page, ewTimeDesc).getRecords();
    }
    
    @Test
    public void TestIndexCategory(){
        List<IndexCategory> indexCategorys = indexCategoryMapper.findIndexCategoryList();
        for(int i=0;i<indexCategorys.size();i++){
        	IndexCategory indexCategory = indexCategorys.get(i);
        	System.out.println(indexCategory.getItemCategory());
        }
        
    }
    
    @Test
    public void TestPicName(){
    	System.out.println(RandomUtil.getPicName());
    }
}
