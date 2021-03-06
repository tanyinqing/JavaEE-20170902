
5. 创建基于 Gradle 构建的 Java Web 项目

  - 安装 gradle
    - https://services.gradle.org/distributions/gradle-2.13-all.zip 下载免安装版
    - 参见 [Gradle 的安装](source/gradle.md)
  - 创建项目

    ```
    Idea > File > New > Project... 
    
    左侧 选择 Gradle 
    右侧勾选 Java 和 Web
    单击 Next
    参见图一
    
    填写 GroupId 和 ArtifactId  前面是公司或域名的反写 后面是项目名
    单击 Next
    
    勾选 Create directories for empty content roots automatically
    选择 Use local gradle distribution
    指定 Gradle home  gradle文件的地址
    单击 Next
    参见图二
    
    确认 Project name 和 Project location
    单击 Finish
    ```
    
    图一
    
    ![图一](image/gradle_web_1.png)
    
    图二
    
    ![图二](image/gradle_web_2.png)
    
6. 生成 WEB-INF/web.xml 文件  这个暂时不会

   ```
   Idea > File > Project Structure... > Facets
   单击 Web Gradle: ...
   单击右侧 Deploment Descriptors + 
   修改 WEB-INF/web.xml 路径，参见图三
   单击 OK
   ```
   
   图三
   
   ![图三](image/gradle_web_3.png)
    
7. Java Web 项目在 Tomcat 中的部署

  - 安装 Tomcat
    - https://tomcat.apache.org/download-90.cgi 下载64位免安装版本
    参见 [JavaEE 引言](https://mingfei.gitbooks.io/training-lecture/content/javaee/intro.html#tomcat_install)
  - 在 Idea 中关联 Tomcat

    ```
    Idea > File > Settings... > Build, Execution, Deployment > Application servers
    单击 +
    选择 Tomcat Server
    指定 Tomcat Home
    单击 OK
    ```
   
   - 创建 Java Web 项目
     - 参见 [4. 创建基于 Gradle 构建的 Java Web 项目](idea.md)
   - 在 Tomcat 中部署 Java Web 项目
   
     ```
     Idea > Run > Edit Configurations...
     单击 +
     选择 Tomcat Server
     单击 Local
     
     在 Deployment 选项卡中
     单击 +
     单击 Artifact...
     选择含有 exploded 的 Artifact
     
     在 Server 选项卡中
     On 'Update' action 选择 Update classes and resources
     On frame deactivation 选择 Update classes and resources
     
     单击 OK
     ```
   - Tomcat　的启动　/ 重启　/　重部署
     -  Win: Shift + Alt + F10
     -  Mac: Control + Option + R
    