Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E803370109
	for <lists+linux-next@lfdr.de>; Fri, 30 Apr 2021 21:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhD3TKC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Apr 2021 15:10:02 -0400
Received: from mail-eopbgr760135.outbound.protection.outlook.com ([40.107.76.135]:25598
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229954AbhD3TKB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Apr 2021 15:10:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4iZ7bg7mU0tGuEDHXnChJsqjlVLLdPlo+ehEUQdjnb+E5O4Zh7QMrYtr9MCQe/Tdequ71UIEhMvy32Rnq/fOyEKjsnVVo8Ty0L82Ec6cV/kHpdQ+g9un9bpKiVkjWmk0GKAe+8Wy33sSPsMVmnyeidZcaNjJspqOvIa5v/LoWiITpqqNVAx5xWyKxz0Geudo0LWWK/V70iK9HXZIiyX2NtEo+0PD0+QwT4LKyTmyf7/Ho9WNbJ62I0Fsp5FIraHViSkLXMnASYVGuxjehgXYAZlGjllWBK0HO8xikY75FOmD8tRBdUaoBpmQnSJ8UjM0Yy252zFr2JkQj40zM7iBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V86ITetBtnu/YWVFU97+Iq3MfkNb/Dv5FwLumxo0ULg=;
 b=QOLPKjIre0knK6UxkE4kvW+nxZct2yg7//bCicnBNqefRsjZqhQxzu5QxzSH0W40sndsr6j4QmMHFfyFtD8oRHiZo5e/CXo5Gj9+eHC33H7CWlcYMp343e30W6BqOeUoYUiDQQF5nf+YOesz/AzsMzUMgNFpj3dlvxWDqbsWECpD7kk2rOS17W1aehc7lMd7TanRg1kj+AyJEBme3NZxj0wYEdMWnzh2Q5acYwspGiQM47RzbEDLgm40c+IXCXV+15ugz06J0lWs9uPHKeGAZpqATmzYqwS44zWmudyBsr9k+0JEs2cRILLk+lvEjMPx7p1YOptknzlxm3WkpU+t9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V86ITetBtnu/YWVFU97+Iq3MfkNb/Dv5FwLumxo0ULg=;
 b=fg72bbqRBMbaRUIqs8JLRvhudZX35d0HYU68ZPfNRofBc4LfqIJhgKL9z6zh76oB27cm8PSq3qwh6A6RXKqPVwl18KTWNBVfYbnZrDM8JyI4qIMClX2jEV97qR7g4bv+2JltkniO0ZzgcpMGeI3+iP2c6cKPdVuY+3AQi1LTDOo=
Received: from DS7PR13MB4733.namprd13.prod.outlook.com (2603:10b6:5:3b1::24)
 by DM6PR13MB4525.namprd13.prod.outlook.com (2603:10b6:5:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.8; Fri, 30 Apr
 2021 19:09:12 +0000
Received: from DS7PR13MB4733.namprd13.prod.outlook.com
 ([fe80::4c65:55ca:a5a2:f18]) by DS7PR13MB4733.namprd13.prod.outlook.com
 ([fe80::4c65:55ca:a5a2:f18%7]) with mapi id 15.20.4108.015; Fri, 30 Apr 2021
 19:09:12 +0000
From:   Trond Myklebust <trondmy@hammerspace.com>
To:     "keescook@chromium.org" <keescook@chromium.org>,
        "chuck.lever@oracle.com" <chuck.lever@oracle.com>
CC:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "gustavo@embeddedor.com" <gustavo@embeddedor.com>
Subject: Re: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Topic: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Index: AQHXPe5Owev6hK6G6EmjYYhzldelXKrNZhyAgAAGooA=
Date:   Fri, 30 Apr 2021 19:09:12 +0000
Message-ID: <08aa80f9bfeb1b48daf804aa2903d6217e599fa4.camel@hammerspace.com>
References: <202104301126.5A1D9706E@keescook>
         <B431253D-E874-45BA-9303-79C7FA950D1B@oracle.com>
In-Reply-To: <B431253D-E874-45BA-9303-79C7FA950D1B@oracle.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none
 header.from=hammerspace.com;
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 537ccc29-4708-478a-75c2-08d90c0b708f
x-ms-traffictypediagnostic: DM6PR13MB4525:
x-microsoft-antispam-prvs: <DM6PR13MB4525A23B4B0597D1EE22750EB85E9@DM6PR13MB4525.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M1A397oU4AUWAbxCUSaZeT5ujOZalRw5WpnMkqrxL1VnemPVY/yC/k8a+yriB4H19Ro2jFQEJRlTJEVYIst5RngTRmULzJIDzTHU/0CBV7nOFcvTisCr1NuAFzUz5kD12CtUUmIDCMP5doNEVDlOEh6U6Bam5vg92U9nbTVgCavV7bZoQa/bcATH0QFizjouZ0FRzVCsqi2S7kn9V201PC1wCqYkYnFXzxGj+y2Xd1q0azFwkTkrK3Gt6J7PXynnXTwvGn1rvPsApZkACvpWjSP4Xed6dlZbOoPA5J1EBo+zSiIjWS1om7Enop/nUW4KhDIhhv+TklG8aotDC2LxfWTP3uaULBp0OjG/SYWxEMbnjeGaNcOe2jWqHXjOoDlGHUE+8HNhNCB+XKFGOtu1dc9KCWZwzTDTN5ZlZ3cwmx4Mi9ZipZu6Y+tEbruBCFLJnJY1PGXxHaC+AbUidSQzYej0DPdEwYe9OagRKlHtza3IJ6I+lzsu9FjuX0yGWVL/pnUolUsMh+ehPkmge6eiTp4/Se4+nFjxwV2cBhVBCFQPpGQVd30AKUDRGhAWTkK6zliOvy/nP4CENvwfJ9l3VqmwrVRyvVP4CivWjL6WqWiYWGzwtC0AXPGvNERfY3UzBYVTLwqq4BBc/lPD/N7I0nRFuui8jb4826fbTBlpM2/XkUr3SYvc5LLzOjHlZru8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR13MB4733.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39840400004)(346002)(136003)(376002)(36756003)(478600001)(86362001)(6486002)(4326008)(2616005)(66446008)(76116006)(966005)(110136005)(122000001)(38100700002)(26005)(5660300002)(71200400001)(8936002)(6512007)(316002)(54906003)(53546011)(6506007)(186003)(8676002)(83380400001)(66556008)(66946007)(66476007)(91956017)(2906002)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SjludUR1WmJMbVhYYzJ5N1VRZEhMZVBCNDVJNEFMaUduZHBDUXpsZ0R0eVFG?=
 =?utf-8?B?SkQ2c2tHeUlHcEo0K292SmFzSFFGaG5Xc0lmNEREVHdKdnJ3UlFGcE5xRHZG?=
 =?utf-8?B?U1lIMkZQTUg1c0VhTk1aVXliTGJRc0pKSkNzTU11RzNqVkdiMlJrRy9TNmdV?=
 =?utf-8?B?L0wzdFVsdWNkOHhSQmtGL2VWWnNDUjJVY0J1dUhsNnRjY204RThDSWlnWk0w?=
 =?utf-8?B?T09ETDFDaSswZ3kyTCtyR2ZqQWJUcHNKOWxqQ1RnWE95aVUzb2ZyTU9ZenpQ?=
 =?utf-8?B?S1VLdExsd2ZHUEhvV1FGdVlRR3dPbXllRUFDL0k0NklseEZKWFdvYzBlSkR3?=
 =?utf-8?B?UUJWQ1NqVkRCMi9Takc3bks2K1piS2JjcHNnVks3MDBCZEg2bVFQQ096RjFW?=
 =?utf-8?B?NEhoVmVRV0dEL0Vra3V6QXRPMUFyRVpCWkRDQ0VmYkJVdTd4OXlaUFNjM0p2?=
 =?utf-8?B?cWlBVnNodHJ2MG1iU2lHMUo5eUxlTzMyUCs5TitGSHljbVZkMjhkN1FyVjJC?=
 =?utf-8?B?MG50alZyZDFNd2pUbnhWbEdmMUoySlJMNk55UDFvME9iNjcxb1o1cVZEKzZp?=
 =?utf-8?B?MDRTd0hXQ0dndjlYT0xhL21DcmNkWU9lbXVSU1RUc2FTTGNwQk91aWM3MTYx?=
 =?utf-8?B?RHZwc2xrM3VLQlpuNHVjZU5zVVNUMnRuTGF4cExZQXpqMStsVVAyNk5LVnlk?=
 =?utf-8?B?TmhpT3g3Q1lXNkhYZlpORWpSRjhTWCtVZ1QvRDZNL1ZWVW1WV2w0QWNsc0hP?=
 =?utf-8?B?ekQwRTlIblFRTW1JRkYrUkdqVyttMVUvNXkxaUtuaDFnUFc2MHpJUGh3WVFu?=
 =?utf-8?B?Y2piODFpeFJnUk1yUzB2VnJMOUY1VU85dTg5Z3hRcDREUW12ME53aWx2UUVT?=
 =?utf-8?B?UDlCZkFrQlpUVk03TEtJTW43dWRqU1FKc2VZRVQ1bGlnRGRpa3lwT2I2bWVm?=
 =?utf-8?B?Qm1jZUJra0huWmhxZkZVUFVnSFVJajlIKzJDcVFScG0yd3dsRDBhSFc0OFhC?=
 =?utf-8?B?ZDRPL1hmYkpmWFk4VkNYNDI1ZW1ndVh6MlVrZUtQcW9OMHV2UnZtcDlHa2pO?=
 =?utf-8?B?WkRhTnV3aEdzYVlKdHpIN1JXWDR0TVdra3czWDhrcU1qWmlsQzBsdDdrd0ky?=
 =?utf-8?B?ODJDMlpWOC9hOWo0NWllNUNPL0REeFRiV0d0cWtWK1o0QkZMckZ2bWsrYnhn?=
 =?utf-8?B?Z3U5QVkwaEx5ZVdkUXhoNGt1Ty9UeUZWQ1pqejBLZUVHR0lGbTdNSTBYc0pv?=
 =?utf-8?B?OTQzSnhZRStOQ2Q5Ly9yL2VHYzJ5R3Q5aUJ2ZGgwd20rSzFqcG4rQ1VxWHlO?=
 =?utf-8?B?dEMya2FkYWFma1diNkVtT05KbEVJbjNXYys2QmlsbEZYa2FmSXhNZWJQQXZI?=
 =?utf-8?B?Q2hsUXN4YVFDT1NjL3NSSkFKSVhYZmNrcFQxUkdFQWdFZ3lFZWROTytKQmww?=
 =?utf-8?B?QlNYdGV6Slp6dlc5M05BWmFvU2RtcSsrZU5xZUxKcFB1Q0I5NlJVZkk3c29K?=
 =?utf-8?B?NmZKSDN2cTZOMUdmSnBsZ1RNVU8yYlpIY1JUOFV4TEZHSU1PdWppV0I5c0lB?=
 =?utf-8?B?VFQxcTRSOXJTUGlJQ0lhUHZuYURqYk9hZU9CRC8zSE1iV2pOU2s5Y0IyNE1k?=
 =?utf-8?B?cEhyNTNZdll3V2YwSmZncGV1U1U2TkRrc1YyL1pGb2pNRnRXZGdjc3BWQVJQ?=
 =?utf-8?B?V1hNek5aRTVoQzlxRWJHV3dEdklrOEpkcGFQM1gxT0I5a2RrSTFDUXBEUklQ?=
 =?utf-8?Q?4oxge9YE52cQorY08gKXFG3xHjoPgWOm3gaJG70?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B9EFF6755D0A246B918CEE3B553DAE8@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR13MB4733.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537ccc29-4708-478a-75c2-08d90c0b708f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 19:09:12.1293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFHecfZteD9zPjgWuR9rkeFlglJvZRj0L46SLwMaWtc/KbTFuTVbCD3hJIUhhMjiNlF1V6jABOpxnjEl6+iCXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4525
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gRnJpLCAyMDIxLTA0LTMwIGF0IDE4OjQ1ICswMDAwLCBDaHVjayBMZXZlciBJSUkgd3JvdGU6
DQo+IA0KPiANCj4gPiBPbiBBcHIgMzAsIDIwMjEsIGF0IDI6MjYgUE0sIGNvdmVyaXR5LWJvdCA8
a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPg0KPiA+IHdyb3RlOg0KPiA+IA0KPiA+IEhlbGxvIQ0KPiA+
IA0KPiA+IFRoaXMgaXMgYW4gZXhwZXJpbWVudGFsIHNlbWktYXV0b21hdGVkIHJlcG9ydCBhYm91
dCBpc3N1ZXMgZGV0ZWN0ZWQNCj4gPiBieQ0KPiA+IENvdmVyaXR5IGZyb20gYSBzY2FuIG9mIG5l
eHQtMjAyMTA0MzAgYXMgcGFydCBvZiB0aGUgbGludXgtbmV4dA0KPiA+IHNjYW4gcHJvamVjdDoN
Cj4gPiBodHRwczovL3NjYW4uY292ZXJpdHkuY29tL3Byb2plY3RzL2xpbnV4LW5leHQtd2Vla2x5
LXNjYW4NCj4gPiANCj4gPiBZb3UncmUgZ2V0dGluZyB0aGlzIGVtYWlsIGJlY2F1c2UgeW91IHdl
cmUgYXNzb2NpYXRlZCB3aXRoIHRoZQ0KPiA+IGlkZW50aWZpZWQNCj4gPiBsaW5lcyBvZiBjb2Rl
IChub3RlZCBiZWxvdykgdGhhdCB3ZXJlIHRvdWNoZWQgYnkgY29tbWl0czoNCj4gPiANCj4gPiDC
oE1vbiBBcHIgMjYgMDk6Mjc6MDYgMjAyMSAtMDQwMA0KPiA+IMKgwqAgOWEzMDFjYWZjODYxICgi
eHBydHJkbWE6IE1vdmUgZnJfbGludl9kb25lIGZpZWxkIHRvIHN0cnVjdA0KPiA+IHJwY3JkbWFf
bXIiKQ0KPiA+IA0KPiA+IENvdmVyaXR5IHJlcG9ydGVkIHRoZSBmb2xsb3dpbmc6DQo+ID4gDQo+
ID4gKioqIENJRCAxNTA0NTU2OsKgIE51bGwgcG9pbnRlciBkZXJlZmVyZW5jZXPCoCAoRk9SV0FS
RF9OVUxMKQ0KPiA+IC9uZXQvc3VucnBjL3hwcnRyZG1hL2Zyd3Jfb3BzLmM6IDUzOSBpbiBmcndy
X3VubWFwX3N5bmMoKQ0KPiA+IDUzMw0KPiA+IDUzNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyogU3Ryb25nIHNlbmQgcXVldWUgb3JkZXJpbmcgZ3VhcmFudGVlcyB0aGF0IHdoZW4NCj4gPiB0
aGUNCj4gPiA1MzXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGxhc3QgV1IgaW4gdGhlIGNo
YWluIGNvbXBsZXRlcywgYWxsIFdScyBpbiB0aGUNCj4gPiBjaGFpbg0KPiA+IDUzNsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogYXJlIGNvbXBsZXRlLg0KPiA+IDUzN8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICovDQo+ID4gNTM4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsYXN0LT53
cl9jcWUtPmRvbmUgPSBmcndyX3djX2xvY2FsaW52X3dha2U7DQo+ID4gdnZ2wqDCoMKgwqAgQ0lE
IDE1MDQ1NTY6wqAgTnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlc8KgIChGT1JXQVJEX05VTEwpDQo+
ID4gdnZ2wqDCoMKgwqAgUGFzc2luZyBudWxsIHBvaW50ZXIgIiZtci0+bXJfbGludl9kb25lIiB0
bw0KPiA+ICJyZWluaXRfY29tcGxldGlvbiIsIHdoaWNoIGRlcmVmZXJlbmNlcyBpdC4NCj4gPiA1
MznCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlaW5pdF9jb21wbGV0aW9uKCZtci0+bXJfbGlu
dl9kb25lKTsNCj4gPiA1NDANCj4gPiA1NDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFRy
YW5zcG9ydCBkaXNjb25uZWN0IGRyYWlucyB0aGUgcmVjZWl2ZSBDUQ0KPiA+IGJlZm9yZSBpdA0K
PiA+IDU0MsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcmVwbGFjZXMgdGhlIFFQLiBUaGUg
UlBDIHJlcGx5IGhhbmRsZXIgd29uJ3QNCj4gPiBjYWxsIHVzDQo+ID4gNTQzwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiB1bmxlc3MgcmVfaWQtPnFwIGlzIGEgdmFsaWQgcG9pbnRlci4NCj4g
PiA1NDTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+IA0KPiA+IElmIHRoaXMgaXMg
YSBmYWxzZSBwb3NpdGl2ZSwgcGxlYXNlIGxldCB1cyBrbm93IHNvIHdlIGNhbiBtYXJrIGl0DQo+
ID4gYXMNCj4gPiBzdWNoLCBvciB0ZWFjaCB0aGUgQ292ZXJpdHkgcnVsZXMgdG8gYmUgc21hcnRl
ci4NCj4gDQo+IFN1cmUsIG5vdCBteSBwcm91ZGVzdCBtb21lbnQgaGVyZS4NCj4gDQo+IFRoZSBz
b2xlIGNhbGwgc2l0ZSBmb3IgZnJ3cl91bm1hcF9zeW5jKCkgaXMgdGhpcyBvbmU6DQo+IA0KPiBu
ZXQvc3VucnBjL3hwcnRyZG1hL3RyYW5zcG9ydC5jOg0KPiA2MDbCoMKgwqDCoMKgwqDCoMKgIGlm
ICh1bmxpa2VseSghbGlzdF9lbXB0eSgmcmVxLT5ybF9yZWdpc3RlcmVkKSkpIHsNCj4gNjA3wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHJhY2VfeHBydHJkbWFfbXJzX3phcCh0YXNr
KTsNCj4gNjA4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJ3cl91bm1hcF9zeW5j
KHJwY3hfdG9fcmRtYXgocnFzdC0+cnFfeHBydCksDQo+IHJlcSk7DQo+IDYwOcKgwqDCoMKgwqDC
oMKgwqAgfQ0KPiANCj4gVGh1cywgaW4gdGhlIGN1cnJlbnQgY29kZSBiYXNlLCB0aGUgd2hpbGUo
KSBsb29wOg0KPiANCj4gbmV0L3N1bnJwYy94cHJ0cmRtYS9mcndyX29wcy5jOg0KPiA1MTTCoMKg
wqDCoMKgwqDCoMKgIHdoaWxlICgobXIgPSBycGNyZG1hX21yX3BvcCgmcmVxLT5ybF9yZWdpc3Rl
cmVkKSkpIHsNCj4gDQo+IFNob3VsZCBhbHdheXMgdGVybWluYXRlIHdpdGggbXIgY29udGFpbmlu
ZyBhIG5vbi1OVUxMIGFkZHJlc3MuDQo+IA0KPiBTZWVtcyB0byBtZSB0aGUgZnJ3cl91bm1hcF9z
eW5jKCkgY29kZSBiZWZvcmUgZmRmNWVjYjE5MzRiDQo+ICgieHBydHJkbWE6IE1vdmUgZnJfbGlu
dl9kb25lIGZpZWxkIHRvIHN0cnVjdCBycGNyZG1hX21yIikgaGFzDQo+IHRoZSBzYW1lIHJpc2sg
LS0gZnJ3ciBjYW4gYmUgTlVMTCBpZiBybF9yZWdpc3RlcmVkIGlzIGVtcHR5Lg0KPiANCj4gSSdt
IG9wZW4gdG8gc3VnZ2VzdGlvbnMgZm9yIGltcHJvdmVtZW50LCBidXQgSSdtIG5vdCBzZWVpbmcg
dGhpcw0KPiByaXNlIHRvIHRoZSBsZXZlbCBvZiBhIHBlcnZhc2l2ZSBhbmQgaGlnaCBpbXBhY3Qg
aXNzdWUuDQo+IA0KDQpDaHVjaywgSSB0aGluayB0aGUgcG9pbnQgaXMgdGhhdCB5b3UgY2FuJ3Qg
ZXZlciBleGl0IHRoYXQgd2hpbGUoKSBsb29wDQpfdW5sZXNzXyBtciA9PSBOVUxMLiBTbyBjYWxs
aW5nIHJlaW5pdF9jb21wbGV0aW9uKCZtci0+bXJfbGludl9kb25lKQ0KYWZ0ZXIgZXhpdGluZyB0
aGF0IGxvb3Agd2lsbCBpbmRlZWQgT29wcy4NCg0KU28gd2lsbCB0aGUgY2FsbCB0byB3YWl0X2Zv
cl9jb21wbGV0aW9uKCZtci0+bXJfbGludl9kb25lKS4NCg0KSU9XOiBJIHRoaW5rIHlvdSBuZWVk
IHRvIHNhdmUgdGhlIGxhc3Qgbm9uLU5VTEwgdmFsdWUgb2YgJ21yJyBpbnNpZGUNCnRoZSBsb29w
Lg0KDQotLSANClRyb25kIE15a2xlYnVzdA0KTGludXggTkZTIGNsaWVudCBtYWludGFpbmVyLCBI
YW1tZXJzcGFjZQ0KdHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbQ0KDQoNCg==
