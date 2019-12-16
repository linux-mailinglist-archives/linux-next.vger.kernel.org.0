Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5B81200D6
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2019 10:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfLPJTW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Dec 2019 04:19:22 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:46882 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726368AbfLPJTW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Dec 2019 04:19:22 -0500
X-UUID: 7bb2b0c8206042e89814a8cbd499d353-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=XLMuh7phu60KA/y9Ab7CUfIkBJUm0WhTWpsI8N8X46k=;
        b=WiH9fhdnKe/F3c6SZKdl65FnStGv2KIFxInyqwoEveVDr9dlh2Q/gb5y8hsj9hR80taUUp9SkKuwv8uZqzLTBUF7NXiCqOAmHMabhRG6Fnolpi8GnetO0E5C3HuFmzmL3OCdaR6DOKWf10HrwQGbu5y7vMmIc4ofZMx9AqDRC2Q=;
X-UUID: 7bb2b0c8206042e89814a8cbd499d353-20191216
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 434879372; Mon, 16 Dec 2019 17:19:16 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 17:18:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Dec 2019 17:18:56 +0800
Message-ID: <1576487955.30597.4.camel@mtkswgap22>
Subject: Re: linux-next: build failure after merge of the mediatek tree
From:   Macpaul Lin <macpaul.lin@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>, <Weiyi.lu@mediatek.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mars Cheng <mars.cheng@mediatek.com>,
        "Owen Chen" <owen.chen@mediatek.com>
Date:   Mon, 16 Dec 2019 17:19:15 +0800
In-Reply-To: <a2518673-f77f-806c-0bd0-dfb2f6f64da2@gmail.com>
References: <20191216090337.4b4cfb42@canb.auug.org.au>
         <a2518673-f77f-806c-0bd0-dfb2f6f64da2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gTW9uLCAyMDE5LTEyLTE2IGF0IDA5OjQ5ICswMTAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiBIaSBTdGVwaGVuLA0KPiANCj4gT24gMTUvMTIvMjAxOSAyMzowMywgU3RlcGhlbiBSb3Ro
d2VsbCB3cm90ZToNCj4gPiBIaSBhbGwsDQo+ID4gDQo+ID4gQWZ0ZXIgbWVyZ2luZyB0aGUgbWVk
aWF0ZWsgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkIChhcm0NCj4gPiBtdWx0aV92N19k
ZWZjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6DQo+ID4gDQo+ID4gZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLXNjcHN5cy5jOjc3Mzo0OiBlcnJvcjogJ2NvbnN0IHN0cnVjdCBzY3BfZG9tYWluX2Rh
dGEnIGhhcyBubyBtZW1iZXIgbmFtZWQgJ3N1YnN5c19jbGtfcHJlZml4Jw0KPiA+ICAgNzczIHwg
ICAuc3Vic3lzX2Nsa19wcmVmaXggPSAiaXNwIiwNCj4gPiAgICAgICB8ICAgIF5+fn5+fn5+fn5+
fn5+fn5+DQoNCltEZWxldGVkLi4uXQ0KPiA+IENhdXNlZCBieSBjb21taXQNCj4gPiANCj4gPiAg
IDM3NDJmZDc3MDEzZiAoInNvYzogbWVkaWF0ZWs6IGFkZCBNVDY3NjUgc2Nwc3lzIGFuZCBzdWJk
b21haW4gc3VwcG9ydCIpDQo+ID4gDQo+ID4gSSBoYXZlIHVzZWQgdGhlIG1lZGlhdGVrIHRyZWUg
ZnJvbSBuZXh0LTIwMTkxMjEzIGZvciB0b2RheS4NCj4gPiANCj4gDQo+IFRoYW5rcyBmb3IgdGhl
IGhlYWRzLXVwLiBJIGRyb3BwZWQgdGhlIHBhdGNoIGZvciBub3cgdW50aWwgaXQncyBkZXBlbmRl
bmNpZXMgYXJlDQo+IGFsbCBtZXJnZWQuIFNvcnJ5IGZvciB0aGUgb3ZlcnNpZ2h0Lg0KPiANCj4g
UmVnYXJkcw0KPiBNYXR0aGlhcw0KDQpIaSBNYXRoaGlhcywNCg0KQWNjb3JkaW5nIHRvIHRoZSBi
dWlsZCBlcnJvciwgaXQgbG9va3MgbGlrZSB0aGlzIHBhdGNoIGhhcyBhIGRlcGVuZGVuY3kNCndp
dGggdGhlIHBhdGNoIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExMTgzNDcv
IC4NCg0KVGhlIHBhdGNoICJbdjcsMTAvMTNdIHNvYzogbWVkaWF0ZWs6IEFkZCBzdWJzeXMgY2xv
Y2sgY29udHJvbCBmb3IgYnVzDQpwcm90ZWN0aW9uIiBpbnRyb2R1Y2VkIG1lbWJlciBzdWJzeXNf
Y2xrX3ByZWZpeCBhbmQgb3RoZXIgcmVxdWlyZWQNCm1lbWJlcnMuDQoNClRoYW5rcyENCg0KUmVn
YXJkcywNCk1hY3BhdWwgTGluDQoNCg==

