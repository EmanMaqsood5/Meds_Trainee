# Basic Shell Scripting
**What is Shell?**

A shell is a special user program that provides an interface for the user to use operating system services. Shell can be accessed by users using a command line interface. A special program called Terminal in Linux/macOS, or Command Prompt in Windows OS is provided to type in the human-readable commands such as “cat”, “ls” etc. and then it is being executed.

**What is a terminal?**

A program which is responsible for providing an interface to a user so that he/she can access the shell. It basically allows users to enter commands and see the output of those commands in a text-based interface.

**What is Shell Scripting?**

As a shell can also take commands as input from file, we can write these commands in a file and can execute them in shell to avoid this repetitive work. These files are called Shell Scripts or Shell Programs.

## Commonly Used Shell Commands
### 1. cd:
It is a built-in shell command that changes the current working directory to the one specified as its arguments.

If we want to change our directory to Documents, we will run the following command:

`cd Documents            `

#### More cases:
| Cases| Uses                               |
|------|-------------------------------------|
| cd ~ | moves you to home directory         | 
| cd - | switches back to previous directory |
| cd ..| moves you to the parent directory   |

### 2. ls:
It is a standard linux command that displays the contetnts of a directory.
If you want to show detailed information such as file permissions, no. of links, owner, group, file size and lost modified date and time then you will run the command

`ls -l`

### 3. echo:
It is a built-in shell command that displays a line of text or variable to the terminal. It is mainly used to print messages. If we run the following command,

`echo "This is a useful tutorial."`

We will get the output:

`This is a useful tutorial.`

We can also display variables like this:

`date="5-4-2005"`

`echo "she was born on $date."`

which will print:

`she was born on 5-4-2005.`

### 4. pwd:

The shell command "pwd" stands for primary working directory. This command dsplays the full path of the directory you are currently in.

### 5. touch:
It is used to create a file without any content. The file created using the touch command is empty. This command can be used when the user doesn’t have data to store at the time of file creation.

`touch file1.txt`

The above command will create an empty file named file1.

### 6. cat:

The cat (concatenate) command in Linux displays file contents. It reads one or multiple files and prints their content to the terminal. cat is used to view file contents, combine files, and create new files.

In order to display the contexts of file1.txt, we will run the command:

`cat file1.txt`
 
 If we want to make a new file using cat command, we will run

 `cat > newfile_name`

 If we want to combine files using cat command, we will run the following command.

 `cat file1.txt file2.txt > combined_file.txt`

 ### 7. mkdir
It is a command-line utility that allows the users to create new directories.

`mkdir new_dir`

this will create new folder (new_dir) in current directory. If we want to create parent directory you can use *mkdir -p*. If you want to create multiple subdirectories by using mkdir -p, you can run the followng command:

`mkdir –p new_dir/sub_dir1/sub_dir2`


### 8. rmdir and rm
If you want to remove an empty directory then you can just write the following code in the terminal

`rmdir [directory name]`

but in case, you want to remove a directory and all its contents, you should follow this command.

`rm -r [directory name]`

## Conclusion
Mastering basic shell scripting enhances your ability to work efficiently with operating systems. By understanding simple commands, you can navigate directories, manage files, and automate tasks with ease. With consistent practice, shell scripting becomes a valuable and natural skill.