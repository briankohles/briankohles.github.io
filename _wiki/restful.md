---
title: RESTful
layout: page
collection: wiki
author: Brian Kohles
tags: wiki RESTful
categories: wiki
---

Key Principals of REST

	• Use HTTP methods explicitly
		○ To create a resource on the server, use POST.
		○ To retrieve a resource, use GET.
		○ To change the state of a resource or to update it, use PUT.
		○ To remove or delete a resource, use DELETE.
	• Be stateless
		○ Server
			§ Generates responses that include links to other resources to allow applications to navigate between related resources. This type of response embeds links. Similarly, if the request is for a parent or container resource, then a typical RESTful response might also include links to the parent's children or subordinate resources so that these remain connected.
			§ Generates responses that indicate whether they are cacheable or not to improve performance by reducing the number of requests for duplicate resources and by eliminating some requests entirely. The server does this by including a Cache-Control and Last-Modified (a date value) HTTP response header.
		○ Client application
			§ Uses the Cache-Control response header to determine whether to cache the resource (make a local copy of it) or not. The client also reads the Last-Modified response header and sends back the date value in an If-Modified-Since header to ask the server if the resource has changed. This is called Conditional GET, and the two headers go hand in hand in that the server's response is a standard 304 code (Not Modified) and omits the actual resource requested if it has not changed since that time. A 304 HTTP response code means the client can safely use a cached, local copy of the resource representation as the most up-to-date, in effect bypassing subsequent GET requests until the resource changes.
			§ Sends complete requests that can be serviced independently of other requests. This requires the client to make full use of HTTP headers as specified by the Web service interface and to send complete representations of resources in the request body. The client sends requests that make very few assumptions about prior requests, the existence of a session on the server, the server's ability to add context to a request, or about application state that is kept in between requests.
	• Expose directory structure-like URIs
		○ Hide the server-side scripting technology file extensions (.jsp, .php, .asp), if any, so you can port to something else without changing the URIs.
		○ Keep everything lowercase.
		○ Substitute spaces with hyphens or underscores (one or the other).
		○ Avoid query strings as much as you can.
		○ Instead of using the 404 Not Found code if the request URI is for a partial path, always provide a default page or resource as a response.
	• Transfer XML, JSON, or both
		
		
	
	

As a general design principle, it helps to follow REST guidelines for using HTTP methods explicitly by using nouns in URIs instead of verbs. In a RESTful Web service, the verbs—POST, GET, PUT, and DELETE—are already defined by the protocol. And ideally, to keep the interface generalized and to allow clients to be explicit about the operations they invoke, the Web service should not define more verbs or remote procedures, such as /adduser or /updateuser. This general design principle also applies to the body of an HTTP request, which is intended to be used to transfer resource state, not to carry the name of a remote method or remote procedure to be invoked. 

Using GET in this way is explicit because GET is for data retrieval only. GET is an operation that should be free of side effects, a property also known as idempotence.


GET	GET /users/Robert HTTP/1.1
Host: myserver
Accept: application/xml
POST	POST /users HTTP/1.1
	Host: myserver
	Content-Type: application/xml
	<?xml version="1.0"?>
	<user>
	  <name>Robert</name>
	</user>
PUT	PUT /users/Robert HTTP/1.1
Host: myserver
Content-Type: application/xml
<?xml version="1.0"?>
<user>
  <name>Bob</name>
</user>
DELETE	









# REST Info
## A good reason to use different methods is to keep URLs simple.
## You can add new options to work with resources without adding URLs.
HEAD [safe] [idempotent] - read
GET [safe] [idempotent] - read
POST - Create a new subordinate. Create & let server decide name (URI), update part of a resource
	POST /questions/<new_question> -- Bad you can't perform a post to an item that does not exist. (use put instead)
	POST /questions/ -- Create a new question
	POST to a URL creates a child resource at a server defined URL.
	POST /users -- create a new user in the "users" collection
	POST /users/john -- create a new resource under the "john" collection
		- NOT the proper way to UPDATE the john resource.
PUT [idempotent] - Create (you choose the URI) new resource, update an entire resource.
	PUT /questions/<new_question> - create new
	PUT /questions/<existing_question> - overwrite existing
	PUT /questions/ -- should error as no specific URI was mentioned
	PUT to a URL creates/replaces the resource in its entirety at the client defined URL. 
	PUT /users/john -- update/create the "john" resource.
PATCH - Update part of a resource
	PATCH to a URL updates part of the resource at that client defined URL.
DELETE [idempotent] - Delete an entire resource
OPTIONS [idempotent]

The use of POST/PUT are constrained by the expected behavior of cache (web or user agent)

POST is like posting a letter to a mailbox or posting an email to an email queue. PUT is like when you put an object in a cubby hole or a place on a shelf (it has a known address).

- Should be coded as:
	- Idempotent - Performing the same action multiple times will have no effect
		- performing a create of a record & specifying the ID (URI)
		- performing a delete on an specific item
		- performing a create of a specific item with a put.
		- A "revert to saved"
		- x=5

	- Not Idempotent - Perfoming the same action multiple times will have a different effect
		- performing a create of a record & having the server choose a ID/URI
		- performing a delete on "the last item created"
		- doing a create with a post
		- An "undo"
		- x++

If you perform a put on a resource & then a get on the same resource you should retrieve the same data you have put.

If you do a post on a resource the new resource will be created at a different URI, so doing a get on the original resource will not return the new item. But after the post is successful the post return data should include a link to the created resource.


http://stackoverflow.com/questions/630453/put-vs-post-in-rest?rq=1
http://stackoverflow.com/questions/630453/put-vs-post-in-rest/18243587#18243587
http://restcookbook.com/
http://microformats.org/wiki/rest/urls
http://www.restapitutorial.com/lessons/httpmethods.html
http://www.restapitutorial.com/httpstatuscodes.html
https://msdn.microsoft.com/en-us/library/azure/dd179357.aspx
http://code.tutsplus.com/tutorials/a-beginners-guide-to-http-and-rest--net-16340
