Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E082F2197DB
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 07:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgGIF3n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 01:29:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35164 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgGIF3n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jul 2020 01:29:43 -0400
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Thu, 9 Jul 2020
 13:29:39 +0800 (GMT+08:00)
X-Originating-IP: [113.200.148.30]
Date:   Thu, 9 Jul 2020 13:29:39 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   "Peng Fan" <fanpeng@loongson.cn>
To:     "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc:     "Mark Brown" <broonie@kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the spi tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2020 www.mailtech.cn .loongson.cn
In-Reply-To: <20200709141054.1b65be9d@canb.auug.org.au>
References: <20200709141054.1b65be9d@canb.auug.org.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <31ee871f.3cd.173320cfdfe.Coremail.fanpeng@loongson.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: AQAAf9Dxvx9DqwZfAZ4AAA--.195W
X-CM-SenderInfo: xidq1vtqj6z05rqj20fqof0/1tbiAQAMEl3QvL5LwQABsb
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

VmVyeSBzb3JyeSBmb3IgdGhhdCwgSSB3aWxsIHJlLXNlbmQgdjIgbGF0ZXIuCgomcXVvdDtTdGVw
aGVuIFJvdGh3ZWxsJnF1b3Q7ICZsdDtzZnJAY2FuYi5hdXVnLm9yZy5hdSZndDt3cm90ZToKPiBI
aSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBzcGkgdHJlZSwgdG9kYXkncyBsaW51eC1u
ZXh0IGJ1aWxkIChhcm0NCj4gbXVsdGlfdjdfZGVmY29uZmlnKSBwcm9kdWNlZCB0aGlzIHdhcm5p
bmc6DQo+IA0KPiBkcml2ZXJzL3NwaS9zcGktYXRtZWwuYzogSW4gZnVuY3Rpb24gJ2F0bWVsX3Nw
aV9wcm9iZSc6DQo+IGRyaXZlcnMvc3BpL3NwaS1hdG1lbC5jOjE2ODA6MTogd2FybmluZzogbGFi
ZWwgJ291dF9mcmVlJyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtbGFiZWxdDQo+ICAx
NjgwIHwgb3V0X2ZyZWU6DQo+ICAgICAgIHwgXn5+fn5+fn4NCj4gDQo+IEludHJvZHVjZWQgYnkg
Y29tbWl0DQo+IA0KPiAgIDJkOWE3NDQ2ODViYyAoInNwaTogYXRtZWw6IE5vIG5lZWQgdG8gY2Fs
bCBzcGlfbWFzdGVyX3B1dCgpIGlmIHNwaV9hbGxvY19tYXN0ZXIoKSBmYWlsZWQiKQ0KPiANCj4g
LS0gDQo+IENoZWVycywNCj4gU3RlcGhlbiBSb3Rod2VsbA0K
