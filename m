Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0AC3FFAD5
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 09:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346599AbhICHGa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 03:06:30 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41922 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1347087AbhICHGU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Sep 2021 03:06:20 -0400
X-UUID: 3a3b462fe8d24ca4a218fd85696981d7-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3BDyl2+T4yjEOti5dQGiM2cmdc+0Fpm3lSQwECJ5FzA=;
        b=cpDC2hCt0pJAseLUliegvcWzu1np4iSh+M4xwIywrruAW9Jo0DLlvNPAvK0yKcpBWVkHFm2cUYTW6vde+9odnDOUbq4Rs5cDp2yLJxv2oUm1QnXtk6aMhwTtVZ1yW5gEo49A6tbOeXyumS1F+sg4ZHs+NYO6OlZKXRhyzG3Guzw=;
X-UUID: 3a3b462fe8d24ca4a218fd85696981d7-20210903
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <trevor.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1200495834; Fri, 03 Sep 2021 15:05:17 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 15:05:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 15:05:16 +0800
Message-ID: <13a16d4b47d4cb36061add729eca6c35ad84c814.camel@mediatek.com>
Subject: Re: linux-next: Tree for Sep 1
 [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko]
From:   Trevor Wu <trevor.wu@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Bicycle Tsai <bicycle.tsai@mediatek.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Fri, 3 Sep 2021 15:05:16 +0800
In-Reply-To: <CAGXv+5HPCUBziGoW9gbtHYGvF9_Pt6JPAFY2CuX05jOnoQUcnw@mail.gmail.com>
References: <20210901181740.3a0a69f2@canb.auug.org.au>
         <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
         <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
         <CAMuHMdXVxNfQYwP7+iMq+CbuDx3wjHgG2xsr9jP4WwL4OLLL-Q@mail.gmail.com>
         <43d231a765a2106b6ef0cbbe842ba3ec37b45878.camel@mediatek.com>
         <CAGXv+5HPCUBziGoW9gbtHYGvF9_Pt6JPAFY2CuX05jOnoQUcnw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVGh1LCAyMDIxLTA5LTAyIGF0IDE3OjE1ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IE9uIFRodSwgU2VwIDIsIDIwMjEgYXQgNDo1MiBQTSBUcmV2b3IgV3UgPHRyZXZvci53dUBtZWRp
YXRlay5jb20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFRodSwgMjAyMS0wOS0wMiBhdCAxMDoy
MiArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gSGkgVHJldm9yLA0KPiA+
ID4gDQo+ID4gPiBPbiBUaHUsIFNlcCAyLCAyMDIxIGF0IDQ6MzcgQU0gVHJldm9yIFd1IDx0cmV2
b3Iud3VAbWVkaWF0ZWsuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgMjAyMS0w
OS0wMSBhdCAxMzo1NSAtMDcwMCwgUmFuZHkgRHVubGFwIHdyb3RlOg0KPiA+ID4gPiA+IE9uIDkv
MS8yMSAxOjE3IEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0KPiA+ID4gPiA+ID4gUGxlYXNl
IGRvIG5vdCBhZGQgYW55IHY1LjE2IHJlbGF0ZWQgY29kZSB0byB5b3VyIGxpbnV4LW5leHQNCj4g
PiA+ID4gPiA+IGluY2x1ZGVkDQo+ID4gPiA+ID4gPiBicmFuY2hlcyB1bnRpbCBhZnRlciB2NS4x
NS1yYzEgaGFzIGJlZW4gcmVsZWFzZWQuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IENoYW5n
ZXMgc2luY2UgMjAyMTA4MzE6DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBvbiB4ODZfNjQ6DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gRVJST1I6IG1vZHBv
c3Q6ICJjbGtkZXZfYWRkIiBbc291bmQvc29jL21lZGlhdGVrL210ODE5NS9zbmQtDQo+ID4gPiA+
ID4gc29jLQ0KPiA+ID4gPiA+IG10ODE5NS1hZmUua29dIHVuZGVmaW5lZCENCj4gPiA+ID4gPiBF
UlJPUjogbW9kcG9zdDogImNsa2Rldl9kcm9wIiBbc291bmQvc29jL21lZGlhdGVrL210ODE5NS9z
bmQtDQo+ID4gPiA+ID4gc29jLQ0KPiA+ID4gPiA+IG10ODE5NS1hZmUua29dIHVuZGVmaW5lZCEN
Cj4gPiA+ID4gPiBFUlJPUjogbW9kcG9zdDogImNsa191bnJlZ2lzdGVyX2dhdGUiDQo+ID4gPiA+
ID4gW3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTUvc25kLQ0KPiA+ID4gPiA+IHNvYy1tdDgxOTUt
YWZlLmtvXSB1bmRlZmluZWQhDQo+ID4gPiA+ID4gRVJST1I6IG1vZHBvc3Q6ICJjbGtfcmVnaXN0
ZXJfZ2F0ZSINCj4gPiA+ID4gPiBbc291bmQvc29jL21lZGlhdGVrL210ODE5NS9zbmQtDQo+ID4g
PiA+ID4gc29jLW10ODE5NS1hZmUua29dIHVuZGVmaW5lZCENCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiBGdWxsIHJhbmRjb25maWcgZmlsZSBpcyBhdHRhY2hlZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4g
DQo+ID4gPiA+IEhpIFJhbmR5LA0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIHByb2JsZW0gaXMgY2F1
c2VkIGJ5IHRoZSBkZXBlbmRlbmN5IGRlY2xhcmF0aW9uLCBiZWNhdXNlDQo+ID4gPiA+IGl0J3MN
Cj4gPiA+ID4gbm90IGENCj4gPiA+ID4gZHJpdmVyIGZvciB4ODZfNjQuDQo+ID4gPiA+IFRoZSBk
ZXBlbmRlbmN5IGRlY2xhcmF0aW9uIGhhcyBiZWVuIGFkZGVkIGluIHRoZSBmb2xsb3dpbmcNCj4g
PiA+ID4gcGF0Y2guDQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiANCj4gPiANCmh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvYWxz
YS1kZXZlbC9wYXRjaC83ZTYyOGUzNTliZGUwNGNlYjlkZGQ3NGE0NTkzMTA1OWI0YTQ2MjNjLjE2
MzA0MTU4NjAuZ2l0LmdlZXJ0KnJlbmVzYXNAZ2xpZGVyLmJlL19fO0t3ISFDVFJOS0E5d01nMEFS
Ynchd01xMTMwbUFvLXM0NXBQNlNoUTFTOFVJUnVKTGh3T25DYlFOQVFISUUyenZOaGpBZDY3aDFy
bHFrSUR4SnZDNV9nJA0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gVGhhdCBpcyBub3Qgc3VmZmlj
aWVudCwgaWYgQ09NUElMRV9URVNUIGlzIGVuYWJsZWQuDQo+ID4gPiANCj4gPiA+IExvb2tzIGxp
a2UgaXQgbmVlZHMgYSBkZXBlbmRlbmN5IG9uIENPTU1PTl9DTEssIHRvby4NCj4gPiA+IA0KPiA+
ID4gR3J7b2V0amUsZWV0aW5nfXMsDQo+ID4gPiANCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0DQo+ID4gPiANCj4gPiANCj4gPiBIaSBHZWVydCwNCj4gPiANCj4gPiBCZWNhdXNl
IGl0J3MgYSBBUk02NCBkcml2ZXIsIEFSTTY0IHdpbGwgc2VsZWN0IENPTU1PTl9DTEsuDQo+ID4g
SXQgc2VlbXMgdGhhdCBzb21lIGRlcGVuZGVuY3kgc2hvdWxkIGJlIGNoZWNrZWQgaWYgQ09NUElM
RV9URVNUIGlzDQo+ID4gZW5hYmxlZCBhbmQgdGhlIGRyaXZlciBpcyBjb21waWxlZCBvbiBub24t
QVJNNjQgZW52aXJvbm1lbnQuDQo+ID4gV2UgZG9uJ3QgZXhwZWN0IHRoZSBkcml2ZXIgY2FuIGJl
IHVzZWQgb24gbm9uLUFSTTY0IGVudmlyb25tZW50LG1heQ0KPiA+IEkNCj4gPiByZW1vdmUgQ09N
UElMRV9URVNUIHRvIHNvbHZlIHRoZSBwcm9ibGVtPw0KPiA+IElmIHRoZSBkcml2ZXIgb25seSBk
ZXBlbmRzIG9uIEFSQ0hfTUVESUFURUssIGl0IG11c3QgYmUgY29tcGlsZWQgb24NCj4gPiBBUk02
NC4NCj4gDQo+IFRoZSB3aG9sZSBwb2ludCBvZiBDT01QSUxFX1RFU1QgaXMgdGhhdCBpdCBnZXRz
IGNvbXBpbGUtdGVzdGVkLiBJdA0KPiBkb2Vzbid0DQo+IGhhdmUgdG8gYWN0dWFsbHkgcnVuLg0K
PiANCj4gU2luY2UgdGhlIGRyaXZlciBpcyB1c2luZyBwYXJ0cyBvZiB0aGUgY29tbW9uIGNsayBm
cmFtZXdvcmssIGl0DQo+IHNob3VsZA0KPiBkZWNsYXJlIGFuIGV4cGxpY2l0IGRlcGVuZGVuY3ks
IGluc3RlYWQgb2YgaW1wbGljaXRseSBkZXBlbmRpbmcgb24NCj4gb3RoZXIgc3ltYm9scyB0byBl
bmFibGUgaXQuDQo+IA0KPiBDaGVuWXUNCg0KSGkgQ2hlbll1LA0KDQpHb3QgaXQuIEkgd2lsbCBz
ZW5kIGEgcGF0Y2ggZm9yIHRoZSBwcm9ibGVtLg0KDQpUaGFua3MsDQpUcmV2b3INCg==

