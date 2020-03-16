Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9AF18654B
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 07:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729739AbgCPG7N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 02:59:13 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:42077 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729319AbgCPG7N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 02:59:13 -0400
X-UUID: 588b13627a9243e19d07350d889f03a6-20200316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=rPV2PYDH/uN9KjdiCX6a2FWijysnZQsqChjH/MPZToI=;
        b=hb+6LufoTvu3iX57+jxVZdGiQhxjKGm8aq5CD8U3812KGBAzROjFXHo7GFoW69cEEgdHI3ur0S3FgLL1QEZ3taJC9dSdHkUdKmw/CAb0+hSvqNp8Yf79A9IzctKnWH1tCg49i3Sh1AyhSz5IrA2vZImlDzbAwa7bXqBoA1y1v4g=;
X-UUID: 588b13627a9243e19d07350d889f03a6-20200316
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 414160655; Mon, 16 Mar 2020 14:59:05 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 16 Mar
 2020 14:58:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Mar 2020 14:58:33 +0800
Message-ID: <1584341922.16860.5.camel@mhfsdcap03>
Subject: Re: linux-next: build failure after merge of the rtc tree
From:   Ran Bi <ran.bi@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 16 Mar 2020 14:58:42 +0800
In-Reply-To: <20200316161558.438c7d8b@canb.auug.org.au>
References: <20200316161558.438c7d8b@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D27664E4EE8A3F429F3D7505BE7B8E49CB41C96B659CEF7BC0E7A7F10F3DEE412000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgQmVsbG9uaSwNCg0KT24gTW9uLCAyMDIwLTAzLTE2IGF0IDE2OjE1ICsxMTAwLCBTdGVwaGVu
IFJvdGh3ZWxsIHdyb3RlOg0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBydGMg
dHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkICh4ODZfNjQgYWxsbW9kY29uZmlnKQ0KPiBm
YWlsZWQgbGlrZSB0aGlzOg0KPiANCj4gZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jOiBJbiBmdW5j
dGlvbiAnbXQyNzEyX3J0Y19zZXRfYWxhcm0nOg0KPiBkcml2ZXJzL3J0Yy9ydGMtbXQyNzEyLmM6
MjM1OjY6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSAnaXJxZW4nIFstV3VudXNlZC12YXJpYWJs
ZV0NCj4gICAyMzUgfCAgdTE2IGlycWVuOw0KPiAgICAgICB8ICAgICAgXn5+fn4NCj4gZHJpdmVy
cy9ydGMvcnRjLW10MjcxMi5jOiBBdCB0b3AgbGV2ZWw6DQo+IGRyaXZlcnMvcnRjL3J0Yy1tdDI3
MTIuYzo0MDk6MTogZXJyb3I6IGV4cGVjdGVkICcsJyBvciAnOycgYmVmb3JlICdzdGF0aWMnDQo+
ICAgNDA5IHwgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXQyNzEyX3J0Y19kcml2ZXIg
PSB7DQo+ICAgICAgIHwgXn5+fn5+DQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL3J0
Yy9ydGMtbXQyNzEyLmM6MTQ6DQo+IGRyaXZlcnMvcnRjL3J0Yy1tdDI3MTIuYzogSW4gZnVuY3Rp
b24gJ210MjcxMl9ydGNfZHJpdmVyX2luaXQnOg0KPiBkcml2ZXJzL3J0Yy9ydGMtbXQyNzEyLmM6
NDE4OjI0OiBlcnJvcjogJ210MjcxMl9ydGNfZHJpdmVyJyB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnbXQyNzEyX3J0Y19wcm9iZSc/DQo+ICAg
NDE4IHwgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihtdDI3MTJfcnRjX2RyaXZlcik7DQo+ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fg0KPiBpbmNsdWRlL2xp
bnV4L3BsYXRmb3JtX2RldmljZS5oOjIxNDoyOTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNy
byAncGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyJw0KPiAgIDIxNCB8ICBfX3BsYXRmb3JtX2RyaXZl
cl9yZWdpc3RlcihkcnYsIFRISVNfTU9EVUxFKQ0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn4NCj4gaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kZXZpY2UuaDoyNDQ6Mjog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdtb2R1bGVfZHJpdmVyJw0KPiAgIDI0NCB8ICBt
b2R1bGVfZHJpdmVyKF9fcGxhdGZvcm1fZHJpdmVyLCBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIs
IFwNCj4gICAgICAgfCAgXn5+fn5+fn5+fn5+fg0KPiBkcml2ZXJzL3J0Yy9ydGMtbXQyNzEyLmM6
NDE4OjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnbW9kdWxlX3BsYXRmb3JtX2RyaXZl
cicNCj4gICA0MTggfCBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG10MjcxMl9ydGNfZHJpdmVyKTsN
Cj4gICAgICAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IGRyaXZlcnMvcnRjL3J0Yy1tdDI3
MTIuYzo0MTg6MjQ6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVk
IG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluDQo+ICAgNDE4IHwgbW9k
dWxlX3BsYXRmb3JtX2RyaXZlcihtdDI3MTJfcnRjX2RyaXZlcik7DQo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fg0KPiBpbmNsdWRlL2xpbnV4L3BsYXRm
b3JtX2RldmljZS5oOjIxNDoyOTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyAncGxhdGZv
cm1fZHJpdmVyX3JlZ2lzdGVyJw0KPiAgIDIxNCB8ICBfX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3Rl
cihkcnYsIFRISVNfTU9EVUxFKQ0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn4NCj4gaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kZXZpY2UuaDoyNDQ6Mjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvICdtb2R1bGVfZHJpdmVyJw0KPiAgIDI0NCB8ICBtb2R1bGVfZHJp
dmVyKF9fcGxhdGZvcm1fZHJpdmVyLCBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIsIFwNCj4gICAg
ICAgfCAgXn5+fn5+fn5+fn5+fg0KPiBkcml2ZXJzL3J0Yy9ydGMtbXQyNzEyLmM6NDE4OjE6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnbW9kdWxlX3BsYXRmb3JtX2RyaXZlcicNCj4gICA0
MTggfCBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG10MjcxMl9ydGNfZHJpdmVyKTsNCj4gICAgICAg
fCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRl
L2xpbnV4L2RldmljZS5oOjMxLA0KPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51
eC9wbGF0Zm9ybV9kZXZpY2UuaDoxMywNCj4gICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMv
cnRjL3J0Yy1tdDI3MTIuYzoxNDoNCj4gZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jOiBJbiBmdW5j
dGlvbiAnbXQyNzEyX3J0Y19kcml2ZXJfZXhpdCc6DQo+IGRyaXZlcnMvcnRjL3J0Yy1tdDI3MTIu
Yzo0MTg6MjQ6IGVycm9yOiAnbXQyNzEyX3J0Y19kcml2ZXInIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdtdDI3MTJfcnRjX3Byb2JlJz8NCj4g
ICA0MTggfCBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG10MjcxMl9ydGNfZHJpdmVyKTsNCj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+DQo+IGluY2x1ZGUv
bGludXgvZGV2aWNlL2RyaXZlci5oOjI2NjoxNzogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNy
byAnbW9kdWxlX2RyaXZlcicNCj4gICAyNjYgfCAgX191bnJlZ2lzdGVyKCYoX19kcml2ZXIpICwg
IyNfX1ZBX0FSR1NfXyk7IFwNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn4NCj4g
ZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jOjQxODoxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8gJ21vZHVsZV9wbGF0Zm9ybV9kcml2ZXInDQo+ICAgNDE4IHwgbW9kdWxlX3BsYXRmb3JtX2Ry
aXZlcihtdDI3MTJfcnRjX2RyaXZlcik7DQo+ICAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fg0KPiBkcml2ZXJzL3J0Yy9ydGMtbXQyNzEyLmM6IEluIGZ1bmN0aW9uICdtdDI3MTJfcnRjX2Ry
aXZlcl9pbml0JzoNCj4gZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jOjQxODoxOiB3YXJuaW5nOiBj
b250cm9sIHJlYWNoZXMgZW5kIG9mIG5vbi12b2lkIGZ1bmN0aW9uIFstV3JldHVybi10eXBlXQ0K
PiAgIDQxOCB8IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIobXQyNzEyX3J0Y19kcml2ZXIpOw0KPiAg
ICAgICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gQXQgdG9wIGxldmVsOg0KPiBkcml2ZXJz
L3J0Yy9ydGMtbXQyNzEyLmM6MzEyOjEyOiB3YXJuaW5nOiAnbXQyNzEyX3J0Y19wcm9iZScgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQ0KPiAgIDMxMiB8IHN0YXRpYyBp
bnQgbXQyNzEyX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAg
ICB8ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fg0KPiANCj4gQ2F1c2VkIGJ5IGNvbW1pdA0K
PiANCj4gICAwMGMzNmQ3MzE3MWIgKCJydGM6IGFkZCBzdXBwb3J0IGZvciB0aGUgTWVkaWFUZWsg
TVQyNzEyIFJUQyIpDQo+IA0KPiBJIGhhdmUgdXNlZCB0aGUgdmVyc2lvbiBmcm9tIG5leHQtMjAy
MDAzMTMgZm9yIHRvZGF5Lg0KPiANCg0KVGhpcyBidWlsZCBmYWlsIG9ubHkgaGFwcGVuIGlmIHJ0
Yy1tdDI3MTIgYnVpbGQgYXMgbW9kdWxlIHdoaWNoIEkNCmhhdmVuJ3QgdHJ5LiBJdCBiZWNhdXNl
ICI7IiB3YXMgbWlzc2VkIGFmdGVyICJNT0RVTEVfREVWSUNFX1RBQkxFKG9mLA0KbXQyNzEyX3J0
Y19vZl9tYXRjaCkiLiBTaG91bGQgSSBzZW5kIGEgZml4IHBhdGNoIGZvciB0aGlzIG9yIHJlc2Vu
ZCB0aGUNCndob2xlIHJ0Yy1tdDI3MTIgZHJpdmVyPw0KDQpSZWdhcmRzLA0KUmFuDQo=

