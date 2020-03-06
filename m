Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4C917C5CA
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 19:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCFS7o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 13:59:44 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:5155 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726083AbgCFS7o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 13:59:44 -0500
X-UUID: 94c557faed8844b3a9c8f8c465c5f476-20200307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MdqWKHfBwguVDBEPuH6JAevmmLUjB/lFGpuvwjDr5go=;
        b=FLovj0sE4sOfEVhAxLM8e3f55Dr8gaydmIrNIE/1qYDEavK6lywzwbZMjsKserLP8I0AbQ0+u4QGxBvtLU4G/tZ4+RLCbbFd3cptHXZm87iNTgyZRV58TYgfwQD8+Ne7uDCCl15iBWrBF99HbOffsRzLm0mgN9K9qFJZzL+YTx4=;
X-UUID: 94c557faed8844b3a9c8f8c465c5f476-20200307
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <walter-zh.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1790914881; Sat, 07 Mar 2020 02:59:35 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Mar 2020 03:00:48 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Sat, 7 Mar
 2020 03:00:01 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 7 Mar 2020 03:00:01 +0800
Message-ID: <1583521173.8911.9.camel@mtksdccf07>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
From:   Walter Wu <walter-zh.wu@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>
Date:   Sat, 7 Mar 2020 02:59:33 +0800
In-Reply-To: <20200305203356.307c0a18@canb.auug.org.au>
References: <20200305163743.7128c251@canb.auug.org.au>
         <1583398476.17146.6.camel@mtksdccf07>
         <20200305203356.307c0a18@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDIwOjMzICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBXYWx0ZXIsDQo+IA0KPiBPbiBUaHUsIDUgTWFyIDIwMjAgMTY6NTQ6MzYgKzA4MDAg
V2FsdGVyIFd1IDx3YWx0ZXItemgud3VAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPg0KPiA+IEkn
bSBzb3JyeSBmb3IgdGhlIGJ1aWxkIHdhcm5pbmcsIGl0IGRvZXNuJ3QgZ2VuZXJhdGUgaW4gb3Vy
IGxvY2FsDQo+ID4gZW52aXJvbm1lbnQoYXJtNjQveDg2XzY0KS4gV291bGQgeW91IHRlbGwgbWUg
d2hhdCB0b29sY2hhaW5zIGNhbg0KPiA+IHJlcHJvZHVjZSBpdD8NCj4gDQo+IEkgYW0gdXNpbmcg
YSBQb3dlclBDIExFIGhvc3RlZCB4ODZfNjQgZ2NjIHY5LjIuMSAoRGViaWFuIGNyb3NzIGNvbXBp
bGVyKS4NCj4gDQo+ICQgL3Vzci9iaW4veDg2XzY0LWxpbnV4LWdudS1nY2MgLS12ZXJzaW9uDQo+
IHg4Nl82NC1saW51eC1nbnUtZ2NjIChEZWJpYW4gOS4yLjEtMjEpIDkuMi4xIDIwMTkxMTMwDQo+
IA0KSGkgU3RlcGhlbiwNCg0KVGhhbmtzIGZvciB5b3VyIGluZm9ybWF0aW9uLCBJdCBkb2Vzbid0
IGdlbmVyYXRlIHdhcm5pbmcgbWVzc2FnZSBpbg0KZ2NjLTguMy4wKERlYmlhbiA4LjMuMC02KSBh
ZnRlciBhcHBseSBiZWxvdyBwYXRjaC4NCg0KDQotLS0gYS9saWIvdGVzdF9rYXNhbi5jDQorKysg
Yi9saWIvdGVzdF9rYXNhbi5jDQpAQCAtMjg2LDE3ICsyODYsMTkgQEAgc3RhdGljIG5vaW5saW5l
IHZvaWQgX19pbml0DQprbWFsbG9jX29vYl9pbl9tZW1zZXQodm9pZCkNCiBzdGF0aWMgbm9pbmxp
bmUgdm9pZCBfX2luaXQga21hbGxvY19tZW1tb3ZlX2ludmFsaWRfc2l6ZSh2b2lkKQ0KIHsNCiAg
ICAgICAgY2hhciAqcHRyOw0KLSAgICAgICBzaXplX3Qgc2l6ZSA9IDY0Ow0KKyAgICAgICBzaXpl
X3Qgc2l6ZTEgPSA2NDsNCisgICAgICAgc2l6ZV90IHNpemUyID0gNjI7DQoNCiAgICAgICAgcHJf
aW5mbygiaW52YWxpZCBzaXplIGluIG1lbW1vdmVcbiIpOw0KLSAgICAgICBwdHIgPSBrbWFsbG9j
KHNpemUsIEdGUF9LRVJORUwpOw0KKyAgICAgICBwdHIgPSBrbWFsbG9jKHNpemUxLCBHRlBfS0VS
TkVMKTsNCiAgICAgICAgaWYgKCFwdHIpIHsNCiAgICAgICAgICAgICAgICBwcl9lcnIoIkFsbG9j
YXRpb24gZmFpbGVkXG4iKTsNCiAgICAgICAgICAgICAgICByZXR1cm47DQogICAgICAgIH0NCg0K
LSAgICAgICBtZW1zZXQoKGNoYXIgKilwdHIsIDAsIDY0KTsNCi0gICAgICAgbWVtbW92ZSgoY2hh
ciAqKXB0ciwgKGNoYXIgKilwdHIgKyA0LCAtMik7DQorICAgICAgIG1lbXNldCgoY2hhciAqKXB0
ciwgMCwgc2l6ZTEpOw0KKyAgICAgICAvKiB0aGUgc2l6ZSBvZiBtZW1tb3ZlKCkgaXMgbmVnYXRp
dmUgbnVtYmVycyAqLw0KKyAgICAgICBtZW1tb3ZlKChjaGFyICopcHRyLCAoY2hhciAqKXB0ciAr
IDQsIHNpemUyIC0gc2l6ZTEpOw0KICAgICAgICBrZnJlZShwdHIpOw0KIH0NCg0K

