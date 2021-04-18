# Documentations
This doc contains an overview of the working of project

## Terminology
- String hashGen(String a) : A function that generates hash

## Storage of data
All the data are stored in a file named "user" (without an extension) in json format. 
There are three types of data
- Account details
    - username : directly stored in json format. Key : "usr"
    - Password : a hash of the password is sored in json formmat. Key : "pass"  a.k.a master password.
- Saved usernames
The saved usernames are stored in an array of map in the format shown below.
```
"data": [
    {
        "site":"abc.com",
        "uname":"abc",
        "id": hashGen(site + uname)  //hashing the combination of string site and uname
    }
]
```
- Saved passwords
the the passwords are encrypted with the ```(master password * 4).substring(0,16)``` as the key, and stored as a value to the key ```hashGen(coressponding id)``` as shown below
```
"hashGen(id)":"Encrypted password"
```

### The complete 'user' file may look like this

```
"usr":"abc",
"pass":"hashGen(orignal password)"
"data":[
    {
        "site":"abc.com",
        "uname":"abc",
        "id": hashGen(site + uname)  
    },
    {
        "site":"xyz.com",
        "uname":"xyz",
        "id": hashGen(site + uname)  
    }

],
"hashGen(id of abc.com)":"Encrypted password",
"hashGen(id of xyz.com)":"Encrypted password"
```