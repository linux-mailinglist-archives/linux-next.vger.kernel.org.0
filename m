Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A4DEF56B
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 07:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387482AbfKEGLL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 01:11:11 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:33554 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387488AbfKEGLL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 01:11:11 -0500
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Ajay.Kathat@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Ajay.Kathat@microchip.com";
  x-sender="Ajay.Kathat@microchip.com"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1 mx
  a:ushub1.microchip.com a:smtpout.microchip.com
  a:mx1.microchip.iphmx.com a:mx2.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Ajay.Kathat@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Ajay.Kathat@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: MGRJbXH9HkKG6mYz2cNdlO/0pkA4Z0aZ510Au53l1DQERrot78dZgq/YYt0hmDqPyflsptJU8u
 D9Jy1uYRavq6RniHcbi0N16hG7SVYrNgSqqlaso1wVpUc1jak0UdphdWg+id/jwToramJIzclD
 3cVP+MpmFkyWZheAfmujBLd6GsLzCX8S8DhDTByNQPTs7gXX2zBBTq3Z5sTvMCRvxEWJL0mGSf
 82HsSWJMVzNXurlBCKrgzA/v5NbIlpJCJMH0WYZyJB41tJU4foCqBzJTBY2NBivmMAlaG0nYfx
 N2U=
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; 
   d="scan'208";a="52876807"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Nov 2019 23:11:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 4 Nov 2019 23:11:06 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 4 Nov 2019 23:11:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGHkDkhL66NroZHlp24GgB5XCOhb1NmMtGYY5fIXFaG/RiT97WtC4yv7PaPgfkpBC7dj+QcSVOYqlUFnBSv/5WYz2FXIijmg/wEG4dPNQU3L1beu6MKa7AsI5FgXXRJ4N9DMQLDb0FV6wSuxOsic9Y1dylZUG7EwJIOVkEuvRs1iy2ZYiieANmcVkCXR+ozGz7IzDRHs/WuCWhSBAEeeFi/DgVnY9cxXDAnuy7yIvtPvIzSzUL5xDikw8zmFnMXr8A20gKsmE+bYdq7gaLN6lL+MbkT3JGCKlX4rbfZ/fNcvCXR22Y1DnVMhq+Rr00H05ccvmv5JgSyHW3UPvaz5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3092rmxdVzNaG4bIAp+ZV6YTWdVdfpzGVTxKw+nKe+w=;
 b=CXi4GBfqC2w0U1A/esyuN1mcw9xXatYyR+IzVoKiDPBir19gAvPPXsTXh0gFXFEygABuWFulDm+3kjACjr5OHCGAydlcJFYSuJyTdmEgRQtobjEHICopXwuZWWsComPY0yqcIkyakqH48wownk1daXsUNXEIo51nBMiZBhxwMJmCMY3Edd//Sk3karV48XO+GVVPsgc6A0HNBNazEmVynOaph6OPbFjwXRNku2zaaiToW4+5/gRe+un8lmzng5aGjhR0KyDTV3IGN7yzpjtJZpnPp8wWVyZ0vCVHiwslySTPb9+4rKLFGIiFnygNW+z8uc1AEnCCzOzAGgFso24PLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3092rmxdVzNaG4bIAp+ZV6YTWdVdfpzGVTxKw+nKe+w=;
 b=ebwwkXJX6hHECJ/I3TvLSlD+gYwpIqVyrg0bJjfptsnqEheJuE5Dxn3ZFlDbH23Mk4LFmgr8AEMWkQoicESwii67JKJxHFuEkQV045W5nr30zfuFEfY0KkJxUWg+6RkV40+JkHB9uLRUGGogZnZavN7Fb3x9AP4Oko6axNhJsSE=
Received: from BN6PR11MB3985.namprd11.prod.outlook.com (10.255.129.78) by
 BN6PR11MB1874.namprd11.prod.outlook.com (10.175.101.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 06:11:03 +0000
Received: from BN6PR11MB3985.namprd11.prod.outlook.com
 ([fe80::5994:7522:979f:5e29]) by BN6PR11MB3985.namprd11.prod.outlook.com
 ([fe80::5994:7522:979f:5e29%7]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 06:11:03 +0000
From:   <Ajay.Kathat@microchip.com>
To:     <keescook@chromium.org>
CC:     <gregkh@linuxfoundation.org>, <gustavo@embeddedor.com>,
        <linux-next@vger.kernel.org>, <Adham.Abozaeid@microchip.com>
Subject: Re: Coverity: wilc_parse_join_bss_param(): Memory - illegal accesses
Thread-Topic: Coverity: wilc_parse_join_bss_param(): Memory - illegal accesses
Thread-Index: AQHVkzbIbwrvZcNwZUuxKscbThwdXKd8GR8A
Date:   Tue, 5 Nov 2019 06:11:03 +0000
Message-ID: <ce212f1d-e04d-6c95-ff18-2ddbed982bd9@microchip.com>
References: <201911040938.57CCE1B@keescook>
In-Reply-To: <201911040938.57CCE1B@keescook>
Reply-To: <Ajay.Kathat@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::13) To BN6PR11MB3985.namprd11.prod.outlook.com
 (2603:10b6:405:7b::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [121.244.27.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb526a76-2678-474e-cfff-08d761b6efe5
x-ms-traffictypediagnostic: BN6PR11MB1874:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB187457F25D09681BB46F4CB7E37E0@BN6PR11MB1874.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(8936002)(99286004)(7736002)(102836004)(36756003)(26005)(66066001)(31696002)(6916009)(25786009)(71200400001)(3450700001)(14444005)(256004)(186003)(8676002)(81166006)(81156014)(86362001)(66446008)(66476007)(66556008)(64756008)(5660300002)(66946007)(14454004)(478600001)(305945005)(229853002)(53546011)(43066004)(76176011)(71190400001)(446003)(11346002)(2906002)(966005)(2616005)(476003)(6512007)(31686004)(6306002)(107886003)(6246003)(4326008)(6436002)(52116002)(6486002)(6116002)(3846002)(54906003)(316002)(386003)(6506007)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1874;H:BN6PR11MB3985.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L8/m8ix9+ubzz7qfiNGFMVWw6ArAznbG+rDBFaPbfl87fy696cw1S4YlkVkYigIJHjLjqF+wHS5uCJu+IdfkQ91G4fJcXbE+tN57fBOtgodpX3yNVJ4U31QNZYFW2V5GqEKkjzL0Lib6r7j1jHzMA2YvablzzIkyDBVOxBm3use5u1eCGF4ufTSXmGNQDkcD/di80wHOlVsuSUrP6NILyrBGrZqMgXh0Df1Uvf1yMNvYNtYqQXBQhUvzICaB8vIWwPf6+1URA8SJaHdDZZrfr5Hd4B+pOrVRHeZzYMkFSWhnazcMcxcd37YInJzJE3WT/UIFIesPK8D+FMRmgHoDpWJOH+tuecZKvvFIsmrIXRiuzxK9cnWJJZKLE4/av4kctS20s8w3AyWleswp9DDWma8zh0IO9R2AKGOT99FTo+p1HIYyeiVNB8PLwcByW4xVhFKmYErdT8arP4sJ9u2X5dlRuI6BJDCSj4gu96n6EzE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB65A18944A22B408726C225A1167773@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb526a76-2678-474e-cfff-08d761b6efe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 06:11:03.8259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ML7uTL7TCoxJ/DQ7i9WKk89E1PPCsRhz9gKjPPp1LbRN3dbFTTracoKUT7X6lmNa0BMzsYIaSqo6mt0XoKbFPR2EAQezmeMj1OvFPlJbz/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1874
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCk9uIDA0LU5vdi0xOSAxMTowOCBQTSwgY292ZXJpdHktYm90IHdyb3RlOg0KPiBFeHRlcm5h
bCBFLU1haWwNCj4gDQo+IA0KPiBIZWxsbyENCj4gDQo+IFRoaXMgaXMgYW4gZXhwZXJpbWVudGFs
IGF1dG9tYXRlZCByZXBvcnQgYWJvdXQgaXNzdWVzIGRldGVjdGVkIGJ5IENvdmVyaXR5DQo+IGZy
b20gYSBzY2FuIG9mIG5leHQtMjAxOTEwMzEgYXMgcGFydCBvZiB0aGUgbGludXgtbmV4dCB3ZWVr
bHkgc2NhbiBwcm9qZWN0Og0KPiBodHRwczovL3NjYW4uY292ZXJpdHkuY29tL3Byb2plY3RzL2xp
bnV4LW5leHQtd2Vla2x5LXNjYW4NCj4gDQo+IFlvdSdyZSBnZXR0aW5nIHRoaXMgZW1haWwgYmVj
YXVzZSB5b3Ugd2VyZSBhc3NvY2lhdGVkIHdpdGggdGhlIGlkZW50aWZpZWQNCj4gbGluZXMgb2Yg
Y29kZSAobm90ZWQgYmVsb3cpIHRoYXQgd2VyZSB0b3VjaGVkIGJ5IHJlY2VudCBjb21taXRzOg0K
PiANCj4gNGUwYjBmNDJjOWM3ICgic3RhZ2luZzogd2lsYzEwMDA6IHVzZSBzdHJ1Y3QgdG8gcGFj
ayBqb2luIHBhcmFtZXRlcnMgZm9yIEZXIikNCj4gDQo+IENvdmVyaXR5IHJlcG9ydGVkIHRoZSBm
b2xsb3dpbmc6DQo+IA0KPiAqKiogQ0lEIDE0ODc0MDA6ICBNZW1vcnkgLSBpbGxlZ2FsIGFjY2Vz
c2VzICAoT1ZFUlJVTikNCj4gL2RyaXZlcnMvc3RhZ2luZy93aWxjMTAwMC93aWxjX2hpZi5jOiA0
OTYgaW4gd2lsY19wYXJzZV9qb2luX2Jzc19wYXJhbSgpDQo+IDQ5MCAgICAgCWlmIChzdXBwX3Jh
dGVzX2llKSB7DQo+IDQ5MSAgICAgCQlpZiAoc3VwcF9yYXRlc19pZVsxXSA+IChXSUxDX01BWF9S
QVRFU19TVVBQT1JURUQgLSByYXRlc19sZW4pKQ0KPiA0OTIgICAgIAkJCXBhcmFtLT5zdXBwX3Jh
dGVzWzBdID0gV0lMQ19NQVhfUkFURVNfU1VQUE9SVEVEOw0KPiA0OTMgICAgIAkJZWxzZQ0KPiA0
OTQgICAgIAkJCXBhcmFtLT5zdXBwX3JhdGVzWzBdICs9IHN1cHBfcmF0ZXNfaWVbMV07DQo+IDQ5
NQ0KPiB2dnYgICAgIENJRCAxNDg3NDAwOiAgTWVtb3J5IC0gaWxsZWdhbCBhY2Nlc3NlcyAgKE9W
RVJSVU4pDQo+IHZ2diAgICAgT3ZlcnJ1bm5pbmcgYXJyYXkgb2YgMTMgYnl0ZXMgYXQgYnl0ZSBv
ZmZzZXQgMTMgYnkgZGVyZWZlcmVuY2luZyBwb2ludGVyICImcGFyYW0tPnN1cHBfcmF0ZXNbcmF0
ZXNfbGVuICsgMV0iLiBbTm90ZTogVGhlIHNvdXJjZSBjb2RlIGltcGxlbWVudGF0aW9uIG9mIHRo
ZSBmdW5jdGlvbiBoYXMgYmVlbiBvdmVycmlkZGVuIGJ5IGEgYnVpbHRpbiBtb2RlbC5dDQo+IDQ5
NiAgICAgCQltZW1jcHkoJnBhcmFtLT5zdXBwX3JhdGVzW3JhdGVzX2xlbiArIDFdLCBzdXBwX3Jh
dGVzX2llICsgMiwNCj4gNDk3ICAgICAJCSAgICAgICAocGFyYW0tPnN1cHBfcmF0ZXNbMF0gLSBy
YXRlc19sZW4pKTsNCg0KQXMgSSB1bmRlcnN0YW5kLCBJZGVhbGx5IHRoaXMgY29uZGl0aW9uIHNo
b3VsZCBuZXZlciBhcmlzZSBiZWNhdXNlIHRoZQ0KbWF4aW11bSBudW1iZXIgb2Ygc3VwcG9ydGVk
ICpiYXNpYyByYXRlcyogaXMgdXAgdG8gOCBzbyB0aGUgdmFsdWUgb2YNCuKAmHJhdGVfbGVu4oCZ
IHdpbGwgYWx3YXlzIGJlIGxlc3MgdGhlbiBXSUxDX01BWF9SQVRFU19TVVBQUFJURUQgKGkuZSAx
MikuDQpUaGVyZWZvcmUgJyZwYXJhbS0+c3VwcF9yYXRlc1tyYXRlc19sZW4rIDFdJyB3aWxsIG5l
dmVyIHRyeSB0byBhY2Nlc3MNCnRoZSAxMyBieXRlcyBpbiB0aGUgYXJyYXkuDQpCdXQgZm9yIHRo
ZSBzYWZlciBzaWRlLCBpZiBuZWVkIEkgY2FuIGNyZWF0ZSBhIHBhdGNoIHRvIGJsb2NrIHRoZQ0K
YWRkaXRpb24gb2YgZXh0ZW5kZWQgc3VwcG9ydGVkIHJhdGVzIGluIOKAmHBhcmFtLT5zdXBwX3Jh
dGVz4oCZIGFycmF5IGlmDQrigJhyYXRlc19sZW7igJkgaXMgMTIgKGkuZSAncGFyYW0tPnN1cHBf
cmF0ZXMnIGFycmF5IGlzIGZ1bGwgYWZ0ZXIgZmlsaW5nDQp0aGUgYmFzaWMgc3VwcG9ydGVkIHJh
dGVzKS4NCg0KPiA0OTggICAgIAl9DQo+IDQ5OQ0KPiA1MDAgICAgIAlodF9pZSA9IGNmZzgwMjEx
X2ZpbmRfaWUoV0xBTl9FSURfSFRfQ0FQQUJJTElUWSwgaWVzLT5kYXRhLCBpZXMtPmxlbik7DQo+
IDUwMSAgICAgCWlmIChodF9pZSkNCj4gDQo+IElmIHRoaXMgaXMgYSBmYWxzZSBwb3NpdGl2ZSwg
cGxlYXNlIGxldCB1cyBrbm93IHNvIHdlIGNhbiBtYXJrIGl0IGFzDQo+IHN1Y2gsIG9yIHRlYWNo
IHRoZSBDb3Zlcml0eSBydWxlcyB0byBiZSBzbWFydGVyLiBJZiBub3QsIHBsZWFzZSBtYWtlDQo+
IHN1cmUgZml4ZXMgZ2V0IGludG8gbGludXgtbmV4dC4gOikgRm9yIHBhdGNoZXMgZml4aW5nIHRo
aXMsIHBsZWFzZQ0KPiBpbmNsdWRlIHRoZXNlIGxpbmVzIChidXQgZG91YmxlLWNoZWNrIHRoZSAi
Rml4ZXMiIGZpcnN0KToNCj4gDQo+IFJlcG9ydGVkLWJ5OiBjb3Zlcml0eS1ib3QgPGtlZXNjb29r
K2NvdmVyaXR5LWJvdEBjaHJvbWl1bS5vcmc+DQo+IEFkZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTQ4
NzQwMCAoIk1lbW9yeSAtIGlsbGVnYWwgYWNjZXNzZXMiKQ0KPiBGaXhlczogNGUwYjBmNDJjOWM3
ICgic3RhZ2luZzogd2lsYzEwMDA6IHVzZSBzdHJ1Y3QgdG8gcGFjayBqb2luIHBhcmFtZXRlcnMg
Zm9yIEZXIikNCj4gDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgYXR0ZW50aW9uIQ0KPiANCg==
