Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E03717A1B9
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 09:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgCEIym (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 03:54:42 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:42671 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725944AbgCEIym (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 03:54:42 -0500
X-UUID: daf7a5ef966d44a4ab90f1e22b62f28a-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=lxr/bby5v3dgaounRNkNHYBEf64DNBdkypfjfP7E/iA=;
        b=kHO3IyO3HGXKZhjaK/pP/x5T/oT3yb5bRYgrlpDvYK3TzQ7wdbz2SmWCAvxQwqpWpbwDrw0w2OrESJLvIfXLwk+ScNZ029XnHpT5jyIHKJwm7TmQTmkffQKuF8v17dVxA/f5r3s+gbtGVzOEoEL9krmYiT5JW/P252xXrAdhFRk=;
X-UUID: daf7a5ef966d44a4ab90f1e22b62f28a-20200305
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <walter-zh.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 881533357; Thu, 05 Mar 2020 16:54:37 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 16:54:36 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 16:52:02 +0800
Message-ID: <1583398476.17146.6.camel@mtksdccf07>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
From:   Walter Wu <walter-zh.wu@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>
Date:   Thu, 5 Mar 2020 16:54:36 +0800
In-Reply-To: <20200305163743.7128c251@canb.auug.org.au>
References: <20200305163743.7128c251@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDE2OjM3ICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBha3BtLWN1cnJlbnQgdHJlZSwg
dG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkICh4ODZfNjQNCj4gYWxsbW9kY29uZmlnKSBwcm9kdWNl
ZCB0aGlzIHdhcm5pbmc6DQo+IA0KPiBtbS9rYXNhbi9jb21tb24ubzogd2FybmluZzogb2JqdG9v
bDoga2FzYW5fcmVwb3J0KCkrMHgxNzogY2FsbCB0byByZXBvcnRfZW5hYmxlZCgpIHdpdGggVUFD
Q0VTUyBlbmFibGVkDQo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2xpbnV4L2JpdG1h
cC5oOjksDQo+ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2NwdW1hc2suaDox
MiwNCj4gICAgICAgICAgICAgICAgICBmcm9tIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0
Lmg6MTcsDQo+ICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pcnFm
bGFncy5oOjcyLA0KPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9pcnFmbGFn
cy5oOjE2LA0KPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9yY3VwZGF0ZS5o
OjI2LA0KPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9yY3VsaXN0Lmg6MTEs
DQo+ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3BpZC5oOjUsDQo+ICAgICAg
ICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3NjaGVkLmg6MTQsDQo+ICAgICAgICAgICAg
ICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaDo2LA0KPiAgICAgICAgICAgICAgICAg
IGZyb20gYXJjaC94ODYvaW5jbHVkZS9hc20vZnB1L3hzdGF0ZS5oOjUsDQo+ICAgICAgICAgICAg
ICAgICAgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmg6MjYsDQo+ICAgICAgICAg
ICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2thc2FuLmg6MTUsDQo+ICAgICAgICAgICAgICAg
ICAgZnJvbSBsaWIvdGVzdF9rYXNhbi5jOjEyOg0KPiBJbiBmdW5jdGlvbiAnbWVtbW92ZScsDQo+
ICAgICBpbmxpbmVkIGZyb20gJ2ttYWxsb2NfbWVtbW92ZV9pbnZhbGlkX3NpemUnIGF0IGxpYi90
ZXN0X2thc2FuLmM6MzAxOjI6DQo+IGluY2x1ZGUvbGludXgvc3RyaW5nLmg6NDQxOjk6IHdhcm5p
bmc6ICdfX2J1aWx0aW5fbWVtbW92ZScgc3BlY2lmaWVkIGJvdW5kIDE4NDQ2NzQ0MDczNzA5NTUx
NjE0IGV4Y2VlZHMgbWF4aW11bSBvYmplY3Qgc2l6ZSA5MjIzMzcyMDM2ODU0Nzc1ODA3IFstV3N0
cmluZ29wLW92ZXJmbG93PV0NCj4gICA0NDEgfCAgcmV0dXJuIF9fYnVpbHRpbl9tZW1tb3ZlKHAs
IHEsIHNpemUpOw0KPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4NCj4gDQo+IEludHJvZHVjZWQgYnkgY29tbWl0DQo+IA0KPiAgIDUxOWU1MDBmYWM2NCAoImth
c2FuOiBhZGQgdGVzdCBmb3IgaW52YWxpZCBzaXplIGluIG1lbW1vdmUiKQ0KPiANCj4gVGhhdCdz
IGEgYml0IGFubm95aW5nIGR1cmluZyBhIG5vcm1hbCB4ODZfNjQgYWxsbW9kY29uZmlnIGJ1aWxk
IC4uLg0KPiANCg0KSGkgU3RlcGhlbiBhbmQgRG1pdHJ5LA0KDQpJJ20gc29ycnkgZm9yIHRoZSBi
dWlsZCB3YXJuaW5nLCBpdCBkb2Vzbid0IGdlbmVyYXRlIGluIG91ciBsb2NhbA0KZW52aXJvbm1l
bnQoYXJtNjQveDg2XzY0KS4gV291bGQgeW91IHRlbGwgbWUgd2hhdCB0b29sY2hhaW5zIGNhbg0K
cmVwcm9kdWNlIGl0Pw0KDQpEbWl0cnksIFRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KDQoN
ClRoYW5rcw0KDQpXYWx0ZXINCg0KDQoNCg==

