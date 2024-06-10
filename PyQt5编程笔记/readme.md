# PyQt5编程笔记

---------------------------

按钮的常用属性

Text按钮上面显示的文字

Font按钮上显示文字的字体类型及大小

按钮的常用信号

点击信号(clicked)

组件:标签

标签属于QLabel

---------------------------

标签的常用属性

Text按钮上面显示的文字

Font按钮上显示文字的字体类型及大小

技巧:

    · 如果要取得某个组件的属性值 self.组件的名字，属性的名字()

    · 举例：如果要得到按钮pb_1上面显示的文字

    · wenzi=self.pb_1.Text()

    · 如果要对某个属性进行赋值 self.组件的名字.set属性的名字(值)

    · 举例：如果要向某个标签(标签名字叫label)设置文字

    · self.label,setText('鸡你太美')

---------------------------

1.设计界面

    注意事项：对每一个组件改名字，命名方式要容易记忆

    名字不能含有除了下划线以外的其他特殊字符

    名字要以小写字母开头

    如果名字超过一个单词 要使用骆驼峰式写法

2.使用转换器 把界面文件转换为python程序代码

    注意事项：如果界面发生改变 要及时保存 并且要重新进行转换

3.编写文件名为main的python程序文件

    注意事项：每个项目只能有一个main文件

---------------------------

编写main文件的步骤

假设 当前只有一个界面文件 这个文件文件名为 A.ui在这个界面中，假设这个窗体的对象名是b.

那么 通过转换器转换之后的程序文件是 A.py程序文件中界面类的类名是 Ui_b

    step1

        引入相关类
        import sys
        from PyQt5.QtWidgets *
        from PyQt5.QtCore import *
        from PyQt5.QtGui import *

    step2

        引入界面类
        from a import Ui b

    step3

        新建一个界面类 假设新建的界面类 名字叫c
        class c (对象b所在类，Ui b)：

    step4

        重写新类的构造函数
        def __init__(self,parent=None):;
            super(c,self).__init__(parent)
            self.setupUi(self)
        下面是其他的代码
        例如是信号和槽的连接

    step5

        在类中实现相应的槽函数

    step6

        编写运行代码
        if__name__=='__main__':
            app=QApplication(sys.argv) #初始化app
            win=c()
            win.show()
            sys.exit(app.exec()) #消息循环结束之后返回0，接着调用sys.exit(0)退出
        退出程序 只需要在槽函数的连接语句中协商self.close
        self.对象名.clicked.connect(self.close)

---------------------------

输入组件

单行文本输入框

    Line Edit

    单行文本输入框输入内容是纯文本 不带任何格式

    所属类 QLineEdit

    常用属性

    最大输入字符量 maxLongth 默认值 32767

    文本 text

    文本输入的显示方式echoMode默认值是 Normal

    Normal 输入什么就显示什么 值是 0

    NoEcho 接受了输入之后 不显示输入内容 值是 1

    Password 专门用于密码输入 输入的字符被遮住 值为 2

    PasswordEchoEdit 当修改字符的时候遮挡的地方可以还原 值为 3

    只读readonly 表示单行文本输入框可不可以被编辑

    常用信号:

    cursorPositionChanged (int,int) 光标位置移动信号

    textChangeed (string) 文本改变信号

    textEdited (string) 文本输入信号

---------------------------

PyQt5开发程序的时候

    1.设计界面.ui
    2.界面的转换.py
    3.编写主程序

引入系统包(类)

    import sys 引入sys类(针对的是操作系统 控制程序的运行)
    from PyQt5.QtWidgets *
    从PyQt5的QtWidgets包中引入 所有的类(界面组件相关)
    from PyQt5.QtCore import *
    从PyQt5的QtCore包当中引入所有类(定时器及时间日期相关)
    from PyQt5.QtGui import *
    从PyQt5的QtGui包当中引入所有类(图形图像功能相关)

引入界面类

    from win import ui_zhuChuangKou 从界面文件(.py)当中引入Ui类

    创建一个新的窗口类(主要是实现程序的逻辑相当于MVC模式中的CM)

    该窗口类要继承两个类

    第一个是窗体组件的所属类

    第二个是界面文件类

    class ChuangKou(QMainwindow,Ui_zhuChuangKou):

重写构造函数 要在构造函数中传入一个参数 值是None

    def __init(self,parent=None):

在构造函数中 调用父类的构造函数

    super(ChuangKou,self).__init__(parent)

初始化界面

    self,setupUi(self)

第二种窗体类型 Widget (组件/小工具)

    属于的类:QWidget

    跟QMainwindow的区别:

    QWidget 只有窗口 只有最小化 关闭 没有菜单栏 没有状态栏

    优点:体积小 运行速度快

    主要属性

    windowTitle 设置窗口的标题

---------------------------

按钮类别

单项选择按钮 Radio Button

属于的类 QRadioButton

常用属性

text 设置单选按钮显示的文字 string

checkable 设置单选按钮能否被点击(可不可以被选择)布尔型

checked 设置单选按钮是否都被选中 布尔型

autoExclusive 设置单选按钮是否互斥 布尔型

重要:在同一个窗口类中 所有的单选按钮都是互斥

主要的信号

clicked 点击信号 用鼠标点击

toggled 转换信号

---------------------------

复习1

    组件的名字:主窗口(QMainwindow)
    类型:窗体
    所属类:QMainwindow
    常用的属性:windowTitle 窗口的标题
    常用的信号:没

    组件的名字:小窗口(QWidget)
    类型:窗体
    所属类:QWidget
    常用的属性:window Title 窗口的标题
    常用的信号:没

    组件的名字:普通按钮(Push Button)
    类型:按钮组件
    所属类:QPushButton
    常用的属性:
                text 按钮上显示的文字
                font 按钮上显示的文字的字体
    常用的信号:
                clicked 鼠标点击信号

    组件的名字:单选按钮 (Radio Button)
    类型:按钮组件
    所属类:QRadioButton
    常用的属性:
                text 设置单选按钮显示的文字 string
                checkable 设置单选按钮能否被点击 布尔型
                checked 设置单选按钮是否都被选中 布尔型
                autoExclusive 设置单选按钮是否互斥 布尔型
    常用的信号:

                clicked 鼠标点击信号
                toggled (bool) 状态转换信号

    组件的名字:单行文本输入框 (Line Edit)
    类型:输入组件
    所属类:QLineEdit
    常用的属性:
                text 单行文本输入框输入的文字 string
                echoMode 设置显示风格 int
                chormal 正常显示 值为 0
                Password 密码 值为 2
                noEcho 接受输入但不显示 值为 1
                PasswordEchoOnEdit 最后一位显示为明文 值为 3
                readonly 只读属性 布尔型 文本输入框里面的文字不能被修改
                maxLength 设置文本输入框一行能输入最大多少个字符int

    常用的信号:没

    组件的名字:标签 (label)
    类型:输出组件
    所属类:QLabel
    常用的属性:
                text 标签显示的文字
                font 标签显示文字的字体
    常用的信号:没

---------------------------

弹窗组件

QMessageBox

使用方法:

    对象名=QMessageBox(弹窗的类型，弹窗的标题,要显示的信息)
    注意 弹窗的标题要和显示的信息是字符串的类型 所以如果是直接写字符串 那么需要用单引号把字符串引起来

弹窗的类型

    QMessageBox.Information 表示信息提示符
    QMessageBox.critical 表示错误提示窗
    QMessageBox.waring 表示警告提示窗

对象名.exec() #把弹窗显示出来

---------------------------

按钮组的使用
    按钮组 ButtonGroup
    所属类 QButtonGroup

    常用属性
    exclusive 布尔型 是否互斥

    常用信号
    buttonClicked(object)
    按钮点击信号 该信号会携带一个对象 该对象指向选中的那个按钮本身

槽函数的连接
    self.按钮组的名字.buttonClicked.connect(self.槽函数的名字)

相应的槽函数
    def 槽函数的名字(self,object):
        pass

按钮组的应用步骤(一般是写在构造函数当中)

    step1 实例化按钮组

        按钮组的名字=QButtonGroup()

    step2 把按钮添加到按钮组中

        按钮组的名字.addButton(self.单选按钮的名字，单选按钮的编号)

    step3 按钮组的信号和槽连接

        按钮组的名字.buttonclicked.connect(self.槽函数的名字)

    step4 响应槽函数

        def 槽函数的名字(self,object):
            得到按钮组选中的按钮编号
            self.按钮组的名字.id(object)

---------------------------

多项选择按钮

check box

所属类 QCheckBox

常用的属性

    text 显示的文字 string

    checkable 是否可选 布尔型

    checked 是否被选中 布尔型

    autoExclusive 是否自动互斥 布尔型 默认值为假

常用的信号

    clicked 点击

    toggled (bool) 状态改变信号

自定义信号

    类PyqtSignal 在PyQt5.QtCore包当中

定义一个自定义信号

    信号名=PyqtSignal(参数表)
    定义一个用来传输整型数据的信号
    sing1=pyqtSignal(int)

定义一个同时传输整型数据与字符串的自定义信号

    sing2=pyqtSignal(int,str)
    sing2=pyqtSignal(int,int,int) #同时传输三个整形数据
    sing2=pyqtSignal(str,str,str) #同时传输三个字符串

定义一个传输列表的自定义信号

    sing3=pyqtSignal(list)

定义一个传输字典的自定义信号
    
    sing4=pyqtSignal(dict)

定义一个传输对象的自定义信号

    sing5=pyqtSignal(object)

---------------------------

多行文本输入框 QTextEdit (支持富文本编辑)

常用属性

    readonly 只读属性 布尔型

    acceptRichText 接受富文本 布尔型 默认打开

    markdown 文本对齐方式 默认值 垂直方向左对齐 水平方向居中

下拉列表框 QComboBox

常用属性

    currentText 当前显示的文字(当前选中的文字)str

    currentIndex 当前显示的项目的下标(当前选中项的目录)int 默认值为 -1 表示什么都没选中

    maxvisibleItems 下拉列表框往下拉的时候最多显示多少个项目 int 默认值是 10

    insertPolicy 添加策略

    sizeAdjustPolicy 大小调整策略

常用信号

    highlighted 当鼠标移动到下拉列表框时该信号

    currentIndexChanged 当选择发生改变的时候触发

常用方法

    往下拉列表框添加项目
    addItem(str)往下拉列表框添加一项
    addItems(list)往下拉列表框添加多个项目

    得到下拉列表框当前选择的项目
    currentText()

    往下拉列表删除项目(只能删除一项)
    removeItem(int) int代表要删除的项目 从0开始

---------------------------