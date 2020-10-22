Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9013B2958A9
	for <lists+linux-next@lfdr.de>; Thu, 22 Oct 2020 08:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504621AbgJVGzz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Oct 2020 02:55:55 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:40010 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439096AbgJVGzz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Oct 2020 02:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1603349755; x=1634885755;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=ZIW2hE594XwZjy1ZzYN4UgXXIpzsdA43Espcpx8qWbg=;
  b=uOrREnLTpSqTnYFpUH1fOMFotFyofbAwsbXftPovLy9xxZhHL+QZrg3Q
   gJXOcMlvpg4t/Ob8rOcE+zS1yrnKGawEC6gM3NvvfI1ZZLaQwG37ZQmJG
   tPIMwHjo0X3QaxDGF+NcUByuLeQU7j/aqsW6Ae1gl/q3dbXzGbxgODW+W
   M=;
X-IronPort-AV: E=Sophos;i="5.77,403,1596499200"; 
   d="scan'208";a="60741992"
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs tree
Thread-Topic: linux-next: Signed-off-by missing for commit in the jc_docs tree
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 22 Oct 2020 06:55:46 +0000
Received: from EX13D38EUB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS id CF0E228405C;
        Thu, 22 Oct 2020 06:55:45 +0000 (UTC)
Received: from EX13D38EUB001.ant.amazon.com (10.43.166.110) by
 EX13D38EUB001.ant.amazon.com (10.43.166.110) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 22 Oct 2020 06:55:44 +0000
Received: from EX13D38EUB001.ant.amazon.com ([10.43.166.110]) by
 EX13D38EUB001.ant.amazon.com ([10.43.166.110]) with mapi id 15.00.1497.006;
 Thu, 22 Oct 2020 06:55:44 +0000
From:   "Zheng, Fam" <famzheng@amazon.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "corbet@lwn.net" <corbet@lwn.net>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Thread-Index: AQHWp/USOxUvfKGOsEqqp9uXnw+NmKmioKMAgACQLAA=
Date:   Thu, 22 Oct 2020 06:55:44 +0000
Message-ID: <4b2a547e58b700455f6732f13cac32cb74568e96.camel@amazon.com>
References: <20201022085542.0abc028d@canb.auug.org.au>
         <20201021161944.14fb7d9f@lwn.net>
In-Reply-To: <20201021161944.14fb7d9f@lwn.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.68]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EB8FE3A902BC34AA202D30E43491A0F@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gV2VkLCAyMDIwLTEwLTIxIGF0IDE2OjE5IC0wNjAwLCBKb25hdGhhbiBDb3JiZXQgd3JvdGU6
DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9y
Z2FuaXphdGlvbi4gRG8NCj4gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyDQo+IGFuZCBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIFRodSwgMjIgT2N0IDIwMjAgMDg6NTU6NDIgKzExMDAN
Cj4gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOg0KPiANCj4g
PiBDb21taXQNCj4gPiANCj4gPiAgIDk0Njc3MzljMjM5ZCAoImRvY3M6IEFkZCB0d28gbWlzc2lu
ZyBlbnRyaWVzIGluIHZtIHN5c2N0bCBpbmRleCIpDQo+ID4gDQo+ID4gaXMgbWlzc2luZyBhIFNp
Z25lZC1vZmYtYnkgZnJvbSBpdHMgYXV0aG9yLg0KPiANCj4gQXJnaCwgSSBzaG91bGQgaGF2ZSBj
YXVnaHQgdGhhdC4gIEknZCBibGFtZSB3aWxkZmlyZXMsIGJ1dCB0aGF0IHdvdWxkDQo+IGJlDQo+
IGxhbWUuDQo+IA0KPiBPZmZlbmRpbmcgY29tbWl0IHJlbW92ZWQ7IEZhbSwgY2FuIHlvdSBzZW5k
IGEgcHJvcGVybHkgc2lnbmVkLW9mZg0KPiByZXBsYWNlbWVudD8gIE1lYW53aGlsZSBJJ20gZ29p
bmcgdG8gZ28gbG9vayBhdCBteSB0b29saW5nIHNvIHRoaXMNCj4gZG9lc24ndA0KPiBoYXBwZW4g
YWdhaW4uLi4NCg0KTXkgYmFkLCBJJ2xsIGZpeCBteSBzZXR1cC4NCg0KVjIgc2VudC4NCg0KRmFt
DQoNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLA0KPiANCj4gam9uDQo=
