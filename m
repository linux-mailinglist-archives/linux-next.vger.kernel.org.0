Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF76370488
	for <lists+linux-next@lfdr.de>; Sat,  1 May 2021 02:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhEAAuq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Apr 2021 20:50:46 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:40768 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhEAAup (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Apr 2021 20:50:45 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1410YkE1053337;
        Sat, 1 May 2021 00:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=wWcoohk0CZ1b0cMLSzu1Ms9p1PwydXB4GFH4vcv5exk=;
 b=Suxq7GZ/KVmcytb5KIqxLChmibnIu0AX0UncLnmDm2jlN69vz3q1XnMh9uHAgKxqp09m
 dFHN8leKIYdIvuZzaQUAkgzbpfRqZhRfnEZdbuS5YmDP4RYJojljcuWGVbzSu6mSiKEK
 Iw/noY194tMVrsgJoil9Zte+yDDbtrI+viz5wYzpgr4EzkKctdu00yRoaIn3w9TspvLh
 JWCwjJ+FMbPPSch+Cla4eh2tQr9OH5BR0H3WADmGYiP7VAUB8IFJ6rgmM322WgqktS84
 YmOkR8NJkV0KIrRKNXlMCdXgB8kXWtNd2y47GgnejOmnUhGrVQRqQd5ueOjahBQUSZtF Iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 385ahc19b0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 01 May 2021 00:49:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1410U0BC002165;
        Sat, 1 May 2021 00:49:39 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2055.outbound.protection.outlook.com [104.47.37.55])
        by aserp3020.oracle.com with ESMTP id 388s417pw1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 01 May 2021 00:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4iM59ZYP2xMOQibWVXSdbHnPl3QvoIfOWeW6CLMnvDTO5/78EY4wNe0XXDG5nT0RQdfepesFrbH17TO6RTMfDhTPp3BDeatk3z4MnAGuSre19ELFub1tck1KuFKXAQus+9ubhKdbIuWSsAKhL3pgv+xXfU/QsLQqIILEXfFbOJ7mGX54RdTax2j2gh18byJe94EDDCEb3RIqZJCgzmdYjo5nXf/pSRQ3vsciBN2r7RLqC1zOXOHwoCKFDHdTyoFZeFKTfXMvskHyTl92HQ0mM7llenjOVi+G9bC61rIBJqnW3Cr0SCBmizzBgW1lgqhIHl/EkSyB+VgX5o0rSR0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWcoohk0CZ1b0cMLSzu1Ms9p1PwydXB4GFH4vcv5exk=;
 b=SHNrt7WcvvwuA63afsVFVuYb68uzX37QnDdAVC/A9LjVm2mcpFr+q+e7XSmxWNQlOBJ9j/vgMAxLDaLeoBwO1mo3cywA3vTdmz1MiLoTebiv+Ij4kb7pPqeFjqidUOUXFvu7sd17IsYkYO74wPRI+G1sc9+p6a44TKgMIIn1/ti3KBbGszP+wvGiQLSaokpxgTiPcYjdr0zpgXRBgS97Z+hk91QBKgQKKwHmxl4uOjjdoOusasPL0IZatbRdvkry7Vd/FAKLR7XMTp9HBrFNan3Pi7VRBjnwZCD6f0Bjg4wz7T3Rllwsk1m0Q7HmjEILx6MXaWLlXTuzXbB8ZPi6Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWcoohk0CZ1b0cMLSzu1Ms9p1PwydXB4GFH4vcv5exk=;
 b=QdJm/9s2PoYfM3k6k4xlcLYD5WLog+nQmwvo6MVsIqCIcDROkZFXm+0ORh+47J3pPC2ajNYH5DkLVTuXOfv/VeIXh6fp+JZ8YcAiQp9IYitu8ENqAq9zC12L2ZXngl46/bm6OchCaUHLK6SSmVMutfx35jlAM528E45Casre4HE=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BY5PR10MB4275.namprd10.prod.outlook.com (2603:10b6:a03:210::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Sat, 1 May
 2021 00:49:37 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::50bf:7319:321c:96c9]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::50bf:7319:321c:96c9%4]) with mapi id 15.20.4087.035; Sat, 1 May 2021
 00:49:37 +0000
From:   Chuck Lever III <chuck.lever@oracle.com>
To:     Trond Myklebust <trondmy@hammerspace.com>
CC:     "keescook@chromium.org" <keescook@chromium.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "gustavo@embeddedor.com" <gustavo@embeddedor.com>
Subject: Re: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Topic: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Index: AQHXPe5P1KlTurzIc0qj5wtiLqlNpqrNZhsAgAAGpACAABGcAIAARyUAgAAGXCA=
Date:   Sat, 1 May 2021 00:49:37 +0000
Message-ID: <36F7576D-D332-47A7-8714-0C49F87594B6@oracle.com>
References: <202104301126.5A1D9706E@keescook>
         <B431253D-E874-45BA-9303-79C7FA950D1B@oracle.com>
         <08aa80f9bfeb1b48daf804aa2903d6217e599fa4.camel@hammerspace.com>
         <84662251-DF84-4827-9D89-293BB2340433@oracle.com>,<8724e5cb46c9cbc97d3f5bef19aadd50ea8210a5.camel@hammerspace.com>
In-Reply-To: <8724e5cb46c9cbc97d3f5bef19aadd50ea8210a5.camel@hammerspace.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [68.61.232.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 659394ab-ca2d-49f2-9ca0-08d90c3aff00
x-ms-traffictypediagnostic: BY5PR10MB4275:
x-microsoft-antispam-prvs: <BY5PR10MB4275A6688126FAF3DC445C39935D9@BY5PR10MB4275.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AiGOGTyvAJkLrOON4cBrxJ5+zWnwimWUTQZeZ/pOYwB9O/Qd3dHhFkNmLtyhhifIW45LVnnJCDNQuBqzUD3lp9aAm/ZyU8UAQN0pqS74moEyXKc2j+Rut6kOdPI7X3YklHX2x83ys6/vlHfAATpxG9hijL4zT+q2lab0T71hvqncqsgeVE1Lj+KBRh3BjLuu5JBAHjZ/3fZoOxQJpUnm744LmonbsUO105aq68ITpOqZfycD4ZX/UzZJ5x0rimEUc8cAYE5V9XqtSRmrp6XIE2PL3fbq7Jv/HaXwE/W8aobJHS2Fgx/2EFeSUlar7fBMX1TOK5UpimJWRNeOfR+tAOGs8V6AU+TxYnQM2aUhOcCsDdVQxu+azbE2+Ffgm4ZBa5GUozX9NrslPqZPuqLfOkfDfFlO/48TTowr/Cc7SMwISC6muL8QRv6O5a6lK5WG+yaJUJENg4roihGS6Aqun+LIUE+8Ht6kJ5xSza2jyetZ0CJnk8hKWO5QZ3HNi6XalF71ILOfoj9p66N3l2Iyyu5GIVhQnNDjMzXBo2CH+0TMuN37KvVL7mAWLUuBo5Lg8gdJrhaEX/c0kDgvnmR9mkNOHmKInbnvaYEllM64XhMGP//UN0o8ulNwmpC+mWXnncaj5OXrM17QjcNEVqaiLYEoOI1Gvf2/P52hiTScZgH7+WYS3wPHcGf4V0IqhhMXejg6EmtxXM22Uuqy5TndFh9PpsZKcsDAD7W9QHrmhFc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB4688.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(376002)(136003)(346002)(396003)(6486002)(2616005)(478600001)(66946007)(38100700002)(186003)(36756003)(8936002)(4326008)(2906002)(6916009)(316002)(26005)(6512007)(91956017)(66446008)(83380400001)(76116006)(54906003)(6506007)(64756008)(66556008)(53546011)(966005)(5660300002)(86362001)(8676002)(33656002)(71200400001)(122000001)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QWZtK2QrbUFPU2RWa0lXQVNJQ0Myemk1STYrbVdKSzNUTTBFVElTRnVPY01R?=
 =?utf-8?B?dmp6NzRFVWRiVEl4QUJmakJVRmNZWlpyYk51Z0tEb20rNUlzRWVaeDloWUx5?=
 =?utf-8?B?SUhRNncvMC9xeUY1UnZzbkVvNVh0eEMrb0tOY3d4RGRqek10SzhOMzQ5c3dC?=
 =?utf-8?B?VEVtRDlVVEZmcE0xTEZqaGxHVjk1YmV0R05FTDkyYlRoMHF1c1dxOWx1WUJl?=
 =?utf-8?B?STE4RnZkbmVKVkNVTnltNDg1Mm9tdmQ1bFZvb2JaUG0vT3dtVVhxaGdYWjBl?=
 =?utf-8?B?Yk9Pd2M0T05LaEsrUmZzQ3ZKaURHblIvd2VMOTlDWGZ4NEtHNmNEaU9oTmlH?=
 =?utf-8?B?RXpYSmRrS2FVelBSelFuYXptdGtXVEl4K2w5Z1ZMRTVhVmM1RXNMOXpzRVdo?=
 =?utf-8?B?enpHbUJBL2dWUlE0Zk45aUJiV2E2aDdlZHpxUnY2TmtEakNEQTZoN2NMNHRF?=
 =?utf-8?B?QVd0MW1zYjgvV28wOGVEYXJBN0d3bGoxNkN2N1poejBhQVMwZFlXS2dJaTRj?=
 =?utf-8?B?SldUVG9RWi9xdWQzTzFFUGdDLzRnWWFzaW9zaUZvc1RCK1JPME1Kb3VjQVVK?=
 =?utf-8?B?RXg1VGtqZGh0QlVlSlAwM25Vald3Y2JkK1FIRXQ0N2FHcGVOOGhRZlBLaVdG?=
 =?utf-8?B?VFRvL3NjQVpzSUNGTFMzajcxcmo4MWJkRFhQeWp6YllXY254ZGxTTHJYRGZr?=
 =?utf-8?B?eHNDLzFYelp1bDNzUkVVZFpObURGZVdHUVBIQTZvZkRvRUhmMWpWNVBoZWNn?=
 =?utf-8?B?UHZlT3JMMEJyd21LZjZGa2thWENoNCtMbkRSb0JKT05FcGJkNEEydGw1cTZM?=
 =?utf-8?B?QkNLdUFPYzE3NmYyV3hBYW5SeE1UbEtOc0VPbHFGS08wSlY0eFlXVVR2WWRH?=
 =?utf-8?B?Z0VwbTBNV1V2djdZU2lmd0FZQ1hOMzVNWFdrbjNHS2VPTndndFVudWYrUGZn?=
 =?utf-8?B?eFlBZENiOXBsZmV5dHJHQzhVdm45WWFENGRPRFp1Tk5FTmdCZlIxZEZsZTYr?=
 =?utf-8?B?U1FFYUR0QlVsTTR6ZUtmajlMREd3bzBJVW52Wmk5RXhUWFVLb3k2SW9YM3g3?=
 =?utf-8?B?WU1wR2VhbW1Fd1RmeSsveXZ5dHdqbHR6WW5EWWxkZ2NSazlwbE9mZ28rMmxk?=
 =?utf-8?B?ZHUrUWthNlZTVHlIVFQ3cFJkK3A0UWZiUHYvQVo3Rk1TdFBPMDJPU2tBcWRv?=
 =?utf-8?B?QktQZE9KdW9rcVc4czVKQTJaMVBBUlJKNW5oWW9Db2FuR045cEdnRW5sbTc1?=
 =?utf-8?B?akFQMitxRS94czJwTWxhQy9UekZsQllOK2NQOUljRkQyWk5tbncyYktmZito?=
 =?utf-8?B?czF2SjNkUkpNU3RtZGFuVUFEcEUzR1lxaiswRXFWSVIxc0lXY2ZkMzZlMHFY?=
 =?utf-8?B?S0Rhbk1UUU1IcHBPYnVGSFNzTXdEY0pRWUs3VDVRSG9kajhTQWRLa1p3Rnd2?=
 =?utf-8?B?NUtCcjB1c2QxSzVVMDA4aTlwZ1N0N3hJdDZueHRoQk5NOHNyUWQybDVpcU8z?=
 =?utf-8?B?Z0daZEpOZjN4VUwvN0gzVFp6TzB1aVVJU2dGb0VVcUZCaStuemI4OTZzT2pG?=
 =?utf-8?B?Y0ZteFNMeEFXcjJBaG04Y3IwSVNNWnlaUCt4bE82TjVZNU9RUXdiMWZaZkM3?=
 =?utf-8?B?S2xQUm43blc4N3Q0ZWN2QzFJYkVseXExZnVVSUhod1lJZ0RvakNLSWJwZEpT?=
 =?utf-8?B?TTR6ZmJUMzZVTVZ0bGdUQlQyRVEvb0VtSzRGaVQ2RkFMejZ4SEoybkpzNkg3?=
 =?utf-8?Q?xdnmNHewAiffJ/uppqNPjaImreybzKGBZ0d8YHQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659394ab-ca2d-49f2-9ca0-08d90c3aff00
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2021 00:49:37.5094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYOlRoSl9LS5kryWh1Mv79mllOVL/XPJrSl8qS/c6q0vthiLw3bsWZvIOZx+Tt5C6FhWqBrL9QS789BhFjsiZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4275
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9970 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105010001
X-Proofpoint-GUID: 2E0E9gKQa9om6-DyS8wDTD61EdxPfpT1
X-Proofpoint-ORIG-GUID: 2E0E9gKQa9om6-DyS8wDTD61EdxPfpT1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9970 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105010001
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCj4gT24gQXByIDMwLCAyMDIxLCBhdCA4OjI3IFBNLCBUcm9uZCBNeWtsZWJ1c3QgPHRyb25k
bXlAaGFtbWVyc3BhY2UuY29tPiB3cm90ZToNCj4gDQo+IO+7v09uIEZyaSwgMjAyMS0wNC0zMCBh
dCAyMDoxMiArMDAwMCwgQ2h1Y2sgTGV2ZXIgSUlJIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBB
cHIgMzAsIDIwMjEsIGF0IDM6MDkgUE0sIFRyb25kIE15a2xlYnVzdCA8DQo+Pj4gdHJvbmRteUBo
YW1tZXJzcGFjZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIEZyaSwgMjAyMS0wNC0zMCBhdCAx
ODo0NSArMDAwMCwgQ2h1Y2sgTGV2ZXIgSUlJIHdyb3RlOg0KPj4+PiANCj4+Pj4gDQo+Pj4+PiBP
biBBcHIgMzAsIDIwMjEsIGF0IDI6MjYgUE0sIGNvdmVyaXR5LWJvdCA8DQo+Pj4+PiBrZWVzY29v
a0BjaHJvbWl1bS5vcmc+DQo+Pj4+PiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gSGVsbG8hDQo+Pj4+
PiANCj4+Pj4+IFRoaXMgaXMgYW4gZXhwZXJpbWVudGFsIHNlbWktYXV0b21hdGVkIHJlcG9ydCBh
Ym91dCBpc3N1ZXMNCj4+Pj4+IGRldGVjdGVkDQo+Pj4+PiBieQ0KPj4+Pj4gQ292ZXJpdHkgZnJv
bSBhIHNjYW4gb2YgbmV4dC0yMDIxMDQzMCBhcyBwYXJ0IG9mIHRoZSBsaW51eC1uZXh0DQo+Pj4+
PiBzY2FuIHByb2plY3Q6DQo+Pj4+PiBodHRwczovL3NjYW4uY292ZXJpdHkuY29tL3Byb2plY3Rz
L2xpbnV4LW5leHQtd2Vla2x5LXNjYW4NCj4+Pj4+IA0KPj4+Pj4gWW91J3JlIGdldHRpbmcgdGhp
cyBlbWFpbCBiZWNhdXNlIHlvdSB3ZXJlIGFzc29jaWF0ZWQgd2l0aCB0aGUNCj4+Pj4+IGlkZW50
aWZpZWQNCj4+Pj4+IGxpbmVzIG9mIGNvZGUgKG5vdGVkIGJlbG93KSB0aGF0IHdlcmUgdG91Y2hl
ZCBieSBjb21taXRzOg0KPj4+Pj4gDQo+Pj4+PiAgTW9uIEFwciAyNiAwOToyNzowNiAyMDIxIC0w
NDAwDQo+Pj4+PiAgICA5YTMwMWNhZmM4NjEgKCJ4cHJ0cmRtYTogTW92ZSBmcl9saW52X2RvbmUg
ZmllbGQgdG8gc3RydWN0DQo+Pj4+PiBycGNyZG1hX21yIikNCj4+Pj4+IA0KPj4+Pj4gQ292ZXJp
dHkgcmVwb3J0ZWQgdGhlIGZvbGxvd2luZzoNCj4+Pj4+IA0KPj4+Pj4gKioqIENJRCAxNTA0NTU2
OiAgTnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlcyAgKEZPUldBUkRfTlVMTCkNCj4+Pj4+IC9uZXQv
c3VucnBjL3hwcnRyZG1hL2Zyd3Jfb3BzLmM6IDUzOSBpbiBmcndyX3VubWFwX3N5bmMoKQ0KPj4+
Pj4gNTMzDQo+Pj4+PiA1MzQgICAgICAgICAgICAgLyogU3Ryb25nIHNlbmQgcXVldWUgb3JkZXJp
bmcgZ3VhcmFudGVlcyB0aGF0DQo+Pj4+PiB3aGVuDQo+Pj4+PiB0aGUNCj4+Pj4+IDUzNSAgICAg
ICAgICAgICAgKiBsYXN0IFdSIGluIHRoZSBjaGFpbiBjb21wbGV0ZXMsIGFsbCBXUnMgaW4NCj4+
Pj4+IHRoZQ0KPj4+Pj4gY2hhaW4NCj4+Pj4+IDUzNiAgICAgICAgICAgICAgKiBhcmUgY29tcGxl
dGUuDQo+Pj4+PiA1MzcgICAgICAgICAgICAgICovDQo+Pj4+PiA1MzggICAgICAgICAgICAgbGFz
dC0+d3JfY3FlLT5kb25lID0gZnJ3cl93Y19sb2NhbGludl93YWtlOw0KPj4+Pj4gdnZ2ICAgICBD
SUQgMTUwNDU1NjogIE51bGwgcG9pbnRlciBkZXJlZmVyZW5jZXMgIChGT1JXQVJEX05VTEwpDQo+
Pj4+PiB2dnYgICAgIFBhc3NpbmcgbnVsbCBwb2ludGVyICImbXItPm1yX2xpbnZfZG9uZSIgdG8N
Cj4+Pj4+ICJyZWluaXRfY29tcGxldGlvbiIsIHdoaWNoIGRlcmVmZXJlbmNlcyBpdC4NCj4+Pj4+
IDUzOSAgICAgICAgICAgICByZWluaXRfY29tcGxldGlvbigmbXItPm1yX2xpbnZfZG9uZSk7DQo+
Pj4+PiA1NDANCj4+Pj4+IDU0MSAgICAgICAgICAgICAvKiBUcmFuc3BvcnQgZGlzY29ubmVjdCBk
cmFpbnMgdGhlIHJlY2VpdmUgQ1ENCj4+Pj4+IGJlZm9yZSBpdA0KPj4+Pj4gNTQyICAgICAgICAg
ICAgICAqIHJlcGxhY2VzIHRoZSBRUC4gVGhlIFJQQyByZXBseSBoYW5kbGVyIHdvbid0DQo+Pj4+
PiBjYWxsIHVzDQo+Pj4+PiA1NDMgICAgICAgICAgICAgICogdW5sZXNzIHJlX2lkLT5xcCBpcyBh
IHZhbGlkIHBvaW50ZXIuDQo+Pj4+PiA1NDQgICAgICAgICAgICAgICovDQo+Pj4+PiANCj4+Pj4+
IElmIHRoaXMgaXMgYSBmYWxzZSBwb3NpdGl2ZSwgcGxlYXNlIGxldCB1cyBrbm93IHNvIHdlIGNh
biBtYXJrDQo+Pj4+PiBpdA0KPj4+Pj4gYXMNCj4+Pj4+IHN1Y2gsIG9yIHRlYWNoIHRoZSBDb3Zl
cml0eSBydWxlcyB0byBiZSBzbWFydGVyLg0KPj4+PiANCj4+Pj4gU3VyZSwgbm90IG15IHByb3Vk
ZXN0IG1vbWVudCBoZXJlLg0KPj4+PiANCj4+Pj4gVGhlIHNvbGUgY2FsbCBzaXRlIGZvciBmcndy
X3VubWFwX3N5bmMoKSBpcyB0aGlzIG9uZToNCj4+Pj4gDQo+Pj4+IG5ldC9zdW5ycGMveHBydHJk
bWEvdHJhbnNwb3J0LmM6DQo+Pj4+IDYwNiAgICAgICAgIGlmICh1bmxpa2VseSghbGlzdF9lbXB0
eSgmcmVxLT5ybF9yZWdpc3RlcmVkKSkpIHsNCj4+Pj4gNjA3ICAgICAgICAgICAgICAgICB0cmFj
ZV94cHJ0cmRtYV9tcnNfemFwKHRhc2spOw0KPj4+PiA2MDggICAgICAgICAgICAgICAgIGZyd3Jf
dW5tYXBfc3luYyhycGN4X3RvX3JkbWF4KHJxc3QtPnJxX3hwcnQpLA0KPj4+PiByZXEpOw0KPj4+
PiA2MDkgICAgICAgICB9DQo+Pj4+IA0KPj4+PiBUaHVzLCBpbiB0aGUgY3VycmVudCBjb2RlIGJh
c2UsIHRoZSB3aGlsZSgpIGxvb3A6DQo+Pj4+IA0KPj4+PiBuZXQvc3VucnBjL3hwcnRyZG1hL2Zy
d3Jfb3BzLmM6DQo+Pj4+IDUxNCAgICAgICAgIHdoaWxlICgobXIgPSBycGNyZG1hX21yX3BvcCgm
cmVxLT5ybF9yZWdpc3RlcmVkKSkpIHsNCj4+Pj4gDQo+Pj4+IFNob3VsZCBhbHdheXMgdGVybWlu
YXRlIHdpdGggbXIgY29udGFpbmluZyBhIG5vbi1OVUxMIGFkZHJlc3MuDQo+Pj4+IA0KPj4+PiBT
ZWVtcyB0byBtZSB0aGUgZnJ3cl91bm1hcF9zeW5jKCkgY29kZSBiZWZvcmUgZmRmNWVjYjE5MzRi
DQo+Pj4+ICgieHBydHJkbWE6IE1vdmUgZnJfbGludl9kb25lIGZpZWxkIHRvIHN0cnVjdCBycGNy
ZG1hX21yIikgaGFzDQo+Pj4+IHRoZSBzYW1lIHJpc2sgLS0gZnJ3ciBjYW4gYmUgTlVMTCBpZiBy
bF9yZWdpc3RlcmVkIGlzIGVtcHR5Lg0KPj4+PiANCj4+Pj4gSSdtIG9wZW4gdG8gc3VnZ2VzdGlv
bnMgZm9yIGltcHJvdmVtZW50LCBidXQgSSdtIG5vdCBzZWVpbmcgdGhpcw0KPj4+PiByaXNlIHRv
IHRoZSBsZXZlbCBvZiBhIHBlcnZhc2l2ZSBhbmQgaGlnaCBpbXBhY3QgaXNzdWUuDQo+Pj4+IA0K
Pj4+IA0KPj4+IENodWNrLCBJIHRoaW5rIHRoZSBwb2ludCBpcyB0aGF0IHlvdSBjYW4ndCBldmVy
IGV4aXQgdGhhdCB3aGlsZSgpDQo+Pj4gbG9vcA0KPj4+IF91bmxlc3NfIG1yID09IE5VTEwuIFNv
IGNhbGxpbmcgcmVpbml0X2NvbXBsZXRpb24oJm1yLQ0KPj4+PiBtcl9saW52X2RvbmUpDQo+Pj4g
YWZ0ZXIgZXhpdGluZyB0aGF0IGxvb3Agd2lsbCBpbmRlZWQgT29wcy4NCj4+IA0KPj4gRCdvaC4N
Cj4+IA0KPj4gDQo+Pj4gU28gd2lsbCB0aGUgY2FsbCB0byB3YWl0X2Zvcl9jb21wbGV0aW9uKCZt
ci0+bXJfbGludl9kb25lKS4NCj4+PiANCj4+PiBJT1c6IEkgdGhpbmsgeW91IG5lZWQgdG8gc2F2
ZSB0aGUgbGFzdCBub24tTlVMTCB2YWx1ZSBvZiAnbXInDQo+Pj4gaW5zaWRlDQo+Pj4gdGhlIGxv
b3AuDQo+PiANCj4+IEkgdGhpbmsgZm9sbG93aW5nIHRoZSB3aGlsZSgpIGxvb3Agd2l0aDoNCj4+
IA0KPj4gICAgbXIgPSBjb250YWluZXJfb2YobGFzdCwgc3RydWN0IHJwY3JkbWFfbXIsIG1yX2lu
dndyKTsNCj4+IA0KPj4gTWlnaHQgYWxzbyB3b3JrLg0KPj4gDQo+IA0KPiBTb3VuZHMgZ29vZC4g
V2lsbCBiZSB5b3Ugc2VuZGluZyBtZSBhbiB1cGRhdGVkK3Rlc3RlZCBwYXRjaD8NCg0KSeKAmWxs
IHBvc3QgYSBmaXggYnkgU3VuZGF5IGV2ZW5pbmcuIFlvdSBjYW4gc3F1YXNoIGl0IGludG8gdGhl
IG9yaWdpbmFsIGlmIHlvdSBsaWtlLg0KDQo=
