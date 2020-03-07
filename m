Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB68217CBF8
	for <lists+linux-next@lfdr.de>; Sat,  7 Mar 2020 06:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgCGFEE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 Mar 2020 00:04:04 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:10193 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725268AbgCGFEE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 7 Mar 2020 00:04:04 -0500
X-UUID: d5b83e5d4f854bf880f1f3fc2a1c5517-20200307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=bMovNE6g0gltRurUOZloJZdwKG5nFql6EWSPoy766UM=;
        b=E+T4Js9KIIKiYmvGim+48F3jMi4B8DVD+Vbz9PjW62S14Db5WDu76HUCydqFyefv5uA47BuJwuOUUQiF9AzViDsfCZPsC7nYBVsBcgi12DEdgr0nax/ACEQSuSs3dwGtXC+2XKETgUa3HkCAmZ14zOcgPZcqWlIHj2GMsS6uWWI=;
X-UUID: d5b83e5d4f854bf880f1f3fc2a1c5517-20200307
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <walter-zh.wu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 677170337; Sat, 07 Mar 2020 13:03:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Mar 2020 13:03:00 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 7 Mar 2020 13:01:18 +0800
Message-ID: <1583557436.8911.25.camel@mtksdccf07>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
From:   Walter Wu <walter-zh.wu@mediatek.com>
To:     Dmitry Vyukov <dvyukov@google.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        kasan-dev <kasan-dev@googlegroups.com>
Date:   Sat, 7 Mar 2020 13:03:56 +0800
In-Reply-To: <CACT4Y+ZX0xaZNnNqOzassKi2=NSPz-9K4VpxdL6FGx_Y4vWSUg@mail.gmail.com>
References: <20200305163743.7128c251@canb.auug.org.au>
         <CACT4Y+ZX0xaZNnNqOzassKi2=NSPz-9K4VpxdL6FGx_Y4vWSUg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDA2OjU0ICswMTAwLCBEbWl0cnkgVnl1a292IHdyb3RlOg0K
PiBPbiBUaHUsIE1hciA1LCAyMDIwIGF0IDY6MzcgQU0gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNh
bmIuYXV1Zy5vcmcuYXU+IHdyb3RlOg0KPiA+DQo+ID4gSGkgYWxsLA0KPiA+DQo+ID4gQWZ0ZXIg
bWVyZ2luZyB0aGUgYWtwbS1jdXJyZW50IHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAo
eDg2XzY0DQo+ID4gYWxsbW9kY29uZmlnKSBwcm9kdWNlZCB0aGlzIHdhcm5pbmc6DQo+ID4NCj4g
PiBtbS9rYXNhbi9jb21tb24ubzogd2FybmluZzogb2JqdG9vbDoga2FzYW5fcmVwb3J0KCkrMHgx
NzogY2FsbCB0byByZXBvcnRfZW5hYmxlZCgpIHdpdGggVUFDQ0VTUyBlbmFibGVkDQo+ID4gSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvbGludXgvYml0bWFwLmg6OSwNCj4gPiAgICAgICAg
ICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9jcHVtYXNrLmg6MTIsDQo+ID4gICAgICAgICAg
ICAgICAgICBmcm9tIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0Lmg6MTcsDQo+ID4gICAg
ICAgICAgICAgICAgICBmcm9tIGFyY2gveDg2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmg6NzIsDQo+
ID4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvaXJxZmxhZ3MuaDoxNiwNCj4g
PiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjI2LA0KPiA+
ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3JjdWxpc3QuaDoxMSwNCj4gPiAg
ICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9waWQuaDo1LA0KPiA+ICAgICAgICAg
ICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3NjaGVkLmg6MTQsDQo+ID4gICAgICAgICAgICAg
ICAgICBmcm9tIGluY2x1ZGUvbGludXgvdWFjY2Vzcy5oOjYsDQo+ID4gICAgICAgICAgICAgICAg
ICBmcm9tIGFyY2gveDg2L2luY2x1ZGUvYXNtL2ZwdS94c3RhdGUuaDo1LA0KPiA+ICAgICAgICAg
ICAgICAgICAgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlLmg6MjYsDQo+ID4gICAg
ICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgva2FzYW4uaDoxNSwNCj4gPiAgICAgICAg
ICAgICAgICAgIGZyb20gbGliL3Rlc3Rfa2FzYW4uYzoxMjoNCj4gPiBJbiBmdW5jdGlvbiAnbWVt
bW92ZScsDQo+ID4gICAgIGlubGluZWQgZnJvbSAna21hbGxvY19tZW1tb3ZlX2ludmFsaWRfc2l6
ZScgYXQgbGliL3Rlc3Rfa2FzYW4uYzozMDE6MjoNCj4gPiBpbmNsdWRlL2xpbnV4L3N0cmluZy5o
OjQ0MTo5OiB3YXJuaW5nOiAnX19idWlsdGluX21lbW1vdmUnIHNwZWNpZmllZCBib3VuZCAxODQ0
Njc0NDA3MzcwOTU1MTYxNCBleGNlZWRzIG1heGltdW0gb2JqZWN0IHNpemUgOTIyMzM3MjAzNjg1
NDc3NTgwNyBbLVdzdHJpbmdvcC1vdmVyZmxvdz1dDQo+IA0KPiAra2FzYW4tZGV2DQo+IA0KPiBX
ZSBwcm9iYWJseSBuZWVkIHRvIG1ha2UgdGhpcyAxODQ0Njc0NDA3MzcwOTU1MTYxNCBjb25zdGFu
dCAiZHluYW1pYyINCj4gc28gdGhhdCBjb21waWxlciBkb2VzIG5vdCBzZWUgaXQuDQo+IA0KPiBX
YWx0ZXIsIHdpbGwgeW91IHRha2UgYSBsb29rPyBUaGFua3MNCg0KSGkgRG1pdHJ5LA0KDQpZZXMs
IEkgaGF2ZSBmaXhlZCBpdC4gVGhpcyB3YXJuaW5nIG5lZWQgbmV3ZXIgZ2NjIGVub3VnaCB0byBy
ZXByb2R1Y2UuDQpNYXliZSBJIHNob3VsZCByZXBsYWNlIG9yaWdpbmFsIGdjYy03LjQuMC4NCg0K
VGhhbmtzLg0KDQoNCi0tLSBhL2xpYi90ZXN0X2thc2FuLmMNCisrKyBiL2xpYi90ZXN0X2thc2Fu
LmMNCkBAIC0yODYsMTcgKzI4NiwxOSBAQCBzdGF0aWMgbm9pbmxpbmUgdm9pZCBfX2luaXQNCmtt
YWxsb2Nfb29iX2luX21lbXNldCh2b2lkKQ0KIHN0YXRpYyBub2lubGluZSB2b2lkIF9faW5pdCBr
bWFsbG9jX21lbW1vdmVfaW52YWxpZF9zaXplKHZvaWQpDQogew0KICAgICAgICBjaGFyICpwdHI7
DQotICAgICAgIHNpemVfdCBzaXplID0gNjQ7DQorICAgICAgIHNpemVfdCBzaXplMSA9IDY0Ow0K
KyAgICAgICB2b2xhdGlsZSBzaXplX3Qgc2l6ZTIgPSAtMjsNCg0KICAgICAgICBwcl9pbmZvKCJp
bnZhbGlkIHNpemUgaW4gbWVtbW92ZVxuIik7DQotICAgICAgIHB0ciA9IGttYWxsb2Moc2l6ZSwg
R0ZQX0tFUk5FTCk7DQorICAgICAgIHB0ciA9IGttYWxsb2Moc2l6ZTEsIEdGUF9LRVJORUwpOw0K
ICAgICAgICBpZiAoIXB0cikgew0KICAgICAgICAgICAgICAgIHByX2VycigiQWxsb2NhdGlvbiBm
YWlsZWRcbiIpOw0KICAgICAgICAgICAgICAgIHJldHVybjsNCiAgICAgICAgfQ0KDQotICAgICAg
IG1lbXNldCgoY2hhciAqKXB0ciwgMCwgNjQpOw0KLSAgICAgICBtZW1tb3ZlKChjaGFyICopcHRy
LCAoY2hhciAqKXB0ciArIDQsIC0yKTsNCisgICAgICAgbWVtc2V0KChjaGFyICopcHRyLCAwLCBz
aXplMSk7DQorICAgICAgIC8qIHRoZSBzaXplIG9mIG1lbW1vdmUoKSBpcyBuZWdhdGl2ZSBudW1i
ZXIgKi8NCisgICAgICAgbWVtbW92ZSgoY2hhciAqKXB0ciwgKGNoYXIgKilwdHIgKyA0LCBzaXpl
Mik7DQogICAgICAgIGtmcmVlKHB0cik7DQogfQ0KDQo+IA0KPiA+ICAgNDQxIHwgIHJldHVybiBf
X2J1aWx0aW5fbWVtbW92ZShwLCBxLCBzaXplKTsNCj4gPiAgICAgICB8ICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPg0KPiA+IEludHJvZHVjZWQgYnkgY29tbWl0DQo+
ID4NCj4gPiAgIDUxOWU1MDBmYWM2NCAoImthc2FuOiBhZGQgdGVzdCBmb3IgaW52YWxpZCBzaXpl
IGluIG1lbW1vdmUiKQ0KPiA+DQo+ID4gVGhhdCdzIGEgYml0IGFubm95aW5nIGR1cmluZyBhIG5v
cm1hbCB4ODZfNjQgYWxsbW9kY29uZmlnIGJ1aWxkIC4uLg0KPiA+DQo+ID4gLS0NCj4gPiBDaGVl
cnMsDQo+ID4gU3RlcGhlbiBSb3Rod2VsbA0KDQo=

