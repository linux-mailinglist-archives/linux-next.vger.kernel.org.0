Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B9B3FAFA7
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 04:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbhH3CBy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Aug 2021 22:01:54 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50010 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235552AbhH3CBy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Aug 2021 22:01:54 -0400
X-UUID: bf59ae2cd0f3408f9c60b258a15e654b-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Qyat5x/fiJC8kmOPCW3EzEYS2O3hrzOq+rV6SCzvXHk=;
        b=ZYnQFQD1W2v+dXcpuDD/op5QT1X8z+2GzwyFFgNz2l8hUhMYcei63/D+FLkONW/yDjNFAZ7JHQkcS7vTEL96eFTQtr0FzQmXazyXWM6ZdVlS8SoPitLdwRj1gkiI6Y/1MJ+IhFFa4xWdQ4YIVxjP0hKsPlmKDSMH1605kdy4v0M=;
X-UUID: bf59ae2cd0f3408f9c60b258a15e654b-20210830
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <trevor.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1432520261; Mon, 30 Aug 2021 10:00:57 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 10:00:56 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 30 Aug 2021 10:00:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 10:00:55 +0800
Message-ID: <2310d7eebf0063eafa86657879238d1d07f180dd.camel@mediatek.com>
Subject: Re: linux-next: Tree for Aug 27 (sound/soc/mediatek: Kconfig)
From:   Trevor Wu <trevor.wu@mediatek.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
Date:   Mon, 30 Aug 2021 10:00:55 +0800
In-Reply-To: <f0fcbb1e-bf15-5ad2-6ff5-55b7c2acb29c@infradead.org>
References: <20210827212415.48ac8b64@canb.auug.org.au>
         <f0fcbb1e-bf15-5ad2-6ff5-55b7c2acb29c@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gRnJpLCAyMDIxLTA4LTI3IGF0IDExOjM5IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+
IE9uIDgvMjcvMjEgNDoyNCBBTSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToNCj4gPiBIaSBhbGws
DQo+ID4gDQo+ID4gQ2hhbmdlcyBzaW5jZSAyMDIxMDgyNjoNCj4gPiANCj4gPiBUaGUga2J1aWxk
IHRyZWUgc3RpbGwgaGFkIGl0cyBidWlsZCBmYWlsdXJlIGZvciB3aGljaCBJIHJldmVydGVkIGEN
Cj4gPiBjb21taXQuDQo+ID4gDQo+ID4gVGhlIHVtbCB0cmVlIGdhaW5lZCBhIGNvbmZsaWN0IGFn
YWluc3QgdGhlIGFzbS1nZW5lcmljIHRyZWUuDQo+ID4gDQo+ID4gVGhlIG5ldC1uZXh0IHRyZWUg
c3RpbGwgaGFkIGl0cyBidWlsZCBmYWlsdXJlIGZvciB3aGljaCBJIGFwcGxpZWQgYQ0KPiA+IHBh
dGNoIGFuZCBpdCBhbHNvIGdhaW5lZCBhIHNlbWFudGljIGNvbmZsaWN0IGFnYWluc3QgTGludXMn
IHRyZWUuDQo+ID4gDQo+ID4gVGhlIGJwZi1uZXh0IHRyZWUgbG9zdCBpdHMgYnVpbGQgZmFpbHVy
ZS4NCj4gPiANCj4gPiBUaGUgdGlwIHRyZWUgZ2FpbmVkIGNvbmZsaWN0cyBhZ2FpbnN0IHRoZSBh
cm02NCB0cmVlLg0KPiA+IA0KPiA+IFRoZSBmdHJhY2UgdHJlZSBnYWluZWQgYSBjb25mbGljdCBh
Z2FpbnN0IHRoZSB1bWwgdHJlZS4NCj4gPiANCj4gPiBUaGUgdmZpbyB0cmVlIGdhaW5lZCBjb25m
bGljdHMgYWdhaW5zdCB0aGUgZHJtIHRyZWUuDQo+ID4gDQo+ID4gVGhlIGtzcHAgdHJlZSBzdGls
bCBoYWQgaXRzIGJ1aWxkIGZhaWx1cmUgc28gSSB1c2VkIHRoZSB2ZXJzaW9uDQo+ID4gZnJvbQ0K
PiA+IG5leHQtMjAyMTA4MjUuDQo+ID4gDQo+ID4gTm9uLW1lcmdlIGNvbW1pdHMgKHJlbGF0aXZl
IHRvIExpbnVzJyB0cmVlKTogOTg2Nw0KPiA+ICAgOTUyOCBmaWxlcyBjaGFuZ2VkLCA1NTI1MDcg
aW5zZXJ0aW9ucygrKSwgMjI3MDU0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4gLS0tLS0tLS0tLS0NCj4gPiANCj4gPiBJIGhhdmUgY3JlYXRlZCB0b2RheSdzIGxpbnV4LW5l
eHQgdHJlZSBhdA0KPiA+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0DQo+ID4gKHBhdGNoZXMgYXQgDQo+ID4gaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVs
L25leHQvX187ISFDVFJOS0E5d01nMEFSYnchMUVscmQzQzdWc00zdmVINTNjVWJRTDZhSlotd3Z4
WEZRUGZ2NDl5NGprQmFDX05Zb3o2NUZkMVhEV1VZTnVVZW1nJA0KPiA+ICAgKS4gIElmIHlvdQ0K
PiA+IGFyZSB0cmFja2luZyB0aGUgbGludXgtbmV4dCB0cmVlIHVzaW5nIGdpdCwgeW91IHNob3Vs
ZCBub3QgdXNlICJnaXQNCj4gPiBwdWxsIg0KPiA+IHRvIGRvIHNvIGFzIHRoYXQgd2lsbCB0cnkg
dG8gbWVyZ2UgdGhlIG5ldyBsaW51eC1uZXh0IHJlbGVhc2Ugd2l0aA0KPiA+IHRoZQ0KPiA+IG9s
ZCBvbmUuICBZb3Ugc2hvdWxkIHVzZSAiZ2l0IGZldGNoIiBhbmQgY2hlY2tvdXQgb3IgcmVzZXQg
dG8gdGhlDQo+ID4gbmV3DQo+ID4gbWFzdGVyLg0KPiA+IA0KPiA+IFlvdSBjYW4gc2VlIHdoaWNo
IHRyZWVzIGhhdmUgYmVlbiBpbmNsdWRlZCBieSBsb29raW5nIGluIHRoZQ0KPiA+IE5leHQvVHJl
ZXMNCj4gPiBmaWxlIGluIHRoZSBzb3VyY2UuICBUaGVyZSBhcmUgYWxzbyBxdWlsdC1pbXBvcnQu
bG9nIGFuZCBtZXJnZS5sb2cNCj4gPiBmaWxlcyBpbiB0aGUgTmV4dCBkaXJlY3RvcnkuICBCZXR3
ZWVuIGVhY2ggbWVyZ2UsIHRoZSB0cmVlIHdhcw0KPiA+IGJ1aWx0DQo+ID4gd2l0aCBhIHBwYzY0
X2RlZmNvbmZpZyBmb3IgcG93ZXJwYywgYW4gYWxsbW9kY29uZmlnIGZvciB4ODZfNjQsIGENCj4g
PiBtdWx0aV92N19kZWZjb25maWcgZm9yIGFybSBhbmQgYSBuYXRpdmUgYnVpbGQgb2YgdG9vbHMv
cGVyZi4gQWZ0ZXINCj4gPiB0aGUgZmluYWwgZml4dXBzIChpZiBhbnkpLCBJIGRvIGFuIHg4Nl82
NCBtb2R1bGVzX2luc3RhbGwgZm9sbG93ZWQNCj4gPiBieQ0KPiA+IGJ1aWxkcyBmb3IgeDg2XzY0
IGFsbG5vY29uZmlnLCBwb3dlcnBjIGFsbG5vY29uZmlnICgzMiBhbmQgNjQgYml0KSwNCj4gPiBw
cGM0NHhfZGVmY29uZmlnLCBhbGx5ZXNjb25maWcgYW5kIHBzZXJpZXNfbGVfZGVmY29uZmlnIGFu
ZCBpMzg2LA0KPiA+IHNwYXJjDQo+ID4gYW5kIHNwYXJjNjQgZGVmY29uZmlnIGFuZCBodG1sZG9j
cy4gQW5kIGZpbmFsbHksIGEgc2ltcGxlIGJvb3QgdGVzdA0KPiA+IG9mIHRoZSBwb3dlcnBjIHBz
ZXJpZXNfbGVfZGVmY29uZmlnIGtlcm5lbCBpbiBxZW11ICh3aXRoIGFuZA0KPiA+IHdpdGhvdXQN
Cj4gPiBrdm0gZW5hYmxlZCkuDQo+ID4gDQo+ID4gQmVsb3cgaXMgYSBzdW1tYXJ5IG9mIHRoZSBz
dGF0ZSBvZiB0aGUgbWVyZ2UuDQo+ID4gDQo+ID4gSSBhbSBjdXJyZW50bHkgbWVyZ2luZyAzMzQg
dHJlZXMgKGNvdW50aW5nIExpbnVzJyBhbmQgOTAgdHJlZXMgb2YNCj4gPiBidWcNCj4gPiBmaXgg
cGF0Y2hlcyBwZW5kaW5nIGZvciB0aGUgY3VycmVudCBtZXJnZSByZWxlYXNlKS4NCj4gPiANCj4g
PiBTdGF0cyBhYm91dCB0aGUgc2l6ZSBvZiB0aGUgdHJlZSBvdmVyIHRpbWUgY2FuIGJlIHNlZW4g
YXQNCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vbmV1bGluZy5vcmcv
bGludXgtbmV4dC1zaXplLmh0bWxfXzshIUNUUk5LQTl3TWcwQVJidyExRWxyZDNDN1ZzTTN2ZUg1
M2NVYlFMNmFKWi13dnhYRlFQZnY0OXk0amtCYUNfTllvejY1RmQxWERXVU1JRWszS0EkDQo+ID4g
QSQgIC4NCj4gPiANCj4gPiBTdGF0dXMgb2YgbXkgbG9jYWwgYnVpbGQgdGVzdHMgd2lsbCBiZSBh
dA0KPiA+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9raXNza2IuZWxsZXJt
YW4uaWQuYXUvbGludXgtbmV4dF9fOyEhQ1RSTktBOXdNZzBBUmJ3ITFFbHJkM0M3VnNNM3ZlSDUz
Y1ViUUw2YUpaLXd2eFhGUVBmdjQ5eTRqa0JhQ19OWW96NjVGZDFYRFdXVGxNMFp6QSQNCj4gPiAg
IC4gIElmIG1haW50YWluZXJzIHdhbnQgdG8gZ2l2ZQ0KPiA+IGFkdmljZSBhYm91dCBjcm9zcyBj
b21waWxlcnMvY29uZmlncyB0aGF0IHdvcmssIHdlIGFyZSBhbHdheXMgb3Blbg0KPiA+IHRvIGFk
ZA0KPiA+IG1vcmUgYnVpbGRzLg0KPiA+IA0KPiA+IFRoYW5rcyB0byBSYW5keSBEdW5sYXAgZm9y
IGRvaW5nIG1hbnkgcmFuZGNvbmZpZyBidWlsZHMuICBBbmQgdG8NCj4gPiBQYXVsDQo+ID4gR29y
dG1ha2VyIGZvciB0cmlhZ2UgYW5kIGJ1ZyBmaXhlcy4NCj4gPiANCj4gDQo+IG9uIGkzODY6DQo+
IA0KPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBTTkRf
U09DX01UNjM1OQ0KPiAgICBEZXBlbmRzIG9uIFtuXTogU09VTkQgWz15XSAmJiAhVU1MICYmIFNO
RCBbPXldICYmIFNORF9TT0MgWz15XSAmJg0KPiBNVEtfUE1JQ19XUkFQIFs9bl0NCj4gICAgU2Vs
ZWN0ZWQgYnkgW3ldOg0KPiAgICAtIFNORF9TT0NfTVQ4MTk1X01UNjM1OV9SVDEwMTlfUlQ1Njgy
IFs9eV0gJiYgU09VTkQgWz15XSAmJiAhVU1MDQo+ICYmIFNORCBbPXldICYmIFNORF9TT0MgWz15
XSAmJiBJMkMgWz15XSAmJiBTTkRfU09DX01UODE5NSBbPXldDQo+IA0KPiANCj4gY2F1c2VkIGJ5
IDQwZDYwNWRmMGE3YjogQVNvQzogbWVkaWF0ZWs6IG10ODE5NTogYWRkIG1hY2hpbmUgZHJpdmVy
DQo+IHdpdGggbXQ2MzU5LCBydDEwMTkgYW5kIHJ0NTY4Mg0KPiANCj4gRnVsbCByYW5kY29uZmln
IGZpbGUgaXMgYXR0YWNoZWQuDQo+IA0KDQoNCkhpIFJhbmR5LA0KDQpJIHdpbGwgYWRkIGEgZGVw
ZW5kZW5jeSB0byBhdm9pZCB0aGF0Lg0KDQpUaGFua3MsDQpUcmV2b3INCg0KDQoNCg==

