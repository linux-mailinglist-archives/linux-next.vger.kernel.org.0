Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2F1117C73A
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 21:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgCFUqA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 15:46:00 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:1575 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726194AbgCFUp7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 15:45:59 -0500
X-UUID: ff4e7cfd56f94ad9ae4dfdd8f2b94adf-20200307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BteGj9cR8u5AHAP2PqMX0uctwlUFo5lvUvScIiAzIgo=;
        b=S/O7B5UR9UkLp+UURfcL4zlKp3I2x+S9QA7zOwoBkoido8aMPuDSWba2SZbxYQVKLExUTE1qSrU1pLwpxzwB+xOFG1CtOk0ZXiCiGJvRBgoFPeClFeTpgI6y78BAEsXVrFyV/D9opZSfIJ4R/LB9cjbuNb5hJRT1Yfh6PXjoPvo=;
X-UUID: ff4e7cfd56f94ad9ae4dfdd8f2b94adf-20200307
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <walter-zh.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1011641253; Sat, 07 Mar 2020 04:45:56 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Mar 2020 04:43:44 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 7 Mar 2020 04:46:16 +0800
Message-ID: <1583527548.8911.23.camel@mtksdccf07>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
From:   Walter Wu <walter-zh.wu@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>
Date:   Sat, 7 Mar 2020 04:45:48 +0800
In-Reply-To: <1583521173.8911.9.camel@mtksdccf07>
References: <20200305163743.7128c251@canb.auug.org.au>
         <1583398476.17146.6.camel@mtksdccf07>
         <20200305203356.307c0a18@canb.auug.org.au>
         <1583521173.8911.9.camel@mtksdccf07>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gU2F0LCAyMDIwLTAzLTA3IGF0IDAyOjU5ICswODAwLCBXYWx0ZXIgV3Ugd3JvdGU6DQo+IE9u
IFRodSwgMjAyMC0wMy0wNSBhdCAyMDozMyArMTEwMCwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToN
Cj4gPiBIaSBXYWx0ZXIsDQo+ID4gDQo+ID4gT24gVGh1LCA1IE1hciAyMDIwIDE2OjU0OjM2ICsw
ODAwIFdhbHRlciBXdSA8d2FsdGVyLXpoLnd1QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPg0K
PiA+ID4gSSdtIHNvcnJ5IGZvciB0aGUgYnVpbGQgd2FybmluZywgaXQgZG9lc24ndCBnZW5lcmF0
ZSBpbiBvdXIgbG9jYWwNCj4gPiA+IGVudmlyb25tZW50KGFybTY0L3g4Nl82NCkuIFdvdWxkIHlv
dSB0ZWxsIG1lIHdoYXQgdG9vbGNoYWlucyBjYW4NCj4gPiA+IHJlcHJvZHVjZSBpdD8NCj4gPiAN
Cj4gPiBJIGFtIHVzaW5nIGEgUG93ZXJQQyBMRSBob3N0ZWQgeDg2XzY0IGdjYyB2OS4yLjEgKERl
YmlhbiBjcm9zcyBjb21waWxlcikuDQo+ID4gDQo+ID4gJCAvdXNyL2Jpbi94ODZfNjQtbGludXgt
Z251LWdjYyAtLXZlcnNpb24NCj4gPiB4ODZfNjQtbGludXgtZ251LWdjYyAoRGViaWFuIDkuMi4x
LTIxKSA5LjIuMSAyMDE5MTEzMA0KPiA+IA0KPiBIaSBTdGVwaGVuLA0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIGluZm9ybWF0aW9uLCBJdCBkb2Vzbid0IGdlbmVyYXRlIHdhcm5pbmcgbWVzc2FnZSBp
bg0KPiBnY2MtOC4zLjAoRGViaWFuIDguMy4wLTYpIGFmdGVyIGFwcGx5IGJlbG93IHBhdGNoLg0K
PiANCj4gDQo+IC0tLSBhL2xpYi90ZXN0X2thc2FuLmMNCj4gKysrIGIvbGliL3Rlc3Rfa2FzYW4u
Yw0KPiBAQCAtMjg2LDE3ICsyODYsMTkgQEAgc3RhdGljIG5vaW5saW5lIHZvaWQgX19pbml0DQo+
IGttYWxsb2Nfb29iX2luX21lbXNldCh2b2lkKQ0KPiAgc3RhdGljIG5vaW5saW5lIHZvaWQgX19p
bml0IGttYWxsb2NfbWVtbW92ZV9pbnZhbGlkX3NpemUodm9pZCkNCj4gIHsNCj4gICAgICAgICBj
aGFyICpwdHI7DQo+IC0gICAgICAgc2l6ZV90IHNpemUgPSA2NDsNCj4gKyAgICAgICBzaXplX3Qg
c2l6ZTEgPSA2NDsNCj4gKyAgICAgICBzaXplX3Qgc2l6ZTIgPSA2MjsNCj4gDQo+ICAgICAgICAg
cHJfaW5mbygiaW52YWxpZCBzaXplIGluIG1lbW1vdmVcbiIpOw0KPiAtICAgICAgIHB0ciA9IGtt
YWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7DQo+ICsgICAgICAgcHRyID0ga21hbGxvYyhzaXplMSwg
R0ZQX0tFUk5FTCk7DQo+ICAgICAgICAgaWYgKCFwdHIpIHsNCj4gICAgICAgICAgICAgICAgIHBy
X2VycigiQWxsb2NhdGlvbiBmYWlsZWRcbiIpOw0KPiAgICAgICAgICAgICAgICAgcmV0dXJuOw0K
PiAgICAgICAgIH0NCj4gDQo+IC0gICAgICAgbWVtc2V0KChjaGFyICopcHRyLCAwLCA2NCk7DQo+
IC0gICAgICAgbWVtbW92ZSgoY2hhciAqKXB0ciwgKGNoYXIgKilwdHIgKyA0LCAtMik7DQo+ICsg
ICAgICAgbWVtc2V0KChjaGFyICopcHRyLCAwLCBzaXplMSk7DQo+ICsgICAgICAgLyogdGhlIHNp
emUgb2YgbWVtbW92ZSgpIGlzIG5lZ2F0aXZlIG51bWJlcnMgKi8NCj4gKyAgICAgICBtZW1tb3Zl
KChjaGFyICopcHRyLCAoY2hhciAqKXB0ciArIDQsIHNpemUyIC0gc2l6ZTEpOw0KPiAgICAgICAg
IGtmcmVlKHB0cik7DQo+ICB9DQo+IA0KSGkgU3RlcGhlbiwNCg0KUGxlYXNlIGlnbm9yZSBwcmV2
aW91cyBtYWlsLCBJIG1pc3MgdGhlIG1lc3NhZ2UuIEJlbG93IHRoZSBwYXRjaCB3aWxsDQpmaXgg
dGhlIHdhcm5pbmcuDQoNCg0KLS0tIGEvbGliL3Rlc3Rfa2FzYW4uYw0KKysrIGIvbGliL3Rlc3Rf
a2FzYW4uYw0KQEAgLTI4NiwxNyArMjg2LDE5IEBAIHN0YXRpYyBub2lubGluZSB2b2lkIF9faW5p
dA0Ka21hbGxvY19vb2JfaW5fbWVtc2V0KHZvaWQpDQogc3RhdGljIG5vaW5saW5lIHZvaWQgX19p
bml0IGttYWxsb2NfbWVtbW92ZV9pbnZhbGlkX3NpemUodm9pZCkNCiB7DQogICAgICAgIGNoYXIg
KnB0cjsNCi0gICAgICAgc2l6ZV90IHNpemUgPSA2NDsNCisgICAgICAgc2l6ZV90IHNpemUxID0g
NjQ7DQorICAgICAgIHZvbGF0aWxlIHNpemVfdCBzaXplMiA9IC0yOw0KDQogICAgICAgIHByX2lu
Zm8oImludmFsaWQgc2l6ZSBpbiBtZW1tb3ZlXG4iKTsNCi0gICAgICAgcHRyID0ga21hbGxvYyhz
aXplLCBHRlBfS0VSTkVMKTsNCisgICAgICAgcHRyID0ga21hbGxvYyhzaXplMSwgR0ZQX0tFUk5F
TCk7DQogICAgICAgIGlmICghcHRyKSB7DQogICAgICAgICAgICAgICAgcHJfZXJyKCJBbGxvY2F0
aW9uIGZhaWxlZFxuIik7DQogICAgICAgICAgICAgICAgcmV0dXJuOw0KICAgICAgICB9DQoNCi0g
ICAgICAgbWVtc2V0KChjaGFyICopcHRyLCAwLCA2NCk7DQotICAgICAgIG1lbW1vdmUoKGNoYXIg
KilwdHIsIChjaGFyICopcHRyICsgNCwgLTIpOw0KKyAgICAgICBtZW1zZXQoKGNoYXIgKilwdHIs
IDAsIHNpemUxKTsNCisgICAgICAgLyogdGhlIHNpemUgb2YgbWVtbW92ZSgpIGlzIG5lZ2F0aXZl
IG51bWJlciAqLw0KKyAgICAgICBtZW1tb3ZlKChjaGFyICopcHRyLCAoY2hhciAqKXB0ciArIDQs
IHNpemUyKTsNCiAgICAgICAga2ZyZWUocHRyKTsNCiB9DQo=

