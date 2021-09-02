Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B653FE7B8
	for <lists+linux-next@lfdr.de>; Thu,  2 Sep 2021 04:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhIBCg0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Sep 2021 22:36:26 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:35616 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233145AbhIBCg0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2021 22:36:26 -0400
X-UUID: 32d966e8fe2746a49b5d40d11e4f32d7-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=QOTKsLIYJE11qFg8eBBPd7FPd11PtcpPDGYrw9m8oEE=;
        b=GwcTVptjejg36Z/KVINTC6/shtkZ9NiWyRYC8gUw8fQr7DJJCpIcMpeCrjBbJ8aMBWiSmgVAbYm7ZaC3AmL/fgjhZXstnnX0EKqs6eQQSGVkGTpe5jXR8N59kUj6ioLucI0pCo2sGw715fYwn6tfQ6hJedXHGh6lVHdx0yDO66o=;
X-UUID: 32d966e8fe2746a49b5d40d11e4f32d7-20210902
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <trevor.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2102975702; Thu, 02 Sep 2021 10:35:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 10:35:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 10:35:22 +0800
Message-ID: <299c7f0a7b1dede1e2f704a0133f4045e85641b5.camel@mediatek.com>
Subject: Re: linux-next: Tree for Sep 1
 [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko]
From:   Trevor Wu <trevor.wu@mediatek.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bicycle Tsai <bicycle.tsai@mediatek.com>
Date:   Thu, 2 Sep 2021 10:35:22 +0800
In-Reply-To: <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
References: <20210901181740.3a0a69f2@canb.auug.org.au>
         <3ee0b878-b78c-2483-1a0b-7570bda0132b@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gV2VkLCAyMDIxLTA5LTAxIGF0IDEzOjU1IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+
IE9uIDkvMS8yMSAxOjE3IEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0KPiA+IEhpIGFsbCwN
Cj4gPiANCj4gPiBQbGVhc2UgZG8gbm90IGFkZCBhbnkgdjUuMTYgcmVsYXRlZCBjb2RlIHRvIHlv
dXIgbGludXgtbmV4dA0KPiA+IGluY2x1ZGVkDQo+ID4gYnJhbmNoZXMgdW50aWwgYWZ0ZXIgdjUu
MTUtcmMxIGhhcyBiZWVuIHJlbGVhc2VkLg0KPiA+IA0KPiA+IENoYW5nZXMgc2luY2UgMjAyMTA4
MzE6DQo+ID4gDQo+IA0KPiANCj4gb24geDg2XzY0Og0KPiANCj4gRVJST1I6IG1vZHBvc3Q6ICJj
bGtkZXZfYWRkIiBbc291bmQvc29jL21lZGlhdGVrL210ODE5NS9zbmQtc29jLQ0KPiBtdDgxOTUt
YWZlLmtvXSB1bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0OiAiY2xrZGV2X2Ryb3AiIFtzb3Vu
ZC9zb2MvbWVkaWF0ZWsvbXQ4MTk1L3NuZC1zb2MtDQo+IG10ODE5NS1hZmUua29dIHVuZGVmaW5l
ZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJjbGtfdW5yZWdpc3Rlcl9nYXRlIiBbc291bmQvc29jL21l
ZGlhdGVrL210ODE5NS9zbmQtDQo+IHNvYy1tdDgxOTUtYWZlLmtvXSB1bmRlZmluZWQhDQo+IEVS
Uk9SOiBtb2Rwb3N0OiAiY2xrX3JlZ2lzdGVyX2dhdGUiIFtzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4
MTk1L3NuZC0NCj4gc29jLW10ODE5NS1hZmUua29dIHVuZGVmaW5lZCENCj4gDQo+IEZ1bGwgcmFu
ZGNvbmZpZyBmaWxlIGlzIGF0dGFjaGVkLg0KPiANCg0KSGkgUmFuZHksDQoNClRoZSBwcm9ibGVt
IGlzIGNhdXNlZCBieSB0aGUgZGVwZW5kZW5jeSBkZWNsYXJhdGlvbiwgYmVjYXVzZSBpdCdzIG5v
dCBhDQpkcml2ZXIgZm9yIHg4Nl82NC4NClRoZSBkZXBlbmRlbmN5IGRlY2xhcmF0aW9uIGhhcyBi
ZWVuIGFkZGVkIGluIHRoZSBmb2xsb3dpbmcgcGF0Y2guDQoNCg0KaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2Fsc2EtZGV2ZWwvcGF0Y2gvN2U2MjhlMzU5YmRlMDRjZWI5ZGRk
NzRhNDU5MzEwNTliNGE0NjIzYy4xNjMwNDE1ODYwLmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5i
ZS8NCg0KVGhhbmtzLA0KVHJldm9yDQoNCg0K

