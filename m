Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBE5019E8BF
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 05:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgDEDHH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 4 Apr 2020 23:07:07 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:45076 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgDEDHG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 4 Apr 2020 23:07:06 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 2147312833A71;
        Sat,  4 Apr 2020 20:07:06 -0700 (PDT)
Date:   Sat, 04 Apr 2020 20:07:03 -0700 (PDT)
Message-Id: <20200404.200703.386761680598211839.davem@davemloft.net>
To:     sfr@canb.auug.org.au
Cc:     bot@kernelci.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenqiwu@xiaomi.com
Subject: Re: linux-next: build failure after merge of the ide tree
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200405111307.6d0ac36e@canb.auug.org.au>
References: <20200405111307.6d0ac36e@canb.auug.org.au>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sat, 04 Apr 2020 20:07:06 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

RnJvbTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQpEYXRlOiBTdW4s
IDUgQXByIDIwMjAgMTE6MTM6MDcgKzEwMDANCg0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJn
aW5nIHRoZSBpZGUgdHJlZSwgeWVzdGVyZGF5J3MgbGludXgtbmV4dCBidWlsZCAobWlwcw0KPiBi
aWdzdXJfZGVmY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOg0KPiANCj4gZHJpdmVycy9pZGUvaWRl
LXNjYW4tcGNpLmM6MTA0OjEzOiBlcnJvcjogaW5jb21wYXRpYmxlIHR5cGUgZm9yIGFyZ3VtZW50
IDEgb2YgoWxpc3RfZGVsog0KPiANCj4gQ2F1c2VkIGJ5IGNvbW1pdA0KPiANCj4gICA2YTAwMzM0
NTdmMjMgKCJkcml2ZXJzL2lkZTogY29udmVydCB0byBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUo
KSIpDQo+IA0KPiBsaXN0X2RlbCgpIHRha2VzIGEgInN0cnVjdCBsaXN0X2hlYWQgKiIsIHN0cnVj
dCBwY2lfZHJpdmVyOjpub2RlIGlzIGENCj4gInN0cnVjdCBsaXN0X2hlYWQiIGkuZS4gdGhlcmUg
aXMgYSBtaXNzaW5nICcmJy4NCg0KVGhhbmtzIFN0ZXBoZW4sIHRoZSBrYnVpbGQgYm90IGNhdWdo
dCB0aGlzIHRvbyBhbmQgaXQncyBub3QgZml4ZWQgaW4gdGhlDQppZGUgR0lUIHRyZWUuDQo=
