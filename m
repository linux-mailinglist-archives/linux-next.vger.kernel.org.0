Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA60180D85
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 02:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbgCKBa0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 21:30:26 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:36730 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727506AbgCKBa0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 21:30:26 -0400
X-UUID: eb7ded84783d4dce8be9535cc7fa05f2-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=YjL6GvaGAfKjZb4Bd10orYHd/UlpZ+NB3DEOe0Lavh4=;
        b=YoXB69XDWQdnyGX6KxCdgfsfteS7hA6mEy8dvqfhOxRYvyo/CEFy61t6OuaAN4NuCWiQQ0QZ+5n96W+2UwtOg6Quu2ZMbNA0SA1ld80eo1PfGjeULUQh4q64BPUcPNMwvyuC1Ct08iRLsYO1Ni3S+FZzUhMQqI/JELq86JXlPrQ=;
X-UUID: eb7ded84783d4dce8be9535cc7fa05f2-20200311
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <walter-zh.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 376188209; Wed, 11 Mar 2020 09:30:17 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 09:30:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 09:30:25 +0800
Message-ID: <1583890215.17522.3.camel@mtksdccf07>
Subject: Re: mmotm 2020-03-03-22-28 uploaded (warning: objtool:)
From:   Walter Wu <walter-zh.wu@mediatek.com>
To:     Peter Zijlstra <peterz@infradead.org>
CC:     Randy Dunlap <rdunlap@infradead.org>, <akpm@linux-foundation.org>,
        <broonie@kernel.org>, <linux-fsdevel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-next@vger.kernel.org>, <mhocko@suse.cz>,
        <mm-commits@vger.kernel.org>, <sfr@canb.auug.org.au>,
        Josh Poimboeuf <jpoimboe@redhat.com>, <dvyukov@google.com>
Date:   Wed, 11 Mar 2020 09:30:15 +0800
In-Reply-To: <20200305095436.GV2596@hirez.programming.kicks-ass.net>
References: <20200304062843.9yA6NunM5%akpm@linux-foundation.org>
         <cd1c6bd2-3db3-0058-f3b4-36b2221544a0@infradead.org>
         <20200305081717.GT2596@hirez.programming.kicks-ass.net>
         <20200305081842.GB2619@hirez.programming.kicks-ass.net>
         <1583399782.17146.14.camel@mtksdccf07>
         <20200305095436.GV2596@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8D5D6D17B14E3DAC78B6AD865BB500C3DE8345FEE21D4308EE916AB05D77B12C2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDEwOjU0ICswMTAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToN
Cj4gT24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMDU6MTY6MjJQTSArMDgwMCwgV2FsdGVyIFd1IHdy
b3RlOg0KPiA+IE9uIFRodSwgMjAyMC0wMy0wNSBhdCAwOToxOCArMDEwMCwgUGV0ZXIgWmlqbHN0
cmEgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIE1hciAwNSwgMjAyMCBhdCAwOToxNzoxN0FNICswMTAw
LCBQZXRlciBaaWpsc3RyYSB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCBNYXIgMDQsIDIwMjAgYXQg
MDk6MzQ6NDlBTSAtMDgwMCwgUmFuZHkgRHVubGFwIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiA+ID4g
bW0va2FzYW4vY29tbW9uLm86IHdhcm5pbmc6IG9ianRvb2w6IGthc2FuX3JlcG9ydCgpKzB4MTM6
IGNhbGwgdG8gcmVwb3J0X2VuYWJsZWQoKSB3aXRoIFVBQ0NFU1MgZW5hYmxlZA0KPiA+ID4gPiAN
Cj4gPiA+ID4gSSB1c2VkIG5leHQvbWFzdGVyIGluc3RlYWQsIGFuZCBmb3VuZCB0aGUgYmVsb3cg
YnJva2VuIGNvbW1pdA0KPiA+ID4gPiByZXNwb25zaWJsZSBmb3IgdGhpcy4NCj4gPiA+IA0KPiA+
ID4gPiBAQCAtNjM0LDEyICs2MzcsMjAgQEAgdm9pZCBrYXNhbl9mcmVlX3NoYWRvdyhjb25zdCBz
dHJ1Y3Qgdm1fc3RydWN0ICp2bSkNCj4gPiA+ID4gICNlbmRpZg0KPiA+ID4gPiAgDQo+ID4gPiA+
ICBleHRlcm4gdm9pZCBfX2thc2FuX3JlcG9ydCh1bnNpZ25lZCBsb25nIGFkZHIsIHNpemVfdCBz
aXplLCBib29sIGlzX3dyaXRlLCB1bnNpZ25lZCBsb25nIGlwKTsNCj4gPiA+ID4gK2V4dGVybiBi
b29sIHJlcG9ydF9lbmFibGVkKHZvaWQpOw0KPiA+ID4gPiAgDQo+ID4gPiA+IC12b2lkIGthc2Fu
X3JlcG9ydCh1bnNpZ25lZCBsb25nIGFkZHIsIHNpemVfdCBzaXplLCBib29sIGlzX3dyaXRlLCB1
bnNpZ25lZCBsb25nIGlwKQ0KPiA+ID4gPiArYm9vbCBrYXNhbl9yZXBvcnQodW5zaWduZWQgbG9u
ZyBhZGRyLCBzaXplX3Qgc2l6ZSwgYm9vbCBpc193cml0ZSwgdW5zaWduZWQgbG9uZyBpcCkNCj4g
PiA+ID4gIHsNCj4gPiA+ID4gLQl1bnNpZ25lZCBsb25nIGZsYWdzID0gdXNlcl9hY2Nlc3Nfc2F2
ZSgpOw0KPiA+ID4gPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gPiA+ICsNCj4gPiA+ID4g
KwlpZiAobGlrZWx5KCFyZXBvcnRfZW5hYmxlZCgpKSkNCj4gPiA+ID4gKwkJcmV0dXJuIGZhbHNl
Ow0KPiA+ID4gDQo+ID4gPiBUaGlzIGFkZHMgYW4gZXhwbGljaXQgY2FsbCBiZWZvcmUgdGhlIHVz
ZXJfYWNjZXNzX3NhdmUoKSBhbmQgdGhhdCBpcyBhDQo+ID4gPiBzdHJhaWdodCBvbiBidWcuDQo+
ID4gPiANCj4gPiBIaSBQZXRlciwNCj4gPiANCj4gPiBUaGFua3MgZm9yIHlvdXIgaGVscC4gVW5m
b3J0dW5hdGVseSwgSSBkb24ndCByZXByb2R1Y2UgaXQgaW4gb3VyDQo+ID4gZW52aXJvbm1lbnQs
IHNvIEkgaGF2ZSBhc2tlZCBTdGVwaGVuLCBpZiBJIGNhbiByZXByb2R1Y2UgaXQsIHRoZW4gd2UN
Cj4gPiB3aWxsIHNlbmQgbmV3IHBhdGNoLg0KPiANCj4gVGhlIHBhdGNoIGlzIHRyaXZpYWw7IGFu
ZCBhbGwgeW91IG5lZWQgaXMgYW4geDg2XzY0IChjcm9zcykgY29tcGlsZXIgdG8NCj4gcmVwcm9k
dWNlLg0KPiANCj4gDQo+IGRpZmYgLS1naXQgYS9tbS9rYXNhbi9jb21tb24uYyBiL21tL2thc2Fu
L2NvbW1vbi5jDQo+IGluZGV4IGFkMmRjMGM5Y2MxNy4uMjkwNjM1OGU0MmYwIDEwMDY0NA0KPiAt
LS0gYS9tbS9rYXNhbi9jb21tb24uYw0KPiArKysgYi9tbS9rYXNhbi9jb21tb24uYw0KPiBAQCAt
NjE4LDE2ICs2MTgsMTcgQEAgZXh0ZXJuIGJvb2wgcmVwb3J0X2VuYWJsZWQodm9pZCk7DQo+ICAN
Cj4gIGJvb2wga2FzYW5fcmVwb3J0KHVuc2lnbmVkIGxvbmcgYWRkciwgc2l6ZV90IHNpemUsIGJv
b2wgaXNfd3JpdGUsIHVuc2lnbmVkIGxvbmcgaXApDQo+ICB7DQo+IC0JdW5zaWduZWQgbG9uZyBm
bGFnczsNCj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzID0gdXNlcl9hY2Nlc3Nfc2F2ZSgpOw0KPiAr
CWJvb2wgcmV0ID0gZmFsc2U7DQo+ICANCj4gLQlpZiAobGlrZWx5KCFyZXBvcnRfZW5hYmxlZCgp
KSkNCj4gLQkJcmV0dXJuIGZhbHNlOw0KPiArCWlmIChsaWtlbHkocmVwb3J0X2VuYWJsZWQoKSkp
IHsNCj4gKwkJX19rYXNhbl9yZXBvcnQoYWRkciwgc2l6ZSwgaXNfd3JpdGUsIGlwKTsNCj4gKwkJ
cmV0ID0gdHJ1ZTsNCj4gKwl9DQo+ICANCj4gLQlmbGFncyA9IHVzZXJfYWNjZXNzX3NhdmUoKTsN
Cj4gLQlfX2thc2FuX3JlcG9ydChhZGRyLCBzaXplLCBpc193cml0ZSwgaXApOw0KPiAgCXVzZXJf
YWNjZXNzX3Jlc3RvcmUoZmxhZ3MpOw0KPiAgDQo+IC0JcmV0dXJuIHRydWU7DQo+ICsJcmV0dXJu
IHJldDsNCj4gIH0NCj4gIA0KPiAgI2lmZGVmIENPTkZJR19NRU1PUllfSE9UUExVRw0KDQpSZXZp
ZXdlZC1hbmQtdGVzdGVkLWJ5Og0KDQoNCg0KDQoNCg0K

