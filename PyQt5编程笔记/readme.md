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
    从
    from PyQt5.QtCore import *
    from PyQt5.QtGui import *

---------------------------