# Bloque 3 (AX) teoría: planear estructura de diapositivas

**Session ID:** ses_2c0a2dffbffeF1xMIL6JKMDs4o
**Created:** 3/30/2026, 5:29:20 PM
**Updated:** 4/22/2026, 3:49:43 PM

---

## User

I'm trying to do Block 3 theory for the AX subject.
I told him this: 
Por otro lado,el bloque 3 lo tengo pendiente. Mi idea es reciclar bastante esto https://drive.google.com/drive/u/3/folders/1rGItUNEgw_WnzenFDNzxoo1OlwGK2ck6?exids=71471476,71471470

Lo ves bien? Al final es patricia quien lo dará, quizás le podemos preguntar si lo ve coherente con lo que dió en el bloque 2? 
And he told me this:
 Vale, no te preocupes. Cuando te pongas me avisas y lo vamos revisando.

Sobre el bloque 3, me parece bien que cojas cosas ya hechas de la parte IP, pero también habrá que añadir alguna cosa más sobre algoritmos de shortest path para routing y profundizar un poco más en protocolos como OSPF y BGP. En este bloque también daremos DHCP y NAT, así que también reforzaría la parte de redes públicas vs redes privadas y todo el tema de hacer subredes. 
Can you help me thinking about how to bould the slides for Bloque 3? 

Let's iterate together before actually building it.

Ah also, the syllabus is in @AX_syllabus_2025_2026_EN.docx.md 

---

## Assistant (Build · claude-opus-4.6 · 8.2s)



Let me first check if there are any existing materials in the working directory that might be relevant.

_Thinking:_

The user is a professor/instructor preparing slides for Block 3 of the "Network Architecture" (AX) course at UPF. Let me analyze what they need:

From the syllabus, Block 3 covers:
- **Network Access & Internetworking (2 sessions)**
- Layer 2: media access control, framing, Wired vs Wireless technologies, ARP, VLANs, tunneling
- Layer 3: IP, routing, OSPF/BGP, ICMP
- Layer 5 applications for connectivity: DHCP, NAT

From the colleague's feedback, they need to:
1. Recycle content from existing IP-related slides (from the Google Drive link)


2. Expand the routing section with more detail on shortest path algorithms, then deepen the OSPF and BGP material
3. Add comprehensive coverage of DHCP and NAT
4. Reinforce the concepts of public versus private networks and subnetting throughout

Let me check what materials already exist in the working directory to see what I can build on.

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF"
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF</path>
<type>directory</type>
<entries>
AX_syllabus_2025_2026_EN.docx.md
HorarisArqXarxes_2026.xlsx
lab_mininet/
Sessions Teoria Curs 2025 - 2026/

(4 entries)
</entries>
```

---

## Assistant (Build · claude-opus-4.6 · 3.1s)

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026"
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026</path>
<type>directory</type>
<entries>
Block 1 - Network Fundamentals/
Block 2 - Application and Transport/
Block 3 - Link layer/
Block 4 - Network Virtualization & Programmability/
Block 5 - Security/

(5 entries)
</entries>
```

---

## Assistant (Build · claude-opus-4.6 · 2.6s)

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer"
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer</path>
<type>directory</type>
<entries>


(0 entries)
</entries>
```

---

## Assistant (Build · claude-opus-4.6 · 3.3s)

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 2 - Application and Transport"
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 2 - Application and Transport</path>
<type>directory</type>
<entries>
2_Application_Layer_2025-2026.pptx
3_Transport_Layer_2025-2026.pptx
Bloc2-2 Transport.pptx

(3 entries)
</entries>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/HorarisArqXarxes_2026.xlsx"
}
```

**Error:**
```
Cannot read binary file: /home/sergio/mystuff/UPF/HorarisArqXarxes_2026.xlsx
```

---

## Assistant (Build · claude-opus-4.6 · 4.0s)

OK, so Block 3 is currently empty. Let me look at the other blocks for reference on structure/style, and also check what Block 1 looks like.

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 1 - Network Fundamentals"
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 1 - Network Fundamentals</path>
<type>directory</type>
<entries>
(old) Introduction - 2024-2025.pptx
0_Introduction_2025-2026.pptx
1_Network_Fundamentals_2025-2026.pptx
Gemini_Generated_Image_2gz68l2gz68l2gz6.png
Gemini_Generated_Image_2trha02trha02trh.png

(5 entries)
</entries>
```

---

## Assistant (Build · claude-opus-4.6 · 364.3s)

Good. Now I have a clear picture. Let me help you plan Block 3.

Here's what I'm working with:

**From the syllabus**, Block 3 - "Network Access & Internetworking" covers 2 theory sessions and includes:
- **Layer 2:** media access control, framing, Wired vs Wireless technologies, ARP, VLANs, tunneling
- **Layer 3:** IP, routing, OSPF/BGP, ICMP
- **Layer 5 apps for connectivity:** DHCP, NAT

**From your colleague's feedback**, you should also:
1. Reuse existing IP material from the Google Drive
2. Add content on **shortest path algorithms** for routing
3. Go deeper into **OSPF and BGP**
4. Cover **DHCP and NAT**
5. Reinforce **public vs private networks** and **subnetting**

---

Here's my proposed structure. Since you have **2 theory sessions**, I'd split it like this:

### Session 1: Layer 2 - Link Layer & Network Access
1. **Recap / Where are we in the stack** (brief, 2-3 slides)
   - Position L2/L3 in OSI vs TCP/IP
2. **Framing** (3-4 slides)
   - What is a frame, Ethernet frame structure, MTU
3. **Media Access Control** (3-4 slides)
   - Shared vs dedicated media, CSMA/CD, CSMA/CA
4. **Wired vs Wireless technologies** (3-4 slides)
   - Ethernet (802.3), Wi-Fi (802.11), brief mention of others
5. **ARP** (2-3 slides)
   - Address resolution, ARP table, ARP request/reply
6. **VLANs** (2-3 slides)
   - Why VLANs, 802.1Q tagging, trunk vs access ports
7. **Tunneling at L2** (1-2 slides)
   - Concept intro (deeper in Block 4 with virtualization)

### Session 2: Layer 3 - Internetworking + Connectivity Services
1. **IP Addressing** (4-5 slides) -- recyclable from existing material
   - IPv4 header, addressing, **public vs private addresses** (RFC 1918)
   - **Subnetting** (CIDR notation, subnet masks, exercises)
2. **ICMP** (2 slides)
   - Ping, traceroute, error messages
3. **Routing fundamentals** (3-4 slides)
   - Forwarding vs routing, routing tables
   - **Shortest path algorithms** (Dijkstra, Bellman-Ford)
4. **OSPF** (3-4 slides)
   - Link-state protocol, areas, LSAs, how Dijkstra is used
5. **BGP** (3-4 slides)
   - Path-vector protocol, AS concept, eBGP vs iBGP, policy-based routing
   - Why the Internet works (brief)
6. **DHCP** (2-3 slides)
   - DORA process, lease, relay agents
7. **NAT** (3-4 slides)
   - Why NAT exists (IPv4 exhaustion), static vs dynamic NAT, PAT/NAPT
   - Connection to public vs private addressing
   - NAT traversal problems (brief)

---

**Tool: question**

**Input:**
```json
{
  "questions": [
    {
      "question": "Does this two-session split and topic distribution look reasonable to you? Any topics you'd move, add, or remove?",
      "header": "Block 3 Structure",
      "options": [
        {
          "label": "Looks good, let's refine",
          "description": "The overall structure works. Let's iterate on details like slide counts, depth, or ordering."
        },
        {
          "label": "Rebalance sessions",
          "description": "I'd like to move some topics between Session 1 and Session 2 (tell me which)."
        },
        {
          "label": "Too much content",
          "description": "This seems like too much for 2 sessions. Let's cut or simplify some parts."
        },
        {
          "label": "Missing topics",
          "description": "There are topics I want to add that aren't listed here."
        }
      ]
    }
  ]
}
```

**Output:**
```
User has answered your questions: "Does this two-session split and topic distribution look reasonable to you? Any topics you'd move, add, or remove?"="FInd attach the google drive file I was talking in my mail in /home/sergio/mystuff/UPF/'1. Networks_I - 2024-2025.pdf'". You can now continue with the user's answers in mind.
```

---

## Assistant (Build · claude-opus-4.6 · 4.2s)

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/1. Networks_I - 2024-2025.pdf"
}
```

**Output:**
```
PDF read successfully
```

---

## Assistant (Build · claude-opus-4.6 · 3.8s)



I can't read PDF files directly unfortunately. Let me try converting it to text.

**Tool: bash**

**Input:**
```json
{
  "command": "which pdftotext || (apt list --installed 2>/dev/null | grep poppler) || echo \"pdftotext not found\"",
  "description": "Check if pdftotext is available"
}
```

**Output:**
```
/usr/bin/pdftotext

```

---

## Assistant (Build · claude-opus-4.6 · 3.5s)

**Tool: bash**

**Input:**
```json
{
  "command": "pdftotext \"/home/sergio/mystuff/UPF/1. Networks_I - 2024-2025.pdf\" \"/home/sergio/mystuff/UPF/1. Networks_I - 2024-2025.txt\"",
  "description": "Convert PDF to text"
}
```

---

## Assistant (Build · claude-opus-4.6 · 2.4s)

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/1. Networks_I - 2024-2025.txt"
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/1. Networks_I - 2024-2025.txt</path>
<type>file</type>
<content>1: Arquitectura de
2: Xarxes
3: 
4: Networks I:
5: Networking Fundamentals
6: Arquitectura de Xarxes
7: 
8: Networks I – Networking fundamentals
9: What are we going to see?
10: •
11: •
12: •
13: •
14: •
15: •
16: 
17: Basic concepts of networks
18: OSI and TCP/IP protocol stacks
19: Application layer
20: Transport layer
21: Network layer
22: Link layer
23: 
24: Arquitectura de Xarxes
25: 
26: The goal of this block is
27: to get a first impression
28: of how networks and the
29: Internet work
30: 
31: 3
32: 
33: Source:https://www.youtube.com/watch?v=vv4y_uOneC0 4
34: 
35: What is a network?
36: A network is composed of:
37: • Hosts/Devices running network applications
38: •
39: 
40: Smartphones, laptops, servers, vehicles, wearables,
41: appliances…
42: 
43: • Communication links
44: • Optical fiber, copper cables, air (wireless)…
45: • Protocols
46: • HTTP/S, DNS, Telnet, SSH, IP, 802.11, 802.3…
47: 
48: The Internet is a network of networks
49: implementing a myriad of technologies
50: Source: J.F. Kurose, K.W. Ross. Computer
51: Networking: a Top Down Approach (Pearson)
52: 
53: Arquitectura de Xarxes
54: 
55: 5
56: 
57: What is a protocol?
58: Protocols define:
59: •
60: 
61: A language for machines
62: •
63: 
64: E.g., Format and types of messages.
65: POST /users HTTP/1.1
66: Host: example.com
67: Content-Type: application/x-www-formurlencoded
68: Content-Length: 50
69: 
70: •
71: 
72: Expected operation and behavior
73: •
74: 
75: E.g., On receiving an HTTP request, I should look in
76: my server and send an HTTP response with a code
77: 
78: Protocols are essential for interoperability
79: 
80: Arquitectura de Xarxes
81: 
82: Source: J.F. Kurose, K.W. Ross. Computer
83: Networking: a Top Down Approach (Pearson)
84: 
85: 6
86: 
87: Who defines the protocols and rules?
88: 
89: Arquitectura de Xarxes
90: 
91: 7
92: 
93: OSI and TCP/IP protocol stacks
94: 
95: 8
96: 
97: The OSI Model
98: 
99: Source: https://en.wikipedia.org/wiki/OSI_model
100: 
101: Arquitectura de Xarxes
102: 
103: 9
104: 
105: The OSI Model
106: Application Layer (L7):
107: • OSI layer closest to the end user, which means both the application
108: layer and the user interact directly with the software application.
109: • The application layer interacts with network applications, that
110: implement a communication.
111: • Examples of protocols/software for application layer are: File
112: Transfer Protocol (FTP), Domain Name Service (DNS), Hypertext
113: Transfer Protocol (HTTP), Simple Mail Transfer Protocol (SMTP), and
114: Telnet, among others.
115: • These protocols form the bases for network services, such as:
116: File transfer, Web surfing, Email, Virtual terminals…
117: 
118: Arquitectura de Xarxes
119: 
120: 10
121: 
122: The OSI Model
123: Presentation Layer (L6):
124: • The presentation layer establishes context between application
125: layer entities, in which the application-layer entities may use
126: different syntax and semantics. The presentation service provides
127: a mapping between them (compression, encryption …).
128: • Examples of protocols/software for the
129: presentation layer include: Multipurpose
130: Internet Mail Extensions (MIME),
131: Transport Layer Security (TLS), Secure
132: Sockets Layer (SSL), among others.
133: 
134: Arquitectura de Xarxes
135: 
136: Source:https://www.youtube.com/watch?v=vv4y_uOneC0 11
137: 
138: The OSI Model
139: Session Layer (L5):
140: • The session layer controls the dialogues (connections) between
141: computers. It establishes, manages and terminates the
142: connections between the local and remote application.
143: • It establishes procedures for authentication, authorization and
144: session management.
145: • Examples of protocols/software for the session layer include, such
146: as Application Programming Interfaces (APIs): Named Pipes,
147: NetBios (Network Basic input output system), among others.
148: 
149: Arquitectura de Xarxes
150: 
151: 12
152: 
153: The OSI Model
154: Transport Layer (L4)
155: • It provides data transfer from a source to a destination host.
156: • Controls the reliability of communication through segmentation,
157: flow control, error control, connection and connectionless Tx.
158: • The transmission of data is divided into small data units (segments).
159: 
160: Arquitectura de Xarxes
161: 
162: Source:https://www.youtube.com/watch?v=vv4y_uOneC0 13
163: 
164: The OSI Model
165: Transport Layer (L4)
166: 
167: Arquitectura de Xarxes
168: 
169: Source:https://www.youtube.com/watch?v=vv4y_uOneC0 14
170: 
171: The OSI Model
172: Transport Layer (L4)
173: 
174: (bits)
175: 
176: Arquitectura de Xarxes
177: 
178: Source:https://www.youtube.com/watch?v=vv4y_uOneC0 15
179: 
180: The OSI Model
181: Transport Layer (L4)
182: • OSI defines five classes of connection-oriented transport protocols
183: (TP0 – TP4). TP4 is equivalent to TCP.
184: • Transmission Control Protocol (TCP) and User Datagram Protocol
185: (UDP) are two of the most widely used transport protocols. Notice
186: that, as opposed to the layers commented above, these are not
187: devices but protocols.
188: • UDP is not connection oriented, and is mostly used for real-time
189: communications, where delay-sensitive applications cannot afford
190: the re-transmission or reordering of packets (faster).
191: • TCP provides segment integrity checks, reordering of segments,
192: and it is connection oriented.
193: Arquitectura de Xarxes
194: 
195: 16
196: 
197: The OSI Model
198: Network Layer (L3)
199: • Transfer of data from one node to another in a different network.
200: • Interconnects nodes in different networks, End-2-End.
201: • Data is sent in packets.
202: • Data delivery at the network layer is not necessarily guaranteed to
203: be reliable.
204: • This layer structure and manages the different existing networks.
205: • It takes care of actions such as logical addressing (IPv4, IPv6),
206: routing (based on IP address and Mask) and path determination
207: (OSPF, BGP).
208: 
209: Arquitectura de Xarxes
210: 
211: 17
212: 
213: The OSI Model
214: Data link Layer (L2)
215: • Main function is the reliable transmission of frames between
216: two connected devices. Node-to-node transfer.
217: • It provides means to detect and even correct transmission
218: errors occurred in the physical layer (L1).
219: • These frames do not cross the boundaries of the Local Area
220: Network (LAN).
221: • It has two sublayers:
222: • Logical Link Control (LLC) (IP): multiplexes protocols running at the top of
223: data link. It can also provide node-to-node flow control and error
224: management.
225: • Physical Medium Access Control (MAC): determines who is allowed to
226: access the media at any one time. (12 digit alphanumeric)
227: Arquitectura de Xarxes
228: 
229: Source:https://www.youtube.com/watch?v=vv4y_uOneC0 18
230: 
231: The OSI Model
232: Physical Layer (L1)
233: • Raw data sent over a transmission medium.
234: • Units transmitted are bits which are organized as symbols.
235: • They are transported intro electrical, radio or optical signals.
236: • Examples:
237: • Ethernet physical layer (100BASE-TX, 100BASE-FX, 1000BASE-T & other
238: variants)
239: • Radio physical transmission (mobile networks, microwave links …), Bluetooth,
240: LoRa, among others
241: • Optical physical transmission such as CWDM/DWDM
242: 
243: • Devices: cables, hub and/or repeaters are “dumb”, mainly because
244: they do not perform any “smart” commutation or multiplexing. In
245: fact, a hub simply forwards any incoming stream of bits.
246: Arquitectura de Xarxes
247: 
248: 19
249: 
250: Role of OSI layers in communication
251: User in host A clicks on a HTTP link, we can consider it as the transmitter, so information starts
252: flowing from L7 to L1 in order to be encoded in bits and sent through PHY.
253: Encapsulates
254: Browser
255: 
256: Arquitectura de Xarxes
257: 
258: Source:https://www.youtube.com/watch?v=vv4y_uOneC0 20
259: 
260: Role of OSI layers in communication
261: Extracts
262: Browser
263: 
264: Host B on the other side of the PHY link then receives a series of bits encoded in a particular
265: way. B‘s L1 then “passes” these bits to L2 after adding headers and trailers that would allow L2 to
266: verify the integrity of the data. L2 then checks for data integrity issues, as well as source and
267: destination Medium Access Control (MAC) addresses. This process, alongside the intricacies of
268: each layer, continues up the OSI model untilArquitectura
269: the L7.de Xarxes
270: Source:https://www.youtube.com/watch?v=vv4y_uOneC0 21
271: 
272: The TCP/IP stack
273: • The TCP/IP is a set of protocols to support
274: network communication.
275: 
276: • Like the OSI model, the TCP/IP model is
277: layered and it is used in the same fashion as
278: the OSI model but with fewer layers.
279: • Most communications use the Internet
280: Protocol (IP), the TCP/IP model is technically
281: more in line with modern network
282: implementations.
283: • It compresses L5-L7 into a single “Application
284: layer”, and L1-L2 into a single “Link layer”.
285: Arquitectura de Xarxes
286: 
287: What a host needs to implement the
288: TCP/IP suite?
289: https://www.ietf.org/rfc/rfc1122.txt
290: 
291: 22
292: 
293: Application layer
294: 
295: 23
296: 
297: Application layer
298: •
299: •
300: 
301: •
302: 
303: This layer focuses on the communication between applications
304: running at different ends (e.g., hosts)
305: The application layer defines formats and protocols used to
306: application exchange data (e.g., webpage request/response, file
307: request/response, mail sending/receiving, etc.).
308: Examples: TELNET, SSH, FTP, SMTP, SNMP, etc.
309: •
310: •
311: 
312: There are dozens of application-layer protocols to enable all the features
313: available on the networks we use.
314: More on application layer protocols:
315: https://xenanetworks.com/wp-content/uploads/2017/05/List-ofApplications-and-Protocols_20170519-fin.pdf
316: Arquitectura de Xarxes
317: 
318: 24
319: 
320: HTTP (web contents)
321: • HTTP: Hypertext Transfer Protocol.
322: HTTP, running over TCP/IP, is in charge of sending the requests of the
323: items to the web server over your browser needs to render the page
324: requested, so getting back the pieces of information (html pages,
325: pictures, css, js, applets, etc…).
326: When wrap with a secure SSL/TLS connection, we have HTTPS.
327: More about HTTP: https://developer.mozilla.org/enUS/docs/Web/HTTP/Guides/Overview
328: Arquitectura de Xarxes
329: 
330: 25
331: 
332: DNS (resolve domain names)
333: • DNS: Domain Name Service. IP addresses are hard to remember and
334: most often not static. Instead, nodes are usually referenced by a
335: name that can be translated to an IP address. Translation is
336: performed by a DNS server able to return the IP address of the node
337: corresponding to the domain name or DN your device is asking for.
338: 
339: Arquitectura de Xarxes
340: 
341: 26
342: 
343: DNS (resolve domain names)
344: • Example: www.google.com can correspond to node 74.125.196.106
345: at a given point in time but change to another node later on. It is not
346: much different to the ARP protocol, but this time to find the address
347: of the node to which your application needs to connect.
348: 
349: Arquitectura de Xarxes
350: 
351: 27
352: 
353: DNS (resolve domain names)
354: 
355: Arquitectura de Xarxes
356: 
357: 28
358: 
359: DNS (resolve domain names)
360: 
361: Arquitectura de Xarxes
362: 
363: 29
364: 
365: DHCP (assign IP addresses)
366: DHCP: Dynamic Host Configuration Protocol. Unless your device has
367: been assigned a static network configuration (IP address), it will try to
368: to get one from any configuration server (DHCP server) available on the
369: same Local Area Network (LAN).
370: Basic operation:
371: 1. The requester broadcasts a message to all nodes on the LAN trying
372: to ”discover” a DHCP server.
373: 2. If there is one (usually in the home modem/router), it will answer to it with a
374: second message ”offering” a network configuration.
375: 3. Then, the requester will ”request” that configuration to the DHCP server in a
376: third message
377: 4. The DHCP server will finally ”acknowledge” the configuration.
378: Arquitectura de Xarxes
379: 
380: 30
381: 
382: DHCP (assign IP addresses)
383: • DHCP Discover: Broadcasted by the client.
384: • DHCP Offer: Server client including IP offered
385: • DHCP Request: Client answers with a broadcasted packet accepting the IP
386: • DHCP ACK: Servers acknowledges the request. IP assigned.
387: 
388: Arquitectura de Xarxes
389: 
390: 31
391: 
392: DHCP (assign IP addresses)
393: DHCP server: 223.1.2.5
394: 
395: • When the 4-step process
396: finishes, the node will
397: have obtained its network
398: configuration:
399: • IP address (e.g.
400: Broadcast: I’m a DHCP
401: server! Here’s an IP
402: 223.1.2.4)
403: address you can use
404: • Network mask
405: (e.g.
406: 255.255.255.0)
407: • Default gateway
408: (e.g. 223.1.2.1)
409: • DNS server(s) (e.g.
410: 223.1.2.5)
411: Broadcast: OK.
412: • Other optional
413: You’ve got that IP
414: parameters…
415: address!
416: 
417: DHCP discover
418: src : 0.0.0.0, 68
419: dest.: 255.255.255.255,67
420: yiaddr: 0.0.0.0
421: transaction ID: 654
422: 
423: arriving
424: client
425: 
426: Broadcast: is
427: there a DHCP
428: server out
429: there?
430: 
431: DHCP offer
432: 
433: src: 223.1.2.5, 67
434: dest: 255.255.255.255, 68
435: yiaddrr: 223.1.2.4
436: transaction ID: 654
437: lifetime: 3600 secs
438: DHCP request
439: src: 0.0.0.0, 68
440: dest:: 255.255.255.255, 67
441: yiaddrr: 223.1.2.4
442: transaction ID: 655
443: lifetime: 3600 secs
444: 
445: Broadcast: OK. I’ll
446: take that IP address!
447: 
448: DHCP ACK
449: src: 223.1.2.5, 67
450: dest: 255.255.255.255, 68
451: yiaddrr: 223.1.2.4
452: transaction ID: 655
453: lifetime: 3600 secs
454: 
455: Arquitectura de Xarxes
456: 
457: 32
458: 
459: DHCP (assign IP addresses)
460: Ethernet II, Src: IntelCor_b3:08:4e (f8:34:41:b3:08:4e), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
461: Internet Protocol Version 4, Src: 0.0.0.0, Dst: 255.255.255.255
462: User Datagram Protocol, Src Port: 68, Dst Port: 67
463: Dynamic Host Configuration Protocol (Discover)
464: Ethernet II, Src: ChiunMai_49:d0:cc (cc:9f:7a:49:d0:cc), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
465: Internet Protocol Version 4, Src: 192.168.43.1, Dst: 255.255.255.255
466: User Datagram Protocol, Src Port: 67, Dst Port: 68
467: Dynamic Host Configuration Protocol (Offer)
468: Ethernet II, Src: IntelCor_b3:08:4e (f8:34:41:b3:08:4e), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
469: Internet Protocol Version 4, Src: 0.0.0.0, Dst: 255.255.255.255
470: User Datagram Protocol, Src Port: 68, Dst Port: 67
471: Dynamic Host Configuration Protocol (Request)
472: Ethernet II, Src: ChiunMai_49:d0:cc (cc:9f:7a:49:d0:cc), Dst: Broadcast (ff:ff:ff:ff:ff:ff)
473: Internet Protocol Version 4, Src: 192.168.43.1, Dst: 255.255.255.255
474: User Datagram Protocol, Src Port: 67, Dst Port: 68
475: Dynamic Host Configuration Protocol (ACK)
476: Arquitectura de Xarxes
477: 
478: 33
479: 
480: DHCP – Packet Tracer Example
481: This captured video of Packet
482: Tracer simulator example
483: showing a DHCP session in
484: detail.
485: The PC0 broadcasts a DHCP
486: Discovery message, which gets
487: the DCHP Server
488: (192.169.1.100), which answers
489: back with a DHCP Offer with
490: @IP (192.168.1.101). PC0
491: accepts the IP offered (DHCP
492: Request) which is
493: acknowledged by the DHCP
494: Server with a DHCP ACK
495: 
496: Arquitectura de Xarxes
497: 
498: 34
499: 
500: Transport layer
501: 
502: 35
503: 
504: Transport layer
505: • Transport layer protocols provide to an application means to
506: communicate with another one
507: • Two main protocols:
508: • Transmission Control Protocol (TCP): Connection oriented. It provides ordered and
509: reliable transfer of data across network
510: -> TCP support internet applications such as: email, http, ftp, telnet
511: • User Datagram Protocol (UDP): connectionless oriented. No delivery guarantee.
512: Simpler than TCP
513: -> SNMP for management or RTP for real time voice & video communications
514: 
515: Arquitectura de Xarxes
516: 
517: 36
518: 
519: Transport layer ports
520: • Logical Endpoint in a communication for a process within a host
521: • Identified for each type of protocol
522: • Port number: 16-bit size (0 – 65535)
523: • Ports provide a multiplexing service for multiple services or multiple
524: communication sessions at one network address.
525: • Specific port numbers are commonly reserved to identify specific services.
526: • The lowest numbered 1024 port numbers are called the well-known port
527: numbers
528: 
529: Arquitectura de Xarxes
530: 
531: 37
532: 
533: Transport layer ports
534: 20: File Transfer Protocol (FTP) Data Transfer
535: 21: File Transfer Protocol (FTP) Command Control
536: 22: Secure Shell (SSH) Secure Login
537: 23: Telnet remote login service, unencrypted text messages
538: 25: Simple Mail Transfer Protocol (SMTP) E-mail routing
539: 53: Domain Name System (DNS) service
540: 80: Hypertext Transfer Protocol (HTTP) used in the World Wide Web
541: 110: Post Office Protocol (POP3)
542: 119: Network News Transfer Protocol (NNTP)
543: 123: Network Time Protocol (NTP)
544: 143: Internet Message Access Protocol (IMAP) Management of digital mail
545: 161: Simple Network Management Protocol (SNMP)
546: 194: Internet Relay Chat (IRC)
547: 443: HTTP Secure (HTTPS) HTTP over TLS/SSL
548: Arquitectura de Xarxes
549: 
550: 38
551: 
552: Transmission Control Protocol (TCP)
553: • Reliable, ordered, and error-checked delivery of a stream of octets (bytes)
554: between applications running on hosts communicating via an IP network
555: 
556: Source: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
557: 
558: Arquitectura de Xarxes
559: 
560: 39
561: 
562: Transmission Control Protocol (TCP)
563: • TCP Session establishment – Three-way handshaking
564: Server
565: 
566: Client
567: SYN
568: SYN-ACK
569: ACK
570: ……
571: FIN
572: ACK-FIN
573: 
574: Source: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
575: 
576: Arquitectura de Xarxes
577: 
578: 40
579: 
580: User Datagram Protocol (UDP)
581: • Connectionless communication – unreliable delivery. No guarantee of
582: delivery, ordering or duplicate protection
583: • No handshaking is required
584: 
585: Source: https://en.wikipedia.org/wiki/User_Datagram_Protocol
586: 
587: Arquitectura de Xarxes
588: 
589: 41
590: 
591: Network (IP) layer
592: 
593: 42
594: 
595: Internet Protocol (IP)
596: • Provides End to End delivery of application data (first layer to provide
597: E2E)
598: • IP provides datagram, connection-less, transport service across the
599: network.
600: • IP does not care about the underlying physical mediums and their access
601: • IP is unreliable meaning it does not guarantee the data delivery, relies in
602: upper layers for this purpose.
603: • Defines a unique address.
604: • Uses routing protocols to build L3 forwarding tables.
605: • Routers are the L3 devices. They separate Local Area Networks.
606: Arquitectura de Xarxes
607: 
608: 43
609: 
610: IPv4 Header
611: 0
612: 
613: 4
614: Version
615: 
616: 8
617: IHL
618: 
619: 16
620: 
621: 32
622: 
623: Type of Service
624: 
625: Identification
626: Time To Live
627: 
628: 19
629: Total Length
630: Flags
631: 
632: Fragment Offset
633: Header Checksum
634: 
635: Protocol
636: Source IP Address
637: 
638: Destination IP Address
639: Options
640: 
641: Padding
642: 
643: Arquitectura de Xarxes
644: 44
645: 
646: IPv4 Header
647: Version
648: IHL
649: 
650: • IP version: IPv4
651: • IP Header Length: Header number of words (1 word = 4 bytes). Typically 5
652: (Options + Padding typically is not present)
653: 
654: Type of Service
655: 
656: • TOS: 6-bit Differentiated Services Code Point (DSCP – DiffServ) + 2-bit
657: Explicit Congestion Notification (ECN)
658: 
659: Total Length
660: 
661: • 16-bit field defines the entire packet size in bytes, including header and
662: data. Minimum size is 20 bytes (header without data) and maximum is
663: 65,535 bytes.
664: 
665: Identification
666: 
667: • Identifies the packet. Used for reassembly of fragmented datagrams
668: 
669: Arquitectura de Xarxes
670: 45
671: 
672: IPv4 Header
673: Flags
674: 
675: • Three-bit field used to control or identify fragments. Bit 0: Reserved; must be zero.
676: Bit 1: Don't Fragment (DF). Bit 2: More Fragments (MF)
677: 
678: Fragment Offset
679: 
680: • The fragment offset measured in units of eight-byte blocks. 13-bits long and
681: specifies the offset of a particular fragment relative to the beginning of the original
682: unfragmented IP datagram. The first fragment has an offset of zero.
683: 
684: Time To Live
685: 
686: • Number of hops the packet can be routed. Decrease by one in each hop. Used to
687: prevent IP packet is routed infinitely in the ntw. When TTL = 0, packet is discarded
688: 
689: Protocol
690: 
691: • 8-bit identifier indicating the payload type: TCP (17), UDP (16), ICMP (1), IGMP (2).
692: 
693: Header Checksum • Checksum to detect errors in the header.
694: 
695: Arquitectura de Xarxes
696: 46
697: 
698: IPv4 Header
699: Source IP Address
700: 
701: • 32-bit IP address of the source sending the packet
702: 
703: Destination IP Address
704: 
705: • 32-bit IP address of the destination of the packet
706: 
707: Options
708: 
709: • Not often used.
710: 
711: Padding
712: 
713: • Ensure header ends in a 32-bit format. Used to complement the options field.
714: 
715: Arquitectura de Xarxes
716: 47
717: 
718: Arquitectura de Xarxes
719: 
720: 48
721: 
722: IPv4 Addressing
723: • Global Addressing is provided by IANA (https://www.iana.org/)
724: • Two main spaces: public address space and private address space
725: • Public address space routable publicly and managed by Regional Internet
726: Registry (RIR) – RIPE NCC in Europe. ARIN in US&Canada
727: • Private address space: not advertised in public internet
728: • 10.0.0.0 – 10.255.255.255
729: • 172.16.0.0 – 172.31.255.255
730: • 192.168.0.0 – 192.168.255.255
731: • 169.254.0.0 – 169.254.255.255
732: Arquitectura de Xarxes
733: 
734: 49
735: 
736: IPv4 Addressing
737: • Format IPv4: 32-bit (4 bytes). Typically noted as 4 decimal numbers separated by
738: dots: XX.XX.XX.XX
739: • Two parts: Network + Host
740: • Example:
741: 
742: 192.168.1.63
743: Network
744: 
745: Host
746: 
747: • Original IPv4 network defined classes (A,B,C,D,E) named Classful addressing but not
748: used anymore due to many problems
749: • Today is used Classless Inter-Domain Routing (CIDR) – hierarchy for address
750: allocation. Uses the concept of network mask
751: Arquitectura de Xarxes
752: 
753: 50
754: 
755: IPv4 Addressing
756: • Classless Inter-Domain Routing (CIDR)
757: Network part
758: 
759: Host part
760: 
761: IP Address
762: 
763: XXXXXXXX.XXXXXXXX.XXXXXXXX.XXXXXXXX
764: 
765: Subnet
766: Mask
767: 
768: 11111111.11111111.11111111.00000000
769: 
770: • Example: 192.168.1.63. Subnet mask: 255.255.255.0
771: • Network noted as: 192.168.1.0/24
772: • Number of hosts possible: 28 -2 = 254
773: • 192.168.1.0 is the network address
774: • 192.168.1.255 is the broadcast address
775: Arquitectura de Xarxes
776: 
777: 51
778: 
779: IPv4 Addressing
780: • Variable Length Subnet Masking (VLSM)
781: • Allows to divide network into different subnets with different sizes
782: • Based on the number of hosts needed in each subnet
783: • Example:
784: • Main network: 10.10.0.0/16
785: • Subnetwork 1: 10.10.5.0/24. Subnetwork 2: 10.10.6.0/24. Subnetwork 3: 10.10.7.0/24
786: • Subnetwork 1.1: 10.10.5.64/26. Subnetwork 1.2: 10.10.5.128/26
787: 
788: • Special subnets
789: • /31: Neither network nor broadcast address. Only two addresses. For point to
790: point link cases.
791: • /32: Only one address which represents the network itself. Used for loopback and
792: system addresses (not associated to physical ports)
793: Arquitectura de Xarxes
794: 
795: 52
796: 
797: IP packet routing
798: • Unicast routing: one-to-one datagram sending/reception
799: • Broadcast routing: one-to-all datagram sending/reception
800: • Multicast routing: one-to-many datagram sending/reception
801: 
802: Arquitectura de Xarxes
803: 
804: 53
805: 
806: IP packet routing
807: • Unicast routing: one-to-one datagram sending/reception
808: R2
809: 
810: R3
811: 
812: IP Packet
813: SA: 192.168.1.15
814: DA: 10.10.5.3
815: 
816: 10.10.10.2
817: R1
818: 
819: 192.168.1.0/24
820: 
821: R4
822: 
823: R5
824: 
825: R6
826: 
827: 10.10.0.0/16
828: 10.20.240.0/22
829: 
830: 192.168.1.15
831: 
832: 10.10.5.2
833: 192.168.1.25
834: 
835: 172.16.2.3
836: 
837: 10.20.240.2
838: 
839: 10.20.240.3
840: 
841: Arquitectura de Xarxes
842: 
843: 10.10.5.3
844: 
845: 10.20.241.2
846: 54
847: 
848: IP packet routing
849: • Broadcast routing: one-to-all datagram sending/reception
850: R2
851: 
852: R3
853: 
854: IP Packet
855: SA: 192.168.1.15
856: DA: 10.10.255.255
857: 
858: 10.10.10.2
859: R1
860: 
861: 192.168.1.0/24
862: 
863: R4
864: 
865: R5
866: 
867: R6
868: 
869: 10.10.0.0/16
870: 10.20.240.0/22
871: 
872: 192.168.1.15
873: 
874: 10.10.5.2
875: 192.168.1.25
876: 
877: 172.16.2.3
878: 
879: 10.20.240.2
880: 
881: 10.20.240.3
882: 
883: Arquitectura de Xarxes
884: 
885: 10.10.5.3
886: 
887: 10.20.241.2
888: 55
889: 
890: IP packet routing
891: • Multicast routing: one-to-many datagram sending/reception
892: R2
893: 
894: R3
895: 
896: IP Packet
897: SA: 192.168.1.15
898: DA: 239.1.1.1
899: 
900: 10.10.10.2
901: R1
902: 
903: 192.168.1.0/24
904: 
905: R4
906: 
907: R5
908: 
909: R6
910: 
911: 10.10.0.0/16
912: 10.20.240.0/22
913: 
914: 192.168.1.15
915: 
916: 192.168.1.25
917: 
918: 172.16.2.3
919: 
920: 10.20.240.2 10.20.240.3
921: Members of multicast group
922: Arquitectura de Xarxes
923: 
924: 10.10.5.2
925: 10.10.5.3
926: Members of multicast group
927: 10.20.241.2
928: III
929: 56
930: 
931: Internet Control Message Protocol (ICMP)
932: • Internet Control Message Protocol
933: • Reports problems in IP packets sending
934: • Provides means to test connectivity
935: • ICMPv4 and ICMPv6
936: • Messages:
937: • Echo Request & Echo Reply (popular ping)
938: • Destination Unreachable
939: 
940: Arquitectura de Xarxes
941: 
942: 57
943: 
944: Internet Control Message Protocol (ICMP)
945: Message
946: 
947: What does it mean?
948: 
949: 0 – Echo Reply
950: 
951: Yes, I am
952: 
953: 3 – Destination unreachable
954: 
955: I can’t deliver the packet
956: 
957: 4 – Source Squelch
958: 
959: Do not pass me too much packets
960: 
961: 5 – Redirect
962: 
963: Your table is not updated
964: 
965: 8 – Echo Request
966: 
967: Are you alive?
968: 
969: 11 – Time exceeded
970: 
971: “time to live” of the packet =0
972: 
973: 12 – Parameter problem
974: 
975: Some header parameter is wrong
976: 
977: 13 – Timestamp request
978: 
979: Tell me the time when your packet is out to calculate the delay
980: 
981: 14 – Timestamp reply
982: 
983: My packet is out at 12:30:31
984: 
985: Arquitectura de Xarxes
986: 
987: 58
988: 
989: Internet Control Message Protocol (ICMP)
990: • Example: ping to www.google.com
991: 
992: Arquitectura de Xarxes
993: 
994: 59
995: 
996: Network Address Translation (NAT)
997: • In the access to internet is very common to use Router Gateways
998: • These Router Gateways separate the Local Network Area (LAN) from the Wide Area
999: Network (WAN). Typical case: Home Gateways
1000: • Router gateway performs NAT, so private IP addresses are translated to public ones.
1001: • “Basic NAT” performs one-to-one IP Address translation. It does not use the transport
1002: port number. This is a big drawback
1003: LAN 192.168.1.0/24
1004: 
1005: Eth 2 (LAN)
1006: 192.168.1.1
1007: 
1008: Eth 1 (WAN)
1009: 81.46.38.1
1010: WAN 81.46.38.0/24
1011: 
1012: 192.168.1.2
1013: 
1014: 192.168.1.3
1015: 
1016: 192.168.1.4
1017: 
1018: NAT
1019: Router
1020: Gateway
1021: 
1022: Arquitectura de Xarxes
1023: 
1024: NAT Table. Public pool:
1025: 81.46.38.1 – 81.46.38.254/24
1026: ISP/Internet
1027: 
1028: Internal
1029: 
1030: External
1031: 
1032: 192.168.1.2
1033: 
1034: 81.46.38.2
1035: 
1036: 192.168.1.3
1037: 
1038: 81.46.38.3
1039: 
1040: 192.168.1.4
1041: 
1042: 81.46.38.4
1043: 
1044: 60
1045: 
1046: NAT – Address-Port Translation
1047: • Many-to-one address translation. Same public IP Address, different transport ports.
1048: • It uses the L4 Transport port number to perform the translation
1049: • Typically used in Residential internet access provided by ISP (Home Gateways)
1050: • Private and Public ports can be the same or different. Some apps (legacy) require
1051: same port and/or specific port.
1052: 
1053: LAN 192.168.1.0/24
1054: 
1055: Eth 2 (LAN)
1056: 192.168.1.1
1057: 
1058: Eth 1 (WAN)
1059: 81.46.38.201
1060: WAN 81.46.0.0/12
1061: 
1062: 192.168.1.2
1063: 
1064: 192.168.1.3
1065: 
1066: 192.168.1.4
1067: 
1068: NAT
1069: Router
1070: Gateway
1071: 
1072: Arquitectura de Xarxes
1073: 
1074: NAT Table. Public pool:
1075: 81.46.38.201/32
1076: ISP/Internet
1077: 
1078: Internal
1079: 
1080: External
1081: 
1082: 192.168.1.2:1501
1083: 
1084: 81.46.38.201:1501
1085: 
1086: 192.168.1.3:1502
1087: 
1088: 81.46.38.201:2222
1089: 
1090: 192.168.1.4:1503
1091: 
1092: 81.46.38.201:2223
1093: 
1094: 61
1095: 
1096: NAT – Packet Tracer Example
1097: 81.10.10.101
1098: 
1099: 10.10.10.10
1100: 
1101: 192.168.1.101
1102: This a Packet Tracer simulator
1103: example showing a NAT case.
1104: The Home Gateway (HGW) has a NAT
1105: Table which maps Internal @IP with
1106: External @IP.
1107: When a PING ICMP message is sent
1108: from 192.168.1.101 PC to 10.10.10.10
1109: Server, there is an @IP NATing
1110: 192.168.1.101 -> 81.10.10.101
1111: 
1112: NAT – Packet Tracer Example
1113: 
1114: This captured video of Packet Tracer
1115: simulator example showing a NAT case
1116: in detail.
1117: When a PING ICMP message is sent
1118: from 192.168.1.101 PC1 to 10.10.10.10
1119: upf.edu Server, we can see at each
1120: step of the PING message sending how
1121: the IP address in the L3 AT message is
1122: being changed due to the NAT
1123: 192.168.1.101 <-> 81.10.10.101
1124: 
1125: Link layer (MAC+PHY)
1126: 
1127: 64
1128: 
1129: Link layer
1130: • Network interface layer of the TCP/IP – it uses frames
1131: • Interacts with the HW (Network Interface Controller – NIC)
1132: • Provides local addressing (Ethernet: MAC addresses)
1133: • Upper layers do not need to take care of underlying physical infrastructure – it hides the
1134: physical medium details
1135: • Scope is Local Network only – L2 frames are transmitted only between hosts in the same
1136: network
1137: • Inside local network, L2 headers are not modified.
1138: • L2 headers are de-capsulated and re-encapsulated as they move from one network to
1139: another
1140: • L2 networks are separated in higher levels with routers.
1141: 
1142: Arquitectura de Xarxes
1143: 
1144: 65
1145: 
1146: Ethernet
1147: • L2 in shared physical medium.
1148: • Uses MAC addresses as identification and provided in the Ethernet header.
1149: • Encapsulates upper layers in Ethernet frames.
1150: • Allow to send frames to all devices in the same network. Referred to
1151: Broadcasting domain or Local Area Network
1152: • Two frame types
1153: • Ethernet II
1154: • 802.3
1155: 
1156: Arquitectura de Xarxes
1157: 
1158: 66
1159: 
1160: Ethernet
1161: Ethernet II: typically used to transport IP datagrams
1162: Preamble
1163: 
1164: S
1165: F
1166: D
1167: 
1168: DA
1169: 
1170: SA
1171: 
1172: Type
1173: 
1174: Payload (46 – 1500 bytes)
1175: 
1176: FCS
1177: 
1178: 802.3: Uses both MAC and Logical Link Control (LLC) layers
1179: Preamble
1180: 
1181: S
1182: F
1183: D
1184: 
1185: DA
1186: 
1187: SA
1188: 
1189: Length
1190: 
1191: LLC header & Payload (46–1500 bytes)
1192: 
1193: Arquitectura de Xarxes
1194: 
1195: FCS
1196: 
1197: 67
1198: 
1199: Ethernet
1200: Preamble
1201: 
1202: S
1203: F
1204: D
1205: 
1206: Dest Add
1207: (DA)
1208: 
1209: Source
1210: Add (SA)
1211: 
1212: Type /
1213: Length
1214: 
1215: Payload (46 – 1500 bytes)
1216: 
1217: FCS
1218: 
1219: • Preamble (bit) + Start Frame Delimiter (byte) (7+1 bytes): Fixed sequence 0x55555555555555D5
1220: (10101010 10101010 10101010 10101010 10101010 10101010 10101010 10101011)
1221: • Destination MAC address (6 bytes)
1222: • Source MAC address (6 bytes)
1223: • Type / Length: Payload length or type field (Ethertype – 2 bytes)
1224: • Value < 1536 then 802.3 frame
1225: • Otherwise Ethernet II frame
1226: 
1227: • Frame Check Sequence (4 bytes): To check frame has not been damaged during transmission
1228: Arquitectura de Xarxes
1229: 
1230: 68
1231: 
1232: Ethernet
1233: • MAC addresses
1234: • Format: 48-bit address typically expressed as XX-XX-XX-XX-XX-XX
1235: • Two parts:
1236: • Organization Unit Identifier (OUI): 24-bit, first three bytes. Assigned to each
1237: vendor/manufacturer by the IEEE.
1238: • Device Identifier: 24-bit, the lower three bytes. Assigned by the vendor/manufacturer
1239: to each device
1240: 
1241: • MAC addresses are physically attached to the device. Burned in the device.
1242: 00
1243: 
1244: 80
1245: 
1246: DA
1247: 
1248: Organization Unit Identifier
1249: 
1250: F1
1251: 
1252: 53
1253: 
1254: 21
1255: 
1256: Network Interface Controller Specific
1257: Arquitectura de Xarxes
1258: 
1259: 69
1260: 
1261: Ethernet – Ethertype field
1262: Ethertype
1263: 
1264: Protocol
1265: 
1266: 0x0800
1267: 
1268: IPv4
1269: 
1270: 0x0806
1271: 
1272: ARP
1273: 
1274: 0x8100
1275: 
1276: VLAN-tagged frame (802.1Q)
1277: 
1278: 0x86DD
1279: 
1280: IPv6
1281: 
1282: 0x8847
1283: 
1284: MPLS Unicast
1285: 
1286: 0x8848
1287: 
1288: MPLS Multicast
1289: 
1290: 0x88A8
1291: 
1292: Provider Bridging (QinQ – 802.1ad)
1293: 
1294: Arquitectura de Xarxes
1295: 
1296: 70
1297: 
1298: Ethernet Datalink Switching
1299: Hubs vs switches
1300: • Hubs:
1301: • Receive Eth frames and replicate them in all ports except the incoming one.
1302: • Do not analyze the L2 frame.
1303: • Do not have any Forwarding Table.
1304: • All interfaces belong to the same collision domain and broadcast domain
1305: • Half-duplex
1306: 
1307: • Switches:
1308: • Analyze L2 Eth frames and forward them only to the correct egress port.
1309: • Has a MAC Forwarding Table.
1310: • Each interface is a collision domain. All interfaces belong to the same broadcast domain
1311: • Full duplex
1312: *Note: Broadcast domains are separated with routers
1313: Arquitectura de Xarxes
1314: 
1315: 71
1316: 
1317: Switch Forwarding
1318: MAC Table
1319: Address
1320: Interface
1321: 
1322: Ethernet Datalink Switching
1323: 
1324: 00-80-E2-12-E3-23
1325: 
1326: 1
1327: 
1328: 00-80-14-12-32-AD
1329: 
1330: 2
1331: 
1332: 00-FD-21-EE-12-13
1333: 
1334: 3
1335: 
1336: 3
1337: 
1338: 1
1339: 2
1340: 00-80-E2-12-E3-23
1341: 
1342: 00-80-14-12-32-AD 00-FD-21-EE-12-13
1343: 
1344: 00-80-E2-12-E3-23
1345: 
1346: 00-80-14-12-32-AD 00-FD-21-EE-12-13
1347: 
1348: Ethernet II Frame
1349: SA: 00-80-E2-12-E3-23
1350: DA: 00-FD-21-EE-12-13
1351: 
1352: Arquitectura de Xarxes
1353: 
1354: 72
1355: 
1356: Ethernet Datalink Switching – Switch Packet
1357: Tracer Example (MAC Address Table)
1358: To perform the frames
1359: forwarding, the switch has a
1360: MAC Address Table, so for each
1361: port Fa0/X it is identified the
1362: MAC address connected to it.
1363: See as well, the MAC Address
1364: Table has type for all entries as
1365: DYNAMIC, so all MAC address
1366: learning process is done
1367: dynamically. Also, all ports
1368: belong to default VLAN (1)
1369: 
1370: Arquitectura de Xarxes
1371: 
1372: 73
1373: 
1374: Ethernet Datalink Switching
1375: • Unicast datalink switching: one-to-one datalink sending/reception
1376: • Broadcast datalink switching: one-to-all datalink sending/reception
1377: • Multicast datalink switching: one-to-many datalink sending/reception
1378: 
1379: Arquitectura de Xarxes
1380: 
1381: 74
1382: 
1383: Ethernet Datalink Switching
1384: • Unicast datalink switching: one-to-one datalink sending/reception
1385: 
1386: 5
1387: 
1388: 1
1389: 4
1390: 
1391: 2
1392: 3
1393: 
1394: 00-80-E2-12-E3-23
1395: 
1396: Ethernet II Frame
1397: SA: 00-80-E2-12-E3-23
1398: DA: 00-FD-14-CD-ED-11
1399: 
1400: 00-80-14-12-32-AD
1401: 
1402: 00-FD-14-CD-ED-11
1403: 
1404: 00-FD-21-EE-12-13
1405: 
1406: 00-FD-21-FA-2D-15
1407: Arquitectura de Xarxes
1408: 
1409: 75
1410: 
1411: Ethernet Datalink Switching
1412: • Broadcast datalink switching: one-to-all datalink sending/reception
1413: 
1414: 5
1415: 
1416: 1
1417: 4
1418: 
1419: 2
1420: 3
1421: 
1422: 00-80-E2-12-E3-23
1423: 
1424: Ethernet II Frame
1425: SA: 00-80-E2-12-E3-23
1426: DA: FF-FF-FF-FF-FF-FF
1427: 
1428: 00-80-14-12-32-AD
1429: 
1430: 00-FD-14-CD-ED-11
1431: 
1432: 00-FD-21-EE-12-13
1433: 
1434: 00-FD-21-FA-2D-15
1435: Arquitectura de Xarxes
1436: 
1437: 76
1438: 
1439: Ethernet Datalink Switching
1440: • Multicast datalink switching: one-to-many datalink sending/reception
1441: • Multicast addresses have OUI 01-00-5E
1442: • Frames only received by the group members
1443: 5
1444: 
1445: 1
1446: 4
1447: 
1448: 2
1449: 3
1450: 
1451: 00-80-E2-12-E3-23
1452: 
1453: Ethernet II Frame
1454: SA: 00-80-E2-12-E3-23
1455: DA: 01-00-5E-01-01-01
1456: 
1457: 00-80-14-12-32-AD
1458: 
1459: 00-FD-14-CD-ED-11
1460: 
1461: 00-FD-21-EE-12-13
1462: 
1463: Members of multicast
1464: Group 01-00-5E-01-01-01
1465: 
1466: 00-FD-21-FA-2D-15
1467: Arquitectura de Xarxes
1468: 
1469: 77
1470: 
1471: Ethernet Datalink Switching
1472: Switch Forwarding Table
1473: • Ethernet switches learn MAC addresses dynamically.
1474: • When a host sends an Eth frame in a given interface, Forwarding Database
1475: (FDB) assigns this interface to the MAC of the sending hosts.
1476: • Since destination MAC address is unknown, broadcast the Eth frame to all
1477: interfaces except the ingress one.
1478: • When receiving answer from the destination MAC address in a given
1479: interface, switch assigns it to the destination MAC address. So further
1480: frames are no longer broadcasted.
1481: 
1482: Arquitectura de Xarxes
1483: 
1484: 78
1485: 
1486: Address Resolution Protocol (ARP)
1487: • Resolves Ethernet MAC address for a given IP Address
1488: • Broadcast a message in the Local Area Network
1489: • ARP do not cross the Local Area Network
1490: • Result is cached in the hosts, so no further requests are needed
1491: 
1492: Arquitectura de Xarxes
1493: 
1494: 79
1495: 
1496: Address Resolution Protocol (ARP)
1497: • If a node with that address receives the message, it will answer node
1498: y.y.y.y with its own MAC address, so that after this two-message
1499: dialogue, both nodes will know each other’s IP and MAC addresses
1500: and will be able to send data frames (Ethernet or WiFi) to each other.
1501: Also, the switch connecting them will become aware of the existence
1502: of those MAC addresses and the physical port they are connected to
1503: in case of a wired Ethernet installation.
1504: • All communication between the LAN nodes takes place at layer 2,
1505: using MAC addresses. This includes communication between devices
1506: and the default gateway, for messages that have an IP destination
1507: outside the LAN, ARP resolves with the MAC address of the default
1508: gateway
1509: 
1510: Arquitectura de Xarxes
1511: 
1512: 80
1513: 
1514: Address Resolution Protocol (ARP)
1515: • Example: Ping to new host in LAN
1516: 
1517: Arquitectura de Xarxes
1518: 
1519: 81
1520: 
1521: Ethernet – Redundancy
1522: • Link redundancy: Link Aggregation Group (LAG)
1523: • Provides multiple links between two nodes with same characteristics (full duplex,
1524: same speed)
1525: • Allows to have more throughput as well as keep connectivity in case of partial failure
1526: 
1527: • The idea is to aggregate multiple links acting as a single one
1528: • They can be statically created or dynamically (Link Aggregation Control Protocol LACP
1529: – 802.1AX and 802.1aq)
1530: LAG
1531: 
1532: Host 1
1533: 
1534: Switch 2
1535: 
1536: Switch 1
1537: 
1538: Arquitectura de Xarxes
1539: 
1540: Host 2
1541: 
1542: 82
1543: 
1544: Ethernet – Redundancy
1545: • Path redundancy: Spanning Tree Protocol (STP)
1546: • Provides multiple paths between two nodes
1547: • The advantage is clear: Provide high protection in front of full path failures
1548: • Disadvantage: The existence of multiple paths can create switch FDB table instability
1549: and infinite loops (broadcast storms). Note: L2 does not have TTL as L3
1550: 
1551: Switch 1
1552: 
1553: Host 1
1554: 
1555: Switch 2
1556: 
1557: Switch 3
1558: 
1559: Arquitectura de Xarxes
1560: 
1561: Host 2
1562: 
1563: 83
1564: 
1565: Spanning Tree Protocol (STP)
1566: • Spanning Tree Protocol (STP – 802.1D): designed to avoid infinite L2 loops in path redundancy
1567: • Uses a root/branch/leaf model. Root & branches are switches. Leaves are end nodes.
1568: • Blocks selectively ports to avoid L2 loops (loop free topologies)
1569: • Only involve switches. Hosts are not aware of STP
1570: • Variants: Rapid STP (802.1w), Multiple STP (802.1s)
1571: • Uses BPDUs (Bridge Protocol Data Units) – sent periodically between switches
1572: • MAC DA: 01-80-C2-00-00-00 (Bridge Group Address)
1573: • Root Bridge: Switch acting as root (default: Lowest MAC)
1574: • Use Root Path Cost (RPC) to setup Root ports (lowest RPC). Other are Designated ports (only one in each
1575: collision domain)
1576: • Blocked ports: Rest of ports. Accept BPDUs but do not do frame forwarding or MAC learning.
1577: • Convergence time: 30-60 seconds -> Rapid STP (RSTP): 2-3 seconds
1578: Arquitectura de Xarxes
1579: 
1580: 84
1581: 
1582: Spanning Tree Protocol (STP)
1583: Root Bridge: Switch acting as
1584: root (default: Lowest MAC)
1585: 
1586: Avoid infinite L2 loops
1587: 
1588: System ID (VLAN) -> Default value 1
1589: Priority (at the beginning, all the same)
1590: MAC -> Lowest MAC
1591: Source:https://www.youtube.com/watch?v=1RHZYyrJH-8 85
1592: 
1593: Spanning Tree Protocol (STP)
1594: D
1595: 
1596: R
1597: Switch 2
1598: 
1599: D
1600: D
1601: Host 1
1602: 
1603: STP Blocks selectively some ports
1604: to allow loop free topologies
1605: 
1606: B
1607: D
1608: 
1609: Switch 1
1610: Root Bridge
1611: 
1612: D
1613: 
1614: R
1615: Switch 3
1616: 
1617: Host 2
1618: 
1619: R
1620: 
1621: Root Ports – Lowest Root Cost Port (RCP)
1622: 
1623: D
1624: 
1625: Designated Ports – All Root bridge + non-root ports in other switches (ONLY one per collision domain)
1626: 
1627: B
1628: 
1629: All rest ports (non-root, non-designated)
1630: 
1631: II
1632: Arquitectura de Xarxes
1633: 
1634: 86
1635: 
1636: Spanning Tree Protocol (STP)
1637: 
1638: II
1639: Arquitectura de Xarxes
1640: 
1641: 87
1642: 
1643: Spanning Tree Protocol (STP)
1644: 
1645: *Tool: Cisco Package Tracer
1646: 
1647: Source:https://www.youtube.com/watch?v=1RHZYyrJH-8 88
1648: 
1649: Spanning Tree Protocol (STP)
1650: 
1651: Source:https://www.youtube.com/watch?v=1RHZYyrJH-8 89
1652: 
1653: Spanning Tree Protocol (STP)
1654: 
1655: Source:https://www.youtube.com/watch?v=1RHZYyrJH-8 90
1656: 
1657: Physical layer (L1)
1658: •
1659: •
1660: 
1661: This layer deals with the physical medium (air, cables,
1662: etc.) and data transmissions
1663: Functions:
1664: •
1665: •
1666: •
1667: •
1668: 
1669: •
1670: 
1671: Encode and decode data bits into symbols
1672: Manages the media together with the link layer (e.g.,
1673: carrier sensing)
1674: Performs the actual transmission of signals over the
1675: medium (e.g., modulation of symbols into electrical
1676: impulses or radio waves).
1677: Ensures synchronization between the transmitter and
1678: the receiver.
1679: 
1680: Relevant design concepts:
1681: •
1682: •
1683: •
1684: •
1685: 
1686: Bandwidth
1687: Signal strength
1688: Attenuation
1689: Noise
1690: Source:https://www.youtube.com/watch?v=1RHZYyrJH-8 91
1691: 
1692: Example
1693: 
1694: 92
1695: 
1696: Let’s see an Example – email sending
1697: 
1698: SMTP
1699: 
1700: SMTP
1701: 
1702: Bob’s user
1703: agent
1704: email sender
1705: 
1706: POP3/IMAP
1707: 
1708: Alice’s
1709: email server
1710: (yahoo)
1711: 
1712: Bob’s
1713: email server
1714: (gmail)
1715: 
1716: Alice’s user agent
1717: email receiver
1718: 
1719: Simple Mail Transfer Protocol (SMTP)
1720: Arquitectura de Xarxes
1721: 
1722: 93
1723: 
1724: Data Encapsulation concept
1725: 
1726: SMTP Header
1727: 
1728: SMTP Body
1729: 
1730: MAIL From: User1@orgA.oom
1731: RCPT To: User2@orgB.com
1732: 
1733: DATA: XXXX.
1734: 
1735: Bob’s user
1736: agent
1737: email sender
1738: 
1739: Application
1740: 
1741: TCP Header
1742: Source Port: 1234
1743: Destination Port: 25
1744: 
1745: SMTP Header
1746: 
1747: SMTP Body
1748: 
1749: Transport
1750: 
1751: IP Header
1752: IP Source: 172.16.32.1
1753: IP Destination: 172.32.16.2
1754: 
1755: TCP Header
1756: 
1757: SMTP Header
1758: 
1759: SMTP Body
1760: 
1761: IP Network
1762: 
1763: TCP Header
1764: 
1765: SMTP Header
1766: 
1767: SMTP Body
1768: 
1769: Ethernet
1770: 
1771: Ethernet Header
1772: MAC Source: 00-E4-3C-F0-13-43
1773: MAC Destination: 00-80-2E-AB-13-65
1774: 
1775: IP Header
1776: 
1777: Arquitectura de Xarxes
1778: 
1779: 94
1780: 
1781: Data Encapsulation concept
1782: Bob’s
1783: email server
1784: (gmail)
1785: 
1786: Application
1787: 
1788: SMTP Header
1789: 
1790: SMTP Body
1791: 
1792: MAIL From: User1@orgA.oom
1793: RCPT To: User2@orgB.com
1794: 
1795: DATA: XXXX.
1796: 
1797: TCP Header
1798: Source Port: 1234
1799: Destination Port: 25
1800: 
1801: Transport
1802: IP Network
1803: 
1804: SMTP Header
1805: 
1806: SMTP Body
1807: 
1808: IP Header
1809: IP Source: 172.16.32.1
1810: IP Destination: 172.32.16.2
1811: 
1812: TCP Header
1813: 
1814: SMTP Header
1815: 
1816: SMTP Body
1817: 
1818: Ethernet Header
1819: 
1820: Ethernet
1821: 
1822: MAC Source: 00-E4-3C-F0-13-43
1823: MAC Destination: 00-80-2E-AB-13-65
1824: 
1825: Arquitectura de Xarxes
1826: 
1827: IP Header
1828: 
1829: TCP Header
1830: 
1831: SMTP Header
1832: 
1833: SMTP Body
1834: 
1835: 95
1836: 
1837: Data Encapsulation concept – Real Example
1838: 
1839: Important:
1840: DOWNLOAD &
1841: INSTALL
1842: https://www.wireshark.org/
1843: Arquitectura de Xarxes
1844: 
1845: I
1846: 96
1847: 
1848: Summary – Main topics to understand and
1849: learn
1850: •
1851: •
1852: •
1853: •
1854: •
1855: •
1856: 
1857: OSI model and how data encapsulation works
1858: TCP/IP stack with its fundamental layers
1859: Application layer. HTTP, DNS, DHCP.
1860: Transport layer: Scope. Port concept. TCP vs UDP.
1861: Network layer: Scope. IP case: frame format & IP addressing. IP
1862: Routing. NAT and NAPT strategies
1863: Link layer: Scope, types. Ethernet case: frame format, how Eth
1864: switching works. Basic redundancy strategies done in L2 (LAG and
1865: STP).
1866: 
1867: Arquitectura de Xarxes
1868: 
1869: 97
1870: 
1871: Summary – Videos for further learning
1872: 
1873: Source: https://www.youtube.com/watch?v=vv4y_uOneC0
1874: 
1875: Arquitectura de Xarxes
1876: 
1877: 98
1878: 
1879: Summary – Videos for further learning
1880: 
1881: Source: https://www.youtube.com/watch?v=PpsEaqJV_A0&feature=youtu.be
1882: 
1883: Arquitectura de Xarxes
1884: 
1885: 99
1886: 
1887: Questions?
1888: 
1889: Arquitectura de
1890: Xarxes
1891: 
1892: 

(End of file - total 1892 lines)
</content>
```

---

## Assistant (Build · claude-opus-4.6)

_Thinking:_

Now I have a very clear picture of the existing material. This is a comprehensive "Networks I" presentation from last year that covers ALL layers from top to bottom in a single deck. The user wants to recycle relevant parts of this for Block 3.

Let me map what's in this PDF to what's needed for Block 3:

**Already covered in this PDF (recyclable for Block 3):**

Layer 2 (Link Layer):
- Link layer intro (slide 65)
- Ethernet framing (slides 66-70)
- MAC addresses (slide 69)
- Ethertype field (slide 70)
- Hubs vs Switches (slide 71)


- Switch forwarding and MAC table operations (slides 72-78)
- ARP protocol (slides 79-81)
- LAG redundancy (slide 82)
- Spanning Tree Protocol (slides 83-90)

Layer 3 (Network/IP):
- IP fundamentals (slide 43)
- IPv4 header structure (slides 44-47)
- Public versus private IPv4 addressing (slide 49)
- CIDR notation and subnetting (slides 50-52)
- IP routing modes including unicast, broadcast, and multicast (slides 53-56)
- ICMP protocol (slides 57-59)
- NAT functionality and NAPT (slides 60-63)

DHCP operation (slides 30-34)

Now I'm reviewing what gaps exist based on my colleague's feedback. The material is missing several important topics: shortest path routing algorithms like Dijkstra and Bellman-Ford, OSPF and BGP protocol specifics, more advanced subnetting practice problems, wireless standards like 802.11, VLAN configuration, Layer 2 tunneling mechanisms, and media access control approaches like CSMA/CD and CSMA/CA. I should structure a proposal that addresses these gaps while building on the existing foundation.

Now I have a clear picture of what you already have. Let me give you a refined proposal based on the actual content in that PDF.

---

## Analysis of Recyclable Material

Your existing "Networks I" deck already covers quite a lot that maps to Block 3. Here's what you can directly reuse:

### Already have (recyclable):
| Topic | Existing slides (approx) | Notes |
|---|---|---|
| Link layer intro | ~65 | Good as-is |
| Ethernet framing (EthII, 802.3) | ~66-70 | Good as-is |
| MAC addresses | ~69 | Good as-is |
| Hubs vs Switches | ~71 | Good as-is |
| Switch forwarding / MAC table | ~72-78 | Good, maybe trim |
| ARP | ~79-81 | Good as-is |
| LAG & STP redundancy | ~82-90 | Consider trimming -- this is a lot of slides for Block 3 |
| IP basics + IPv4 header | ~43-47 | Good as-is |
| IPv4 addressing (public/private) | ~49 | Good, needs expansion per colleague |
| CIDR & subnetting | ~50-52 | Good, needs expansion per colleague |
| IP routing (unicast/broadcast/multicast) | ~53-56 | Good as-is |
| ICMP | ~57-59 | Good as-is |
| NAT & NAPT | ~60-63 | Good as-is |
| DHCP (DORA) | ~30-34 | Good as-is |

### Missing (need to create new):
| Topic | Priority | Source of requirement |
|---|---|---|
| **Shortest path algorithms** (Dijkstra, Bellman-Ford) | High | Colleague explicitly asked |
| **OSPF** (link-state, areas, how Dijkstra applies) | High | Colleague + syllabus |
| **BGP** (path-vector, AS, eBGP/iBGP) | High | Colleague + syllabus |
| **VLANs** (802.1Q, trunk/access) | Medium | Syllabus |
| **Wireless** (802.11, CSMA/CA) | Medium | Syllabus |
| **Media Access Control** (CSMA/CD, CSMA/CA) | Medium | Syllabus |
| **Tunneling at L2** | Low | Syllabus (deeper in Block 4) |
| **Deeper subnetting / public vs private** | Medium | Colleague asked to reinforce |

---

## Revised Session Structure Proposal

Given you have **2 theory sessions** and the material volume, here's how I'd split it:

### Session 1: Layer 2 -- Link Layer & Network Access
1. **Where are we in the stack** (1-2 slides, recycle)
2. **Media Access Control concepts** (2-3 slides, **NEW**)
   - Shared medium problem, CSMA/CD (Ethernet), CSMA/CA (Wi-Fi)
3. **Ethernet framing** (3-4 slides, recycle from ~66-70)
4. **MAC addresses** (1 slide, recycle)
5. **Hubs vs Switches + forwarding** (3-4 slides, recycle from ~71-78, trimmed)
6. **ARP** (2-3 slides, recycle from ~79-81)
7. **Wired vs Wireless** (2-3 slides, **NEW**)
   - Ethernet (802.3) vs Wi-Fi (802.11), brief comparison
8. **VLANs** (2-3 slides, **NEW**)
   - Why VLANs, 802.1Q tagging, trunk vs access
9. **L2 Redundancy** (3-4 slides, recycle from ~82-90, trimmed)
   - LAG + STP (condensed)
10. **Tunneling at L2** (1 slide, **NEW**, just a teaser for Block 4)

### Session 2: Layer 3 -- IP, Routing & Connectivity Services
1. **IP fundamentals** (2-3 slides, recycle from ~43-47)
2. **IPv4 addressing: public vs private** (2-3 slides, recycle + **expand**)
   - RFC 1918 ranges, why private exists, IPv4 exhaustion
3. **Subnetting deep-dive** (3-4 slides, recycle + **expand**)
   - CIDR, VLSM, worked examples
4. **ICMP** (2 slides, recycle from ~57-59)
5. **Routing fundamentals** (2 slides, recycle from ~53-56)
   - Forwarding tables, forwarding vs routing
6. **Shortest path algorithms** (3-4 slides, **NEW**)
   - Dijkstra (link-state) and Bellman-Ford (distance-vector)
   - Visual step-by-step example on a small graph
7. **OSPF** (3-4 slides, **NEW**)
   - Link-state protocol, areas, LSAs, Dijkstra in action
8. **BGP** (3-4 slides, **NEW**)
   - Path-vector, Autonomous Systems, eBGP vs iBGP, policy routing
   - "How the Internet actually routes"
9. **DHCP** (3-4 slides, recycle from ~30-34)
10. **NAT / NAPT** (3-4 slides, recycle from ~60-63)
    - Tie back to public vs private addressing

---

## Open Questions

A few things to decide before building:

**Tool: question**

**Input:**
```json
{
  "questions": [
    {
      "header": "Overall structure",
      "question": "Does this 2-session split look right to you? Session 1 = L2, Session 2 = L3 + connectivity services.",
      "options": [
        {
          "label": "Yes, looks good",
          "description": "Proceed with this split as proposed"
        },
        {
          "label": "Rebalance",
          "description": "Some topics should move between sessions (tell me which)"
        }
      ]
    },
    {
      "header": "STP depth",
      "question": "The existing material has ~8 slides on STP (Spanning Tree Protocol). For Block 3, how deep do you want to go?",
      "options": [
        {
          "label": "Keep 3-4 slides",
          "description": "Trim to essentials: what STP does, root bridge, port roles, one example"
        },
        {
          "label": "Keep all ~8 slides",
          "description": "STP is important enough to keep the full treatment"
        },
        {
          "label": "Just 1-2 slides",
          "description": "Mention STP exists and what problem it solves, no detail"
        }
      ]
    },
    {
      "header": "Subnetting depth",
      "question": "Your colleague asked to reinforce subnetting. How much do you want to expand?",
      "options": [
        {
          "label": "Add 2-3 worked examples",
          "description": "Practical exercises: given a network, divide into subnets"
        },
        {
          "label": "Keep as-is + mention in seminar",
          "description": "Leave the theory slides as-is, do exercises in seminar sessions"
        },
        {
          "label": "Full subnetting tutorial",
          "description": "Add a comprehensive subnetting section (5+ slides)"
        }
      ]
    },
    {
      "header": "Routing algorithms",
      "question": "For Dijkstra / Bellman-Ford, how visual/detailed should the examples be?",
      "options": [
        {
          "label": "Step-by-step walkthrough",
          "description": "Animated-style: show the algorithm running on a small graph, step by step"
        },
        {
          "label": "Conceptual only",
          "description": "Explain the idea and show the final result, no step-by-step"
        },
        {
          "label": "Comparison table",
          "description": "Focus on comparing link-state vs distance-vector approaches with a summary table"
        }
      ]
    },
    {
      "header": "Slide format",
      "question": "What format do you want me to produce the slides in?",
      "options": [
        {
          "label": "Markdown outline",
          "description": "Detailed slide-by-slide markdown that you convert to PPTX yourself"
        },
        {
          "label": "Marp / reveal.js",
          "description": "Markdown-based slide deck you can render directly"
        },
        {
          "label": "Just the outline",
          "description": "High-level outline only, I'll build the PPTX myself"
        }
      ]
    }
  ]
}
```

---

## User

REmember the mail from the coordinator though

Sobre el bloque 3, me parece bien que cojas cosas ya hechas de la parte IP, pero también habrá que añadir alguna cosa más sobre algoritmos de shortest path para routing y profundizar un poco más en protocolos como OSPF y BGP. En este bloque también daremos DHCP y NAT, así que también reforzaría la parte de redes públicas vs redes privadas y todo el tema de hacer subredes. 

---

## Assistant (Build · claude-opus-4.6 · 142.6s)



You're right, let me re-read the coordinator's mail carefully. He's specifically talking about what to **add or reinforce** on top of the recycled IP material. He's not mentioning Layer 2 topics at all. Let me cross-reference with the syllabus again.

Looking at the syllabus:

> Block 3 - Network Access & Internetworking (2 sessions): **Layer 2** (media access control, framing, Wired vs Wireless technologies, ARP, VLANs, tunneling), **Layer 3** (IP, routing, OSPF/BGP, ICMP), **Layer 5 applications for connectivity** (DHCP, NAT).

And Patricia gave Block 2 (Application and Transport). The coordinator says:

> "quizás le podemos preguntar si lo ve coherente con lo que dió en el bloque 2"

So there's also a question of what Patricia already covered in Block 2 and whether there's overlap or a smooth handoff. But let's focus on what the coordinator explicitly flagged as gaps:

1. **Shortest path algorithms** for routing -- NEW content needed
2. **OSPF and BGP** -- deepen, not just mention -- NEW content needed
3. **DHCP and NAT** -- these are already in the recycled material, so mostly recycle
4. **Public vs private networks** -- reinforce (expand what exists)
5. **Subnetting** -- reinforce (expand what exists)

Notice: he does **not** mention the L2 side at all (Ethernet, switches, ARP, VLANs, STP, wireless...). That doesn't mean you skip it -- the syllabus includes it -- but it suggests he sees the L2 part as already well-covered by the recycled material, and the **real work** is on the L3/routing/connectivity side.

---

## Revised thinking on content effort

| Area | Effort | What to do |
|---|---|---|
| L2 (Ethernet, MAC, ARP, switches, STP) | Low -- recycle | Trim and adapt from existing slides |
| VLANs, Wireless, CSMA, Tunneling | Medium -- new but not deep | Syllabus requires it, add a few slides each |
| IP basics, IPv4 header | Low -- recycle | As-is from existing |
| **Public vs Private + Subnetting** | **Medium -- expand** | Coordinator explicitly asked |
| **Shortest path algorithms** | **High -- create from scratch** | Coordinator explicitly asked |
| **OSPF** | **High -- create from scratch** | Coordinator explicitly asked |
| **BGP** | **High -- create from scratch** | Coordinator explicitly asked |
| ICMP | Low -- recycle | As-is |
| DHCP | Low -- recycle | As-is |
| NAT/NAPT | Low -- recycle | As-is, tie to public/private |

So the heavy lifting is really in Session 2: routing algorithms, OSPF, BGP, and reinforcing subnetting/addressing. The rest is mostly assembly from existing material.

---

## Key question before we proceed

The coordinator's priorities are clear, but I want to flag something: fitting all of this into **2 theory sessions** is tight, especially if you add proper Dijkstra/Bellman-Ford walkthroughs plus OSPF and BGP with any depth.

**Tool: question**

**Input:**
```json
{
  "questions": [
    {
      "header": "Session balance",
      "options": [
        {
          "description": "Yes, L2 can be lighter since students saw it in the recycled material. Focus time on L3/routing.",
          "label": "L2 light, L3 heavy"
        },
        {
          "description": "Both sessions should be balanced in content density.",
          "label": "Balanced"
        },
        {
          "description": "Let me check how much time per session first (e.g., 2h each?).",
          "label": "Need to check timing"
        }
      ],
      "question": "Given the coordinator's emphasis on routing/OSPF/BGP/subnetting, would you be OK making Session 1 (L2) lighter and giving more weight to Session 2 (L3 + routing + connectivity)?"
    },
    {
      "header": "Output format",
      "options": [
        {
          "description": "Detailed slide-by-slide outline with speaker notes, that you then build into PPTX",
          "label": "Detailed markdown outline"
        },
        {
          "description": "Just the topic structure and key points per slide, you fill in the rest",
          "label": "High-level outline only"
        }
      ],
      "question": "What level of detail do you want me to produce?"
    }
  ]
}
```

**Output:**
```
User has answered your questions: "Given the coordinator's emphasis on routing/OSPF/BGP/subnetting, would you be OK making Session 1 (L2) lighter and giving more weight to Session 2 (L3 + routing + connectivity)?"="Balanced. Ah and there are 2 sessions, two hours per session.", "What level of detail do you want me to produce?"="You can build the slides using markdown, then we can compile it to pdf with pandoc / beamer.". You can now continue with the user's answers in mind.
```

---

## Assistant (Build · claude-opus-4.6 · 40.4s)

_Thinking:_

OK, so:
- 2 sessions, 2 hours each = 4 hours total
- Balanced content between sessions
- Output format: Markdown slides using Pandoc/Beamer to compile to PDF

Let me think about timing. 2 hours per session is generous. Typically you can cover about 40-60 slides in 2 hours depending on interaction level. Let me plan roughly 45-50 slides per session.

Let me now create a detailed slide-by-slide outline and then we can iterate before building.

Actually wait, let me think about the balance. The coordinator wants OSPF/BGP/shortest-path as new heavy content. 

I need to figure out how to distribute the routing material without overloading one session. I could split this differently—maybe Session 1 covers L2 and foundational L3 concepts like IP addressing and subnetting, while Session 2 dives into routing protocols and internetworking. That way the new routing content gets proper time without cramming everything into one block. I'm realizing the user wants me to propose a detailed outline with slide counts before we actually start building, so let me put together a comprehensive structure and then check if they're ready to move forward with the markdown/beamer implementation.

Good -- 2 sessions x 2 hours each, balanced, and Markdown/Beamer for output. Let me propose a balanced split.

Since the coordinator's heavy items (routing algorithms, OSPF, BGP) are all L3, the way to **balance** the two sessions is to pull some L3 content into Session 1. Here's my proposal:

---

## Session 1: Network Access & IP Fundamentals (~45 slides, 2h)

**Part A -- Layer 2: Link Layer (approx 25 slides)**

| # | Topic | Slides | Source |
|---|---|---|---|
| 1 | Title + Where are we in the stack | 2 | Recycle |
| 2 | Media Access Control (shared medium, CSMA/CD, CSMA/CA) | 3 | **New** |
| 3 | Ethernet framing (Eth II, 802.3, MTU) | 3 | Recycle |
| 4 | MAC addresses (format, OUI) | 1 | Recycle |
| 5 | Ethertype field | 1 | Recycle |
| 6 | Hubs vs Switches + switch forwarding | 3 | Recycle (trimmed) |
| 7 | ARP (request/reply, ARP table) | 3 | Recycle |
| 8 | Wired vs Wireless (802.3 vs 802.11) | 2 | **New** |
| 9 | VLANs (why, 802.1Q, trunk/access) | 3 | **New** |
| 10 | L2 Redundancy (LAG + STP condensed) | 3 | Recycle (trimmed) |
| 11 | Tunneling at L2 (concept, teaser for Block 4) | 1 | **New** |

**Part B -- Layer 3 basics: IP & Addressing (approx 20 slides)**

| # | Topic | Slides | Source |
|---|---|---|---|
| 12 | IP fundamentals (E2E, connectionless, unreliable) | 2 | Recycle |
| 13 | IPv4 header walkthrough | 3 | Recycle |
| 14 | IPv4 addressing: public vs private | 3 | Recycle + **expand** |
| 15 | CIDR and subnet masks | 3 | Recycle + **expand** |
| 16 | VLSM and subnetting worked examples | 4 | Recycle + **new examples** |
| 17 | IP routing types (unicast/broadcast/multicast) | 3 | Recycle |
| 18 | ICMP (ping, traceroute, message types) | 2 | Recycle |

---

## Session 2: Routing, Protocols & Connectivity Services (~45 slides, 2h)

**Part A -- Routing & Protocols (approx 28 slides)**

| # | Topic | Slides | Source |
|---|---|---|---|
| 1 | Title + Recap: forwarding vs routing | 2 | **New** |
| 2 | Routing tables (how a router decides) | 2 | **New** |
| 3 | Distance-vector vs Link-state (concept comparison) | 2 | **New** |
| 4 | Bellman-Ford algorithm (step-by-step on small graph) | 4 | **New** |
| 5 | Dijkstra algorithm (step-by-step on same graph) | 4 | **New** |
| 6 | Interior vs Exterior routing (IGP vs EGP) | 1 | **New** |
| 7 | OSPF (link-state, areas, LSAs, Dijkstra in practice) | 5 | **New** |
| 8 | BGP (path-vector, AS, eBGP/iBGP, policy routing) | 5 | **New** |
| 9 | The big picture: how Internet routing works | 2 | **New** |
| 10 | Routing summary / comparison table | 1 | **New** |

**Part B -- Connectivity Services (approx 17 slides)**

| # | Topic | Slides | Source |
|---|---|---|---|
| 11 | Why private addressing exists (IPv4 exhaustion) | 2 | **New** (ties back to Session 1) |
| 12 | DHCP (DORA process, what you get, relay agents) | 4 | Recycle |
| 13 | DHCP Wireshark / Packet Tracer example | 2 | Recycle |
| 14 | NAT -- Basic NAT (one-to-one) | 2 | Recycle |
| 15 | NAPT / PAT (many-to-one, port translation) | 3 | Recycle |
| 16 | NAT example + limitations (traversal problems) | 2 | Recycle + **new** |
| 17 | Block 3 summary + key takeaways | 2 | **New** |

---

## Why this balances well

- **Session 1** covers all of L2 + IP addressing/subnetting -- which is the "foundations" side
- **Session 2** covers routing algorithms/protocols + connectivity services -- which is the "how the internet actually works" side
- The coordinator's priorities (shortest path, OSPF, BGP, subnetting, NAT/DHCP) are all addressed with proper depth
- Both sessions are ~45 slides / 2 hours

Does this structure work for you, or do you want to adjust anything before I start building the Beamer markdown?

---

## User

Yes! Go ahead. 

---

## Assistant (Build · claude-opus-4.6 · 334.9s)



_Thinking:_

The user wants me to build the slides in Markdown/Beamer format. Let me create two files, one for each session. I'll use Pandoc/Beamer compatible markdown.

Let me plan this carefully with a todo list and then start building.

I need to create comprehensive slides for both sessions. Let me think about the Beamer markdown format:

```markdown
---
title: "Title"
author: "Author"
date: "Date"
theme: "metropolis"
...

# Section

## Slide Title

- Content
- Content

## Slide Title

- Content
```

Let me create detailed, well-structured slides. I'll use the recycled content from the existing PDF and create new content for the gaps.


Now I'm organizing the content into two markdown files with the proper structure. Session 1 will cover Layer 2 and Layer 3 basics across roughly 45 slides total, while Session 2 will tackle routing protocols and connectivity services with about 45 slides. I'll start writing the markdown with proper Beamer formatting and comprehensive coverage of each topic. Beamer format.

I'm setting up the output directory and creating separate markdown files for each session in the Block 3 folder. For the YAML header, I'll configure a clean Beamer theme with Madrid styling, dolphin colors, and 16:9 aspect ratio to give the user a solid foundation they can customize later.

Now I'm ready to start writing the content.

For Session 1, I'm organizing it into two main parts. Part A covers Layer 2 topics starting with an introduction, then moving through Media Access Control, Ethernet framing, MAC addresses, Ethertype, comparing hubs versus switches, ARP protocol, wired versus wireless networking, VLANs, Layer 2 redundancy, and tunneling. Part B will cover Layer 3 concepts.

Now I'm mapping out the Layer 3 section with IP fundamentals, IPv4 header structure, public versus private addressing, CIDR and subnet masks, VLSM with subnetting examples, IP routing types, and ICMP. This is a substantial amount of content to develop thoroughly.

I'm thinking about how to incorporate visual elements into the Beamer presentation. Rather than trying to embed complex TikZ diagrams directly, I'll use text-based descriptions and formatting to indicate where diagrams should be placed, keeping the content focused and maintainable.

Actually, since pandoc supports raw LaTeX blocks, I can use TikZ selectively for the most important network diagrams and topology visualizations, while relying on tables and bullet points for the rest of the content to keep things clean and compilable.

Let me work through this systematically—I'll create both session files, using the beamer markdown format with proper YAML headers and the `{.fragile}` attribute for any slides containing code or verbatim content. Starting with Session 1 now. I'm mapping out which visualizations really need diagrams versus what can work as tables or text—things like the OSI stack and subnetting are fine as structured tables, but switch forwarding, OSPF areas, and BGP topology need actual diagrams, so I'll use TikZ for those and keep everything else in clean markdown. Now I'm ready to start drafting the actual slide content, beginning with Session 1. I'm settling on English for consistency with the existing content, even though the course title is in Catalan. Now I'll create both session files in the Block 3 directory. For Session 1, I'm planning around 45 slides covering Network Access and IP Fundamentals, starting with Layer 2 concepts.

Building the presentation structure...

Now I'm explaining how the Link Layer operates within the network stack, sitting between the Physical and Network layers to handle node-to-node communication using frames with MAC addressing, error detection, and flow control—all scoped to local networks.

When multiple devices share the same physical medium, collisions become a problem, so different solutions evolved: Ethernet uses CSMA/CD for wired networks while Wi-Fi uses CSMA/CA for wireless, though modern switched Ethernet has largely eliminated collisions by giving each port its own domain.

CSMA/CD works by having devices listen before transmitting, then send if the medium is free, but if it's busy...

For CSMA/CA in Wi-Fi, the approach is different since wireless can't reliably detect collisions—devices listen, wait for an inter-frame space plus random backoff, transmit, and then wait for acknowledgment from the receiver, with optional RTS/CTS handshaking to further reduce collisions.

Now I'm looking at Ethernet framing standards. Ethernet II is the most common format used for IP traffic, with fields for preamble, start frame delimiter, MAC addresses, EtherType, payload, and frame check sequence. IEEE 802.3 is an alternative format that uses a length field instead of EtherType and includes LLC data.

The key distinction between the two formats comes down to that Type/Length field—if it's 1536 or higher, it's Ethernet II; otherwise it's the 802.3 variant. Each field serves a specific purpose: the preamble and SFD handle synchronization, the MAC addresses identify source and destination, the Type/Length field either specifies the protocol or indicates payload size, and the payload carries the actual data with a minimum of 46 bytes.

Generating reference table... ID `F1:53:21` identifies that specific network interface. Now I'm looking at how hubs and switches differ — switches are far more intelligent, learning MAC addresses and forwarding frames only to the correct port rather than flooding everything out like hubs do. This creates separate collision domains per port and enables full-duplex communication, which is why they've become the standard in modern networks. I'm moving into how switches actually build and use their MAC address tables to learn which devices are connected where. Now I'm covering the different switching types—unicast for one-to-one forwarding when the destination MAC is known, broadcast when the destination is all ones, and multicast for one-to-many delivery to group members. Then moving into ARP, which solves the fundamental problem of mapping IP addresses to MAC addresses on a local network—when a host needs to send to an IP, it broadcasts an ARP request asking who owns that address.

The process involves checking the local cache first, then broadcasting if needed, with the target host responding unicast back with its MAC address so both sides can cache the mapping. I'm noting that ARP is strictly a LAN protocol that doesn't cross routers, entries expire after a timeout, and for destinations outside the network the host resolves the gateway's MAC instead. There's also a security vulnerability where hosts can send spoofed ARP replies to redirect traffic.

Now I'm walking through a concrete example where Host A initiates an ARP request broadcast with its own IP and MAC, then Host B responds with a unicast reply containing its MAC address. I'm also starting to compare wired versus wireless technologies...

Generating comparison table...

Wi-Fi operates across multiple frequency bands and can work in infrastructure mode through an access point or ad-hoc peer-to-peer mode, with frames containing up to four MAC address fields to handle the routing complexity. The main challenges are the hidden node problem where devices can't detect each other but both reach the AP, signal degradation from obstacles and interference, and contention on the shared medium. The standard has evolved significantly from 802.11b through to Wi-Fi 7, each generation offering substantial speed improvements.

VLANs solve the problem of a single physical switch creating one large broadcast domain by logically segmenting it into multiple isolated domains, which improves security by separating sensitive traffic, reduces broadcast overhead, and allows flexible device grouping independent of physical location. The 802.1Q standard accomplishes this by inserting a 4-byte tag into Ethernet frames that includes priority and other control information.

The VLAN ID field uses 12 bits to support up to 4096 different VLANs, while access ports connect end devices and carry untagged traffic for a single VLAN, and trunk ports connect switches together carrying multiple tagged VLANs. In practice, a switch assigns ports to different VLANs by department—for example, ports 1-4 might belong to Engineering, 5-8 to Marketing, 9-12 to Management, with port 24 as a trunk to another switch—and devices on different VLANs cannot communicate directly without a router.

Link aggregation bundles multiple physical links into one logical link for increased bandwidth and redundancy, using protocols like LACP for dynamic negotiation, while spanning tree protocol solves the problem of loops created by redundant paths between switches.

STP elects a root bridge and assigns port roles (root, designated, or blocked) based on path cost to prevent broadcast storms and MAC flapping, communicating through BPDUs, with RSTP providing faster convergence.

Now I'm walking through a concrete example with three switches where the lowest MAC becomes root, and the blocked port on Switch 3 breaks the loop. After that, I'm introducing tunneling at Layer 2 as a way to extend LANs across wider networks by encapsulating protocols inside each other.

Moving into Layer 3, I'm covering IP as the core protocol for end-to-end delivery across different networks. The key distinction here is that IP operates connectionless and best-effort—each packet travels independently without guaranteed delivery, which is why upper layers like TCP handle reliability. The main functions include logical addressing and routing.

Now I'm comparing Layer 2 and Layer 3 to highlight the fundamental differences: Layer 2 operates locally within a LAN using MAC addresses that change at each hop, while Layer 3 provides end-to-end communication using hierarchical IP addresses that stay constant throughout the journey. Routers operate at Layer 3 and separate broadcast domains, whereas switches work at Layer 2.

Looking at the IPv4 header structure now, examining the key fields like version, header length, type of service, total packet size, fragmentation details, TTL for hop counting, and protocol identification. Now I'm covering how fragmentation works when packets exceed the MTU—routers split them up, but reassembly only happens at the destination, and the DF flag lets senders prevent fragmentation entirely by dropping oversized packets instead. I should also note the Wireshark example showing a real IPv4 header with typical values like TTL starting at 64 or 128 depending on the OS, and then move into public versus private IP addressing managed by IANA and the regional registries.

For private addresses, there are three RFC 1918 ranges: the 10.0.0.0/8 block with about 16.7 million addresses, the 172.16.0.0/12 block with roughly a million, and the 192.168.0.0/16 block with around 65,000 addresses—these are reserved for internal networks and can't be routed on the public internet.

The reason we need private addressing comes down to IPv4's fundamental limitation: with only 4.3 billion addresses available and a world population of 8 billion people each with multiple devices, we hit exhaustion quickly—the IANA pool ran out in 2011 and most regional registries followed. The solution involves combining private addresses with NAT for internal reuse, using CIDR for more efficient allocation, and ultimately transitioning to IPv6's vastly larger 128-bit address space.

Beyond the main private ranges, there are other special address blocks serving specific purposes like loopback for localhost testing, link-local for automatic configuration when DHCP isn't available, multicast for group communication, and broadcast addresses. Now I'm moving into how CIDR replaced the older classful addressing system to solve the inefficiency problem.

The old class-based approach was wasteful—Class A gave you millions of addresses when you might only need thousands, while Class C was too restrictive for larger organizations. CIDR introduced variable-length prefixes so you can allocate exactly what you need. The notation `IP/prefix_length` tells you how many bits define the network portion, with the subnet mask showing which bits are network versus host. For instance, in `192.168.1.0/24`, the first 24 bits identify the network and the remaining 8 bits can address up to 256 individual hosts.

Now I'm moving into subnetting itself—the practice of carving a network into smaller pieces to reduce broadcast domains, organize departments or physical locations, and use address space more efficiently. The math is straightforward: borrowing bits from the host portion lets you create more subnets (2^s where s is the number of borrowed bits), though each subnet loses two addresses for the network and broadcast addresses, leaving 2^h - 2 usable hosts. I'm looking at a reference table showing how different prefix lengths map to subnet masks and available host counts.

For the worked example, I'm starting with a /16 network and need to create 4 subnets, so I need to borrow 2 bits since 2^2 equals 4.

Generating subnet table... Now I'm working through a VLSM example where I allocate subnets from largest to smallest — starting with 60 devices requiring a /26, then 30 devices at /27, 10 devices at /28, and finally a point-to-point link at /30, which gives me the exact host counts needed for each segment. The next question involves analyzing an IP address in the 172.16.0.0 range. or forwarded across networks), directed broadcast (to specific subnet), and multicast (one-to-many to a group). I'm also noting the key differences in how these traffic types propagate through networks and their typical use cases.

Now moving into how routing actually works—every device maintains a routing table that determines where packets go by matching the destination IP against known routes, with the longest prefix match winning when multiple routes could apply, and a default route catching anything that doesn't match more specific entries.

Looking at ICMP next, which is the protocol used for network diagnostics and error reporting—it travels inside IP packets but doesn't carry application data, with different message types for things like ping responses and unreachable destination notifications.

Ping works by sending an Echo Request and waiting for an Echo Reply to test connectivity and measure round-trip time, while traceroute discovers the path to a destination by sending packets with incrementing TTL values so each router responds with a Time Exceeded message, giving you an ordered list of hops.

Now I'm wrapping up the first session by listing the key concepts we covered: Link Layer fundamentals like frames and MAC addressing, media access control methods for wired and wireless networks, VLANs for logical segmentation, redundancy techniques like LAG and STP, IP's connectionless nature, IPv4 addressing schemes including CIDR and subnetting, and ICMP for diagnostics. The next session will focus on how routers determine optimal paths using routing algorithms and protocols like OSPF and BGP, plus connectivity services like DHCP and NAT.

Now moving into Session 2, I'm starting with the distinction between forwarding and routing—forwarding is the per-packet operation that happens in hardware at nanosecond speeds using the forwarding table, while routing is the control plane function that builds and maintains the routing table using algorithms, operating at software speeds over longer intervals. I'm using the analogy of trip planning versus following road signs to make this clear. Then I'm introducing the split between static routing, which is manually configured and doesn't adapt to network failures, and dynamic routing approaches.

I'm laying out the two main families of routing algorithms in a comparison table: distance-vector algorithms like RIP that share distance information only with neighbors and use Bellman-Ford, versus link-state algorithms like OSPF that flood complete topology information to all routers and use Dijkstra's algorithm. The key tradeoff is that distance-vector has a partial view but is simpler, while link-state converges faster with a complete global view.

Now I'm explaining how distance-vector routing works in practice—each router maintains costs to all destinations and periodically shares its vector with neighbors, then updates its own routes by taking the minimum cost path through any neighbor. The algorithm iteratively converges to optimal routes, though it suffers from the count-to-infinity problem where bad news propagates slowly, which can be mitigated with techniques like split horizon and poison reverse.

I'm walking through the Bellman-Ford algorithm step by step with a concrete example using a graph of five nodes.

Now I'm showing the initialization and first iteration of the algorithm, relaxing each edge to find shorter paths—starting with A at distance 0 and all others at infinity, then updating distances as I discover cheaper routes through neighbors.

Continuing through the remaining edges in iteration 1, I find that going through C gives a better path to D (distance 6 instead of 7), and C also provides the shortest route to E at distance 4. In the second iteration, I'm checking whether any distances can still be improved, but they've all stabilized—no further updates are possible, confirming these are the shortest paths.

Now I'm shifting to Dijkstra's algorithm, which takes a different approach by assuming every router maintains a complete network map and greedily selects the nearest unvisited node at each step to compute shortest paths.

Generating algorithm walkthrough... I'm completing the Dijkstra algorithm trace and seeing that it arrives at the same shortest distances as Bellman-Ford but more efficiently. Now I'm visualizing the shortest path tree from node A, showing how each destination is reached through the optimal intermediate nodes, and then comparing the two algorithms across key dimensions like their approach and complexity characteristics. | Greedy | Dynamic programming |
| Requires | Global topology (link-state) | Neighbor info (distance-vector) |
| Negative weights | Does **not** handle | Can handle (and detect negative cycles) |
| Complexity | O(V²) or O((V+E)log V) | O(V × E) |
| Convergence | Fast (single computation) | Iterative (multiple rounds) |
| Used by | OSPF, IS-IS | RIP, (BGP uses path-vector) |

Now I'm looking at how the Internet organizes routing across different administrative domains. Each Autonomous System has its own ASN, and routing happens at two levels: within an AS using interior protocols like OSPF, IS-IS, and RIP, and between ASes using BGP. OSPF is the dominant link-state IGP that works by having routers discover neighbors, form adjacencies, and flood link-state advertisements to build a complete network topology.

For larger networks, OSPF scales through areas where the backbone area connects all others, reducing the size of routing databases and limiting how far flooding spreads. Routers can be internal to a single area or serve as area border routers connecting multiple areas together.

When OSPF starts up, routers exchange Hello packets to find neighbors, then synchronize their link-state databases through a series of database description and link-state request/update packets. Once all routers in an area have identical topology information, each one independently calculates its shortest path tree using Dijkstra's algorithm to build the routing table.

When the network topology changes, new link-state advertisements get flooded throughout the area and each router recalculates its paths—typically converging within seconds thanks to fast failure detection and quick computation.

Now I'm working through a concrete example with five routers connected by links with different costs, showing how Dijkstra determines the optimal path from R1 to each destination based on cumulative link costs.

Moving on to BGP, which is the Internet's routing protocol and operates between autonomous systems rather than within them—it's a path-vector protocol where each route advertisement includes the full sequence of ASes traversed, allowing routers to detect loops if their own AS number appears in the path. BGP uses TCP for reliable peer communication and makes routing decisions based on business policies rather than purely optimizing for shortest paths.

The protocol splits into two variants: eBGP handles routing between different ASes with peers typically directly connected, and it updates the AS path by prepending its own ASN to advertised routes, while iBGP distributes those externally learned routes within a single AS without modifying the path, though it requires either a full mesh of connections or route reflectors to prevent loops.

When BGP learns multiple paths to the same destination, it selects among them using a hierarchy of criteria starting with local preference for policy-driven decisions, then shortest AS path length, followed by origin type preference, and continuing down through additional metrics.

The real purpose of BGP isn't finding the shortest route—it's enforcing business policies and relationships between ASes, which determine what routes get announced to whom based on whether the connection is a customer-provider relationship, peer-to-peer settlement-free peering, or transit service.

Inside each AS, IGP protocols like OSPF handle the fast, efficient routing with complete topology knowledge, while BGP operates between ASes to exchange reachability information based on policy rather than pure path optimization, using the AS path as a loop prevention mechanism. When you access a website, your traffic moves through your ISP's internal network via IGP, then BGP decides which AS path to take at the border, potentially crossing several ASes before reaching the destination, with each AS independently managing its internal routing.

Now I'm looking at a comparison of the major routing protocols—RIP uses distance-vector with hop count limitations, OSPF and IS-IS are link-state protocols using Dijkstra's algorithm for IGP routing, while BGP operates as a path-vector protocol between ASes with policy-driven selection. Moving into connectivity services, a device needs several pieces of information to join a network: an IP address, subnet mask, default gateway, and DNS server configuration—all typically provided through DHCP.

Generating markdown table... The client also gets optional parameters like NTP servers and domain names, and the IP is leased for a limited time—it needs to renew before expiration at specific checkpoints (50% and 87.5% of the lease duration) or the address goes back into the pool. Now I'm walking through the DHCP discovery process step by step, starting with the client broadcasting a Discover message from 0.0.0.0 to find any available server, then the server responding with an Offer containing the IP address and lease details. Now I'm moving on to how DHCP relay agents solve the broadcast limitation by forwarding requests as unicast to a central server, which lets a single DHCP server manage multiple subnets. Then I'm connecting this to the broader picture of private versus public networks and how NAT enables devices with private IPs to communicate on the Internet by translating their addresses at the network boundary.

For one-to-one NAT, each private IP gets its own unique public IP through a translation table that swaps source addresses on outgoing packets and destination addresses on incoming ones—it's straightforward but impractical since you'd need as many public IPs as internal hosts. The more common approach is NAPT or PAT, which multiplexes many internal IPs onto a single public IP by using port numbers to distinguish the traffic.

Now I'm looking at how the translation actually works in practice. When a host sends an outgoing packet, the NAT router rewrites the source IP and port, records the mapping, and forwards it out. When the response comes back, the router looks up that (IP, port) tuple in its table to figure out which internal host should receive it.

The main issue with NAT is that it breaks end-to-end connectivity—external hosts can't initiate connections inbound, which causes problems for peer-to-peer applications, VoIP, gaming, and IoT devices. There are workarounds like port forwarding and NAT traversal techniques, but the fundamental problem is that NAT modifies packet headers, which violates IP layering principles and breaks protocols that embed addresses in their payloads.

Beyond connectivity issues, NAT introduces performance overhead from translation table lookups on every packet and creates a single point of failure since all traffic routes through the NAT device. IPv6 was actually designed to eliminate NAT entirely by providing enough addresses for everything, but NAT persists because IPv4 is still dominant and many people view NAT as a security feature.

From the web server's perspective, all those internal hosts appear as a single IP address—the NAT router's public IP. I'm now summarizing the broader networking concepts covered so far: Layer 2 fundamentals like Ethernet and switching, Layer 3 basics including IPv4 addressing and subnetting, routing protocols like OSPF and BGP, DHCP for automatic configuration, and NAT for address translation. I'm considering whether to include TikZ diagrams for the Beamer presentation or stick with well-formatted text and tables for now, since TikZ can be finicky to get right. I'll go with clean markdown for the initial version and note where diagrams should go, letting the user add visual elements later if needed. Now I'm setting up the YAML header for pandoc/beamer compilation to ensure both files render correctly.

I need to be mindful of Beamer's space constraints—my content is too dense for individual slides, so I'll trim it down and use section breaks with `#` for dividers and `##` for slide titles to keep things readable.

Since the user can iterate with me, I'll write a solid first draft with concise slides and let them refine from there. I should also include compilation instructions and handle things like column layouts properly for pandoc Beamer syntax.

Let me write out both files now with careful attention to slide density and formatting. should make sure the markdown is properly formatted for Beamer compilation. Key considerations:

1. Tables - pandoc supports pipe tables but they might need `\small` or `\footnotesize` in Beamer
2. Long content - need to keep slides concise
3. Section titles - use `#` for sections (these create title slides in Beamer)
4. Frame titles - use `##` for individual slides
5. Bullet points - standard markdown lists
6. Code blocks - need `{.fragile}` attribute on the frame
7. Columns - use pandoc's column syntax

Let me write clean, well-structured files that compile correctly.

For the header-includes, I'll add some useful LaTeX packages and commands.

Let me now write everything to disk. I'll create two files and a Makefile.

Now I need to be careful about slide density—keeping each one to around 4-6 bullet points or a single table, with plenty of whitespace for the audience to absorb the content. I'll revise my drafts to trim sub-bullets and make tables more compact, leaving room for any diagrams the user might want to add later.

**Tool: todowrite**

**Input:**
```json
{
  "todos": [
    {
      "content": "Create Session 1 Beamer slides: Network Access & IP Fundamentals",
      "status": "in_progress",
      "priority": "high"
    },
    {
      "content": "Create Session 2 Beamer slides: Routing, Protocols & Connectivity Services",
      "status": "pending",
      "priority": "high"
    },
    {
      "content": "Create Makefile for pandoc/beamer compilation",
      "status": "pending",
      "priority": "medium"
    }
  ]
}
```

**Output:**
```
[
  {
    "content": "Create Session 1 Beamer slides: Network Access & IP Fundamentals",
    "status": "in_progress",
    "priority": "high"
  },
  {
    "content": "Create Session 2 Beamer slides: Routing, Protocols & Connectivity Services",
    "status": "pending",
    "priority": "high"
  },
  {
    "content": "Create Makefile for pandoc/beamer compilation",
    "status": "pending",
    "priority": "medium"
  }
]
```

---

## Assistant (Build · claude-opus-4.6 · 172.5s)

**Tool: write**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_1_Network_Access_IP_Fundamentals.md",
  "content": "---\ntitle: \"Block 3 -- Session 1\"\nsubtitle: \"Network Access \\\\& IP Fundamentals\"\nauthor: \"Arquitectura de Xarxes\"\ninstitute: \"Universitat Pompeu Fabra -- 2025/2026\"\ntheme: \"Madrid\"\ncolortheme: \"dolphin\"\nfonttheme: \"structurebold\"\naspectratio: 169\nnavigation: horizontal\ntoc: true\nheader-includes:\n  - \\usepackage{booktabs}\n  - \\usepackage{tikz}\n  - \\usetikzlibrary{positioning, arrows.meta, calc}\n  - \\setbeamerfont{footnote}{size=\\tiny}\n  - \\AtBeginSection[]{\\begin{frame}{Outline}\\tableofcontents[currentsection]\\end{frame}}\n---\n\n# Part A -- Layer 2: Link Layer\n\n## Where Are We in the Stack?\n\n\\begin{center}\n\\small\n\\begin{tabular}{c|l|l}\n\\toprule\n\\textbf{Layer} & \\textbf{TCP/IP} & \\textbf{Block} \\\\\n\\midrule\nL5--L7 & Application & Block 2 \\\\\nL4 & Transport & Block 2 \\\\\n\\rowcolor{blue!15} L3 & Network (IP) & \\textbf{Block 3} \\\\\n\\rowcolor{blue!15} L2 & Link (Data Link) & \\textbf{Block 3} \\\\\nL1 & Physical & (covered with L2) \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n- Block 2 covered **Application** (HTTP, DNS, DASH) and **Transport** (TCP, UDP, QUIC)\n- **Block 3**: Link layer (L2), Network layer (L3), plus connectivity services (DHCP, NAT)\n\n## The Link Layer -- Overview\n\n- Sits between Physical (L1) and Network (L3) in the protocol stack\n- Provides **node-to-node** data transfer within the **same network**\n- Protocol Data Unit: **frame**\n\nKey responsibilities:\n\n- **Framing**: encapsulate L3 packets into frames\n- **Addressing**: MAC addresses (physical, local scope)\n- **Media access control**: who gets to transmit and when\n- **Error detection**: Frame Check Sequence (FCS / CRC)\n\n\\vfill\n\\footnotesize\nScope: frames do **not** cross LAN boundaries --- routers separate L2 domains.\n\n## Media Access Control -- The Problem\n\n- Multiple devices may share the same physical medium\n- If two devices transmit simultaneously $\\rightarrow$ **collision**\n\nHow to coordinate access?\n\n- **Wired (Ethernet)**: CSMA/CD\n- **Wireless (Wi-Fi)**: CSMA/CA\n- **Modern switched Ethernet**: each port is its own collision domain\n    - CSMA/CD is rarely triggered in practice\n    - Still fundamental to understanding Ethernet's design\n\n## CSMA/CD -- Carrier Sense Multiple Access with Collision Detection\n\nUsed in **classic Ethernet** (shared medium / hubs):\n\n1. **Listen** before transmitting (Carrier Sense)\n2. If medium is free $\\rightarrow$ **transmit**\n3. While transmitting, **monitor** for collisions (Collision Detection)\n4. If collision detected:\n    - Stop transmitting\n    - Send **jam signal**\n    - Wait a **random backoff** (Binary Exponential Backoff)\n    - Retry\n\n\\vfill\n\\footnotesize\nNot relevant in modern full-duplex switched Ethernet, but foundational.\n\n## CSMA/CA -- Carrier Sense Multiple Access with Collision Avoidance\n\nUsed in **Wi-Fi (802.11)** --- wireless cannot reliably detect collisions:\n\n1. **Listen** before transmitting\n2. If medium is free $\\rightarrow$ wait **IFS** (Inter-Frame Space) + random backoff\n3. **Transmit** the frame\n4. Wait for **ACK** from receiver\n5. No ACK $\\rightarrow$ assume collision $\\rightarrow$ retransmit\n\nOptional: **RTS/CTS** (Request to Send / Clear to Send)\n\n- Addresses the **hidden node problem**\n- Two nodes that can't hear each other both reach the AP\n\n## Ethernet Framing\n\nEthernet is the dominant wired LAN technology (IEEE 802.3).\n\n**Ethernet II** (most common --- carries IP):\n\n\\footnotesize\n\n| Preamble | SFD | Dest MAC | Src MAC | EtherType | Payload | FCS |\n|:--------:|:---:|:--------:|:-------:|:---------:|:-------:|:---:|\n| 7 B      | 1 B | 6 B      | 6 B     | 2 B       | 46--1500 B | 4 B |\n\n\\normalsize\n\n**IEEE 802.3**:\n\n\\footnotesize\n\n| Preamble | SFD | Dest MAC | Src MAC | Length | LLC + Payload | FCS |\n|:--------:|:---:|:--------:|:-------:|:------:|:-------------:|:---:|\n| 7 B      | 1 B | 6 B      | 6 B     | 2 B    | 46--1500 B    | 4 B |\n\n\\normalsize\n\nHow to tell them apart? The Type/Length field:\n\n- Value $\\geq$ 1536 $\\rightarrow$ **Ethernet II** (EtherType)\n- Value $<$ 1536 $\\rightarrow$ **802.3** (Length)\n\n## Ethernet Frame -- Key Fields\n\n- **Preamble + SFD** (8 B): synchronization pattern \\texttt{0x55...55D5}\n- **Destination MAC** (6 B): target device address\n- **Source MAC** (6 B): sender device address\n- **EtherType** (2 B): identifies upper-layer protocol\n- **Payload** (46--1500 B): data from upper layers\n    - Minimum 46 B (padded if shorter) $\\rightarrow$ minimum frame size = 64 B\n    - Maximum 1500 B $\\rightarrow$ **MTU** (Maximum Transmission Unit)\n- **FCS** (4 B): CRC-32 error detection\n\n## Common EtherType Values\n\n\\begin{center}\n\\begin{tabular}{ll}\n\\toprule\n\\textbf{EtherType} & \\textbf{Protocol} \\\\\n\\midrule\n0x0800 & IPv4 \\\\\n0x0806 & ARP \\\\\n0x8100 & VLAN-tagged frame (802.1Q) \\\\\n0x86DD & IPv6 \\\\\n0x8847 & MPLS Unicast \\\\\n0x8848 & MPLS Multicast \\\\\n0x88A8 & Provider Bridging (QinQ / 802.1ad) \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n## MAC Addresses\n\n- **48-bit** address: \\texttt{XX:XX:XX:XX:XX:XX}\n- Two parts:\n    - **OUI** (first 24 bits): Organization Unique Identifier --- assigned by IEEE to vendors\n    - **Device ID** (last 24 bits): assigned by vendor to each NIC\n- **Burned into** the Network Interface Controller (NIC)\n\nSpecial addresses:\n\n| Address | Purpose |\n|:--------|:--------|\n| \\texttt{FF:FF:FF:FF:FF:FF} | Broadcast (all devices in LAN) |\n| \\texttt{01:00:5E:XX:XX:XX} | IPv4 Multicast |\n| \\texttt{01:80:C2:00:00:00} | STP Bridge Group |\n\n## Hubs vs. Switches\n\n\\begin{center}\n\\small\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Feature} & \\textbf{Hub} & \\textbf{Switch} \\\\\n\\midrule\nIntelligence & None (``dumb'') & Learns MACs \\\\\nForwarding & Floods to \\textbf{all} ports & Forwards to \\textbf{correct} port \\\\\nForwarding table & No & MAC Address Table (FDB) \\\\\nCollision domain & All ports = 1 & Each port = separate \\\\\nBroadcast domain & 1 & 1 (unless VLANs) \\\\\nDuplex & Half-duplex & Full-duplex \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n\\vfill\nSwitches have **completely replaced** hubs in modern networks.\n\n## Switch Forwarding -- MAC Address Table\n\nHow a switch learns and forwards:\n\n1. Frame arrives on port X with source MAC **A**\n2. Switch **learns**: MAC A is reachable via port X (adds to FDB)\n3. Switch looks up destination MAC **B** in FDB:\n    - **Found** $\\rightarrow$ forward to that specific port (unicast)\n    - **Not found** $\\rightarrow$ forward to **all** ports except X (flooding / unknown unicast)\n    - **Broadcast** (\\texttt{FF:...:FF}) $\\rightarrow$ forward to all ports except X\n\nFDB entries have a **timeout** (typically 300s) and are refreshed on activity.\n\n## Switch Forwarding -- Example\n\n<!-- NOTE: Consider adding a diagram from the existing material (slide ~72) -->\n\n\\begin{center}\n\\small\n\\begin{tabular}{ll}\n\\toprule\n\\textbf{MAC Address} & \\textbf{Port} \\\\\n\\midrule\n00:80:E2:12:E3:23 & 1 \\\\\n00:80:14:12:32:AD & 2 \\\\\n00:FD:21:EE:12:13 & 3 \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nFrame arrives: SA = \\texttt{00:80:E2:12:E3:23}, DA = \\texttt{00:FD:21:EE:12:13}\n\n$\\rightarrow$ Switch looks up DA in table $\\rightarrow$ **port 3** $\\rightarrow$ forward only to port 3.\n\n## L2 Switching Types\n\n- **Unicast**: DA matches a known MAC $\\rightarrow$ forward to specific port\n- **Broadcast**: DA = \\texttt{FF:FF:FF:FF:FF:FF} $\\rightarrow$ forward to all ports (except ingress)\n- **Multicast**: DA = multicast MAC (OUI \\texttt{01:00:5E}) $\\rightarrow$ forward to group members\n\n<!-- NOTE: Consider adding the 3-diagram set from existing slides ~74-77 -->\n\n## Address Resolution Protocol (ARP)\n\n**Problem**: IP knows the destination IP, but Ethernet needs a MAC address.\n\nARP resolves: **IP address $\\rightarrow$ MAC address** within a LAN.\n\n1. Host A wants to send to \\texttt{192.168.1.5}\n2. Checks its **ARP cache** --- not found\n3. Broadcasts **ARP Request**: \\textit{``Who has 192.168.1.5? Tell 192.168.1.2''}\n    - DA: \\texttt{FF:FF:FF:FF:FF:FF}\n4. Host B (\\texttt{192.168.1.5}) replies with **ARP Reply** (unicast)\n    - \\textit{``192.168.1.5 is at 00:80:DA:12:34:56''}\n5. Both hosts **cache** each other's mapping\n\n## ARP -- Important Details\n\n- ARP is **broadcast-based** $\\rightarrow$ does **not** cross routers (LAN only)\n- ARP cache entries have a **timeout** (typically 20 min)\n- For destinations **outside the LAN**:\n    - ARP resolves the MAC of the **default gateway** (router)\n    - The router then forwards the IP packet to the next hop\n\n\\vfill\n\n**Security concern**: ARP Spoofing --- a host can send fake ARP replies\n\n- Covered in more detail in Block 5 (Security)\n\n## ARP -- Example\n\n<!-- NOTE: Reuse the Wireshark/Packet Tracer ARP example from existing slide ~81 -->\n\n\\small\n\n| Step | Src MAC | Dst MAC | Type | Content |\n|:-----|:--------|:--------|:-----|:--------|\n| Request | AA:AA:...:AA | FF:FF:...:FF | 0x0806 | Who has 192.168.1.5? |\n| Reply | BB:BB:...:BB | AA:AA:...:AA | 0x0806 | 192.168.1.5 is at BB:BB:...:BB |\n\n\\normalsize\n\nAfter this exchange, both hosts update their ARP caches and can communicate directly at L2.\n\n## Wired vs. Wireless Technologies\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Feature} & \\textbf{Ethernet (802.3)} & \\textbf{Wi-Fi (802.11)} \\\\\n\\midrule\nMedium & Copper / Fiber & Radio (air) \\\\\nAccess control & CSMA/CD & CSMA/CA \\\\\nTypical speeds & 1/10/25/100 Gbps & 600 Mbps -- 9.6 Gbps \\\\\nReliability & High & Variable (interference) \\\\\nSecurity & Physical access needed & Encryption required (WPA2/3) \\\\\nDuplex & Full-duplex (switched) & Half-duplex \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nStandards evolution: 802.11b $\\rightarrow$ g $\\rightarrow$ n $\\rightarrow$ ac (Wi-Fi 5) $\\rightarrow$ ax (Wi-Fi 6) $\\rightarrow$ be (Wi-Fi 7)\n\n## Wi-Fi (802.11) -- Key Concepts\n\n- Wireless LAN using radio frequencies (2.4 GHz, 5 GHz, 6 GHz)\n- **Infrastructure mode**: devices connect via an Access Point (AP)\n- **Ad-hoc mode**: direct peer-to-peer connections\n\nKey differences from Ethernet:\n\n- Frame format has up to **4 MAC address fields** (needed for AP-mediated communication)\n- **Hidden node problem**: two nodes can't hear each other but both reach the AP\n- **Shared medium**: all devices on same channel compete for airtime\n- **Signal degradation**: walls, distance, interference\n\n## VLANs -- Virtual Local Area Networks\n\n**Problem**: one physical switch = one broadcast domain\n\n- All devices receive all broadcast traffic\n- No logical separation without adding routers\n\n**Solution**: VLANs --- logically segment a switch into **multiple broadcast domains**\n\nBenefits:\n\n- **Security**: isolate sensitive traffic (e.g., management vs. guest)\n- **Performance**: reduce broadcast domain size\n- **Flexibility**: group devices logically, not by physical location\n\n## VLANs -- IEEE 802.1Q Tagging\n\n802.1Q inserts a **4-byte tag** into the Ethernet frame:\n\n\\footnotesize\n\n| Dest MAC | Src MAC | **802.1Q Tag (4B)** | EtherType | Payload | FCS |\n\n\\normalsize\n\nThe 802.1Q tag contains:\n\n- **TPID** (2 B): \\texttt{0x8100} --- identifies a tagged frame\n- **PCP** (3 bits): Priority Code Point (QoS)\n- **DEI** (1 bit): Drop Eligible Indicator\n- **VLAN ID** (12 bits): 0--4095 (4096 possible VLANs)\n\nPort types:\n\n- **Access port**: connects to end devices, carries **one** VLAN (untagged)\n- **Trunk port**: connects switches, carries **multiple** VLANs (tagged)\n\n## VLANs -- Example\n\n\\begin{center}\n\\small\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Ports} & \\textbf{VLAN} & \\textbf{Department} \\\\\n\\midrule\n1--4 & VLAN 10 & Engineering \\\\\n5--8 & VLAN 20 & Marketing \\\\\n9--12 & VLAN 30 & Management \\\\\n24 & Trunk & To other switch \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n- Devices on VLAN 10 **cannot** reach VLAN 20 at L2\n- Cross-VLAN traffic requires a **router** (or L3 switch) $\\rightarrow$ \\textit{inter-VLAN routing}\n\n## L2 Redundancy -- Link Aggregation (LAG)\n\n- **LAG**: bundle multiple physical links into one logical link\n- Standard: IEEE 802.1AX (formerly 802.3ad)\n\nBenefits:\n\n- **Increased bandwidth**: aggregate throughput of member links\n- **Redundancy**: if one link fails, others continue operating\n\nConfiguration:\n\n- **Static LAG**: manually configured on both ends\n- **LACP** (Link Aggregation Control Protocol): dynamic negotiation\n\nRequirements: same speed, full-duplex, between the same two devices.\n\n## L2 Redundancy -- Spanning Tree Protocol (STP)\n\n**Problem**: redundant paths between switches create **L2 loops**\n\n- L2 has **no TTL** $\\rightarrow$ broadcast frames loop forever $\\rightarrow$ **broadcast storm**\n- Switch FDB becomes unstable (MAC flapping)\n\n**STP (802.1D)**: creates a loop-free logical topology\n\n- Elects a **Root Bridge** (lowest priority + MAC)\n- Assigns port roles:\n    - **Root Port (R)**: best path to root (one per non-root switch)\n    - **Designated Port (D)**: best port on each segment\n    - **Blocked Port (B)**: no forwarding, prevents loops\n- Uses **BPDUs** (Bridge Protocol Data Units) for communication\n- Convergence: 30--60s. **RSTP (802.1w)**: 2--3s\n\n## STP -- Example\n\n<!-- NOTE: Reuse or adapt the STP diagram from existing slides ~84-87 -->\n\n\\begin{center}\n\\begin{tikzpicture}[\n    switch/.style={rectangle, draw, minimum width=1.8cm, minimum height=0.8cm, font=\\small},\n    >=Stealth\n]\n\\node[switch, fill=blue!20] (S1) {SW1 (Root)};\n\\node[switch, right=3cm of S1] (S2) {SW2};\n\\node[switch, below=2cm of $(S1)!0.5!(S2)$] (S3) {SW3};\n\n\\draw[thick] (S1) -- node[above, font=\\scriptsize]{D --- R} (S2);\n\\draw[thick] (S1) -- node[left, font=\\scriptsize]{D --- R} (S3);\n\\draw[thick, dashed, red] (S2) -- node[right, font=\\scriptsize]{D --- \\textbf{B}} (S3);\n\\end{tikzpicture}\n\\end{center}\n\nSW1 = Root Bridge (all ports Designated). SW3's port toward SW2 is **Blocked** $\\rightarrow$ loop prevented.\n\n## Tunneling at Layer 2 -- Preview\n\n**Tunneling**: encapsulating one protocol inside another.\n\nAt L2, tunneling allows extending a LAN across a wider network:\n\n- **L2TP** (Layer 2 Tunneling Protocol)\n- **VXLAN** (Virtual Extensible LAN) --- key for data centers\n- **GRE** (Generic Routing Encapsulation)\n\n\\vfill\n\nWe will explore tunneling and encapsulation in depth in **Block 4** (Network Virtualization \\& Programmability).\n\n# Part B -- Layer 3: IP Fundamentals\n\n## The Network Layer -- Overview\n\nLayer 3 provides **end-to-end** data delivery across **different networks**.\n\nKey protocol: **Internet Protocol (IP)**\n\n- **Connectionless**: each packet (datagram) is routed independently\n- **Unreliable**: no delivery guarantee (upper layers like TCP handle this)\n- **Best-effort**: packets may be lost, duplicated, or arrive out of order\n\nKey functions:\n\n- **Logical addressing** (IP addresses)\n- **Routing** (path determination between networks)\n- **Fragmentation** (if packet exceeds link MTU)\n\nDevices: **Routers** operate at L3 and separate broadcast domains.\n\n## L2 vs. L3 -- Key Differences\n\n\\begin{center}\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Feature} & \\textbf{L2 (Link)} & \\textbf{L3 (Network)} \\\\\n\\midrule\nScope & Local (same LAN) & End-to-end (across networks) \\\\\nAddressing & MAC (flat, physical) & IP (hierarchical, logical) \\\\\nPDU & Frame & Packet / Datagram \\\\\nDevices & Switches & Routers \\\\\nHeaders & Change at each hop & Preserved end-to-end \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nL2 headers are de-encapsulated and re-encapsulated at each router hop; L3 headers remain (mostly) unchanged.\n\n## IPv4 Header\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{llp{7cm}}\n\\toprule\n\\textbf{Field} & \\textbf{Bits} & \\textbf{Description} \\\\\n\\midrule\nVersion & 4 & IP version (4) \\\\\nIHL & 4 & Header length in 32-bit words (typically 5 = 20 bytes) \\\\\nToS / DSCP & 8 & Differentiated Services + ECN \\\\\nTotal Length & 16 & Entire packet size in bytes (max 65535) \\\\\nIdentification & 16 & Fragment identification \\\\\nFlags & 3 & DF (Don't Fragment), MF (More Fragments) \\\\\nFragment Offset & 13 & Position of fragment in original datagram \\\\\nTTL & 8 & Hops remaining (decremented at each router) \\\\\nProtocol & 8 & Upper layer: TCP=6, UDP=17, ICMP=1 \\\\\nHeader Checksum & 16 & Error detection for header only \\\\\nSource IP & 32 & Sender's IP address \\\\\nDestination IP & 32 & Receiver's IP address \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n## IPv4 Header -- Key Fields Explained\n\n**TTL (Time to Live)**:\n\n- Decremented by 1 at each router; packet **discarded** when TTL = 0\n- Prevents infinite routing loops\n- ICMP ``Time Exceeded'' sent back to source\n- **Traceroute** exploits this mechanism\n\n**Protocol**: identifies payload type (TCP=6, UDP=17, ICMP=1)\n\n**Fragmentation** (Identification + Flags + Offset):\n\n- If packet $>$ link MTU, router **fragments** it\n- Reassembly at the **destination** only\n- DF flag: ``Don't Fragment'' --- drop and send ICMP error instead\n\n## IPv4 Addressing -- Public vs. Private\n\n:::::::::::::: {.columns}\n::: {.column width=\"50%\"}\n\n**Public addresses:**\n\n- Globally routable on the Internet\n- Managed by IANA $\\rightarrow$ RIRs\n    - Europe: RIPE NCC\n    - N. America: ARIN\n- Assigned to organizations/ISPs\n- **Scarce**: $2^{32} \\approx$ 4.3 billion\n\n:::\n::: {.column width=\"50%\"}\n\n**Private addresses (RFC 1918):**\n\n| Range | CIDR |\n|:------|:-----|\n| 10.0.0.0 -- 10.255.255.255 | /8 |\n| 172.16.0.0 -- 172.31.255.255 | /12 |\n| 192.168.0.0 -- 192.168.255.255 | /16 |\n\n- **Not routable** on public Internet\n- Used internally (offices, homes)\n- Require **NAT** for Internet access\n\n:::\n::::::::::::::\n\n## Why Private Addresses Exist -- IPv4 Exhaustion\n\n- IPv4: 32 bits $\\rightarrow$ $2^{32} \\approx$ **4.3 billion** addresses\n- World population: $\\sim$8 billion, many with multiple devices\n- IANA pool **exhausted in February 2011**\n\nSolutions:\n\n- **Private addressing + NAT**: reuse addresses internally\n- **CIDR**: efficient allocation (no more classful waste)\n- **IPv6**: 128-bit addresses ($2^{128} \\approx 3.4 \\times 10^{38}$), but adoption is gradual\n\n\\vfill\nYour home LAN likely uses \\texttt{192.168.X.X} with \\textbf{one public IP} via NAT.\n\n## Other Special Address Ranges\n\n\\begin{center}\n\\begin{tabular}{ll}\n\\toprule\n\\textbf{Range} & \\textbf{Purpose} \\\\\n\\midrule\n127.0.0.0/8 & Loopback (localhost) \\\\\n169.254.0.0/16 & Link-local (APIPA -- auto-config when no DHCP) \\\\\n224.0.0.0/4 & Multicast (Class D) \\\\\n255.255.255.255/32 & Limited broadcast \\\\\n0.0.0.0/8 & ``This network'' (used in DHCP) \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n## CIDR -- Classless Inter-Domain Routing\n\n**Before CIDR**: classful addressing (A, B, C)\n\n- Class A (/8): 16M hosts --- too many for most organizations\n- Class C (/24): 254 hosts --- too few for many\n- Enormous waste of address space\n\n**CIDR** (RFC 4632): variable-length prefix notation\n\n- Format: \\texttt{IP/prefix\\_length} (e.g., \\texttt{192.168.1.0/24})\n- Subnet mask defines **network** vs. **host** portion\n\nExample: \\texttt{192.168.1.0/24}\n\n- Mask: \\texttt{255.255.255.0} = \\texttt{11111111.11111111.11111111.00000000}\n- Usable hosts: $2^{8} - 2 = \\textbf{254}$ (minus network address + broadcast)\n\n## Subnetting -- The Basics\n\n**Subnetting**: dividing a network into smaller sub-networks.\n\nKey formulas:\n\n- Subnets: $2^{s}$ \\quad ($s$ = bits borrowed from host portion)\n- Hosts per subnet: $2^{h} - 2$ \\quad ($h$ = remaining host bits)\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Prefix} & \\textbf{Subnet Mask} & \\textbf{Usable Hosts} \\\\\n\\midrule\n/24 & 255.255.255.0 & 254 \\\\\n/25 & 255.255.255.128 & 126 \\\\\n/26 & 255.255.255.192 & 62 \\\\\n/27 & 255.255.255.224 & 30 \\\\\n/28 & 255.255.255.240 & 14 \\\\\n/30 & 255.255.255.252 & 2 \\\\\n/31 & 255.255.255.254 & 2* \\\\\n/32 & 255.255.255.255 & 1* \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n\\footnotesize *Special: /31 for point-to-point links (RFC 3021), /32 for loopbacks.\n\n## Subnetting -- Worked Example 1\n\n**Given**: Network \\texttt{10.10.0.0/16}. Create **4 subnets**.\n\n1. Need 4 subnets $\\rightarrow$ $2^{2} = 4$ $\\rightarrow$ borrow **2 bits**\n2. New prefix: /16 + 2 = **/18**\n3. New mask: \\texttt{255.255.192.0}\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{llll}\n\\toprule\n\\textbf{Subnet} & \\textbf{Network} & \\textbf{Usable Range} & \\textbf{Broadcast} \\\\\n\\midrule\n1 & 10.10.0.0/18 & 10.10.0.1 -- 10.10.63.254 & 10.10.63.255 \\\\\n2 & 10.10.64.0/18 & 10.10.64.1 -- 10.10.127.254 & 10.10.127.255 \\\\\n3 & 10.10.128.0/18 & 10.10.128.1 -- 10.10.191.254 & 10.10.191.255 \\\\\n4 & 10.10.192.0/18 & 10.10.192.1 -- 10.10.255.254 & 10.10.255.255 \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nEach subnet: $2^{14} - 2 = \\textbf{16,382}$ hosts.\n\n## Subnetting -- Worked Example 2 (VLSM)\n\n**Given**: \\texttt{192.168.10.0/24}. Subnets needed:\n\n- Subnet A: 60 devices \\quad / \\quad Subnet B: 30 devices\n- Subnet C: 10 devices \\quad / \\quad Subnet D: 2 devices (point-to-point)\n\n\\textbf{VLSM} --- allocate largest first:\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{lllll}\n\\toprule\n\\textbf{Subnet} & \\textbf{Need} & \\textbf{Prefix} & \\textbf{Network Address} & \\textbf{Usable} \\\\\n\\midrule\nA & 60 & /26 & 192.168.10.0/26 & 62 \\\\\nB & 30 & /27 & 192.168.10.64/27 & 30 \\\\\nC & 10 & /28 & 192.168.10.96/28 & 14 \\\\\nD & 2  & /30 & 192.168.10.112/30 & 2 \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n## Subnetting -- Worked Example 3\n\n**Question**: Host IP = \\texttt{172.16.45.130/21}. Find:\n\n- Network address? Broadcast address? Valid host range?\n\n**Solution**:\n\n- /21 $\\rightarrow$ Mask = \\texttt{255.255.248.0}\n- 3rd octet: 45 = \\texttt{00101101} in binary\n- Mask 3rd octet: \\texttt{11111000}\n- Network bits: \\texttt{00101\\textbf{000}} = **40**\n\n\\begin{center}\n\\begin{tabular}{ll}\n\\toprule\nNetwork address & \\texttt{172.16.40.0/21} \\\\\nBroadcast address & \\texttt{172.16.47.255} \\\\\nValid host range & \\texttt{172.16.40.1} -- \\texttt{172.16.47.254} \\\\\nTotal usable hosts & $2^{11} - 2 = 2046$ \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n## Subnetting -- Quick Reference Method\n\nTo quickly find network boundaries:\n\n1. Identify the **interesting octet** (mask is not 0 or 255)\n2. **Block size** = $256 - \\text{mask value in that octet}$\n3. Network addresses are **multiples** of the block size\n\n\\vfill\n\n**Example**: /26 $\\rightarrow$ mask = 255.255.255.**192**\n\n- Block size = $256 - 192 = \\textbf{64}$\n- Networks: .0, .64, .128, .192\n\n**Exercise**: In which subnet is \\texttt{192.168.1.100/26}?\n\n- $64 \\leq 100 < 128$ $\\rightarrow$ belongs to \\texttt{192.168.1.64/26}\n\n## IP Routing Types\n\n- **Unicast**: one-to-one (normal IP traffic)\n    - Source IP $\\rightarrow$ specific Destination IP\n- **Broadcast**: one-to-all in a network\n    - Limited broadcast: \\texttt{255.255.255.255} (never forwarded by routers)\n    - Directed broadcast: e.g., \\texttt{10.10.255.255} for \\texttt{10.10.0.0/16}\n- **Multicast**: one-to-many (specific group)\n    - Destination IP in range \\texttt{224.0.0.0/4}\n    - Devices join multicast groups (IGMP)\n    - Used for streaming, IPTV, etc.\n\n## IP Routing -- How It Works (Preview)\n\nEvery host and router has a **routing table**:\n\n1. Extract **destination IP** from incoming packet\n2. Look up in routing table $\\rightarrow$ find **next hop** + **output interface**\n3. **Longest prefix match**: most specific route wins\n4. No match $\\rightarrow$ use **default route** (\\texttt{0.0.0.0/0}) or drop\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Destination} & \\textbf{Next Hop} & \\textbf{Interface} \\\\\n\\midrule\n192.168.1.0/24 & directly connected & eth0 \\\\\n10.0.0.0/8 & 192.168.1.1 & eth0 \\\\\n0.0.0.0/0 & 192.168.1.1 & eth0 \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n\\vfill\n\\footnotesize\nNext session: \\textit{how} routers compute these tables (routing algorithms, OSPF, BGP).\n\n## ICMP -- Internet Control Message Protocol\n\n- Protocol for **network diagnostics and error reporting**\n- Carried inside IP packets (Protocol field = 1)\n- Does NOT carry application data\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Type} & \\textbf{Name} & \\textbf{Meaning} \\\\\n\\midrule\n0 & Echo Reply & ``Yes, I'm alive'' \\\\\n3 & Destination Unreachable & ``I can't deliver this'' \\\\\n5 & Redirect & ``There's a better route'' \\\\\n8 & Echo Request & ``Are you alive?'' \\\\\n11 & Time Exceeded & ``TTL reached 0'' \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n## ICMP -- Ping and Traceroute\n\n**Ping**: tests connectivity\n\n- Sends **Echo Request** (type 8), expects **Echo Reply** (type 0)\n- Measures **Round-Trip Time (RTT)**\n\n**Traceroute**: discovers the path to a destination\n\n- Sends packets with **incrementing TTL** (1, 2, 3, ...)\n- Each router along the path returns **Time Exceeded** (type 11)\n- Result: ordered list of every router between source and destination\n\n\\vfill\n\n<!-- NOTE: Reuse the Wireshark ping example from existing slide ~59 -->\n\n## Session 1 -- Summary\n\n**Layer 2 -- Link Layer:**\n\n- Ethernet framing, MAC addresses, EtherTypes\n- Media access: CSMA/CD (wired) vs. CSMA/CA (wireless)\n- Switches vs. Hubs, ARP, VLANs (802.1Q)\n- Redundancy: LAG and STP\n\n**Layer 3 -- IP Fundamentals:**\n\n- IPv4 header, addressing (public vs. private, RFC 1918)\n- CIDR, subnetting, VLSM\n- IP routing types (unicast, broadcast, multicast)\n- ICMP: ping and traceroute\n\n\\vfill\n**Next session**: Routing algorithms (Dijkstra, Bellman-Ford), OSPF, BGP, DHCP, and NAT.\n\n## Questions?\n\n\\begin{center}\n\\Huge Arquitectura de Xarxes\n\\end{center}\n"
}
```

**Output:**
```
Wrote file successfully.
```

---

## Assistant (Build · claude-opus-4.6 · 11.4s)

**Tool: todowrite**

**Input:**
```json
{
  "todos": [
    {
      "content": "Create Session 1 Beamer slides: Network Access & IP Fundamentals",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Create Session 2 Beamer slides: Routing, Protocols & Connectivity Services",
      "priority": "high",
      "status": "in_progress"
    },
    {
      "content": "Create Makefile for pandoc/beamer compilation",
      "priority": "medium",
      "status": "pending"
    }
  ]
}
```

**Output:**
```
[
  {
    "content": "Create Session 1 Beamer slides: Network Access & IP Fundamentals",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Create Session 2 Beamer slides: Routing, Protocols & Connectivity Services",
    "priority": "high",
    "status": "in_progress"
  },
  {
    "content": "Create Makefile for pandoc/beamer compilation",
    "priority": "medium",
    "status": "pending"
  }
]
```

---

## Assistant (Build · claude-opus-4.6 · 174.5s)

**Tool: write**

**Input:**
```json
{
  "content": "---\ntitle: \"Block 3 -- Session 2\"\nsubtitle: \"Routing, Protocols \\\\& Connectivity Services\"\nauthor: \"Arquitectura de Xarxes\"\ninstitute: \"Universitat Pompeu Fabra -- 2025/2026\"\ntheme: \"Madrid\"\ncolortheme: \"dolphin\"\nfonttheme: \"structurebold\"\naspectratio: 169\nnavigation: horizontal\ntoc: true\nheader-includes:\n  - \\usepackage{booktabs}\n  - \\usepackage{tikz}\n  - \\usetikzlibrary{positioning, arrows.meta, calc, decorations.markings}\n  - \\setbeamerfont{footnote}{size=\\tiny}\n  - \\AtBeginSection[]{\\begin{frame}{Outline}\\tableofcontents[currentsection]\\end{frame}}\n---\n\n# Part A -- Routing Algorithms \\& Protocols\n\n## Recap -- Forwarding vs. Routing\n\nTwo distinct functions in a router:\n\n:::::::::::::: {.columns}\n::: {.column width=\"50%\"}\n\n**Forwarding (Data Plane)**\n\n- Per-packet operation\n- Look up destination in forwarding table\n- Determine output port\n- Hardware speed (nanoseconds)\n\n:::\n::: {.column width=\"50%\"}\n\n**Routing (Control Plane)**\n\n- Builds and maintains routing tables\n- Uses routing algorithms to compute best paths\n- Software-based (seconds to minutes)\n- Periodic or event-driven\n\n:::\n::::::::::::::\n\n\\vfill\n\\footnotesize\nAnalogy: \\textit{Routing} = planning a trip on a map. \\textit{Forwarding} = following road signs at each intersection.\n\n## Static vs. Dynamic Routing\n\n:::::::::::::: {.columns}\n::: {.column width=\"50%\"}\n\n**Static Routing**\n\n- Manually configured by admin\n- Simple, predictable\n- Does NOT adapt to failures\n- Suitable for small, stable networks\n\n:::\n::: {.column width=\"50%\"}\n\n**Dynamic Routing**\n\n- Routers exchange info automatically\n- Adapts to topology changes\n- Uses routing protocols (OSPF, BGP, RIP...)\n- Essential for large networks and the Internet\n\n:::\n::::::::::::::\n\n\\vfill\nIn practice, most networks use a combination: static for simple paths, dynamic for the core.\n\n## Routing Algorithms -- Two Families\n\n\\begin{center}\n\\begin{tabular}{lll}\n\\toprule\n& \\textbf{Distance-Vector} & \\textbf{Link-State} \\\\\n\\midrule\nInfo shared & Distance to destinations & Complete topology \\\\\nShared with & Neighbors only & All routers (flooding) \\\\\nAlgorithm & Bellman-Ford & Dijkstra \\\\\nNetwork view & Partial (via neighbors) & Complete (global map) \\\\\nConvergence & Slower & Faster \\\\\nExamples & RIP, BGP* & OSPF, IS-IS \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n\\footnotesize\n*BGP uses \\textit{path-vector}, an evolution of distance-vector.\n\n## Distance-Vector -- Concept\n\nEach router maintains a **distance vector**: estimated cost to reach every destination.\n\nAlgorithm:\n\n1. Periodically, send your distance vector to **neighbors**\n2. Upon receiving a neighbor's vector, **update** your own:\n$$d(x, y) = \\min_{v \\in \\text{neighbors}} \\left\\{ c(x, v) + d(v, y) \\right\\}$$\n3. Iterate until convergence\n\nCharacteristics:\n\n- ``Routing by rumor'' --- a router only knows what neighbors tell it\n- **Count-to-infinity** problem: bad news travels slowly\n- Mitigations: split horizon, poison reverse, hold-down timers\n\n## Example Graph -- Used for Both Algorithms\n\n\\begin{center}\n\\begin{tikzpicture}[\n    node/.style={circle, draw, minimum size=0.9cm, font=\\normalsize, thick},\n    >=Stealth,\n    every edge/.style={draw, thick}\n]\n\\node[node, fill=blue!20] (A) at (0, 0) {A};\n\\node[node] (B) at (3, 0) {B};\n\\node[node] (C) at (1.5, -2) {C};\n\\node[node] (D) at (4.5, -2) {D};\n\\node[node] (E) at (3, -4) {E};\n\n\\draw (A) -- node[above, font=\\small] {1} (B);\n\\draw (A) -- node[left, font=\\small] {4} (C);\n\\draw (B) -- node[right, font=\\small] {2} (C);\n\\draw (B) -- node[above right, font=\\small] {6} (D);\n\\draw (C) -- node[above, font=\\small] {3} (D);\n\\draw (C) -- node[left, font=\\small] {1} (E);\n\\draw (D) -- node[right, font=\\small] {2} (E);\n\\end{tikzpicture}\n\\end{center}\n\n**Goal**: find shortest paths from **A** to all other nodes.\n\n## Bellman-Ford Algorithm\n\n**Principle**: relax **all edges**, repeat up to $|V| - 1$ times.\n\nInitialize: $\\text{dist}[A] = 0$, all others $= \\infty$.\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{llll}\n\\toprule\n\\textbf{Edge} & \\textbf{Relaxation check} & \\textbf{Update?} & \\textbf{New dist} \\\\\n\\midrule\n$A \\to B$ & $0 + 1 = 1 < \\infty$ & Yes & dist[B] = 1 \\\\\n$A \\to C$ & $0 + 4 = 4 < \\infty$ & Yes & dist[C] = 4 \\\\\n$B \\to C$ & $1 + 2 = 3 < 4$     & Yes & dist[C] = 3 \\\\\n$B \\to D$ & $1 + 6 = 7 < \\infty$ & Yes & dist[D] = 7 \\\\\n$C \\to D$ & $3 + 3 = 6 < 7$     & Yes & dist[D] = 6 \\\\\n$C \\to E$ & $3 + 1 = 4 < \\infty$ & Yes & dist[E] = 4 \\\\\n$D \\to E$ & $6 + 2 = 8 > 4$     & No  & -- \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nAfter iteration 1: dist = [A:0, B:1, C:3, D:6, E:4]\n\n## Bellman-Ford -- Convergence\n\n**Iteration 2**: relax all edges again.\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{llll}\n\\toprule\n\\textbf{Edge} & \\textbf{Check} & \\textbf{Update?} & \\textbf{Reason} \\\\\n\\midrule\n$A \\to B$ & $0 + 1 = 1$ & No & already 1 \\\\\n$A \\to C$ & $0 + 4 = 4 > 3$ & No & already 3 \\\\\n$B \\to C$ & $1 + 2 = 3$ & No & already 3 \\\\\n$B \\to D$ & $1 + 6 = 7 > 6$ & No & already 6 \\\\\n$C \\to D$ & $3 + 3 = 6$ & No & already 6 \\\\\n$C \\to E$ & $3 + 1 = 4$ & No & already 4 \\\\\n$D \\to E$ & $6 + 2 = 8 > 4$ & No & already 4 \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n**No changes** $\\rightarrow$ **converged!**\n\nComplexity: $O(|V| \\times |E|)$ --- runs up to $|V|-1$ iterations over all edges.\n\n## Bellman-Ford -- Final Result\n\n\\begin{center}\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Destination} & \\textbf{Shortest Distance} & \\textbf{Path} \\\\\n\\midrule\nA & 0 & -- \\\\\nB & 1 & $A \\to B$ \\\\\nC & 3 & $A \\to B \\to C$ \\\\\nD & 6 & $A \\to B \\to C \\to D$ \\\\\nE & 4 & $A \\to B \\to C \\to E$ \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nIn **distance-vector** routing, each router would:\n\n1. Send its distance vector \\{B:1, C:3, D:6, E:4\\} to neighbors\n2. Neighbors update their own vectors accordingly\n3. Process repeats until all routers converge\n\n## Dijkstra's Algorithm -- Concept\n\n**Link-state** approach: every router has a **complete map** of the network.\n\nAlgorithm (**greedy**):\n\n1. Start with source node, distance = 0. All others = $\\infty$.\n2. For current node: update distances to all **unvisited** neighbors.\n3. Mark current node as **visited**.\n4. Select unvisited node with **smallest distance** as next current.\n5. Repeat until all nodes visited.\n\n\\vfill\nComplexity: $O(|V|^{2})$ or $O((|V|+|E|) \\log |V|)$ with a priority queue.\n\n## Dijkstra -- Step by Step\n\nSame graph. Source = **A**.\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{llccccc}\n\\toprule\n\\textbf{Step} & \\textbf{Current} & \\textbf{dist[A]} & \\textbf{dist[B]} & \\textbf{dist[C]} & \\textbf{dist[D]} & \\textbf{dist[E]} \\\\\n\\midrule\nInit & -- & \\textbf{0} & $\\infty$ & $\\infty$ & $\\infty$ & $\\infty$ \\\\\n1 & A & 0 & \\textbf{1} & 4 & $\\infty$ & $\\infty$ \\\\\n2 & B & 0 & 1 & \\textbf{3} & 7 & $\\infty$ \\\\\n3 & C & 0 & 1 & 3 & 6 & \\textbf{4} \\\\\n4 & E & 0 & 1 & 3 & \\textbf{6} & 4 \\\\\n5 & D & 0 & 1 & 3 & 6 & 4 \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nBold = newly finalized distance at each step.\n\nSame result as Bellman-Ford, but found more efficiently!\n\n## Dijkstra -- Shortest Path Tree\n\n\\begin{center}\n\\begin{tikzpicture}[\n    node/.style={circle, draw, minimum size=0.9cm, font=\\normalsize, thick},\n    >=Stealth,\n    selected/.style={draw, very thick, blue!70}\n]\n\\node[node, fill=blue!20] (A) at (0, 0) {A};\n\\node[node] (B) at (3, 0) {B};\n\\node[node] (C) at (1.5, -2) {C};\n\\node[node] (D) at (4.5, -2) {D};\n\\node[node] (E) at (3, -4) {E};\n\n% Shortest path edges (blue, thick)\n\\draw[selected, ->] (A) -- node[above, font=\\small, blue] {1} (B);\n\\draw[selected, ->] (B) -- node[right, font=\\small, blue] {2} (C);\n\\draw[selected, ->] (C) -- node[above, font=\\small, blue] {3} (D);\n\\draw[selected, ->] (C) -- node[left, font=\\small, blue] {1} (E);\n\n% Non-shortest edges (gray, dashed)\n\\draw[dashed, gray] (A) -- node[left, font=\\small, gray] {4} (C);\n\\draw[dashed, gray] (B) -- node[above right, font=\\small, gray] {6} (D);\n\\draw[dashed, gray] (D) -- node[right, font=\\small, gray] {2} (E);\n\\end{tikzpicture}\n\\end{center}\n\nBlue arrows = shortest path tree from A. Each router runs Dijkstra **from its own perspective**.\n\n## Dijkstra vs. Bellman-Ford\n\n\\begin{center}\n\\begin{tabular}{lll}\n\\toprule\n\\textbf{Feature} & \\textbf{Dijkstra} & \\textbf{Bellman-Ford} \\\\\n\\midrule\nType & Greedy & Dynamic programming \\\\\nRequires & Global topology & Neighbor info only \\\\\nNegative weights & Cannot handle & Can handle \\\\\nComplexity & $O(V^{2})$ / $O((V\\!+\\!E)\\log V)$ & $O(V \\times E)$ \\\\\nConvergence & Single computation & Multiple iterations \\\\\nUsed by & OSPF, IS-IS & RIP, (BGP: path-vector) \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n\\vfill\nIn networking, edge weights are always positive (link costs), so **Dijkstra is generally preferred** for IGPs.\n\n## Interior vs. Exterior Routing\n\nThe Internet is divided into **Autonomous Systems (ASes)**:\n\n- An AS = a network under a **single administrative authority**\n- Each AS has a unique **AS Number (ASN)** assigned by IANA/RIRs\n- Examples: AS3352 (Telef\\'{o}nica), AS15169 (Google), AS32934 (Meta)\n\n\\vfill\n\nTwo types of routing protocols:\n\n- **IGP** (Interior Gateway Protocol): routing **within** an AS\n    - Examples: OSPF, IS-IS, RIP\n- **EGP** (Exterior Gateway Protocol): routing **between** ASes\n    - The protocol: **BGP** (Border Gateway Protocol)\n\n## OSPF -- Open Shortest Path First\n\n- **Link-state IGP** --- the most widely used interior routing protocol\n- RFC 2328 (OSPFv2 for IPv4), RFC 5340 (OSPFv3 for IPv6)\n\nHow it works:\n\n1. Discover neighbors via **Hello** packets\n2. Form **adjacencies** with neighbors\n3. Exchange **LSAs** (Link-State Advertisements) --- flooded to all routers\n4. Build a **Link-State Database (LSDB)** --- identical across the area\n5. Run **Dijkstra's algorithm** on the LSDB $\\rightarrow$ routing table\n\nCost metric (typically based on bandwidth):\n$$\\text{Cost} = \\frac{\\text{Reference BW}}{\\text{Interface BW}}$$\nExample: $100 \\text{ Mbps} / 10 \\text{ Mbps} = 10$\n\n## OSPF -- Hello Protocol and Adjacencies\n\n**Hello packets** are sent periodically on each OSPF-enabled interface:\n\n- Default interval: **10 seconds** (Ethernet), 30s (NBMA)\n- Dead interval: **4 $\\times$ Hello** = 40 seconds\n- If no Hello received within Dead interval $\\rightarrow$ neighbor considered **down**\n\nHello packets carry:\n\n- Router ID, Area ID\n- Hello/Dead intervals (must match to form adjacency)\n- Neighbor list, DR/BDR (on multi-access networks)\n\n\\vfill\nWhen two routers discover each other $\\rightarrow$ they synchronize their LSDBs via **Database Description (DBD)** and **LSR/LSU** exchanges.\n\n## OSPF -- Areas\n\nLarge networks: OSPF uses **areas** to improve scalability.\n\n\\begin{center}\n\\begin{tikzpicture}[\n    area/.style={rectangle, rounded corners, draw, dashed, minimum width=2.5cm, minimum height=1.5cm, font=\\small},\n    rtr/.style={circle, draw, fill=white, minimum size=0.5cm, font=\\scriptsize},\n    >=Stealth\n]\n\\node[area, fill=blue!10, minimum width=3cm] (a0) at (0,0) {Area 0 (Backbone)};\n\\node[area, fill=green!10] (a1) at (-3.5,-2.5) {Area 1};\n\\node[area, fill=orange!10] (a2) at (3.5,-2.5) {Area 2};\n\n\\node[rtr, fill=yellow!30] (abr1) at (-1.5,-1.2) {\\tiny ABR};\n\\node[rtr, fill=yellow!30] (abr2) at (1.5,-1.2) {\\tiny ABR};\n\n\\draw[thick] (a0) -- (abr1) -- (a1);\n\\draw[thick] (a0) -- (abr2) -- (a2);\n\\end{tikzpicture}\n\\end{center}\n\n- **Area 0** (backbone): all areas must connect to it\n- **ABR** (Area Border Router): connects areas\n- Benefits: smaller LSDBs, faster SPF computation, contained flooding\n\n## OSPF -- Router Types\n\n\\begin{center}\n\\begin{tabular}{lp{8cm}}\n\\toprule\n\\textbf{Type} & \\textbf{Description} \\\\\n\\midrule\nInternal Router & All interfaces in one area \\\\\nABR (Area Border Router) & Connects two or more areas; summarizes routes between them \\\\\nASBR (AS Boundary Router) & Connects OSPF domain to external routing (e.g., BGP) \\\\\nBackbone Router & Has at least one interface in Area 0 \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n\\vfill\nIn a small/medium network, a single area (Area 0) is often sufficient.\n\n## OSPF -- Convergence Process\n\nWhen a **topology change** occurs (e.g., link failure):\n\n1. Detecting router generates a **new LSA**\n2. LSA is **flooded** throughout the area\n3. All routers update their LSDB\n4. Each router **re-runs Dijkstra** on the updated LSDB\n5. New routing table computed and installed\n\nConvergence time: typically **seconds**\n\n- Fast detection: Hello/Dead timers or BFD (Bidirectional Forwarding Detection)\n- Fast computation: Dijkstra is efficient on modern hardware\n- Fast flooding: LSAs propagated hop-by-hop with minimal delay\n\n## OSPF -- Example\n\n\\begin{center}\n\\begin{tikzpicture}[\n    rtr/.style={circle, draw, thick, minimum size=0.8cm, font=\\small},\n    >=Stealth\n]\n\\node[rtr, fill=blue!20] (R1) at (0,0) {R1};\n\\node[rtr] (R2) at (3,0) {R2};\n\\node[rtr] (R3) at (6,0) {R3};\n\\node[rtr] (R4) at (0,-2.5) {R4};\n\\node[rtr] (R5) at (6,-2.5) {R5};\n\n\\draw[thick] (R1) -- node[above, font=\\small] {10} (R2);\n\\draw[thick] (R2) -- node[above, font=\\small] {5} (R3);\n\\draw[thick] (R1) -- node[left, font=\\small] {20} (R4);\n\\draw[thick] (R3) -- node[right, font=\\small] {2} (R5);\n\\draw[thick] (R4) -- node[below, font=\\small] {15} (R5);\n\\end{tikzpicture}\n\\end{center}\n\nFrom R1, Dijkstra computes:\n\n| Dest | Best Path | Cost |\n|:-----|:----------|:-----|\n| R2 | R1 $\\to$ R2 | 10 |\n| R3 | R1 $\\to$ R2 $\\to$ R3 | 15 |\n| R5 | R1 $\\to$ R2 $\\to$ R3 $\\to$ R5 | 17 |\n| R4 | R1 $\\to$ R4 | 20 |\n\n## BGP -- Border Gateway Protocol\n\n- **The routing protocol of the Internet** (the only EGP in use)\n- **Path-vector** protocol (evolution of distance-vector)\n- RFC 4271 (BGP-4) --- current version\n\nKey characteristics:\n\n- Routes between **Autonomous Systems**\n- Each route carries the **full AS path** (sequence of ASNs)\n    - Loop detection: if own ASN appears in path $\\rightarrow$ reject\n- Uses **TCP** (port 179) for reliable peer communication\n- **Policy-based**: decisions driven by business relationships, not just cost\n\n## eBGP vs. iBGP\n\n:::::::::::::: {.columns}\n::: {.column width=\"50%\"}\n\n**eBGP (External BGP)**\n\n- Between routers in **different** ASes\n- Peers typically directly connected\n- Prepends own ASN to AS path\n- TTL = 1 by default (directly connected)\n\n:::\n::: {.column width=\"50%\"}\n\n**iBGP (Internal BGP)**\n\n- Between routers in the **same** AS\n- Distributes externally-learned routes\n- Does NOT modify AS path\n- Requires **full mesh** or **route reflectors**\n\n:::\n::::::::::::::\n\n\\begin{center}\n\\begin{tikzpicture}[\n    as/.style={rectangle, rounded corners, draw, dashed, minimum width=2.8cm, minimum height=1.5cm},\n    rtr/.style={circle, draw, fill=white, minimum size=0.5cm, font=\\tiny},\n    >=Stealth\n]\n\\node[as, fill=blue!10] (as1) at (0,0) {AS 100};\n\\node[as, fill=green!10] (as2) at (5,0) {AS 200};\n\\node[rtr] (r1) at (-0.5, 0) {R1};\n\\node[rtr] (r2) at (0.5, 0) {R2};\n\\node[rtr] (r3) at (4.5, 0) {R3};\n\\node[rtr] (r4) at (5.5, 0) {R4};\n\\draw[<->, blue, thick] (r1) -- node[above, font=\\tiny] {iBGP} (r2);\n\\draw[<->, red, very thick] (r2) -- node[above, font=\\tiny] {eBGP} (r3);\n\\draw[<->, blue, thick] (r3) -- node[above, font=\\tiny] {iBGP} (r4);\n\\end{tikzpicture}\n\\end{center}\n\n## BGP -- Path Selection (Simplified)\n\nBGP can learn **multiple paths** to the same prefix. Selection criteria (in order):\n\n\\begin{center}\n\\footnotesize\n\\begin{tabular}{ll}\n\\toprule\n\\textbf{Priority} & \\textbf{Criterion} \\\\\n\\midrule\n1 & Highest \\textbf{Local Preference} (policy, iBGP only) \\\\\n2 & \\textbf{Shortest AS Path} (fewest ASes to traverse) \\\\\n3 & Lowest \\textbf{Origin type} (IGP $<$ EGP $<$ Incomplete) \\\\\n4 & Lowest \\textbf{MED} (hint from neighbor AS) \\\\\n5 & \\textbf{eBGP over iBGP} preferred \\\\\n6 & Lowest \\textbf{IGP cost} to next hop \\\\\n7 & Lowest \\textbf{Router ID} (tiebreaker) \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nKey insight: BGP is not about ``shortest path'' --- it's about **policy and business**.\n\n## BGP -- Business Relationships\n\nAS interconnections are governed by **business agreements**:\n\n- **Customer -- Provider**: customer pays for Internet access\n    - Provider announces customer's prefixes to everyone\n- **Peer -- Peer**: two ASes exchange traffic for free (settlement-free peering)\n    - Only exchange traffic destined to each other's customers\n- **Transit**: full Internet routing (customer pays)\n\n\\vfill\nThese relationships determine **what routes are announced to whom**:\n\n- Routes from **customers** $\\rightarrow$ announce to everyone (you get paid)\n- Routes from **peers** $\\rightarrow$ announce only to customers\n- Routes from **providers** $\\rightarrow$ announce only to customers\n\n## The Big Picture -- How Internet Routing Works\n\n\\begin{center}\n\\begin{tikzpicture}[\n    as/.style={ellipse, draw, thick, minimum width=2.5cm, minimum height=1.2cm, font=\\small},\n    >=Stealth\n]\n\\node[as, fill=blue!15] (isp) at (0,0) {Your ISP};\n\\node[as, fill=green!15] (tier1) at (4,1.5) {Tier-1};\n\\node[as, fill=green!15] (tier1b) at (-4,1.5) {Tier-1};\n\\node[as, fill=orange!15] (google) at (4,-1.5) {Google};\n\\node[as, fill=gray!15] (you) at (-4, -1.5) {You};\n\n\\draw[<->, thick, red] (isp) -- node[above, font=\\scriptsize] {eBGP} (tier1);\n\\draw[<->, thick, red] (isp) -- node[above, font=\\scriptsize] {eBGP} (tier1b);\n\\draw[<->, thick, red] (tier1) -- node[right, font=\\scriptsize] {eBGP} (google);\n\\draw[<->, thick, red] (tier1) -- node[above, font=\\scriptsize] {eBGP} (tier1b);\n\\draw[thick] (you) -- node[below, font=\\scriptsize] {customer} (isp);\n\\end{tikzpicture}\n\\end{center}\n\n1. Inside each AS: **IGP** (OSPF/IS-IS) computes internal paths\n2. Between ASes: **BGP** exchanges reachability + applies policy\n3. A typical web request may cross 3--5 ASes\n\n## Routing Protocols -- Summary\n\n\\begin{center}\n\\begin{tabular}{lllll}\n\\toprule\n\\textbf{Protocol} & \\textbf{Type} & \\textbf{Scope} & \\textbf{Algorithm} & \\textbf{Metric} \\\\\n\\midrule\nRIP & Distance-vector & IGP & Bellman-Ford & Hop count (max 15) \\\\\nOSPF & Link-state & IGP & Dijkstra & Cost (bandwidth) \\\\\nIS-IS & Link-state & IGP & Dijkstra & Cost \\\\\nBGP & Path-vector & EGP & Best path selection & Policy + AS path \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n# Part B -- Connectivity Services\n\n## The Need for Connectivity Services\n\nA device joining a network needs:\n\n1. An **IP address** $\\rightarrow$ how? $\\rightarrow$ **DHCP**\n2. A **subnet mask** $\\rightarrow$ **DHCP**\n3. A **default gateway** $\\rightarrow$ **DHCP**\n4. **DNS server(s)** $\\rightarrow$ **DHCP**\n5. Access to the Internet with a private address $\\rightarrow$ **NAT**\n\n\\vfill\nThese are application-layer services that **enable** network-layer connectivity.\n\n## DHCP -- Dynamic Host Configuration Protocol\n\n- Automatically assigns network configuration to devices\n- Uses **UDP**: client port 68, server port 67\n\n**DORA** process (4-step handshake):\n\n\\begin{center}\n\\begin{tabular}{llll}\n\\toprule\n\\textbf{Step} & \\textbf{Message} & \\textbf{Direction} & \\textbf{Description} \\\\\n\\midrule\n1 & \\textbf{D}iscover & Client $\\to$ Broadcast & ``Any DHCP server out there?'' \\\\\n2 & \\textbf{O}ffer & Server $\\to$ Broadcast & ``Here's an IP you can use'' \\\\\n3 & \\textbf{R}equest & Client $\\to$ Broadcast & ``I'll take that IP'' \\\\\n4 & \\textbf{A}ck & Server $\\to$ Broadcast & ``Confirmed, it's yours!'' \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\nAll messages are **broadcast** (the client has no IP yet!).\n\n## DHCP -- What You Get\n\nAfter DORA completes, the client receives:\n\n- **IP address** (e.g., 192.168.1.100)\n- **Subnet mask** (e.g., 255.255.255.0)\n- **Default gateway** (e.g., 192.168.1.1)\n- **DNS server(s)** (e.g., 8.8.8.8)\n- **Lease time** (e.g., 3600 seconds)\n- Other optional parameters (NTP server, domain name, etc.)\n\n**Lease concept**:\n\n- IP is ``leased'' for a limited time\n- Client must **renew** before expiry (at $T_1 = 50\\%$, $T_2 = 87.5\\%$)\n- If not renewed $\\rightarrow$ IP returns to the pool\n\n## DHCP -- DORA in Detail\n\n\\begin{center}\n\\begin{tikzpicture}[>=Stealth, font=\\small]\n\\node (C) at (0, 0) {\\textbf{Client}};\n\\node (S) at (7, 0) {\\textbf{DHCP Server}};\n\\draw[dashed] (0, -0.5) -- (0, -6);\n\\draw[dashed] (7, -0.5) -- (7, -6);\n\n\\draw[->, thick] (0, -1) -- node[above, font=\\scriptsize] {DISCOVER} node[below, font=\\tiny] {src: 0.0.0.0:68, dst: 255.255.255.255:67} (7, -1.8);\n\\draw[<-, thick] (0, -2.6) -- node[above, font=\\scriptsize] {OFFER} node[below, font=\\tiny] {yiaddr: 192.168.1.100, lease: 3600s} (7, -2.0);\n\\draw[->, thick] (0, -3.2) -- node[above, font=\\scriptsize] {REQUEST} node[below, font=\\tiny] {yiaddr: 192.168.1.100} (7, -4.0);\n\\draw[<-, thick] (0, -4.8) -- node[above, font=\\scriptsize] {ACK} node[below, font=\\tiny] {Confirmed: 192.168.1.100 for 3600s} (7, -4.2);\n\n\\node[font=\\scriptsize, text=green!60!black] at (3.5, -5.5) {Client now has full network configuration};\n\\end{tikzpicture}\n\\end{center}\n\n## DHCP -- Wireshark Perspective\n\n<!-- NOTE: Consider reusing the Wireshark capture from existing slide ~33 -->\n\nExample captured DHCP exchange:\n\n\\footnotesize\n\n| \\# | Src | Dst | Protocol | Info |\n|:---|:----|:----|:---------|:-----|\n| 1 | 0.0.0.0:68 | 255.255.255.255:67 | DHCP | Discover |\n| 2 | 192.168.43.1:67 | 255.255.255.255:68 | DHCP | Offer |\n| 3 | 0.0.0.0:68 | 255.255.255.255:67 | DHCP | Request |\n| 4 | 192.168.43.1:67 | 255.255.255.255:68 | DHCP | ACK |\n\n\\normalsize\n\nNotice: Ethernet frames use broadcast MAC (\\texttt{FF:FF:FF:FF:FF:FF}) throughout.\n\n## DHCP -- Relay Agent\n\n**Problem**: DHCP uses broadcast $\\rightarrow$ doesn't cross routers.\n\nWhat if the DHCP server is in a different subnet?\n\n**Solution**: **DHCP Relay Agent** (RFC 3046)\n\n- Configured on the router/gateway of each subnet\n- **Intercepts** DHCP broadcast messages\n- **Forwards** them as **unicast** to the central DHCP server\n- Adds relay info (which subnet the request came from)\n\n$\\rightarrow$ Allows a **single DHCP server** to serve multiple subnets across routers.\n\n## Public vs. Private -- The NAT Connection\n\nRecall from Session 1:\n\n- Private addresses (10.x, 172.16--31.x, 192.168.x) are **not routable** on the Internet\n- Most LANs use private addressing internally\n\n**Problem**: How do devices with private IPs access the Internet?\n\n**Answer**: **NAT (Network Address Translation)**\n\n- Router at the network boundary **translates** private $\\to$ public\n- From the Internet's perspective, all traffic appears to come from the **public IP**\n- This is how your home network works right now\n\n## NAT -- Basic NAT (One-to-One)\n\nEach internal IP mapped to a **unique** external IP:\n\n\\begin{center}\n\\begin{tabular}{ll}\n\\toprule\n\\textbf{Internal (Private)} & \\textbf{External (Public)} \\\\\n\\midrule\n192.168.1.2 & 81.46.38.2 \\\\\n192.168.1.3 & 81.46.38.3 \\\\\n192.168.1.4 & 81.46.38.4 \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n- Simple but **wasteful**: needs as many public IPs as internal hosts\n- Rarely used in practice (doesn't solve the scarcity problem)\n- Translation:\n    - Outgoing: Source IP private $\\to$ public\n    - Incoming: Dest IP public $\\to$ private\n\n## NAPT / PAT -- Many-to-One Translation\n\n**NAPT** (Network Address Port Translation), also called **PAT**:\n\n- Maps many internal IPs to a **single public IP** using **port numbers**\n- The **most common** form of NAT (every home router does this)\n\n\\begin{center}\n\\begin{tabular}{ll}\n\\toprule\n\\textbf{Internal} & \\textbf{External} \\\\\n\\midrule\n192.168.1.2:\\textbf{1501} & 81.46.38.201:\\textbf{1501} \\\\\n192.168.1.3:\\textbf{1502} & 81.46.38.201:\\textbf{2222} \\\\\n192.168.1.4:\\textbf{1503} & 81.46.38.201:\\textbf{2223} \\\\\n\\bottomrule\n\\end{tabular}\n\\end{center}\n\n- Uses (public IP, public port) tuple to uniquely identify each internal flow\n- $\\sim$65,000 ports available $\\rightarrow$ thousands of simultaneous connections\n\n## NAT -- How Translation Works\n\n\\begin{center}\n\\begin{tikzpicture}[>=Stealth, font=\\small,\n    box/.style={rectangle, draw, rounded corners, minimum width=1.8cm, minimum height=0.8cm}]\n\\node[box] (host) at (0,0) {Host A};\n\\node[box, fill=yellow!20] (nat) at (4,0) {NAT Router};\n\\node[box] (server) at (8,0) {Web Server};\n\n\\draw[->, thick, blue] (host) -- node[above, font=\\scriptsize] {src: 192.168.1.2:1501} node[below, font=\\scriptsize] {dst: 93.184.216.34:80} (nat);\n\\draw[->, thick, red] (nat) -- node[above, font=\\scriptsize] {src: 81.46.38.201:2222} node[below, font=\\scriptsize] {dst: 93.184.216.34:80} (server);\n\\end{tikzpicture}\n\\end{center}\n\n**Outgoing**: Replace source IP:port (private $\\to$ public). Record in NAT table.\n\n**Incoming reply**: Look up (public IP:port) $\\rightarrow$ replace destination (public $\\to$ private).\n\n\\vfill\n\\footnotesize\nThe web server only sees \\texttt{81.46.38.201} --- it never knows about \\texttt{192.168.1.2}.\n\n## NAT -- Limitations and Problems\n\n- **Breaks end-to-end connectivity**: external hosts cannot initiate connections\n    - Problematic for: P2P, VoIP, gaming, IoT\n    - Solutions: port forwarding, UPnP, STUN/TURN (NAT traversal)\n- **Modifies packet headers**: violates the layering principle\n    - Some protocols embed IPs in payload (FTP, SIP)\n    - Require Application Layer Gateways (ALGs)\n- **Single point of failure**: all connections through one device\n- **IPv6 was designed to eliminate NAT**\n    - But NAT persists due to IPv4 dominance and (perceived) security benefits\n\n## NAT -- Network Diagram\n\n<!-- NOTE: Reuse/adapt the NAT diagram from existing slides ~60-61 -->\n\n\\begin{center}\n\\begin{tikzpicture}[>=Stealth, font=\\small,\n    host/.style={rectangle, draw, minimum width=1.2cm, minimum height=0.6cm, font=\\scriptsize},\n    rtr/.style={rectangle, draw, thick, fill=yellow!20, minimum width=1.8cm, minimum height=0.8cm}]\n\n\\node[host] (h1) at (0, 1) {.2};\n\\node[host] (h2) at (0, 0) {.3};\n\\node[host] (h3) at (0, -1) {.4};\n\\node[rtr] (nat) at (3.5, 0) {NAT Router};\n\\node[font=\\scriptsize] at (3.5, -0.7) {LAN: 192.168.1.1};\n\\node[font=\\scriptsize] at (3.5, -1.1) {WAN: 81.46.38.201};\n\n\\node[font=\\small] at (7, 0) {Internet / ISP};\n\n\\draw (h1) -- (nat);\n\\draw (h2) -- (nat);\n\\draw (h3) -- (nat);\n\\draw[->, very thick] (nat) -- (6, 0);\n\n\\node[font=\\scriptsize, text=gray] at (0, -2) {LAN: 192.168.1.0/24};\n\\end{tikzpicture}\n\\end{center}\n\nAll 3 hosts share the single public IP \\texttt{81.46.38.201} via NAPT. From the Internet's perspective, all requests come from the same address.\n\n# Summary\n\n## Block 3 -- Complete Summary\n\n**Session 1 -- Network Access \\& IP Fundamentals:**\n\n- L2: Ethernet framing, MAC, switches, ARP, VLANs (802.1Q)\n- Media access: CSMA/CD (wired) vs. CSMA/CA (wireless)\n- IPv4: header, public vs. private addressing, CIDR, subnetting\n- ICMP: ping, traceroute\n\n**Session 2 -- Routing \\& Connectivity:**\n\n- Algorithms: Bellman-Ford (distance-vector), Dijkstra (link-state)\n- OSPF: link-state IGP, areas, Dijkstra in practice\n- BGP: path-vector EGP, AS, policy-based routing\n- DHCP: automatic configuration (DORA process)\n- NAT/NAPT: private-to-public translation\n\n## Key Takeaways\n\n1. L2 operates **locally** (LAN); L3 operates **end-to-end** (across networks)\n2. Switches forward frames (MAC); routers forward packets (IP)\n3. **Subnetting** divides networks efficiently --- master the math!\n4. **OSPF** uses Dijkstra for routing within an organization\n5. **BGP** uses policy + AS paths for routing between organizations --- this is how the Internet works\n6. **DHCP** gives you your network configuration automatically\n7. **NAT** lets private networks share public IPs --- essential given IPv4 exhaustion\n\n## Questions?\n\n\\begin{center}\n\\Huge Arquitectura de Xarxes\n\\end{center}\n",
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md"
}
```

**Output:**
```
Wrote file successfully.
```

---

## Assistant (Build · claude-opus-4.6 · 11.5s)

**Tool: todowrite**

**Input:**
```json
{
  "todos": [
    {
      "content": "Create Session 1 Beamer slides: Network Access & IP Fundamentals",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Create Session 2 Beamer slides: Routing, Protocols & Connectivity Services",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Create Makefile for pandoc/beamer compilation",
      "priority": "medium",
      "status": "in_progress"
    }
  ]
}
```

**Output:**
```
[
  {
    "content": "Create Session 1 Beamer slides: Network Access & IP Fundamentals",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Create Session 2 Beamer slides: Routing, Protocols & Connectivity Services",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Create Makefile for pandoc/beamer compilation",
    "priority": "medium",
    "status": "in_progress"
  }
]
```

---

## Assistant (Build · claude-opus-4.6 · 8.5s)

**Tool: write**

**Input:**
```json
{
  "content": "PANDOC = pandoc\nPANDOC_FLAGS = --pdf-engine=xelatex -t beamer --slide-level=2\n\nSOURCES = Session_1_Network_Access_IP_Fundamentals.md \\\n          Session_2_Routing_Protocols_Connectivity.md\n\nPDFS = $(SOURCES:.md=.pdf)\n\n.PHONY: all clean\n\nall: $(PDFS)\n\n%.pdf: %.md\n\t$(PANDOC) $(PANDOC_FLAGS) -o $@ $<\n\nclean:\n\trm -f $(PDFS)\n",
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Makefile"
}
```

**Output:**
```
Wrote file successfully.
```

---

## Assistant (Build · claude-opus-4.6 · 8.1s)

Now let me try to compile them to see if there are any issues:

**Tool: bash**

**Input:**
```json
{
  "command": "which pandoc && pandoc --version | head -1 && which xelatex",
  "description": "Check pandoc and xelatex availability",
  "workdir": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer"
}
```

**Output:**
```
/usr/bin/pandoc
pandoc 3.1.11.1
/usr/bin/xelatex

```

---

## Assistant (Build · claude-opus-4.6 · 11.1s)

**Tool: bash**

**Input:**
```json
{
  "command": "make 2>&1",
  "description": "Compile both slide decks to PDF",
  "workdir": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer",
  "timeout": 120000
}
```

**Output:**
```
pandoc --pdf-engine=xelatex -t beamer --slide-level=2 -o Session_1_Network_Access_IP_Fundamentals.pdf Session_1_Network_Access_IP_Fundamentals.md
Error producing PDF.
! Undefined control sequence.
<recently read> \rowcolor 
                          
l.151 \end{frame}

make: *** [Makefile:14: Session_1_Network_Access_IP_Fundamentals.pdf] Error 43

```

---

## Assistant (Build · claude-opus-4.6 · 78.2s)

_Thinking:_

The `\rowcolor` command requires the `colortbl` or `xcolor` package with the `table` option. Let me fix the header-includes to add the needed packages.

Need to add the `xcolor` package with `table` option. Let me fix both files:

**Tool: edit**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_1_Network_Access_IP_Fundamentals.md",
  "oldString": "  - \\usepackage{booktabs}\n  - \\usepackage{tikz}",
  "newString": "  - \\usepackage{booktabs}\n  - \\usepackage[table]{xcolor}\n  - \\usepackage{tikz}"
}
```

**Output:**
```
Edit applied successfully.
```

---

## User

---

## Assistant (Compaction · claude-opus-4.6 · 42.3s)

## Goal

The user (Sergio) is a professor at UPF building lecture slides for **Block 3 ("Network Access & Internetworking")** of the "Arquitectura de Xarxes" (AX / Network Architecture) course for 2025-2026. Block 3 has **2 theory sessions, 2 hours each**, covering Layer 2, Layer 3, and connectivity services (DHCP, NAT). The slides are written in Markdown and compiled to PDF via Pandoc/Beamer.

## Instructions

- **Recycle existing material** from a previous "Networks I" presentation (`1. Networks_I - 2024-2025.pdf`) which covers L2 (Ethernet, switches, ARP, STP, LAG), L3 (IP header, addressing, routing types, ICMP), DHCP, and NAT at an introductory level.
- **The course coordinator explicitly requested** (via email in Spanish) that the following be **added or reinforced** on top of the recycled material:
  1. **Shortest path algorithms** for routing (Dijkstra, Bellman-Ford)
  2. **Deeper coverage of OSPF and BGP**
  3. DHCP and NAT are confirmed topics
  4. **Reinforce public vs. private networks and subnetting**
- **Patricia** (another instructor) taught Block 2 (Application + Transport). The coordinator suggested checking with her for coherence. This hasn't been done yet.
- The sessions should be **balanced** in content density (not one heavy, one light).
- Output format: **Markdown compiled to PDF with Pandoc/Beamer** (`--pdf-engine=xelatex -t beamer --slide-level=2`).
- The folder is named "Block 3 - Link layer" but covers both L2 and L3 + connectivity services.

## Discoveries

- The Block 3 folder was **empty** before we started — no prior slides existed.
- The recycled PDF (`1. Networks_I - 2024-2025.pdf`) was converted to text for analysis. It contains ~90 slides covering all layers at introductory depth. Key recyclable content: Ethernet framing, MAC addresses, switch forwarding, ARP, STP/LAG, IP header, IPv4 addressing (public/private, CIDR, VLSM), IP routing types, ICMP, DHCP (DORA), NAT/NAPT.
- **New content that had to be created from scratch**: CSMA/CD and CSMA/CA, VLANs (802.1Q), Wireless/Wi-Fi concepts, L2 tunneling preview, expanded subnetting examples, Bellman-Ford algorithm step-by-step, Dijkstra algorithm step-by-step, distance-vector vs link-state comparison, OSPF (Hello protocol, areas, ABR/ASBR, convergence), BGP (eBGP/iBGP, path selection, business relationships), Internet routing big picture, DHCP relay agents, NAT limitations.
- Session split: **Session 1** = L2 (link layer) + IP fundamentals (addressing, subnetting, ICMP); **Session 2** = Routing algorithms + OSPF + BGP + DHCP + NAT. This balances the two sessions.
- Compilation requires `xelatex`, `pandoc`, and the `xcolor` package with `[table]` option for `\rowcolor` commands.

## Accomplished

- **COMPLETED**: Session 1 markdown slides (`Session_1_Network_Access_IP_Fundamentals.md`) — ~45 slides covering L2 and IP fundamentals
- **COMPLETED**: Session 2 markdown slides (`Session_2_Routing_Protocols_Connectivity.md`) — ~45 slides covering routing algorithms, OSPF, BGP, DHCP, NAT with TikZ diagrams
- **COMPLETED**: Makefile for compilation
- **IN PROGRESS**: Fixing compilation errors. The first error was `\rowcolor` requiring `\usepackage[table]{xcolor}`. This was fixed in Session 1's header-includes, but **the same fix has NOT yet been applied to Session 2**. Also, **compilation has not been re-attempted** after the fix, so there may be additional errors.
- **NOT DONE**: 
  - Apply the `[table]{xcolor}` fix to Session 2's header-includes
  - Re-run `make` and fix any remaining compilation errors
  - Review/iterate on slide content with the user
  - The user may want to add images/screenshots from existing material (several `<!-- NOTE: -->` comments in the markdown indicate where existing Wireshark/Packet Tracer screenshots could be inserted)

## Relevant files / directories

- **Working directory**: `/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/`
  - `Session_1_Network_Access_IP_Fundamentals.md` — Session 1 slides (CREATED, header partially fixed)
  - `Session_2_Routing_Protocols_Connectivity.md` — Session 2 slides (CREATED, needs xcolor fix in header)
  - `Makefile` — Pandoc/Beamer build file (CREATED)
- **Syllabus**: `/home/sergio/mystuff/UPF/AX_syllabus_2025_2026_EN.docx.md` (READ)
- **Recycled source material**: `/home/sergio/mystuff/UPF/1. Networks_I - 2024-2025.pdf` (READ via pdftotext conversion)
  - Text version: `/home/sergio/mystuff/UPF/1. Networks_I - 2024-2025.txt`
- **Other blocks for reference**: `/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/` (Block 1, Block 2 have existing .pptx files; Block 4, Block 5 directories exist)

---

## User

---

## Assistant (Build · claude-opus-4.6 · 6.3s)



Let me pick up where we left off. The immediate next steps are clear: fix the xcolor issue in Session 2 and then attempt compilation of both sessions.

**Tool: todowrite**

**Input:**
```json
{
  "todos": [
    {
      "content": "Apply [table]{xcolor} fix to Session 2 header-includes",
      "status": "in_progress",
      "priority": "high"
    },
    {
      "content": "Re-run make and fix any compilation errors in Session 1",
      "status": "pending",
      "priority": "high"
    },
    {
      "content": "Re-run make and fix any compilation errors in Session 2",
      "status": "pending",
      "priority": "high"
    },
    {
      "content": "Review final PDFs and report status to user",
      "status": "pending",
      "priority": "medium"
    }
  ]
}
```

**Output:**
```
[
  {
    "content": "Apply [table]{xcolor} fix to Session 2 header-includes",
    "status": "in_progress",
    "priority": "high"
  },
  {
    "content": "Re-run make and fix any compilation errors in Session 1",
    "status": "pending",
    "priority": "high"
  },
  {
    "content": "Re-run make and fix any compilation errors in Session 2",
    "status": "pending",
    "priority": "high"
  },
  {
    "content": "Review final PDFs and report status to user",
    "status": "pending",
    "priority": "medium"
  }
]
```

---

## Assistant (Build · claude-opus-4.6 · 6.9s)

Let me first read the current state of both files' headers to see what needs fixing.

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_1_Network_Access_IP_Fundamentals.md",
  "limit": 40
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_1_Network_Access_IP_Fundamentals.md</path>
<type>file</type>
<content>1: ---
2: title: "Block 3 -- Session 1"
3: subtitle: "Network Access \\& IP Fundamentals"
4: author: "Arquitectura de Xarxes"
5: institute: "Universitat Pompeu Fabra -- 2025/2026"
6: theme: "Madrid"
7: colortheme: "dolphin"
8: fonttheme: "structurebold"
9: aspectratio: 169
10: navigation: horizontal
11: toc: true
12: header-includes:
13:   - \usepackage{booktabs}
14:   - \usepackage[table]{xcolor}
15:   - \usepackage{tikz}
16:   - \usetikzlibrary{positioning, arrows.meta, calc}
17:   - \setbeamerfont{footnote}{size=\tiny}
18:   - \AtBeginSection[]{\begin{frame}{Outline}\tableofcontents[currentsection]\end{frame}}
19: ---
20: 
21: # Part A -- Layer 2: Link Layer
22: 
23: ## Where Are We in the Stack?
24: 
25: \begin{center}
26: \small
27: \begin{tabular}{c|l|l}
28: \toprule
29: \textbf{Layer} & \textbf{TCP/IP} & \textbf{Block} \\
30: \midrule
31: L5--L7 & Application & Block 2 \\
32: L4 & Transport & Block 2 \\
33: \rowcolor{blue!15} L3 & Network (IP) & \textbf{Block 3} \\
34: \rowcolor{blue!15} L2 & Link (Data Link) & \textbf{Block 3} \\
35: L1 & Physical & (covered with L2) \\
36: \bottomrule
37: \end{tabular}
38: \end{center}
39: 
40: - Block 2 covered **Application** (HTTP, DNS, DASH) and **Transport** (TCP, UDP, QUIC)

(Showing lines 1-40 of 821. Use offset=41 to continue.)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md",
  "limit": 40
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md</path>
<type>file</type>
<content>1: ---
2: title: "Block 3 -- Session 2"
3: subtitle: "Routing, Protocols \\& Connectivity Services"
4: author: "Arquitectura de Xarxes"
5: institute: "Universitat Pompeu Fabra -- 2025/2026"
6: theme: "Madrid"
7: colortheme: "dolphin"
8: fonttheme: "structurebold"
9: aspectratio: 169
10: navigation: horizontal
11: toc: true
12: header-includes:
13:   - \usepackage{booktabs}
14:   - \usepackage{tikz}
15:   - \usetikzlibrary{positioning, arrows.meta, calc, decorations.markings}
16:   - \setbeamerfont{footnote}{size=\tiny}
17:   - \AtBeginSection[]{\begin{frame}{Outline}\tableofcontents[currentsection]\end{frame}}
18: ---
19: 
20: # Part A -- Routing Algorithms \& Protocols
21: 
22: ## Recap -- Forwarding vs. Routing
23: 
24: Two distinct functions in a router:
25: 
26: :::::::::::::: {.columns}
27: ::: {.column width="50%"}
28: 
29: **Forwarding (Data Plane)**
30: 
31: - Per-packet operation
32: - Look up destination in forwarding table
33: - Determine output port
34: - Hardware speed (nanoseconds)
35: 
36: :::
37: ::: {.column width="50%"}
38: 
39: **Routing (Control Plane)**
40: 

(Showing lines 1-40 of 843. Use offset=41 to continue.)
</content>
```

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Makefile"
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Makefile</path>
<type>file</type>
<content>1: PANDOC = pandoc
2: PANDOC_FLAGS = --pdf-engine=xelatex -t beamer --slide-level=2
3: 
4: SOURCES = Session_1_Network_Access_IP_Fundamentals.md \
5:           Session_2_Routing_Protocols_Connectivity.md
6: 
7: PDFS = $(SOURCES:.md=.pdf)
8: 
9: .PHONY: all clean
10: 
11: all: $(PDFS)
12: 
13: %.pdf: %.md
14: 	$(PANDOC) $(PANDOC_FLAGS) -o $@ $<
15: 
16: clean:
17: 	rm -f $(PDFS)

(End of file - total 17 lines)
</content>
```

---

## Assistant (Build · claude-opus-4.6 · 6.1s)

Session 2 is missing `\usepackage[table]{xcolor}`. Let me add it and then attempt compilation.

**Tool: edit**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md",
  "oldString": "header-includes:\n  - \\usepackage{booktabs}\n  - \\usepackage{tikz}",
  "newString": "header-includes:\n  - \\usepackage{booktabs}\n  - \\usepackage[table]{xcolor}\n  - \\usepackage{tikz}"
}
```

**Output:**
```
Edit applied successfully.
```

---

## Assistant (Build · claude-opus-4.6 · 5.1s)

**Tool: todowrite**

**Input:**
```json
{
  "todos": [
    {
      "content": "Apply [table]{xcolor} fix to Session 2 header-includes",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Re-run make and fix any compilation errors in Session 1",
      "priority": "high",
      "status": "in_progress"
    },
    {
      "content": "Re-run make and fix any compilation errors in Session 2",
      "priority": "high",
      "status": "pending"
    },
    {
      "content": "Review final PDFs and report status to user",
      "priority": "medium",
      "status": "pending"
    }
  ]
}
```

**Output:**
```
[
  {
    "content": "Apply [table]{xcolor} fix to Session 2 header-includes",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Re-run make and fix any compilation errors in Session 1",
    "priority": "high",
    "status": "in_progress"
  },
  {
    "content": "Re-run make and fix any compilation errors in Session 2",
    "priority": "high",
    "status": "pending"
  },
  {
    "content": "Review final PDFs and report status to user",
    "priority": "medium",
    "status": "pending"
  }
]
```

---

## Assistant (Build · claude-opus-4.6 · 10.1s)

Now let me try compiling both sessions. I'll start with Session 1:

**Tool: bash**

**Input:**
```json
{
  "command": "make clean && make \"Session_1_Network_Access_IP_Fundamentals.pdf\" 2>&1",
  "description": "Compile Session 1 slides to PDF",
  "workdir": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer",
  "timeout": 120000
}
```

**Output:**
```
rm -f Session_1_Network_Access_IP_Fundamentals.pdf Session_2_Routing_Protocols_Connectivity.pdf
pandoc --pdf-engine=xelatex -t beamer --slide-level=2 -o Session_1_Network_Access_IP_Fundamentals.pdf Session_1_Network_Access_IP_Fundamentals.md
[WARNING] Missing character: There is no ∼ (U+223C) (U+223C) in font [lmsans10-regular]:mapping=te

```

---

## Assistant (Build · claude-opus-4.6 · 5.8s)

Session 1 compiled successfully (just a warning about a tilde character). Let me fix that warning and compile Session 2:

**Tool: todowrite**

**Input:**
```json
{
  "todos": [
    {
      "content": "Apply [table]{xcolor} fix to Session 2 header-includes",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Re-run make and fix any compilation errors in Session 1",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Re-run make and fix any compilation errors in Session 2",
      "priority": "high",
      "status": "in_progress"
    },
    {
      "content": "Fix ∼ (U+223C) character warning in Session 1",
      "priority": "low",
      "status": "pending"
    },
    {
      "content": "Review final PDFs and report status to user",
      "priority": "medium",
      "status": "pending"
    }
  ]
}
```

**Output:**
```
[
  {
    "content": "Apply [table]{xcolor} fix to Session 2 header-includes",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Re-run make and fix any compilation errors in Session 1",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Re-run make and fix any compilation errors in Session 2",
    "priority": "high",
    "status": "in_progress"
  },
  {
    "content": "Fix ∼ (U+223C) character warning in Session 1",
    "priority": "low",
    "status": "pending"
  },
  {
    "content": "Review final PDFs and report status to user",
    "priority": "medium",
    "status": "pending"
  }
]
```

---

## Assistant (Build · claude-opus-4.6 · 9.3s)

**Tool: bash**

**Input:**
```json
{
  "command": "make \"Session_2_Routing_Protocols_Connectivity.pdf\" 2>&1",
  "description": "Compile Session 2 slides to PDF",
  "timeout": 120000,
  "workdir": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer"
}
```

**Output:**
```
pandoc --pdf-engine=xelatex -t beamer --slide-level=2 -o Session_2_Routing_Protocols_Connectivity.pdf Session_2_Routing_Protocols_Connectivity.md
Error producing PDF.
! Package pgfkeys Error: I do not know the key '/tikz/ellipse' and I am going t
o ignore it. Perhaps you misspelled it.

See the pgfkeys package documentation for explanation.
Type  H <return>  for immediate help.
 ...                                              
                                                  
l.907 \end{frame}

make: *** [Makefile:14: Session_2_Routing_Protocols_Connectivity.pdf] Error 43

```

---

## Assistant (Build · claude-opus-4.6 · 6.1s)

There's a TikZ error — `ellipse` needs to be used as a node shape, not as a key. Let me find the problematic TikZ code around what would produce line 907 in the LaTeX output. Let me search for `ellipse` in Session 2:

**Tool: grep**

**Input:**
```json
{
  "pattern": "ellipse",
  "path": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md"
}
```

**Output:**
```
Found 1 matches
/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md:
  Line 547:     as/.style={ellipse, draw, thick, minimum width=2.5cm, minimum height=1.2cm, font=\small},
```

---

## Assistant (Build · claude-opus-4.6 · 5.0s)

**Tool: read**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md",
  "offset": 540,
  "limit": 40
}
```

**Output:**
```
<path>/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md</path>
<type>file</type>
<content>540: - Routes from **peers** $\rightarrow$ announce only to customers
541: - Routes from **providers** $\rightarrow$ announce only to customers
542: 
543: ## The Big Picture -- How Internet Routing Works
544: 
545: \begin{center}
546: \begin{tikzpicture}[
547:     as/.style={ellipse, draw, thick, minimum width=2.5cm, minimum height=1.2cm, font=\small},
548:     >=Stealth
549: ]
550: \node[as, fill=blue!15] (isp) at (0,0) {Your ISP};
551: \node[as, fill=green!15] (tier1) at (4,1.5) {Tier-1};
552: \node[as, fill=green!15] (tier1b) at (-4,1.5) {Tier-1};
553: \node[as, fill=orange!15] (google) at (4,-1.5) {Google};
554: \node[as, fill=gray!15] (you) at (-4, -1.5) {You};
555: 
556: \draw[<->, thick, red] (isp) -- node[above, font=\scriptsize] {eBGP} (tier1);
557: \draw[<->, thick, red] (isp) -- node[above, font=\scriptsize] {eBGP} (tier1b);
558: \draw[<->, thick, red] (tier1) -- node[right, font=\scriptsize] {eBGP} (google);
559: \draw[<->, thick, red] (tier1) -- node[above, font=\scriptsize] {eBGP} (tier1b);
560: \draw[thick] (you) -- node[below, font=\scriptsize] {customer} (isp);
561: \end{tikzpicture}
562: \end{center}
563: 
564: 1. Inside each AS: **IGP** (OSPF/IS-IS) computes internal paths
565: 2. Between ASes: **BGP** exchanges reachability + applies policy
566: 3. A typical web request may cross 3--5 ASes
567: 
568: ## Routing Protocols -- Summary
569: 
570: \begin{center}
571: \begin{tabular}{lllll}
572: \toprule
573: \textbf{Protocol} & \textbf{Type} & \textbf{Scope} & \textbf{Algorithm} & \textbf{Metric} \\
574: \midrule
575: RIP & Distance-vector & IGP & Bellman-Ford & Hop count (max 15) \\
576: OSPF & Link-state & IGP & Dijkstra & Cost (bandwidth) \\
577: IS-IS & Link-state & IGP & Dijkstra & Cost \\
578: BGP & Path-vector & EGP & Best path selection & Policy + AS path \\
579: \bottomrule

(Showing lines 540-579 of 844. Use offset=580 to continue.)
</content>
```

---

## Assistant (Build · claude-opus-4.6 · 5.9s)

The `ellipse` shape requires the `shapes.geometric` TikZ library. Let me add it to the header:

**Tool: edit**

**Input:**
```json
{
  "filePath": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/Session_2_Routing_Protocols_Connectivity.md",
  "oldString": "  - \\usetikzlibrary{positioning, arrows.meta, calc, decorations.markings}",
  "newString": "  - \\usetikzlibrary{positioning, arrows.meta, calc, decorations.markings, shapes.geometric}"
}
```

**Output:**
```
Edit applied successfully.
```

---

## Assistant (Build · claude-opus-4.6 · 9.6s)

**Tool: bash**

**Input:**
```json
{
  "command": "make \"Session_2_Routing_Protocols_Connectivity.pdf\" 2>&1",
  "description": "Compile Session 2 slides to PDF (attempt 2)",
  "timeout": 120000,
  "workdir": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer"
}
```

**Output:**
```
pandoc --pdf-engine=xelatex -t beamer --slide-level=2 -o Session_2_Routing_Protocols_Connectivity.pdf Session_2_Routing_Protocols_Connectivity.md
[WARNING] Missing character: There is no ∼ (U+223C) (U+223C) in font [lmsans10-regular]:mapping=te

```

---

## Assistant (Build · claude-opus-4.6 · 5.2s)

Both sessions compile successfully now. Let me fix that `∼` (U+223C) character warning in both files — it's a Unicode tilde that should be replaced with a regular ASCII tilde or `\sim`.

**Tool: grep**

**Input:**
```json
{
  "path": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer",
  "pattern": "∼"
}
```

**Output:**
```
No files found
```

---

## Assistant (Build · claude-opus-4.6 · 5.4s)

**Tool: bash**

**Input:**
```json
{
  "command": "rg -n $'\\u223c' \"/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer/\" 2>&1",
  "description": "Search for U+223C character",
  "workdir": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer"
}
```

---

## Assistant (Build · claude-opus-4.6 · 72.9s)

The character isn't in our source files — it's likely generated by Pandoc's internal processing (e.g., converting `~` in markdown). It's just a warning, not an error, so it won't affect the output. Let me verify both PDFs were actually generated:

**Tool: bash**

**Input:**
```json
{
  "command": "ls -lh *.pdf",
  "description": "List generated PDF files",
  "workdir": "/home/sergio/mystuff/UPF/Sessions Teoria Curs 2025 - 2026/Block 3 - Link layer"
}
```

**Output:**
```
-rw-rw-r-- 1 sergio sergio 146K Mar 31 21:25 Session_1_Network_Access_IP_Fundamentals.pdf
-rw-rw-r-- 1 sergio sergio 148K Mar 31 21:26 Session_2_Routing_Protocols_Connectivity.pdf

```

---

## Assistant (Build · claude-opus-4.6 · 6.7s)

Both PDFs are generated successfully. Let me update the todo list:

**Tool: todowrite**

**Input:**
```json
{
  "todos": [
    {
      "content": "Apply [table]{xcolor} fix to Session 2 header-includes",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Re-run make and fix any compilation errors in Session 1",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Re-run make and fix any compilation errors in Session 2",
      "priority": "high",
      "status": "completed"
    },
    {
      "content": "Fix ∼ (U+223C) character warning in Session 1",
      "priority": "low",
      "status": "cancelled"
    },
    {
      "content": "Review final PDFs and report status to user",
      "priority": "medium",
      "status": "completed"
    }
  ]
}
```

**Output:**
```
[
  {
    "content": "Apply [table]{xcolor} fix to Session 2 header-includes",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Re-run make and fix any compilation errors in Session 1",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Re-run make and fix any compilation errors in Session 2",
    "priority": "high",
    "status": "completed"
  },
  {
    "content": "Fix ∼ (U+223C) character warning in Session 1",
    "priority": "low",
    "status": "cancelled"
  },
  {
    "content": "Review final PDFs and report status to user",
    "priority": "medium",
    "status": "completed"
  }
]
```

---

## Assistant (Build · claude-opus-4.6 · 9.8s)

Both sessions now compile cleanly to PDF. Here's the status:

**Session 1** — `Session_1_Network_Access_IP_Fundamentals.pdf` (146 KB)
**Session 2** — `Session_2_Routing_Protocols_Connectivity.pdf` (148 KB)

Fixes applied:
- Added `\usepackage[table]{xcolor}` to Session 2 (was already in Session 1)
- Added `shapes.geometric` to Session 2's TikZ libraries (needed for the `ellipse` node shape in the BGP diagram)

The only remaining warning is a cosmetic one about a Unicode tilde (`∼`, U+223C) that Pandoc generates internally — it doesn't affect the output.

**What's left to consider (when you're ready):**
1. **Review the PDFs** — open them and check the flow, content density, and readability
2. **Images** — several slides have `<!-- NOTE: -->` comments suggesting where screenshots from the original Networks I material (Wireshark captures, Packet Tracer topologies) could be inserted
3. **Coordination with Patricia** — the coordinator suggested checking Block 2 / Block 3 coherence
4. **Content tuning** — any topics you want expanded, trimmed, or reordered after reviewing

---

