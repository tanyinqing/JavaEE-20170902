package demo.json;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import demo.model.Book;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.enterprise.inject.Model;
import java.io.IOException;

public class JsonTestDemo {
    public static void main(String[] args) {


        Book[] books=new Book[3];
        for (int i = 0; i < 3; i++) {
            Book book=new Book(i,"JSON","Tom","2018-1-1",12.45,100,"");
            books[i]=book;
        }
        Book book=new Book(1,"JSON","Tom","2018-1-1",12.45,100,"");
//fastjson��
     /*   String json = JSON.toJSONString(book, true);
        System.out.println(json);
        System.out.println(JSON.parseObject(json, Book.class));*/
        /*//������ʽ����
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(book);
        System.out.println( gson.fromJson(json, Book.class));*/


     //gson��
    /*  ObjectMapper jaonArray=new ObjectMapper();
        jaonArray.configure(SerializationFeature.INDENT_OUTPUT, true);
        String json= null;//Ԥ��4���ո�
        try {
            json = jaonArray.writeValueAsString(book);
            System.out.println(jaonArray.writeValueAsString(books));
//            Book testBook=jaonArray.readValues(json,Book.class);
            Book testBook=jaonArray.readValue(json,Book.class);
            System.out.println(testBook);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // System.out.println(json);*/






       /* JSONArray jaonArray=new JSONArray(books);
        String json=jaonArray.toString(4);//Ԥ��4���ո�
        System.out.println(json);*/




        JSONObject jsonObject=new JSONObject(book);
        String json=jsonObject.toString(4);
        System.out.println(json);
    }
}
