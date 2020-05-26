Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5690E1E1A75
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 06:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgEZEle (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 00:41:34 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:59962 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgEZEld (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 00:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1590468092; x=1622004092;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=caE/9/0SQ6+2/9eb0G93tHduQ5lAktlVlar54l5ivz8=;
  b=KLAMdLRr/GXbG2QpUHgAaJf9I6DlDhPG7tWrsi/4+HozEjDJ7w9M8xqW
   CFFYbWcjHV7pSoykRz1kHo75oHulx+A/FkNN4iTtOl++9i3t3r0Nfg6bq
   f++spJ4pv3I98gUqMxCwWqvrt9nIzW6smpZh5nE8x7Qh88I9CPwBN/ac6
   A=;
IronPort-SDR: 1I2yxgpQGronPtIVGFQbJPBNll2qNecEq6eWNw/8qKHwTIPYkDBpDa1+IrLgw6TjjTHOt2Vc6S
 g6nuZvCSpF7w==
X-IronPort-AV: E=Sophos;i="5.73,436,1583193600"; 
   d="scan'208";a="33514062"
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
Thread-Topic: linux-next: manual merge of the akpm-current tree with the tip tree
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 26 May 2020 04:41:19 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS id 6B3BFA22CF;
        Tue, 26 May 2020 04:41:18 +0000 (UTC)
Received: from EX13D01UWB003.ant.amazon.com (10.43.161.94) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 26 May 2020 04:41:18 +0000
Received: from EX13D01UWB002.ant.amazon.com (10.43.161.136) by
 EX13d01UWB003.ant.amazon.com (10.43.161.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 26 May 2020 04:41:17 +0000
Received: from EX13D01UWB002.ant.amazon.com ([10.43.161.136]) by
 EX13d01UWB002.ant.amazon.com ([10.43.161.136]) with mapi id 15.00.1497.006;
 Tue, 26 May 2020 04:41:17 +0000
From:   "Singh, Balbir" <sblbir@amazon.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@elte.hu" <mingo@elte.hu>, "hpa@zytor.com" <hpa@zytor.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC:     "jroedel@suse.de" <jroedel@suse.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Thread-Index: AQHWMoRxHm7E9gHusUGGqipfCnsbV6i5ysCA
Date:   Tue, 26 May 2020 04:41:17 +0000
Message-ID: <7cb7ccbdec1b8fd56be345bfa86648c4763c2473.camel@amazon.com>
References: <20200525210443.0904d583@canb.auug.org.au>
In-Reply-To: <20200525210443.0904d583@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.161.175]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C2C8DB2A7E9CB4A80D03C43F7D35508@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gTW9uLCAyMDIwLTA1LTI1IGF0IDIxOjA0ICsxMDAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhlIGFrcG0t
Y3VycmVudCB0cmVlIGdvdCBhIGNvbmZsaWN0IGluOg0KPiANCj4gICBhcmNoL3g4Ni9tbS90bGIu
Yw0KPiANCj4gYmV0d2VlbiBjb21taXQ6DQo+IA0KPiAgIDgzY2U1NmY3MTJhZiAoIng4Ni9tbTog
UmVmYWN0b3IgY29uZF9pYnBiKCkgdG8gc3VwcG9ydCBvdGhlciB1c2UgY2FzZXMiKQ0KPiANCj4g
ZnJvbSB0aGUgdGlwIHRyZWUgYW5kIGNvbW1pdDoNCj4gDQo+ICAgMzZjOGUzNGQwM2ExICgieDg2
L21tOiByZW1vdmUgdm1hbGxvYyBmYXVsdGluZyIpDQo+IA0KPiBmcm9tIHRoZSBha3BtLWN1cnJl
bnQgdHJlZS4NCj4gDQo+IEkgZml4ZWQgaXQgdXAgKHNlZSBiZWxvdykgYW5kIGNhbiBjYXJyeSB0
aGUgZml4IGFzIG5lY2Vzc2FyeS4gVGhpcw0KPiBpcyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4
LW5leHQgaXMgY29uY2VybmVkLCBidXQgYW55IG5vbiB0cml2aWFsDQo+IGNvbmZsaWN0cyBzaG91
bGQgYmUgbWVudGlvbmVkIHRvIHlvdXIgdXBzdHJlYW0gbWFpbnRhaW5lciB3aGVuIHlvdXIgdHJl
ZQ0KPiBpcyBzdWJtaXR0ZWQgZm9yIG1lcmdpbmcuICBZb3UgbWF5IGFsc28gd2FudCB0byBjb25z
aWRlciBjb29wZXJhdGluZw0KPiB3aXRoIHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb25mbGljdGlu
ZyB0cmVlIHRvIG1pbmltaXNlIGFueSBwYXJ0aWN1bGFybHkNCj4gY29tcGxleCBjb25mbGljdHMu
DQo+IA0KDQpUaGUgY2hhbmdlcyBsb29rIHJlYXNvbmFibGUgdG8gbWUgKGluIHRlcm1zIG9mIHRo
ZSBtZXJnZSByZXNvbHV0aW9uKS4NCg0KQWNrZWQtYnk6IEJhbGJpciBTaW5naCA8YnNpbmdoYXJv
cmFAZ21haWwuY29tPg0KDQo=
