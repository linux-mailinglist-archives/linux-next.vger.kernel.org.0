Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E75E219A35
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 09:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgGIHux (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 03:50:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34582 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726187AbgGIHux (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jul 2020 03:50:53 -0400
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Thu, 9 Jul 2020
 15:50:47 +0800 (GMT+08:00)
X-Originating-IP: [113.200.148.30]
Date:   Thu, 9 Jul 2020 15:50:47 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   "Peng Fan" <fanpeng@loongson.cn>
To:     "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc:     "Mark Brown" <broonie@kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: Re: linux-next: build warning after merge of the spi tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2020 www.mailtech.cn .loongson.cn
In-Reply-To: <31ee871f.3cd.173320cfdfe.Coremail.fanpeng@loongson.cn>
References: <20200709141054.1b65be9d@canb.auug.org.au>
 <31ee871f.3cd.173320cfdfe.Coremail.fanpeng@loongson.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7376c15b.48e.173328e36ab.Coremail.fanpeng@loongson.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: AQAAf9DxTx9YzAZf5asAAA--.158W
X-CM-SenderInfo: xidq1vtqj6z05rqj20fqof0/1tbiAQAMEl3QvL5MuwABsm
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGksIEJyb3dtLCBTdGVwaGVuCiAgICBGaXJzdGx5LCBmZWVsIHNvcnJ5IGZvciB0aGUgcHJvYmxl
bSBpbnRyb2R1Y2VkIGJ5IG1lLiBJIHRoaW5rIEkgbXVzdCBtb2RpZnkgbXkgYmFkLGJ1dCBzaG91
bGQgSSBzZW5kIGFub3RoZXIgcGF0Y2ggdG8gZGVsZXRlIHRoZSBsYWJlbCAib3V0X2ZyZWUiIG9y
IApyZS1zZW5kIHBhdGNoIG9mIHYyKHdoaWNoIG1heWJlIG5lZWQgdG8gZ28gYmFjayk/CiAgICBD
b3VsZCB5b3UgZ2l2ZSBtZSBzb21lIGFkdmljZXM/IFNvcnJ5IGFnYWluLgoKVGhhbmtzCgomcXVv
dDtQZW5nIEZhbiZxdW90OyAmbHQ7ZmFucGVuZ0Bsb29uZ3Nvbi5jbiZndDt3cm90ZToKPiBWZXJ5
IHNvcnJ5IGZvciB0aGF0LCBJIHdpbGwgcmUtc2VuZCB2MiBsYXRlci4NCj4gDQo+ICZxdW90O1N0
ZXBoZW4gUm90aHdlbGwmcXVvdDsgJmx0O3NmckBjYW5iLmF1dWcub3JnLmF1Jmd0O3dyb3RlOg0K
PiA+IEhpIGFsbCwNCj4gPiANCj4gPiBBZnRlciBtZXJnaW5nIHRoZSBzcGkgdHJlZSwgdG9kYXkn
cyBsaW51eC1uZXh0IGJ1aWxkIChhcm0NCj4gPiBtdWx0aV92N19kZWZjb25maWcpIHByb2R1Y2Vk
IHRoaXMgd2FybmluZzoNCj4gPiANCj4gPiBkcml2ZXJzL3NwaS9zcGktYXRtZWwuYzogSW4gZnVu
Y3Rpb24gJ2F0bWVsX3NwaV9wcm9iZSc6DQo+ID4gZHJpdmVycy9zcGkvc3BpLWF0bWVsLmM6MTY4
MDoxOiB3YXJuaW5nOiBsYWJlbCAnb3V0X2ZyZWUnIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1sYWJlbF0NCj4gPiAgMTY4MCB8IG91dF9mcmVlOg0KPiA+ICAgICAgIHwgXn5+fn5+fn4N
Cj4gPiANCj4gPiBJbnRyb2R1Y2VkIGJ5IGNvbW1pdA0KPiA+IA0KPiA+ICAgMmQ5YTc0NDY4NWJj
ICgic3BpOiBhdG1lbDogTm8gbmVlZCB0byBjYWxsIHNwaV9tYXN0ZXJfcHV0KCkgaWYgc3BpX2Fs
bG9jX21hc3RlcigpIGZhaWxlZCIpDQo+ID4gDQo+ID4gLS0gDQo+ID4gQ2hlZXJzLA0KPiA+IFN0
ZXBoZW4gUm90aHdlbGwNCg==
