Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA253A5E42
	for <lists+linux-next@lfdr.de>; Mon, 14 Jun 2021 10:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbhFNIUo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Jun 2021 04:20:44 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:38640 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232594AbhFNIUn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Jun 2021 04:20:43 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-195-7lJORaaoNCKWXPve2GavIw-1; Mon, 14 Jun 2021 09:18:38 +0100
X-MC-Unique: 7lJORaaoNCKWXPve2GavIw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 14 Jun
 2021 09:18:37 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Mon, 14 Jun 2021 09:18:37 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Geert Uytterhoeven' <geert@linux-m68k.org>,
        Dave Chinner <david@fromorbit.com>
CC:     Dave Chinner <dchinner@redhat.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        "Darrick J . Wong" <djwong@kernel.org>,
        "Allison Henderson" <allison.henderson@oracle.com>,
        Christoph Hellwig <hch@lst.de>,
        "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
        Linux-Next <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "noreply@ellerman.id.au" <noreply@ellerman.id.au>
Subject: RE: [PATCH] xfs: Fix 64-bit division on 32-bit in
 xlog_state_switch_iclogs()
Thread-Topic: [PATCH] xfs: Fix 64-bit division on 32-bit in
 xlog_state_switch_iclogs()
Thread-Index: AQHXXo7VbmU6/rUPA0ycA+xJ6PrQ66sTKT0g
Date:   Mon, 14 Jun 2021 08:18:37 +0000
Message-ID: <7478840c18fc45379697609757c6c747@AcuMS.aculab.com>
References: <20210610110001.2805317-1-geert@linux-m68k.org>
 <20210610220155.GQ664593@dread.disaster.area>
 <CAMuHMdWp3E3QDnbGDcTZsCiQNP3pLV2nXVmtOD7OEQO8P-9egQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWp3E3QDnbGDcTZsCiQNP3pLV2nXVmtOD7OEQO8P-9egQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6IDExIEp1bmUgMjAyMSAwNzo1NQ0KPiBI
aSBEYXZlLA0KPiANCj4gT24gRnJpLCBKdW4gMTEsIDIwMjEgYXQgMTI6MDIgQU0gRGF2ZSBDaGlu
bmVyIDxkYXZpZEBmcm9tb3JiaXQuY29tPiB3cm90ZToNCj4gPiBPbiBUaHUsIEp1biAxMCwgMjAy
MSBhdCAwMTowMDowMVBNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQouLi4NCj4g
PiA2NCBiaXQgZGl2aXNpb24gb24gMzIgYml0IHBsYXRmb3JtcyBpcyBzdGlsbCBhIHByb2JsZW0g
aW4gdGhpcyBkYXkNCj4gPiBhbmQgYWdlPw0KPiANCj4gVGhleSdyZSBub3QgYSBwcm9ibGVtLiAg
QnV0IHlvdSBzaG91bGQgdXNlIHRoZSByaWdodCBvcGVyYXRpb25zIGZyb20NCj4gPGxpbnV4L21h
dGg2NC5oPiwgaWZmIHlvdSByZWFsbHkgbmVlZCB0aGVzZSBleHBlbnNpdmUgb3BlcmF0aW9ucy4N
Cg0KKDY0Yml0KSBkaXZpc2lvbiBpc24ndCBleGFjdGx5IGNoZWFwIG9uIDY0Yml0IGNwdXMuDQoN
ClNvbWUgdGltaW5nIHRhYmxlcyBmb3IgeDg2IGdpdmUgbGF0ZW5jaWVzIG9mIHdlbGwgb3ZlciAx
IGJpdC9jbG9jaw0KZm9yIEludGVsIGNwdXMsIEFNRCByeXplbiBtYW5hZ2UgMiBiaXRzL2Nsb2Nr
Lg0KU2lnbmVkIGRpdmlkZSBpcyBhbHNvIHNpZ25pZmljYW50bHkgbW9yZSBleHBlbnNpdmUgdGhh
bg0KdW5zaWduZWQgZGl2aWRlLg0KDQpJbnRlZ2VyIGRpdmlkZSBwZXJmb3JtYW5jZSBpcyBjbGVh
cmx5IG5vdCBpbXBvcnRhbnQgZW5vdWdoDQp0byB0aHJvdyBzaWxpY29uIGF0Lg0KVGhlIHNhbWUg
dGFibGVzIHNob3cgZmRpdiBoYXZpbmcgYSBsYXRlbmN5IG9mIDE2IGNsb2Nrcy4NCg0KCURhdmlk
DQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBG
YXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2
IChXYWxlcykNCg==

