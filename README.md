# Bash scripts 

A collection of automated scripts to use for making life easier on various operating systems.

## About the project
There are two scripts in the repo. One is for Linux and the other is for Windows. The Linux script is written in Bash and the Windows script is written in batch files. To download the file you can use the following commands.

- for linux based commands
```bash
wget https://raw.githubusercontent.com/<filelocation>
```

- for windows based commands
```bat
curl https://raw.githubusercontent.com/<filelocation>
```

## Usage
- for linux based commands
Linux based commands needs a few more steps to run. This includes giving the program permission to run and the **sudo** superuser privilages. To do this you can use the following commands.

```bash
chmod +x <filename>
sudo ./<filename>
```

- for windows based commands
Windows based commands are much easier to run. All you need to do is double click the file and it will run or can be run via the **command prompt**. **Note:** The batch files may only run on command prompt and may not run on powershell.

```bat
<filename>
```