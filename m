Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9122E0720
	for <lists+linux-next@lfdr.de>; Tue, 22 Dec 2020 09:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgLVIR2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Dec 2020 03:17:28 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:38604 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725782AbgLVIR2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Dec 2020 03:17:28 -0500
X-UUID: 0b244554e44e48deb8b92f22ff5a7c29-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ldqqTqQvzSlSfMOD5zdJgBKNaeRu85daEfS5sNyHJ/o=;
        b=Gr6aczneW6zqFGoQT51aOWp6xq7o1fNRo9iQ+GJRM1yk+BVpZxp5uxkHyHOaIke2IyP+16/EvrModzPy3N5HyyNARU8vzuvmkXd26/gMfud2cgrYoSWFr3h5kyXEr8/0JyLw4ZDzplKLS6IKPe/Si+ffnmzZEWn3QIVZ64266zs=;
X-UUID: 0b244554e44e48deb8b92f22ff5a7c29-20201222
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <kuan-ying.lee@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1631919817; Tue, 22 Dec 2020 16:16:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 16:16:39 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Dec 2020 16:16:39 +0800
Message-ID: <1608625001.9171.48.camel@mtksdccf07>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
From:   Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        <miles.chen@mediatek.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue, 22 Dec 2020 16:16:41 +0800
In-Reply-To: <20201221135527.4cbdb11a@canb.auug.org.au>
References: <20201221131017.128c89b1@canb.auug.org.au>
         <1608517898.9171.6.camel@mtksdccf07>
         <20201221135527.4cbdb11a@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BAAA24470D3C57DFAA1FE4C0B42AE5AECCEFBE5FD6945FFED6B2F84530E87DBA2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gTW9uLCAyMDIwLTEyLTIxIGF0IDEzOjU1ICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBLdWFuLVlpbmcsDQo+IA0KPiBPbiBNb24sIDIxIERlYyAyMDIwIDEwOjMxOjM4ICsw
ODAwIEt1YW4tWWluZyBMZWUgPEt1YW4tWWluZy5MZWVAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4g
Pg0KPiA+IE9uIE1vbiwgMjAyMC0xMi0yMSBhdCAxMzoxMCArMTEwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToNCj4gPiA+IA0KPiA+ID4gQWZ0ZXIgbWVyZ2luZyB0aGUgYWtwbS1jdXJyZW50IHRy
ZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0DQo+ID4gPiBhbGxtb2Rjb25maWcp
IGZhaWxlZCBsaWtlIHRoaXM6DQo+ID4gPiANCj4gPiA+IG1tL2thc2FuL3F1YXJhbnRpbmUuYzog
SW4gZnVuY3Rpb24gJ3F1YXJhbnRpbmVfcHV0JzoNCj4gPiA+IG1tL2thc2FuL3F1YXJhbnRpbmUu
YzoyMDc6MTU6IGVycm9yOiAnaW5mbycgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVu
Y3Rpb24pDQo+ID4gPiAgIDIwNyB8ICAgcWxpbmtfZnJlZSgmaW5mby0+cXVhcmFudGluZV9saW5r
LCBjYWNoZSk7DQo+ID4gPiAgICAgICB8ICAgICAgICAgICAgICAgXn5+fg0KPiA+ID4gDQo+ID4g
PiBDYXVzZWQgYnkgY29tbWl0DQo+ID4gPiANCj4gPiA+ICAgMTIwZDU5M2E4NjUwICgia2FzYW46
IGZpeCBtZW1vcnkgbGVhayBvZiBrYXNhbiBxdWFyYW50aW5lIikNCj4gPiA+IA0KPiA+ID4gaW50
ZXJhY3Rpbmcgd2l0aCBjb21taXQNCj4gPiA+IA0KPiA+ID4gICBjZmJjOTIwODhlMWQgKCJrYXNh
bjogcmVuYW1lIGdldF9hbGxvYy9mcmVlX2luZm8iKQ0KPiA+ID4gDQo+ID4gPiBDYW4gd2UgcGxl
YXNlIGdldCB0aGlzIHNvcnRlZCBvdXQgb25jZSBhbmQgZm9yIGFsbD8NCj4gPiA+IA0KPiA+ID4g
SSBoYXZlIGFwcGxpZWQgdGhlIGZvbGxvd2luZyBwYXRjaCBmb3IgdG9kYXk6DQo+ID4gPiANCj4g
PiA+IEZyb206IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pg0KPiA+ID4g
RGF0ZTogTW9uLCAyMSBEZWMgMjAyMCAxMzowNzo0MiArMTEwMA0KPiA+ID4gU3ViamVjdDogW1BB
VENIXSBrYXNhbjogZml4IG1lbW9yeSBsZWFrIG9mIGthc2FuIHF1YXJhbnRpbmUgZml4DQo+ID4g
PiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcu
b3JnLmF1Pg0KPiA+ID4gLS0tDQo+ID4gPiAgbW0va2FzYW4vcXVhcmFudGluZS5jIHwgMiArLQ0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+
ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvbW0va2FzYW4vcXVhcmFudGluZS5jIGIvbW0va2FzYW4v
cXVhcmFudGluZS5jDQo+ID4gPiBpbmRleCAzZjNiM2Q5MDJjMTguLjA5MWE1N2Y5NDJiMyAxMDA2
NDQNCj4gPiA+IC0tLSBhL21tL2thc2FuL3F1YXJhbnRpbmUuYw0KPiA+ID4gKysrIGIvbW0va2Fz
YW4vcXVhcmFudGluZS5jDQo+ID4gPiBAQCAtMjA0LDcgKzIwNCw3IEBAIGJvb2wgcXVhcmFudGlu
ZV9wdXQoc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLCB2b2lkICpvYmplY3QpDQo+ID4gPiAgDQo+
ID4gPiAgCXEgPSB0aGlzX2NwdV9wdHIoJmNwdV9xdWFyYW50aW5lKTsNCj4gPiA+ICAJaWYgKHEt
Pm9mZmxpbmUpIHsNCj4gPiA+IC0JCXFsaW5rX2ZyZWUoJmluZm8tPnF1YXJhbnRpbmVfbGluaywg
Y2FjaGUpOw0KPiA+ID4gKwkJcWxpbmtfZnJlZSgmbWV0YS0+cXVhcmFudGluZV9saW5rLCBjYWNo
ZSk7IC8vIGZyZWUgb25jZQ0KPiA+ID4gIAkJbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0KPiA+
ID4gIAkJcmV0dXJuIGZhbHNlOyAgLy8gZnJlZSB0d2ljZQ0KPiA+ID4gIAl9DQo+ID4gPiAtLSAN
Cj4gPiA+IDIuMjkuMg0KPiA+ID4gICANCj4gPiANCj4gPiBQbGVhc2UganVzdCBkcm9wIHRoaXMg
cGF0Y2ggImthc2FuOiBmaXggbWVtb3J5IGxlYWsgb2Yga2FzYW4gcXVhcmFudGluZSINCj4gPiBm
cm9tIGxpbnV4LW5leHQuIE90aGVyd2lzZSwgaXQgd291bGQgY2F1c2UgZG91YmxlIGZyZWUgaXNz
dWUuDQo+IA0KPiBPSywgc28gZm9yIHRvZGF5IEkgaGF2ZSByZXZlcnRlZCBteSBmaXggcGF0Y2gg
YW5kIDEyMGQ1OTNhODY1MCAoImthc2FuOg0KPiBmaXggbWVtb3J5IGxlYWsgb2Yga2FzYW4gcXVh
cmFudGluZSIpLg0KPiANCg0KRGVhciBBbmRyZXcsDQoNCkkgYW0gc29ycnkuIEkgZGlkbid0IG1l
YW4gdG8uDQoNClRoaXMgcGF0Y2ggaGFzIGJ1aWxkIGVycm9yLg0KaHR0cHM6Ly93d3cub3psYWJz
Lm9yZy9+YWtwbS9tbW90bS9icm9rZW4tb3V0L2thc2FuLWZpeC1tZW1vcnktbGVhay1vZi1rYXNh
bi1xdWFyYW50aW5lLnBhdGNoDQoNCg0KU29ycnkgdG8gbWFrZSB0aGUgYnVpbGQgZXJyb3JzIGFu
ZCBtZXJnZSBpc3N1ZXMgcmVwZWF0ZWRseS4NCk15IGZpeCBoYXMgZGVwZW5kZW5jeSBpc3N1ZXMg
d2l0aCBBbmRyZXkncyBwYXRjaGVzIFsxLCAyXSwgYW5kIEkgdGhpbmsNCml0J3MgYmV0dGVyIHRv
IG1lcmdlIEFuZHJleSdzIHBhdGNoZXMgZmlyc3QgYW5kIEkgd2lsbCBwdXNoIGEgZml4IGFmdGVy
DQpBbmRyZXkncyBwYXRjaC4NClBsZWFzZSBqdXN0IGRyb3AgdGhpcyBwYXRjaCBmcm9tIGFrcG0t
dHJlZSBkaXJlY3RseS4NCg0KWzFdaHR0cHM6Ly93d3cub3psYWJzLm9yZy9+YWtwbS9tbW90bS9i
cm9rZW4tb3V0L2thc2FuLXNhbml0aXplLW9iamVjdHMtd2hlbi1tZXRhZGF0YS1kb2VzbnQtZml0
LnBhdGNoDQpbMl1odHRwczovL3d3dy5vemxhYnMub3JnL35ha3BtL21tb3RtL2Jyb2tlbi1vdXQv
a2FzYW4tcmVuYW1lLWdldF9hbGxvYy1mcmVlX2luZm8ucGF0Y2gNCg0KDQpUaGFua3MuDQoNCg==

