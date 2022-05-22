# -*- coding: utf-8 -*-
"""
Created on Sat May 14 18:53:13 2022

@author: olosz
"""

from bs4 import BeautifulSoup as bs
import os
import requests as req

root='C:\\Users\\olosz\\Programming\\HDLbits\\Solutions'





cookies = {
    'vlgsession': '0'
}

f=open('C://Users//olosz//Programming//HDLbitsScraping//logininfo.txt', "r")

data2=f.read()
f.close()
data={
    'vlg_username': data2.split()[0],
    'password': data2.split()[1],
    'login': 'Login',
}
response = req.post('https://hdlbits.01xz.net/wiki/Special:VlgLogin',cookies=cookies, data=data)
cookies=cookies = {
    'vlgsession': response.headers['Set-Cookie'].split(';')[0][11:]
}
content = req.get('https://hdlbits.01xz.net/wiki/Problem_sets', cookies=cookies).text





def Codegrab(url, cookies, dire):
    splitter=url.split('/')
    i=-2
    tc=splitter[-1]
    while(splitter[i]!='wiki'):
        if(i<-1):
            tc=splitter[i]+'/'+tc
        i-=1

    
        
    #print(tc)    
    data = {
        'tc': tc,
        'name': '0',
    }
    #print(url)
    #print("")
    code = req.post('https://hdlbits.01xz.net/load.php', cookies=cookies, data=data)  
    printable=code.text.split(',',maxsplit=1)[1][8:-2]
    printable=printable.replace(r'\n','\n')
    printable=printable.replace(r'\r','')
    printable=printable.replace(r'\t','\t')
    printable=printable.replace(r'\/','/')
    f=open(dire, "w")
    f.write(printable)
    f.close()
    



    
soup = bs(content, 'lxml')
    

header = soup.find('span', class_='mw-headline')
current=header.parent
top=current.parent

l1c=0
l2c=0
l3c=0
dire=''
for child in top.children:
   
    if (child.name=='h2'):
        layer1="";
        layercount=1
        for char in child.text:
            if char==':':
                char='-'
            layer1=layer1+char 
        l1c+=1
        l2c=0
        l3c=0    
    
    if (child.name=='h3'):
        layer2="";
        layercount=2
        for char in child.text:
            if char==':':
                char='-'
            layer2=layer2+char 
        l2c+=1
        l3c=0
        
    if (child.name=='h4'):
        layer3="";
        layercount=3
        for char in child.text:
            if char==':':
                char='-'
            layer3=layer3+char 
        l3c+=1   
        
        

    if(child.name=='ul'):
        direold=dire;
        if(layercount==1):

            dire=(f"{root}\\{l1c}. {layer1}")      
        if(layercount==2):
            
            dire=(f"{root}\\{l1c}. {layer1}\\{l2c}. {layer2}")
        if(layercount==3):
            
            dire=(f"{root}\\{l1c}. {layer1}\\{l2c}. {layer2}\\{l3c}. {layer3}")
        if((os.path.exists(dire))==False):
            os.makedirs(dire)
        

            
        urls=child.find_all('a', class_='vlgstat_link')
        if(dire!=direold):
            count=0
        for url in urls:
            if(url.contents[1]['title'].split()[-1]=='Completed'):
                count+=1
                urlstore=''
                for char in url.text:
                    if char=='?':
                        char=''
                    if char=='/':
                        char='-'
                    if char==':':
                        char='-'
                    urlstore=urlstore+char    
                Codegrab(url['href'], cookies, dire+'\\'+str(count)+'. '+urlstore+'.sv')

                
               





  
