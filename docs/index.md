Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@jithu7432 
jithu7432
/
nb-viewer
1
00
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
nb-viewer
/
README.md
in
main
 

Spaces

1

Soft wrap
1
​
2
## Jupyter Notebook Viewer (Ubuntu)
3
* This is a utility which lets you preview jupyter notebooks faster on your web browser without starting a Jupyter server.
4
* Requires no internet and is faster.
5
* Whether you have installed Jupyter in a virtual environment or not, update the path of Jupyter on `path.py` by using the commmand `which jupyter`,     `/home/jithin/venv/bin/jupyter`in my case.
6
​
7
* Crashes when spaces are present in the filename, eg: `"hello world.ipynb"`  
8
​
9
# Installation
10
* Clone the repository
11
```markdown
12
​
13
git clone https://github.com/jithu7432/nb-viewer.git ; cd nb-viewer 
14
```
15
* Create a directory for `nbv`  and copy all the contents to it
16
```markdown
17
sudo mkdir /opt/nbv ; sudo cp -a . /opt/nbv
18
```
19
* Add an alias for using the utility
20
```markdown
21
echo "alias nbv='/opt/nbv/nbv.py'">> ~/.bash_aliases
22
```
23
* Make sure you have updated the path to Jupyter on the file 
24
 ```markdown
25
sudo nano /opt/nbv/path.py
26
```
27
## Usage
28
* Navigate to any directory containing Jupyter notebooks, open terminal and run `nbv` to open all notebooks in your default web browser.
29
​
No file chosen
Attach files by dragging & dropping, selecting or pasting them.
@jithu7432
Commit changes
Commit summary
Create README.md
Optional extended description
Add an optional extended description…
 Commit directly to the main branch.
 Create a new branch for this commit and start a pull request. Learn more about pull requests.
 
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
