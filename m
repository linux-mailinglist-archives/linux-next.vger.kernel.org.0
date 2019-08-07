Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 884398558B
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 00:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbfHGWLw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 18:11:52 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:7796 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729624AbfHGWLw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 18:11:52 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x77MAAUh013359;
        Wed, 7 Aug 2019 15:11:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=mG1TPNkY72m4fL99POZ0GuCQxRUuikRXG372n2l++js=;
 b=NWbPInwRy99vpkslCltbZCnayteBAXZN52+Yq/W7pAPyI5m/VeqhOZWVTGY1I7Rw+8WZ
 glQXYBpKHiQ8vx/1SdXa9oFtyLKVMn0NNFFVTQVRz4VtnjRj5qiN4mV0rocQ99LGtfjA
 JhLdgopLNK2Rzi1TECAkGymUVGB4mVyprFQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 2u86j684ux-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 07 Aug 2019 15:11:33 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Aug 2019 15:11:29 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Aug 2019 15:11:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3Z6qpCuIkssNQbfWhqIJI7lwkANy5uFnGmZlRkKQ5vQQCmJBr7NKoT5Hm0bksK/mdXsmCgIVch5eV31XUlzjjPpinFvsiuatp0rr5QbOLxALJYmCHeeytgB8faLBx6V2O5LUXUNmM3M13dPjtNmGAfvEdCyhf3YpoRgkajoOvE3tnWeXwfJBZxB+8jdOL8S8PWqfNdfC/9fdm0e7hM7K214sVcsj0NsEh0DIJJ6Uvjx90l2IWnFtuEQ56+E3OEF3xPJha40sHwaicm7SqHAD8M1lReaIGdqXJ98BE23ebzlC4qloKmzvCrTRjVio9njF4Az/RECXvpRze+/Lx8XDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mG1TPNkY72m4fL99POZ0GuCQxRUuikRXG372n2l++js=;
 b=I2G2TKob8pgngx71igcotSvLmVNh9CDciIt96RIRFroMk96zTPiHLbGCQdF4oYjpOF6dI733kONfPb7xn+uylrC3dmlqY7h1mygoi1OA8EK4poaUQ6pKcD+g6EwjnCvCqgMV8nognHfQ0dxcQWm00MV6Oi59Td7gLcJ0I3COiokTI/Yh8MqOVylKPw/14w/vy3f7hLyCBjrHcgrqIMnuVsm0iu0GKdRDhG4Ggg4ltYea6f3lbQkk1jlM2N7ROxF8mVMX+90ZOrPZ3mOoQxrZdFGo1DLqph1Yl1WAO0/SE3bvv0p+SBvTY694tNiWH/D9MkqjrXPvLycpDyiMFVXakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mG1TPNkY72m4fL99POZ0GuCQxRUuikRXG372n2l++js=;
 b=B2bjJ6G9w3GzYUySwJpKcfQpPNABjSFjLnmw9XtJTUzbd6v6yDGpveH9YeKRHACR5ht1aBfwKIRx1LE9rAA5PYGO/l3h6xe66ZV+WNPKKXQhZ+7pRU4+qdkl8nAuuyD7AfS9Vc5e7eAtY21OOoPrCkVhCuFbGTkH1VCYUcIJVek=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
 MWHPR15MB1821.namprd15.prod.outlook.com (10.174.255.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 22:11:28 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::79c8:442d:b528:802d]) by MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::79c8:442d:b528:802d%9]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 22:11:28 +0000
From:   Song Liu <songliubraving@fb.com>
To:     Randy Dunlap <rdunlap@infradead.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Subject: Re: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Thread-Topic: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Thread-Index: AQHVTTJXJMBKk+9UcEyVbeuM3CTH0abv6HuAgAA1cYCAAA3aAIAAB8iAgAAA0ICAAAtbAA==
Date:   Wed, 7 Aug 2019 22:11:28 +0000
Message-ID: <F53407FB-96CC-42E8-9862-105C92CC2B98@fb.com>
References: <20190807183606.372ca1a4@canb.auug.org.au>
 <c18b2828-cdf3-5248-609f-d89a24f558d1@infradead.org>
 <DCC6982B-17EF-4143-8CE8-9D0EC28FA06B@fb.com>
 <20190807131029.f7f191aaeeb88cc435c6306f@linux-foundation.org>
 <BB7412DE-A88E-41A4-9796-5ECEADE31571@fb.com>
 <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
 <abb5daa5-322e-55e8-a08d-4e938375451f@infradead.org>
In-Reply-To: <abb5daa5-322e-55e8-a08d-4e938375451f@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-originating-ip: [2620:10d:c090:200::3:1a00]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2347d421-afc4-48b6-5206-08d71b843220
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR15MB1821;
x-ms-traffictypediagnostic: MWHPR15MB1821:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MWHPR15MB18212004B94A269218690216B3D40@MWHPR15MB1821.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(346002)(376002)(39860400002)(396003)(43544003)(189003)(199004)(2616005)(476003)(486006)(71200400001)(71190400001)(99286004)(11346002)(446003)(14444005)(46003)(33656002)(256004)(57306001)(186003)(36756003)(8936002)(76116006)(50226002)(25786009)(478600001)(5660300002)(6512007)(6246003)(6306002)(6436002)(229853002)(66556008)(53936002)(66476007)(8676002)(6486002)(81156014)(66946007)(64756008)(81166006)(86362001)(4326008)(66446008)(2906002)(14454004)(102836004)(316002)(53546011)(6506007)(6916009)(54906003)(76176011)(966005)(6116002)(305945005)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR15MB1821;H:MWHPR15MB1165.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r+z7SvkkCnJJv68werYofwCzOi76wCvZt6S9sRQFRRAUU/FSnyteXX4jTgdHwIzQlFMVBEPNf+9nbL6VG0ycHNdUwNg0BWKSv4JlhZMDQcojJlxLV6AfyJyWo1ow0lXF8TVj8P/pcqJNVn4vCOqyuiLITcPJUImK9ubMIoAYN8F6c4rmxaqcokZFltj+lhSqpc3IJCIsc6fpFTEc0r589n1y1TBMYI/Xv+MbUloWCi3js+6nvf/h3HZJA3zc1IBMHCuAvxPCl8PvFt2SZpGbfWHpLsobYBRF1cwhOneNXoR/dFmYALkP9eYdwQYeOUEWeYw9DkWIej5oQlFmZY4UacnPAUX2WSHOA62mGoad83+Y/2+G3flEuyt0Wp0j3yEnClKyCs8jnzFel3+XKaJu/oJuJE/RloGg3wV88otpsPM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10368E975B3B554CBD3019912B8078C5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2347d421-afc4-48b6-5206-08d71b843220
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 22:11:28.4907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1821
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-07_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070191
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCj4gT24gQXVnIDcsIDIwMTksIGF0IDI6MzAgUE0sIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIDgvNy8xOSAyOjI3IFBNLCBBbmRyZXcgTW9y
dG9uIHdyb3RlOg0KPj4gT24gV2VkLCA3IEF1ZyAyMDE5IDIxOjAwOjA0ICswMDAwIFNvbmcgTGl1
IDxzb25nbGl1YnJhdmluZ0BmYi5jb20+IHdyb3RlOg0KPj4gDQo+Pj4+PiANCj4+Pj4+IFNoYWxs
IEkgcmVzZW5kIHRoZSBwYXRjaCwgb3Igc2hhbGwgSSBzZW5kIGZpeCBvbiB0b3Agb2YgY3VycmVu
dCBwYXRjaD8NCj4+Pj4gDQo+Pj4+IEVpdGhlciBpcyBPSy4gIElmIHRoZSBkaWZmZXJlbmNlIGlz
IHNtYWxsIEkgd2lsbCB0dXJuIGl0IGludG8gYW4NCj4+Pj4gaW5jcmVtZW50YWwgcGF0Y2ggc28g
dGhhdCBJIChhbmQgb3RoZXJzKSBjYW4gc2VlIHdoYXQgY2hhbmdlZC4NCj4+PiANCj4+PiBQbGVh
c2UgZmluZCB0aGUgcGF0Y2ggdG8gZml4IHRoaXMgYXQgdGhlIGVuZCBvZiB0aGlzIGVtYWlsLiBJ
dCBhcHBsaWVzIA0KPj4+IHJpZ2h0IG9uIHRvcCBvZiAia2h1Z2VwYWdlZDogZW5hYmxlIGNvbGxh
cHNlIHBtZCBmb3IgcHRlLW1hcHBlZCBUSFAiLiANCj4+PiBJdCBtYXkgY29uZmxpY3QgYSBsaXR0
bGUgd2l0aCB0aGUgIkVuYWJsZSBUSFAgZm9yIHRleHQgc2VjdGlvbiBvZiANCj4+PiBub24tc2ht
ZW0gZmlsZXMiIHNldCwgd2hpY2ggcmVuYW1lcyBmdW5jdGlvbiBraHVnZXBhZ2VkX3NjYW5fc2ht
ZW0oKS4gDQo+Pj4gDQo+Pj4gQWxzbywgSSBmb3VuZCB2MyBvZiB0aGUgc2V0IGluIGxpbnV4LW5l
eHQuIFRoZSBsYXRlc3QgaXMgdjQ6DQo+Pj4gDQo+Pj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIw
MTkvOC8yLzE1ODcNCj4+PiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS84LzIvMTU4OA0KPj4+
IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzgvMi8xNTg5DQo+PiANCj4+IEl0J3MgYWxsIGEg
Yml0IGNvbmZ1c2luZy4gIEknbGwgZHJvcCANCj4+IA0KPj4gbW0tbW92ZS1tZW1jbXBfcGFnZXMt
YW5kLXBhZ2VzX2lkZW50aWNhbC5wYXRjaA0KPj4gdXByb2JlLXVzZS1vcmlnaW5hbC1wYWdlLXdo
ZW4tYWxsLXVwcm9iZXMtYXJlLXJlbW92ZWQucGF0Y2gNCj4+IHVwcm9iZS11c2Utb3JpZ2luYWwt
cGFnZS13aGVuLWFsbC11cHJvYmVzLWFyZS1yZW1vdmVkLXYyLnBhdGNoDQo+PiBtbS10aHAtaW50
cm9kdWNlLWZvbGxfc3BsaXRfcG1kLnBhdGNoDQo+PiBtbS10aHAtaW50cm9kdWNlLWZvbGxfc3Bs
aXRfcG1kLXYxMS5wYXRjaA0KPj4gdXByb2JlLXVzZS1mb2xsX3NwbGl0X3BtZC1pbnN0ZWFkLW9m
LWZvbGxfc3BsaXQucGF0Y2gNCj4+IGtodWdlcGFnZWQtZW5hYmxlLWNvbGxhcHNlLXBtZC1mb3It
cHRlLW1hcHBlZC10aHAucGF0Y2gNCj4+IHVwcm9iZS1jb2xsYXBzZS10aHAtcG1kLWFmdGVyLXJl
bW92aW5nLWFsbC11cHJvYmVzLnBhdGNoDQo+PiANCj4+IFBsZWFzZSByZXNvbHZlIE9sZWcncyBy
ZXZpZXcgY29tbWVudHMgYW5kIHJlc2VuZCBldmVyeXRoaW5nLg0KPj4gDQo+IA0KPiBPSywgdGhh
dCB3aWxsIHRha2UgY2FyZSBvZiB0aGUgYnVpbGQgZXJyb3IgdGhhdCBJIGFtIHN0aWxsIHNlZWlu
Zw0KPiB3aGVuIFNITUVNIGlzIG5vdCBlbmFibGVkOg0KPiANCj4gLi4vbW0va2h1Z2VwYWdlZC5j
OjE4NDk6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR+KAmQ0KPiAg
QlVJTERfQlVHKCk7DQo+ICBefn5+fn5+fn4NCg0KVGhpcyB3YXMgYnJva2VuIGJ5IG9uZSBvZiBt
eSBvdGhlciBwYXRjaC4gU29ycnkhDQoNClRoZSBmb2xsb3dpbmcgcGF0Y2ggKG9uIHRvcCBvZiBs
aW51eC1uZXh0L21hc3RlcikgZml4ZXMgaXQuIA0KDQpUaGFua3MsDQpTb25nDQoNCj09PT09PT09
PT09PT09PT09IDg8ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KDQpGcm9tIDRkNmUz
YTNhMjhiZjg1YjFkZWJiYjkwYzU1ZjY2YzgxZTllYmI5ZWMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxDQpGcm9tOiBTb25nIExpdSA8c29uZ2xpdWJyYXZpbmdAZmIuY29tPg0KRGF0ZTogV2VkLCA3
IEF1ZyAyMDE5IDE0OjU3OjM4IC0wNzAwDQpTdWJqZWN0OiBbUEFUQ0hdIGtodWdlcGFnZWQ6IGZp
eCBidWlsZCB3aXRob3V0IENPTkZJR19TSE1FTQ0KDQpraHVnZXBhZ2VkX3NjYW5fZmlsZSgpIHNo
b3VsZCBiZSBmdWxseSBieXBhc3NlZCB3aXRob3V0IENPTkZJR19TSE1FTS4NCg0KRml4ZXM6IGY1
NzI4NjE0MGQ5NiAoIm1tLHRocDogYWRkIHJlYWQtb25seSBUSFAgc3VwcG9ydCBmb3IgKG5vbi1z
aG1lbSkgRlMiKQ0KU2lnbmVkLW9mZi1ieTogU29uZyBMaXUgPHNvbmdsaXVicmF2aW5nQGZiLmNv
bT4NCi0tLQ0KIG1tL2todWdlcGFnZWQuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL21tL2todWdlcGFnZWQuYyBi
L21tL2todWdlcGFnZWQuYw0KaW5kZXggMjcyZmVkM2VkMGYwLi40MGMyNWRkZjI5ZTQgMTAwNjQ0
DQotLS0gYS9tbS9raHVnZXBhZ2VkLmMNCisrKyBiL21tL2todWdlcGFnZWQuYw0KQEAgLTE3Nzgs
NyArMTc3OCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQga2h1Z2VwYWdlZF9zY2FuX21tX3Nsb3Qo
dW5zaWduZWQgaW50IHBhZ2VzLA0KICAgICAgICAgICAgICAgICAgICAgICAgVk1fQlVHX09OKGto
dWdlcGFnZWRfc2Nhbi5hZGRyZXNzIDwgaHN0YXJ0IHx8DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAga2h1Z2VwYWdlZF9zY2FuLmFkZHJlc3MgKyBIUEFHRV9QTURfU0laRSA+DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGVuZCk7DQotICAgICAgICAgICAgICAg
ICAgICAgICBpZiAodm1hLT52bV9maWxlKSB7DQorICAgICAgICAgICAgICAgICAgICAgICBpZiAo
SVNfRU5BQkxFRChDT05GSUdfU0hNRU0pICYmIHZtYS0+dm1fZmlsZSkgew0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZmlsZSAqZmlsZTsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGdvZmZfdCBwZ29mZiA9IGxpbmVhcl9wYWdlX2luZGV4KHZtYSwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtodWdlcGFnZWRf
c2Nhbi5hZGRyZXNzKTsNCi0tDQoyLjE3LjENCg0K
