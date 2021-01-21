Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C662FE012
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 04:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbhAUDfs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 22:35:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:60436 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2436671AbhAUCIr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Jan 2021 21:08:47 -0500
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Thu, 21 Jan 2021
 10:07:48 +0800 (GMT+08:00)
X-Originating-IP: [112.3.198.184]
Date:   Thu, 21 Jan 2021 10:07:48 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5Y+45bu26IW+?= <siyanteng@loongson.cn>
To:     "Jonathan Corbet" <corbet@lwn.net>
Cc:     "Stephen Rothwell" <sfr@canb.auug.org.au>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: Re: linux-next: build warning after merge of the jc_docs tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2021 www.mailtech.cn .loongson.cn
In-Reply-To: <20210113162730.4f6dc0ac@lwn.net>
References: <20210113150748.1efc75aa@canb.auug.org.au>
 <20210113162730.4f6dc0ac@lwn.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4b5a642b.4d7e.17722b2a4af.Coremail.siyanteng@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9Dx2+T14QhgKVwIAA--.3865W
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/1tbiAQAGEV3QvM3eFwAbs4
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

U29ycnksIEkgYXBvbG9naXplIGZvciB0aGUgaW5jb252ZW5pZW5jZSBjYXVzZWQgdG8geW91LCBJ
IGRvIG5vdCBxdWliYmxlLCBidXQgSSBoYXZlIGJlZW4gc3R1ZHlpbmcgZm9yIG5lYXJseSBhIHdl
ZWssIHBsZWFzZSBwYXkgYXR0ZW50aW9uIHRvIG15IGZ1dHVyZSBwYXRjaGVzLgoKVGhhbmtzCllh
bnRlbmcKCgomZ3Q7IC0tLS0t5Y6f5aeL6YKu5Lu2LS0tLS0KJmd0OyDlj5Hku7bkuro6ICJKb25h
dGhhbiBDb3JiZXQiIDxjb3JiZXRAbHduLm5ldD4KJmd0OyDlj5HpgIHml7bpl7Q6IDIwMjEtMDEt
MTQgMDc6Mjc6MzAgKOaYn+acn+WbmykKJmd0OyDmlLbku7bkuro6ICJTdGVwaGVuIFJvdGh3ZWxs
IiA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+CiZndDsg5oqE6YCBOiAiWWFudGVuZyBTaSIgPHNpeWFu
dGVuZ0Bsb29uZ3Nvbi5jbj4sICJMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IiA8bGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZz4sICJMaW51eCBOZXh0IE1haWxpbmcgTGlzdCIgPGxpbnV4LW5l
eHRAdmdlci5rZXJuZWwub3JnPgomZ3Q7IOS4u+mimDogUmU6IGxpbnV4LW5leHQ6IGJ1aWxkIHdh
cm5pbmcgYWZ0ZXIgbWVyZ2Ugb2YgdGhlIGpjX2RvY3MgdHJlZQomZ3Q7IAomZ3Q7IE9uIFdlZCwg
MTMgSmFuIDIwMjEgMTU6MDc6NDggKzExMDAKJmd0OyBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2Fu
Yi5hdXVnLm9yZy5hdT4gd3JvdGU6CiZndDsgCiZndDsgJmd0OyBBZnRlciBtZXJnaW5nIHRoZSBq
Y19kb2NzIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoaHRtbGRvY3MpCiZndDsgJmd0
OyBwcm9kdWNlZCB0aGlzIHdhcm5pbmc6CiZndDsgJmd0OyAKJmd0OyAmZ3Q7IERvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL21pcHMvaW5nZW5pYy10Y3UucnN0OjYxOiBXQVJOSU5HOiBN
YWxmb3JtZWQgdGFibGUuCiZndDsgJmd0OyBUZXh0IGluIGNvbHVtbiBtYXJnaW4gaW4gdGFibGUg
bGluZSA2LgomZ3Q7ICZndDsgCiZndDsgJmd0OyA9PT09PT09PT09PSAgICAgICAgID09PT09CiZn
dDsgJmd0OyDml7bpkp8gICAgICAgICAgICAgICAgZHJpdmVycy9jbGsvaW5nZW5pYy90Y3UuYwom
Z3Q7ICZndDsg5Lit5patICAgICAgICAgICAgICAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtaW5nZW5p
Yy10Y3UuYwomZ3Q7ICZndDsg5a6a5pe25ZmoICAgICAgICAgICAgICBkcml2ZXJzL2Nsb2Nrc291
cmNlL2luZ2VuaWMtdGltZXIuYwomZ3Q7ICZndDsgT1NUICAgICAgICAgICAgICAgICBkcml2ZXJz
L2Nsb2Nrc291cmNlL2luZ2VuaWMtb3N0LmMKJmd0OyAmZ3Q7IOiEieWGsuWuveW6puiwg+WItuWZ
qCAgICAgIGRyaXZlcnMvcHdtL3B3bS1qejQ3NDAuYwomZ3Q7ICZndDsg55yL6Zeo54uXICAgICAg
ICAgICAgICBkcml2ZXJzL3dhdGNoZG9nL2p6NDc0MF93ZHQuYwomZ3Q7ICZndDsgPT09PT09PT09
PT0gICAgICAgICA9PT09PQomZ3Q7ICZndDsgCiZndDsgJmd0OyBJbnRyb2R1Y2VkIGJ5IGNvbW1p
dAomZ3Q7ICZndDsgCiZndDsgJmd0OyAgIDQxOWIxZDRlZDFjYiAoImRvYy96aF9DTjogYWRkIG1p
cHMgaW5nZW5pYy10Y3UucnN0IHRyYW5zbGF0aW9uIikKJmd0OyAKJmd0OyBNZW1vIHRvIHNlbGY6
IHlvdSBjYW4ndCBza2lwIGRvaW5nIGEgbmV3IGJ1aWxkIGV2ZW4gZm9yIHNpbXBsZQomZ3Q7IHRy
YW5zbGF0aW9ucyB0aGF0IG9idmlvdXNseSBzaG91bGRuJ3QgYWRkIGFueSBuZXcgcHJvYmxlbXMu
ICBTb3JyeSBmb3IgdGhlCiZndDsgbm9pc2UsIEkndmUgYXBwbGllZCBmaXhlcyBmcm9tIEx1a2Fz
IEJ1bHdhaG4gZm9yIGFsbCBvZiB0aGlzIHdob2xlIG1lc3Mgb2YKJmd0OyBlcnJvcnMuCiZndDsg
CiZndDsgWWFudGFuZywgKnBsZWFzZSogZG8gbm90IHN1Ym1pdCBkb2N1bWVudGF0aW9uIHBhdGNo
ZXMgd2l0aG91dCBoYXZpbmcgZG9uZQomZ3Q7IGEgZG9jcyBidWlsZCB0byBtYWtlIHN1cmUgdGhp
bmdzIHdvcmsgYXMgZXhwZWN0ZWQhCiZndDsgCiZndDsgVGhhbmtzLAomZ3Q7IAomZ3Q7IGpvbgoK
Cjwvc2ZyQGNhbmIuYXV1Zy5vcmcuYXU+PC9saW51eC1uZXh0QHZnZXIua2VybmVsLm9yZz48L2xp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+PC9zaXlhbnRlbmdAbG9vbmdzb24uY24+PC9zZnJA
Y2FuYi5hdXVnLm9yZy5hdT48L2NvcmJldEBsd24ubmV0Pg==
