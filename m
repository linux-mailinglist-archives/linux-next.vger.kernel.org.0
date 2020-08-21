Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED14924C96A
	for <lists+linux-next@lfdr.de>; Fri, 21 Aug 2020 03:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHUBHV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 21:07:21 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3491 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726309AbgHUBHU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Aug 2020 21:07:20 -0400
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
        by Forcepoint Email with ESMTP id 79EFA8312E2E22CFD7F4;
        Fri, 21 Aug 2020 09:07:18 +0800 (CST)
Received: from dggemi710-chm.china.huawei.com (10.3.20.109) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 21 Aug 2020 09:07:17 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi710-chm.china.huawei.com (10.3.20.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 21 Aug 2020 09:07:18 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Fri, 21 Aug 2020 09:07:18 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
CC:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Linuxarm <linuxarm@huawei.com>,
        John Hubbard <jhubbard@nvidia.com>, Jan Kara <jack@suse.cz>,
        =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        "Dan Williams" <dan.j.williams@intel.com>,
        Dave Chinner <david@fromorbit.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        "Michal Hocko" <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shuah Khan <shuah@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Subject: =?utf-8?B?UkU6IG1tL2d1cC5jOjE5MjI6NzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0?=
 =?utf-8?B?aW9uIG9mIGZ1bmN0aW9uIOKAmGlzX3ZhbGlkX2d1cF9mbGFnc+KAmQ==?=
Thread-Topic: =?utf-8?B?bW0vZ3VwLmM6MTkyMjo3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g?=
 =?utf-8?B?b2YgZnVuY3Rpb24g4oCYaXNfdmFsaWRfZ3VwX2ZsYWdz4oCZ?=
Thread-Index: AQHWdtSC73u9hMvyMkWJoaaW4e6o2alA9KKAgADK0FA=
Date:   Fri, 21 Aug 2020 01:07:18 +0000
Message-ID: <f45f6a5ebacf4c11880f6288bbf50a31@hisilicon.com>
References: <CA+G9fYuNS3k0DVT62twfV746pfNhCSrk5sVMcOcQ1PGGnEseyw@mail.gmail.com>
 <20200820135515.c36b35449143c723f0800f5b@linux-foundation.org>
In-Reply-To: <20200820135515.c36b35449143c723f0800f5b@linux-foundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.2]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3duZXItbGludXgtbW1A
a3ZhY2sub3JnIFttYWlsdG86b3duZXItbGludXgtbW1Aa3ZhY2sub3JnXSBPbg0KPiBCZWhhbGYg
T2YgQW5kcmV3IE1vcnRvbg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyMSwgMjAyMCA4OjU1IEFN
DQo+IFRvOiBOYXJlc2ggS2FtYm9qdSA8bmFyZXNoLmthbWJvanVAbGluYXJvLm9yZz4NCj4gQ2M6
IExpbnV4LU5leHQgTWFpbGluZyBMaXN0IDxsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZz47IG9w
ZW4gbGlzdA0KPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LW1tIDxsaW51
eC1tbUBrdmFjay5vcmc+Ow0KPiBsa2Z0LXRyaWFnZUBsaXN0cy5saW5hcm8ub3JnOyBMaW51eGFy
bSA8bGludXhhcm1AaHVhd2VpLmNvbT47IFNvbmcgQmFvIEh1YQ0KPiAoQmFycnkgU29uZykgPHNv
bmcuYmFvLmh1YUBoaXNpbGljb24uY29tPjsgSm9obiBIdWJiYXJkDQo+IDxqaHViYmFyZEBudmlk
aWEuY29tPjsgSmFuIEthcmEgPGphY2tAc3VzZS5jej47IErDqXLDtG1lIEdsaXNzZQ0KPiA8amds
aXNzZUByZWRoYXQuY29tPjsgTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJhZGVh
ZC5vcmc+OyBBbA0KPiBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az47IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz47IERhbg0KPiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlh
bXNAaW50ZWwuY29tPjsgRGF2ZSBDaGlubmVyIDxkYXZpZEBmcm9tb3JiaXQuY29tPjsNCj4gSmFz
b24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+OyBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24u
bmV0PjsgTWljaGFsDQo+IEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+OyBNaWtlIEtyYXZldHogPG1p
a2Uua3JhdmV0ekBvcmFjbGUuY29tPjsNCj4gU2h1YWggS2hhbiA8c2h1YWhAa2VybmVsLm9yZz47
IFZsYXN0aW1pbCBCYWJrYSA8dmJhYmthQHN1c2UuY3o+DQo+IFN1YmplY3Q6IFJlOiBtbS9ndXAu
YzoxOTIyOjc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbg0KPiDigJhp
c192YWxpZF9ndXBfZmxhZ3PigJkNCj4gDQo+IE9uIFRodSwgMjAgQXVnIDIwMjAgMTQ6NTk6NTIg
KzA1MzAgTmFyZXNoIEthbWJvanUNCj4gPG5hcmVzaC5rYW1ib2p1QGxpbmFyby5vcmc+IHdyb3Rl
Og0KPiANCj4gPiBhcm0gYW5kIHJpc2N2IGFyY2hpdGVjdHVyZSBidWlsZCBmYWlsZWQgb24gbGlu
dXggbmV4dCAyMDIwMDgyMCB0YWcuDQo+ID4NCj4gPiBtYWtlIC1zayBLQlVJTERfQlVJTERfVVNF
Uj1UdXhCdWlsZCAtQy9saW51eCAtajE2IEFSQ0g9YXJtDQo+ID4gQ1JPU1NfQ09NUElMRT1hcm0t
bGludXgtZ251ZWFiaWhmLSBIT1NUQ0M9Z2NjIENDPSJzY2NhY2hlDQo+ID4gYXJtLWxpbnV4LWdu
dWVhYmloZi1nY2MiIE89YnVpbGQgekltYWdlDQo+ID4NCj4gPiAzNDgjDQo+ID4gMzQ5Li4vbW0v
Z3VwLmM6IEluIGZ1bmN0aW9uIOKAmGdldF91c2VyX3BhZ2Vz4oCZOg0KPiA+IDM1MC4uL21tL2d1
cC5jOjE5MjI6NzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uDQo+ID4g
4oCYaXNfdmFsaWRfZ3VwX2ZsYWdz4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQ0KPiA+IDM1MSAxOTIyIHwgaWYgKCFpc192YWxpZF9ndXBfZmxhZ3MoZ3VwX2ZsYWdz
KSkNCj4gPiAzNTIgfCBefn5+fn5+fn5+fn5+fn5+fn4NCj4gPiAzNTNjYzE6IHNvbWUgd2Fybmlu
Z3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCj4gPg0KPiANCj4gWWVzLCB0aGFua3MuDQo+IA0K
PiBGcm9tOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KPiBTdWJq
ZWN0Og0KPiBtbS1ndXAtZG9udC1wZXJtaXQtdXNlcnMtdG8tY2FsbC1nZXRfdXNlcl9wYWdlcy13
aXRoLWZvbGxfbG9uZ3Rlcm0tZml4DQo+IA0KPiBmaXggQ09ORklHX01NVT1uIGJ1aWxkDQo+IA0K
PiBMaW5rOg0KPiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yL0NBK0c5Zll1TlMzazBEVlQ2MnR3
ZlY3NDZwZk5oQ1NyazVzVk1jT2NRMQ0KPiBQR0duRXNleXdAbWFpbC5nbWFpbC5jb20NCj4gUmVw
b3J0ZWQtYnk6IE5hcmVzaCBLYW1ib2p1IDxuYXJlc2gua2FtYm9qdUBsaW5hcm8ub3JnPg0KPiBD
YzogQmFycnkgU29uZyA8c29uZy5iYW8uaHVhQGhpc2lsaWNvbi5jb20+DQo+IENjOiBTdGVwaGVu
IFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4NCg0KQW5kcmV3LA0KVGhhbmtzIGZv
ciB0YWtpbmcgY2FyZSBvZiB0aGlzIGJ1aWxkIGlzc3VlLg0KQWNrZWQtYnk6IEJhcnJ5IFNvbmcg
PHNvbmcuYmFvLmh1YUBoaXNpbGljb24uY29tPg0KDQo+IC0tLQ0KPiANCj4gIG1tL2d1cC5jIHwg
ICAzOCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0tDQo+IGEv
bW0vZ3VwLmN+bW0tZ3VwLWRvbnQtcGVybWl0LXVzZXJzLXRvLWNhbGwtZ2V0X3VzZXJfcGFnZXMt
d2l0aC1mb2xsX2xvbmcNCj4gdGVybS1maXgNCj4gKysrIGEvbW0vZ3VwLmMNCj4gQEAgLTE3NTks
NiArMTc1OSwyNSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGxvbmcgX19ndXBfbG9uZ3RlICB9
DQo+ICNlbmRpZiAvKiBDT05GSUdfRlNfREFYIHx8IENPTkZJR19DTUEgKi8NCj4gDQo+ICtzdGF0
aWMgYm9vbCBpc192YWxpZF9ndXBfZmxhZ3ModW5zaWduZWQgaW50IGd1cF9mbGFncykgew0KPiAr
CS8qDQo+ICsJICogRk9MTF9QSU4gbXVzdCBvbmx5IGJlIHNldCBpbnRlcm5hbGx5IGJ5IHRoZSBw
aW5fdXNlcl9wYWdlcyooKSBBUElzLA0KPiArCSAqIG5ldmVyIGRpcmVjdGx5IGJ5IHRoZSBjYWxs
ZXIsIHNvIGVuZm9yY2UgdGhhdCB3aXRoIGFuIGFzc2VydGlvbjoNCj4gKwkgKi8NCj4gKwlpZiAo
V0FSTl9PTl9PTkNFKGd1cF9mbGFncyAmIEZPTExfUElOKSkNCj4gKwkJcmV0dXJuIGZhbHNlOw0K
PiArCS8qDQo+ICsJICogRk9MTF9QSU4gaXMgYSBwcmVyZXF1aXNpdGUgdG8gRk9MTF9MT05HVEVS
TS4gQW5vdGhlciB3YXkgb2Ygc2F5aW5nDQo+ICsJICogdGhhdCBpcywgRk9MTF9MT05HVEVSTSBp
cyBhIHNwZWNpZmljIGNhc2UsIG1vcmUgcmVzdHJpY3RpdmUgY2FzZSBvZg0KPiArCSAqIEZPTExf
UElOLg0KPiArCSAqLw0KPiArCWlmIChXQVJOX09OX09OQ0UoZ3VwX2ZsYWdzICYgRk9MTF9MT05H
VEVSTSkpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCXJldHVybiB0cnVlOw0KPiArfQ0K
PiArDQo+ICAjaWZkZWYgQ09ORklHX01NVQ0KPiAgc3RhdGljIGxvbmcgX19nZXRfdXNlcl9wYWdl
c19yZW1vdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+ICAJCQkJICAgIHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsIEBADQo+IC0xNzg5LDI1ICsxODA4LDYgQEAg
c3RhdGljIGxvbmcgX19nZXRfdXNlcl9wYWdlc19yZW1vdGUoc3RydQ0KPiAgCQkJCSAgICAgICBn
dXBfZmxhZ3MgfCBGT0xMX1RPVUNIIHwgRk9MTF9SRU1PVEUpOyAgfQ0KPiANCj4gLXN0YXRpYyBi
b29sIGlzX3ZhbGlkX2d1cF9mbGFncyh1bnNpZ25lZCBpbnQgZ3VwX2ZsYWdzKSAtew0KPiAtCS8q
DQo+IC0JICogRk9MTF9QSU4gbXVzdCBvbmx5IGJlIHNldCBpbnRlcm5hbGx5IGJ5IHRoZSBwaW5f
dXNlcl9wYWdlcyooKSBBUElzLA0KPiAtCSAqIG5ldmVyIGRpcmVjdGx5IGJ5IHRoZSBjYWxsZXIs
IHNvIGVuZm9yY2UgdGhhdCB3aXRoIGFuIGFzc2VydGlvbjoNCj4gLQkgKi8NCj4gLQlpZiAoV0FS
Tl9PTl9PTkNFKGd1cF9mbGFncyAmIEZPTExfUElOKSkNCj4gLQkJcmV0dXJuIGZhbHNlOw0KPiAt
CS8qDQo+IC0JICogRk9MTF9QSU4gaXMgYSBwcmVyZXF1aXNpdGUgdG8gRk9MTF9MT05HVEVSTS4g
QW5vdGhlciB3YXkgb2Ygc2F5aW5nDQo+IC0JICogdGhhdCBpcywgRk9MTF9MT05HVEVSTSBpcyBh
IHNwZWNpZmljIGNhc2UsIG1vcmUgcmVzdHJpY3RpdmUgY2FzZSBvZg0KPiAtCSAqIEZPTExfUElO
Lg0KPiAtCSAqLw0KPiAtCWlmIChXQVJOX09OX09OQ0UoZ3VwX2ZsYWdzICYgRk9MTF9MT05HVEVS
TSkpDQo+IC0JCXJldHVybiBmYWxzZTsNCj4gLQ0KPiAtCXJldHVybiB0cnVlOw0KPiAtfQ0KPiAt
DQo+ICAvKioNCj4gICAqIGdldF91c2VyX3BhZ2VzX3JlbW90ZSgpIC0gcGluIHVzZXIgcGFnZXMg
aW4gbWVtb3J5DQo+ICAgKiBAbW06CQltbV9zdHJ1Y3Qgb2YgdGFyZ2V0IG1tDQo+IF8NCj4gDQoN
CkJlc3QgUmVnYXJkcw0KQmFycnkNCg0K
