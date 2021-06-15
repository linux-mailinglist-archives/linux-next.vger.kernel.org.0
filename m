Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26D33A8CBF
	for <lists+linux-next@lfdr.de>; Wed, 16 Jun 2021 01:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhFOXmW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 19:42:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:49954 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230039AbhFOXmV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 19:42:21 -0400
X-UUID: fffb4e5efa684f19b12ece330d112351-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1N+JC1snW7EnO8epve2A7QzbqIbp6/TazBXQRTkssHQ=;
        b=n82vwoj5rhMqtRsiJZh8+qFglbmTBIRohSuAk/q64M/NVX/l3TiFuZHeDasTD31+GL8FWitoMYCAJ/gnuERTASrK3skKFQNczhi7D0oKPxKLUav/neNe8wkY+CrLtbo/nD8UW8Ob2tJLpU+01euzEs3fDzZw3Pu66i6kVhiaeBo=;
X-UUID: fffb4e5efa684f19b12ece330d112351-20210616
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1541065036; Wed, 16 Jun 2021 07:40:13 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 07:40:12 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 07:40:12 +0800
Message-ID: <1623800412.8512.16.camel@mtkswgap22>
Subject: Re: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
From:   Miles Chen <miles.chen@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Mike Rapoport <rppt@linux.ibm.com>,
        Qian Cai <quic_qiancai@quicinc.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>, <lkft-triage@lists.linaro.org>,
        <regressions@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alistair Popple <apopple@nvidia.com>
Date:   Wed, 16 Jun 2021 07:40:12 +0800
In-Reply-To: <20210616093422.31270f1e@canb.auug.org.au>
References: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
         <20210615124745.GA47121@C02TD0UTHF1T.local>
         <20210615131902.GB47121@C02TD0UTHF1T.local>
         <076665b9-9fb1-71da-5f7d-4d2c7f892103@quicinc.com>
         <YMj9vHhHOiCVN4BF@linux.ibm.com> <20210616093422.31270f1e@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gV2VkLCAyMDIxLTA2LTE2IGF0IDA5OjM0ICsxMDAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBPbiBUdWUsIDE1IEp1biAyMDIxIDIyOjIxOjMyICswMzAwIE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBUdWUs
IEp1biAxNSwgMjAyMSBhdCAxMDo1MDozMUFNIC0wNDAwLCBRaWFuIENhaSB3cm90ZToNCj4gPiA+
IA0KPiA+ID4gT24gNi8xNS8yMDIxIDk6MTkgQU0sIE1hcmsgUnV0bGFuZCB3cm90ZTogIA0KPiA+
ID4gPiBMb29raW5nIHNvbWUgbW9yZSwgaXQgbG9va3MgbGlrZSB0aGF0J3MgY29ycmVjdCBpbiBp
c29sYXRpb24sIGJ1dCBpdA0KPiA+ID4gPiBjbGFzaGVzIHdpdGggY29tbWl0Og0KPiA+ID4gPiAN
Cj4gPiA+ID4gICA1ODMxZWVkYWQyYWM2ZjM4ICgibW06IHJlcGxhY2UgQ09ORklHX05FRURfTVVM
VElQTEVfTk9ERVMgd2l0aCBDT05GSUdfTlVNQSIpICANCj4gPiA+IA0KPiA+ID4gSnVzdCBhIGRh
dGEgcG9pbnQuIFJldmVydGluZyB0aGUgY29tbWl0IGFsb25lIGZpeGVkIHRoZSBzYW1lIGNyYXNo
IGZvciBtZS4gIA0KPiA+IA0KPiA+IFllYWgsIHRoYXQgY29tbWl0IGRpZG4ndCB0YWtlIGludG8g
dGhlIGFjY291bnQgdGhlIGNoYW5nZSBpbg0KPiA+IHBnZGF0X3RvX3BoeXMoKS4NCj4gPiANCj4g
PiBUaGUgcGF0Y2ggYmVsb3cgc2hvdWxkIGZpeCBpdC4gSW4gdGhlIGxvbmcgcnVuIEkgdGhpbmsg
d2Ugc2hvdWxkIGdldCByaWQgb2YNCj4gPiBjb250aWdfcGFnZV9kYXRhIGFuZCBhbGxvY2F0ZSBO
T0RFX0RBVEEoMCkgZm9yICFOVU1BIGNhc2UgYXMgd2VsbC4NCj4gPiANCj4gPiBBbmRyZXcsIGNh
biB5b3UgcGxlYXNlIGFkZCB0aGlzIGFzIGEgZml4dXAgdG8gIm1tOiByZXBsYWNlDQo+ID4gQ09O
RklHX05FRURfTVVMVElQTEVfTk9ERVMgd2l0aCBDT05GSUdfTlVNQSI/DQo+ID4gDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL21tL3NwYXJzZS5jIGIvbW0vc3BhcnNlLmMNCj4gPiBpbmRleCBhMGU5
Y2RiNWJjMzguLjYzMjZjZGYzNmM0ZiAxMDA2NDQNCj4gPiAtLS0gYS9tbS9zcGFyc2UuYw0KPiA+
ICsrKyBiL21tL3NwYXJzZS5jDQo+ID4gQEAgLTM0Nyw3ICszNDcsNyBAQCBzaXplX3QgbWVtX3Nl
Y3Rpb25fdXNhZ2Vfc2l6ZSh2b2lkKQ0KPiA+ICANCj4gPiAgc3RhdGljIGlubGluZSBwaHlzX2Fk
ZHJfdCBwZ2RhdF90b19waHlzKHN0cnVjdCBwZ2xpc3RfZGF0YSAqcGdkYXQpDQo+ID4gIHsNCj4g
PiAtI2lmbmRlZiBDT05GSUdfTkVFRF9NVUxUSVBMRV9OT0RFUw0KPiA+ICsjaWZuZGVmIENPTkZJ
R19OVU1BDQo+ID4gIAlyZXR1cm4gX19wYV9zeW1ib2wocGdkYXQpOw0KPiA+ICAjZWxzZQ0KPiA+
ICAJcmV0dXJuIF9fcGEocGdkYXQpOw0KPiANCj4gQWRkZWQgdG8gbGludXgtbmV4dCB0b2RheS4N
Cj4gDQoNClNvcnJ5IGZvciBteSBsYXRlIHJlc3BvbnNlLg0KdGhhbmtzIGZvciBkb2luZyB0aGlz
LiANCg0KTWlsZXMNCg0K

