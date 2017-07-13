---
title: about-spring
date: 2017-2-26  16:21:37
updated: 2017-07-04 01:04:13
tags: [spring,tech,refrence]
keywords: spring,tech,refrence
categories: Docs
toc: true
---

## spring  HATEOAS
ref link: https://spring.io/understanding/HATEOAS

### what is HATEOAS
HATEOAS (Hypermedia as the Engine of Application State) is a constraint of the REST application architecture.
A hypermedia-driven site provides information to navigate the site's REST interfaces dynamically by including hypermedia links with the responses. This capability differs from that of SOA-based systems and WSDL-driven interfaces. With SOA, servers and clients usually must access a fixed specification that might be staged somewhere else on the website, on another website, or perhaps distributed by email.

### example
The following code represents a Customer object.
```java
class Customer {
    String name;
}
```
A simple JSON presentation is traditionally rendered as:
```json
{ 
    "name" : "Alice"
}
```
The customer data is there, but the data contains nothing about its relevant links.

A HATEOAS-based response would look like this:
```json
{
    "name": "Alice",
    "links": [ {
        "rel": "self",
        "href": "http://localhost:8080/customer/1"
    } ]
}
```

This response not only has the person's name, but includes the self-linking URL where that person is located.

 - rel means relationship. In this case, it's a self-referencing hyperlink. More complex systems might include other relationships. For example, an order might have a "rel":"customer" relationship, linking the order to its customer.
 - href is a complete URL that uniquely defines the resource.



##  maven
### add local jar to project
```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-install-plugin</artifactId>
    <version>2.5.2</version>
    <executions>
        <execution>
            <phase>initialize</phase>
            <goals>
                <goal>install-file</goal>
            </goals>
            <configuration>
                <file>lib/commons-codec-1.3.jar</file>
                <groupId>com.commons.codec</groupId>
                <artifactId>commonsCodec</artifactId>
                <version>1.0.0</version>
                <packaging>jar</packaging>
            </configuration>
        </execution>
    </executions>
</plugin>
```
