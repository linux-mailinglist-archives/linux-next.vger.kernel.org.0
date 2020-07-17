Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B3222378A
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 11:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGQJBW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 05:01:22 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:15559 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725864AbgGQJBV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 05:01:21 -0400
X-UUID: a106391d987841c68fe5f09cc4ced914-20200717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=XHOpy32OtASkNxEPdqs+g9DpCHrfPTsvKN+Adv820uk=;
        b=ebVlzjzyXSGC8xna720AufTNVaSe+/D75NRHvbsZodZuw/nxfgX4dlkrMO9uHRzw+jz7O9bftF5rv5Y+OCGvrtmslqkBIMs3eQf9MdjbQ0jwdoknb7RiRffRLup/5qFL/6EpbwYS/OhNgkQ5HqXUspME1290jCigxQ3pwq1IaKo=;
X-UUID: a106391d987841c68fe5f09cc4ced914-20200717
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hanks.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 474251666; Fri, 17 Jul 2020 17:01:18 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 17:01:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jul 2020 17:01:14 +0800
Message-ID: <1594976475.4688.2.camel@mtkswgap22>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
From:   Hanks Chen <hanks.chen@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        "Mars Cheng" <mars.cheng@mediatek.com>
Date:   Fri, 17 Jul 2020 17:01:15 +0800
In-Reply-To: <20200717171634.4b68472c@canb.auug.org.au>
References: <20200717171634.4b68472c@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 279F5F33599B3C2B2F768669CC6ED361C28F278600F1A53D70229ACEFB27311A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gRnJpLCAyMDIwLTA3LTE3IGF0IDE3OjE2ICsxMDAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBwaW5jdHJsIHRyZWUsIHRvZGF5
J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0DQo+IGFsbG1vZGNvbmZpZykgZmFpbGVkIGxpa2Ug
dGhpczoNCj4gDQo+IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc3OS5jOjc4
MzoxOiB3YXJuaW5nOiBkYXRhIGRlZmluaXRpb24gaGFzIG5vIHR5cGUgb3Igc3RvcmFnZSBjbGFz
cw0KPiAgIDc4MyB8IGFyY2hfaW5pdGNhbGwobXQ2Nzc5X3BpbmN0cmxfaW5pdCk7DQo+ICAgICAg
IHwgXn5+fn5+fn5+fn5+fg0KPiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDY3
NzkuYzo3ODM6MTogZXJyb3I6IHR5cGUgZGVmYXVsdHMgdG8gJ2ludCcgaW4gZGVjbGFyYXRpb24g
b2YgJ2FyY2hfaW5pdGNhbGwnIFstV2Vycm9yPWltcGxpY2l0LWludF0NCj4gZHJpdmVycy9waW5j
dHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2Nzc5LmM6NzgzOjE6IHdhcm5pbmc6IHBhcmFtZXRlciBu
YW1lcyAod2l0aG91dCB0eXBlcykgaW4gZnVuY3Rpb24gZGVjbGFyYXRpb24NCj4gZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2Nzc5LmM6Nzc5OjE5OiB3YXJuaW5nOiAnbXQ2Nzc5
X3BpbmN0cmxfaW5pdCcgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQ0K
PiAgIDc3OSB8IHN0YXRpYyBpbnQgX19pbml0IG10Njc3OV9waW5jdHJsX2luaXQodm9pZCkNCj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+DQo+IA0KPiBDYXVz
ZWQgYnkgY29tbWl0DQo+IA0KPiAgIGU2Zjc0NGM2YWQ0ZiAoInBpbmN0cmw6IG1lZGlhdGVrOiBh
ZGQgcGluY3RybCBzdXBwb3J0IGZvciBNVDY3NzkgU29DIikNCj4gDQo+IEZvcmdvdCB0byBpbmNs
dWRlIG1vZHVsZS5oIChzaW5jZSBpdCBpcyB0cmlzdGF0ZSBpbiBLY29uZmlnKSBvciBpbml0Lmg/
DQo+IA0KPiBJIHVzZWQgdGhlIHBpbmN0cmwgdHJlZSBmcm9tIG5leHQtMjAyMDA3MTYgZm9yIHRv
ZGF5Lg0KPiANCg0KTXkgZmF1bHQsIEknbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbi4NCihTZXJp
ZXM6IEFkZCBiYXNpYyBTb0MgU3VwcG9ydCBmb3IgTWVkaWF0ZWsgTVQ2Nzc5IFNvQykNCg0KVGhh
bmsgeW91IGZvciB5b3VyIG1lc3NhZ2UNCg0KDQpIYW5rcyBDaGVuDQo=

