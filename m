Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0451EEF64
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 04:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgFECSe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 22:18:34 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:38327 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725497AbgFECSe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 22:18:34 -0400
X-UUID: 9d188a1cb38342b5905f6a4dbdc13962-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=lpy8EnZ6wUWyr0sPLWYCdBeo3+Sir5kSAhPwv1xe/Ls=;
        b=V2CWKQwrCl90ERhCFVSY8Z3+QDkWvLIs8BfvyGx9L/B4BSJGrNH8j+FB7BZcu0Bk4atIrO02HqOgcdjYwUyi/ezlXKIw6aHfjj+bkkAOdAL82tpCSVG29lOpLYa3A+IXaOR66z33C9lZE1274gJa4DhQfTRHQlytX01cXzkwAzc=;
X-UUID: 9d188a1cb38342b5905f6a4dbdc13962-20200605
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2091216620; Fri, 05 Jun 2020 10:18:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 10:18:30 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 10:18:28 +0800
Message-ID: <1591323509.7223.2.camel@mtkswgap22>
Subject: Re: linux-next: build failure after merge of the sound-current tree
From:   Macpaul Lin <macpaul.lin@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Takashi Iwai <tiwai@suse.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Fri, 5 Jun 2020 10:18:29 +0800
In-Reply-To: <20200605084307.47d31882@canb.auug.org.au>
References: <20200605084307.47d31882@canb.auug.org.au>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6EEC0A4E971896C348324CFA9779EA8B98CCFDC9C9561AEEDC292991E6ED77A62000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gRnJpLCAyMDIwLTA2LTA1IGF0IDA4OjQzICsxMDAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBzb3VuZC1jdXJyZW50IHRyZWUs
IHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoYXJtDQo+IG11bHRpX3Y3X2RlZmNvbmZpZykgZmFp
bGVkIGxpa2UgdGhpczoNCj4gDQo+IC9ob21lL3Nmci9uZXh0L25leHQvc291bmQvdXNiL2NhcmQu
YzogSW4gZnVuY3Rpb24gJ3NuZF91c2JfYXV0b3Jlc3VtZSc6DQo+IC9ob21lL3Nmci9uZXh0L25l
eHQvc291bmQvdXNiL2NhcmQuYzo4NDE6Mjk6IGVycm9yOiBleHBlY3RlZCAnOycgYmVmb3JlICcp
JyB0b2tlbg0KPiAgIDg0MSB8ICAgIGF0b21pY19kZWMoJmNoaXAtPmFjdGl2ZSkpDQo+ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgOw0KPiANCj4gQ2F1c2VkIGJ5IGNvbW1pdA0KPiANCj4gICAzMzk4ZTVj
N2IwMzggKCJBTFNBOiB1c2ItYXVkaW86IE1hbmFnZSBhdXRvLXBtIG9mIGFsbCBidW5kbGVkIGlu
dGVyZmFjZXMiKQ0KPiANCj4gSSBoYXZlIHJldmVydGVkIHRoYXQgY29tbWl0IGZvciB0b2RheS4N
Cj4gDQoNClNvcnJ5IEkndmUgdGVzdGVkIGl0cyBmdW5jdGlvbiBieSAicGF0Y2ggYmFjayIgdG8g
b2xkZXIga2VybmVsIHZlcnNpb24NCjQuMTQuDQpBZnRlciBjaGVja2luZyB0aGUgbGF0ZXN0IHBh
dGNoIGFnYWluLCB0aGVyZSBpcyBpbmRlZWQgYSB0eXBvIGhlcmUuDQoNClRoYW5rcw0KTWFjcGF1
bCBMaW4NCg==

