Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33CA72DF7A6
	for <lists+linux-next@lfdr.de>; Mon, 21 Dec 2020 03:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgLUCc3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Dec 2020 21:32:29 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:43336 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725902AbgLUCc3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Dec 2020 21:32:29 -0500
X-UUID: ac4f9fc8500c45da872660cb6dd52321-20201221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=KIKHYUimp+s7JD+lBAAhom57+LWwjGgisFpopmRx+Jk=;
        b=ipvLSR+Ycbc1RUXLjjHamV4aAzhcoemwjiVORBVpPodAffIpNm1K5PBhqMSqjvI8i4jiHJT1PEYNObhcLds16WYBq986qjDplpNEwJ04INDN0vWg5jGJ9QdgJTC6WNmZ8SZnyP7YkVL0xx/7eFojhOP1i7WHamJL0bBlW0lSGpI=;
X-UUID: ac4f9fc8500c45da872660cb6dd52321-20201221
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <kuan-ying.lee@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 456355461; Mon, 21 Dec 2020 10:31:40 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 10:31:39 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Dec 2020 10:31:38 +0800
Message-ID: <1608517898.9171.6.camel@mtksdccf07>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
From:   Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 21 Dec 2020 10:31:38 +0800
In-Reply-To: <20201221131017.128c89b1@canb.auug.org.au>
References: <20201221131017.128c89b1@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gTW9uLCAyMDIwLTEyLTIxIGF0IDEzOjEwICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBha3BtLWN1cnJlbnQgdHJlZSwg
dG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkICh4ODZfNjQNCj4gYWxsbW9kY29uZmlnKSBmYWlsZWQg
bGlrZSB0aGlzOg0KPiANCj4gbW0va2FzYW4vcXVhcmFudGluZS5jOiBJbiBmdW5jdGlvbiAncXVh
cmFudGluZV9wdXQnOg0KPiBtbS9rYXNhbi9xdWFyYW50aW5lLmM6MjA3OjE1OiBlcnJvcjogJ2lu
Zm8nIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQ0KPiAgIDIwNyB8ICAg
cWxpbmtfZnJlZSgmaW5mby0+cXVhcmFudGluZV9saW5rLCBjYWNoZSk7DQo+ICAgICAgIHwgICAg
ICAgICAgICAgICBefn5+DQo+IA0KPiBDYXVzZWQgYnkgY29tbWl0DQo+IA0KPiAgIDEyMGQ1OTNh
ODY1MCAoImthc2FuOiBmaXggbWVtb3J5IGxlYWsgb2Yga2FzYW4gcXVhcmFudGluZSIpDQo+IA0K
PiBpbnRlcmFjdGluZyB3aXRoIGNvbW1pdA0KPiANCj4gICBjZmJjOTIwODhlMWQgKCJrYXNhbjog
cmVuYW1lIGdldF9hbGxvYy9mcmVlX2luZm8iKQ0KPiANCj4gQ2FuIHdlIHBsZWFzZSBnZXQgdGhp
cyBzb3J0ZWQgb3V0IG9uY2UgYW5kIGZvciBhbGw/DQo+IA0KPiBJIGhhdmUgYXBwbGllZCB0aGUg
Zm9sbG93aW5nIHBhdGNoIGZvciB0b2RheToNCj4gDQo+IEZyb206IFN0ZXBoZW4gUm90aHdlbGwg
PHNmckBjYW5iLmF1dWcub3JnLmF1Pg0KPiBEYXRlOiBNb24sIDIxIERlYyAyMDIwIDEzOjA3OjQy
ICsxMTAwDQo+IFN1YmplY3Q6IFtQQVRDSF0ga2FzYW46IGZpeCBtZW1vcnkgbGVhayBvZiBrYXNh
biBxdWFyYW50aW5lIGZpeA0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RlcGhlbiBSb3Rod2VsbCA8
c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQo+IC0tLQ0KPiAgbW0va2FzYW4vcXVhcmFudGluZS5jIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvbW0va2FzYW4vcXVhcmFudGluZS5jIGIvbW0va2FzYW4vcXVhcmFu
dGluZS5jDQo+IGluZGV4IDNmM2IzZDkwMmMxOC4uMDkxYTU3Zjk0MmIzIDEwMDY0NA0KPiAtLS0g
YS9tbS9rYXNhbi9xdWFyYW50aW5lLmMNCj4gKysrIGIvbW0va2FzYW4vcXVhcmFudGluZS5jDQo+
IEBAIC0yMDQsNyArMjA0LDcgQEAgYm9vbCBxdWFyYW50aW5lX3B1dChzdHJ1Y3Qga21lbV9jYWNo
ZSAqY2FjaGUsIHZvaWQgKm9iamVjdCkNCj4gIA0KPiAgCXEgPSB0aGlzX2NwdV9wdHIoJmNwdV9x
dWFyYW50aW5lKTsNCj4gIAlpZiAocS0+b2ZmbGluZSkgew0KPiAtCQlxbGlua19mcmVlKCZpbmZv
LT5xdWFyYW50aW5lX2xpbmssIGNhY2hlKTsNCj4gKwkJcWxpbmtfZnJlZSgmbWV0YS0+cXVhcmFu
dGluZV9saW5rLCBjYWNoZSk7IC8vIGZyZWUgb25jZQ0KPiAgCQlsb2NhbF9pcnFfcmVzdG9yZShm
bGFncyk7DQo+ICAJCXJldHVybiBmYWxzZTsgIC8vIGZyZWUgdHdpY2UNCj4gIAl9DQo+IC0tIA0K
PiAyLjI5LjINCj4gDQoNCkhpIFN0ZXBoZW4sDQpQbGVhc2UganVzdCBkcm9wIHRoaXMgcGF0Y2gg
Imthc2FuOiBmaXggbWVtb3J5IGxlYWsgb2Yga2FzYW4gcXVhcmFudGluZSINCmZyb20gbGludXgt
bmV4dC4gT3RoZXJ3aXNlLCBpdCB3b3VsZCBjYXVzZSBkb3VibGUgZnJlZSBpc3N1ZS4NCg0KDQpI
aSBBbmRyZXcsDQoNClNvcnJ5IHRvIGJvdGhlci4NCkkgdXBsb2FkIHRoZSB2MiBzdGFuZGFsb25l
IGZpeHVwIHBhdGNoIHRvIGZpeCB0aGUgbWVtb3J5IGxlYWsgaXNzdWUgb24NCmtlcm5lbC01LjEw
IHN0YWJsZSBhcyBiZWxvdy4NCmh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LW1tJm09MTYwODIw
NzUxODI1MjUyJnc9Mg0KSSB0aGluayB0aGlzIHNsYWIgbWVtb3J5IGxlYWsgaXNzdWUgaXMgaW1w
b3J0YW50LiBJdCdzIGJlY2F1c2Ugd2hlbiB3ZQ0KZG8ga21lbV9jYWNoZV9kZXN0cm95LCBpdCB3
aWxsIHJlcG9ydCBvYmplY3QgcmVtYWluaW5nIGVycm9yLg0KDQpBZGQgdGhpcyB2MiBwYXRjaCB0
byBtbS10cmVlLCBpdCB3aWxsIGhhdmUgY29uZmxpY3RzIHdpdGgNCkFuZHJleSdzIHBhdGNoZXMg
YXMgYmVsb3cuDQoia2FzYW46IHJlbmFtZSBnZXRfYWxsb2MvZnJlZV9pbmZvIg0KImthc2FuOiBz
YW5pdGl6ZSBvYmplY3RzIHdoZW4gbWV0YWRhdGEgZG9lc250IGZpdCINCg0KSSB0aGluayB0aGlz
IHN0YW5kYWxvbmUgZml4dXAgcGF0Y2ggc2hvdWxkIGJlIGFkZGVkICIiYmVmb3JlIiIgQW5kcmV5
J3MNCnBhdGNoIGluIG1tLXRyZWUuIEJlY2F1c2Ugb25seSBtZXJnaW5nIHRoaXMgc3RhbmRhbG9u
ZSBmaXggcGF0Y2ggdG8gNS4xMA0Kc3RhYmxlLCB3ZSBjYW4gcmVzb2x2ZSB0aGlzIGxlYWsgaXNz
dWUgaW5zdGVhZCBvZiBtZXJnaW5nIHRoZSB3aG9sZSANCnBhdGNoc2V0IG9mIEFuZHJleSdzIHBh
dGNoIHRvIDUuMTAgc3RhYmxlLg0KSG93ZXZlciwgbWVyZ2luZyB0aGUgZml4dXAgcGF0Y2ggaW50
byBtbS10cmVlIHdpbGwgY2F1c2Ugc29tZSBjb25mbGljdHMNCmluIG1tLXRyZWUuDQoNClBsZWFz
ZSBoZWxwIHRvIGZpeCB0aGUgY29uZmxpY3RzLg0KQW5kIEkgdGhpbmsgdGhlIGNvbmZsaWN0IGJl
dHdlZW4gc3RhbmRhbG9uZSBmaXh1cCBwYXRjaCBhbmQNCkFuZHJleSdzIHBhdGNoZXMgd2lsbCBi
ZSBmaXhlZCBhcyBiZWxvdy4NCg0KSSB0aGluayB0aGlzIHBhdGNoICJrYXNhbjogcmVuYW1lIGdl
dF9hbGxvYy9mcmVlX2luZm8iIG5lZWQgdG8gcmVuYW1lDQp0aGUgImluZm8iIHRvICJtZXRhIiBh
cyBiZWxvdy4NCg0KLSAgICAgICBxbGlua19mcmVlKCZpbmZvLT5xdWFyYW50aW5lX2xpbmssIGNh
Y2hlKTsNCisgICAgICAgcWxpbmtfZnJlZSgmbWV0YS0+cXVhcmFudGluZV9saW5rLCBjYWNoZSk7
DQoNCg0KVGhpcyBwYXRjaCAia2FzYW46IHNhbml0aXplIG9iamVjdHMgd2hlbiBtZXRhZGF0YSBk
b2VzbnQgZml0IiBuZWVkIHRvDQpyZW1vdmUgdGhlIHFsaW5rX2ZyZWUoKSBhbmQgYWRkIHJldHVy
biBmYWxzZSBhcyBiZWxvdy4NCg0KICAgICAgICBxID0gdGhpc19jcHVfcHRyKCZjcHVfcXVhcmFu
dGluZSk7DQogICAgICAgIGlmIChxLT5vZmZsaW5lKSB7DQotICAgICAgICAgICAgICAgcWxpbmtf
ZnJlZSgmbWV0YS0+cXVhcmFudGluZV9saW5rLCBjYWNoZSk7DQogICAgICAgICAgICAgICAgbG9j
YWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0KLSAgICAgICAgICAgICAgIHJldHVybjsNCisgICAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7DQogICAgICAgIH0NCg0KVGhhbmtzIGEgbG90Lg0KDQo=

