Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BB6315FD1
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 08:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhBJHDu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 02:03:50 -0500
Received: from mo-csw-fb1114.securemx.jp ([210.130.202.173]:45498 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhBJHDs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 02:03:48 -0500
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1114) id 11A5asLG028801; Wed, 10 Feb 2021 14:36:54 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 11A5Y82U011470; Wed, 10 Feb 2021 14:34:08 +0900
X-Iguazu-Qid: 2wGqzdZmd9QW53S1Hk
X-Iguazu-QSIG: v=2; s=0; t=1612935248; q=2wGqzdZmd9QW53S1Hk; m=hYskWyOAMKP44whQCy6aV9uT1RX7jHUgJVl532InDVE=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1112) id 11A5Y1Mw019294;
        Wed, 10 Feb 2021 14:34:02 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 11A5Y1Nc013789;
        Wed, 10 Feb 2021 14:34:01 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 11A5Y1Yi024311;
        Wed, 10 Feb 2021 14:34:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDteWqBukzvIqwUVqnGXj/k1wSHP4gs/SQwtrhgKhJ9byMdveIh+f2nIcYUVOtn9FkK3WIAt3+cL+U4MBTuqACfLnF6L0+hnovFZmePFOhC8XewCjusHEbocCFZzQSBpLD387yXvsmpubG/UcLZDekcuV97LJDjT8bOc1MWURnp7uiS4xnBVqzfRbv3zApi7F8Tq+8poWQQ67fSaNEYMFSMWvZWubJ4HU9+4ON1A/Q6f43PK/sk/1A8mgqiWARq1h9l5LvMM8ubYokgE/MGV0ReAw3DXMTkEPCAVeZAsI8nNJyHLgfT35VnLt+KpMMq7l/ANoVz55J4mpX7wfIQ/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnZyIXExNQZNRBec68qkIQKQi+wpatekQ3bTMpRAm+U=;
 b=hB4p14CHhXHi1lqF50BVEfpVMF5CUZLDj+ayMfO6vXlWsq5vYtfRIx8VETcLHqgs/4wAqO0tCDb9dfelfmUOXw1Ayls/WWTF9oZyht9eaKyGnzh/4hNJ+i7WjSGaMWeeY9ErxkjcobRC2pC4eZX3EgD0wGyGSMdOYxqnS6AMXWTU/Xa2gXZgAcDrJd4LFVi5Hfz33zDaQsgJCHDln1oyYMcSj8W5kVZAZOwDfBSonxGrlsJIOZxVGPOTuhXe4sOkn2HjeFyXfBde0+nJznC5JbG3DZhXQWXRPb9BdKbq2Ee2k9pnztH4wkDKbz66qtR8KvPs/t3ixDL48N+OI5a/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From:   <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     <arnd@kernel.org>, <geert@linux-m68k.org>
CC:     <sfr@canb.auug.org.au>, <brgl@bgdev.pl>, <olof@lixom.net>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <bgolaszewski@baylibre.com>, <linux-kernel@vger.kernel.org>,
        <linux-next@vger.kernel.org>
Subject: RE: linux-next: manual merge of the gpio-brgl tree with the arm-soc
 tree
Thread-Topic: linux-next: manual merge of the gpio-brgl tree with the arm-soc
 tree
Thread-Index: AQHW9Tt2Y/QaGZ7Br0qfv4Sly9Ky16pPqokAgAAaVgCAASvngA==
Date:   Wed, 10 Feb 2021 05:33:59 +0000
X-TSB-HOP: ON
Message-ID: <OSBPR01MB2983BB81E025AABF7D633C18928D9@OSBPR01MB2983.jpnprd01.prod.outlook.com>
References: <20210128170331.4f2ac87b@canb.auug.org.au>
 <CAMuHMdWAOXpJGTRM7O7ix4uG-hpH-kDiueN51oA0YEZ0vJdZfw@mail.gmail.com>
 <CAK8P3a1Fv=Bei+Zkq43yn_dek=RB96_yXrtJ-ZA5K4nf06joOw@mail.gmail.com>
In-Reply-To: <CAK8P3a1Fv=Bei+Zkq43yn_dek=RB96_yXrtJ-ZA5K4nf06joOw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=toshiba.co.jp;
x-originating-ip: [103.91.184.0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98ad7a4d-1b3b-4483-d536-08d8cd85777c
x-ms-traffictypediagnostic: OSAPR01MB5171:
x-microsoft-antispam-prvs: <OSAPR01MB5171BF7056AB8A1FB80AC1DB928D9@OSAPR01MB5171.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:397;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Flhe7jsau3ZbWNVWkYBmRpKdet9AUMp4c57REMsfjYoWRPOXN8itY2xXTxgoOh4yLSDZrVIb72r+n8Yn3e3g6e5uDdGF5ow/QDa1uEHuVsHACcrVHDfBKzZXwcDVrQf09Gn8uYzbIggFOmDkRyYqWanOQJ1OHqAVdunK3R27zapkQGjax0d5YtmKL7QztfiFP1KCDqq5d4qrFc4huKSvJFXPDX8R+IipcKKHVTs0iAQhzbT1e946TwvP8l9OLWBSBafnaCde+OdiGSTLW/D1XBtyfsR3YgPThrkJRUqy6Wfx2O7Nos3G920/FqJ4+4+HsC3dywf4HQnWWs3Y3Rcj8ALuqatYuB2k3VzeflzfqMoxb/dAbGBolhUTZRB1+PoP3C2M4Pw6SpRW7IROvIdR+bRRR3WKGNe6Dx+orJCkmzA3v/1yF691QmpG0WP6mfC0rLVcrCu4oGEnXx23AvUCB5Orro769nALGQ+8ZvEg6oad1NCMQqpOw/DlAa75Hy0eTm7p4xbnvhkLUckXkvQSC0TrO6y1b17Yvs9n5stNtBvNrXiF6cw/O8l+ZoDztO3FRNT5mro+jVqTzF/hTTYzjw3aRG+8b72Ua1NHxRCiI7k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2983.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(478600001)(66946007)(2906002)(8676002)(186003)(83380400001)(33656002)(76116006)(53546011)(9686003)(86362001)(66556008)(7696005)(110136005)(4326008)(6506007)(71200400001)(66446008)(966005)(66476007)(8936002)(26005)(5660300002)(52536014)(64756008)(54906003)(316002)(55016002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dWx4SzZWaGgxUkRwRzV6T1NncHp6QWRHUjFLYVROMUxWTkNMVXdXNEl3a3pU?=
 =?utf-8?B?TnhCL3FOa0tzWmFUdnRrajNWcmdkWURJdEtuSTJ1T3JHQ3ZLMzhPbXVZR2NU?=
 =?utf-8?B?OGVFb2ZFeFRaWEd3aEQzQnJJbW5FZWNQWDAwWHVvMEdPTG4wY3ZYYWlQb1U5?=
 =?utf-8?B?aE5RK0plZVBpN1h2UnJBbU1hTUVWOSs5S2hXRnJWMHVNNVhrSTdwb2F3a1BN?=
 =?utf-8?B?ZDlVY29lbVh6cGRkZ2FtZkdnV05HTXJxQzBjV1NXejJkNmV3ck0yMDFIa0Fh?=
 =?utf-8?B?U09rQWl1Sytub0xkNEFXUmtyc1M5ZFRjWldzQytKc29qc0NQNjRqU29vem5G?=
 =?utf-8?B?Wk9PSWl2WklCM09SaUY4ZUJwdHpBbVIyQTh4WkkvYkVRNkhwVHZmWVlPdjRu?=
 =?utf-8?B?eXl0dDZKaUZ2RnI2aUgySjVuWFJRNW9ORXMzUmFsVHJldkN3d0Fadm85dU1X?=
 =?utf-8?B?anBqQWRPWkkwTXJQZHRWaGNmQXlWTFV3dG9xaWEwMXFUKzd0MHAvTGlvc0RM?=
 =?utf-8?B?RjNvZW9DcDRCREFZUG9RWmZSUTdJWTVERWhicjJkRnBWbHlWcEZYTElLZkJv?=
 =?utf-8?B?SWdQRnpsTXpDYXlvZjREelVFWDU4d1JwalAraU15QzJPZzFjZmdudXEyQkVM?=
 =?utf-8?B?dUZYVXQ3N2hWU0d4OGZXVzJzaDY4Y0YxZVhnQ05Rai9ENmVIRWErZTliSzVP?=
 =?utf-8?B?Y1VCWHlROWIwdGZ3dVRkOEFYcVMzUUhSV05HbEtFd0hPdXExbVBWUTNZNmVx?=
 =?utf-8?B?WG9rVFhoWTc2dHkvZ1hKaERhMTJza2EwRk5ySDMvbzdTbHE1RVBEL0VNVVNo?=
 =?utf-8?B?QVYyL0VWcUx5cllpckpCYjB6bXdBNUtBMTNtS0QxbWNxbmtKUW5MalpSWTlO?=
 =?utf-8?B?dExlaEF3Sk9oazJIYjJBYlY3SFFaSzBPZi9aV0M1aE1zVlFZS21ESEtSUk9B?=
 =?utf-8?B?bVg3a3ZRWWlhME5OREV1aWZLaUZnU3JxY2djL1FoaHgzTytGczhWekJ6YXZx?=
 =?utf-8?B?U2p2TldVdGdFeHZ3VHVuN2hUZHQyVXlWRWtiTGZCWTdGY1hzNHRpT3RvMy9h?=
 =?utf-8?B?WWljUXgzS0FhWkRkc0ZoVVlrbFlqTDlpd1Z2Z1ZyK3hMNDUxYlFKTm5paUhl?=
 =?utf-8?B?b2FzUmlCbEFNNFpCbm5Qa3pETVhOa1h6aTljbGdta0dVemFCTU96YnBqQjJX?=
 =?utf-8?B?K3lJdnMwdEpmUC9hSFlJSFV0NnZwRXM2emQ4U2tRNnVvbUVuRVNXYzNPYWty?=
 =?utf-8?B?c0Vob3NSS2hnYUdEa3p3WDZ5aHFzTFRaTmwwbzMvaGh5TUJzTVVYZVFWa3ox?=
 =?utf-8?B?Y3dXdWR0dkZIQkcrdGZyMUJNUDBHQThxMSsrYXM3WjY2dmNoZ2EvZ1lBRHJY?=
 =?utf-8?B?SnA2RFU5VHZHbW5mS2wyV010dnZXaE1aMTlKRVFSdlRRMGxzTDY3SzBrd255?=
 =?utf-8?B?aUlNOWNsTFF3Q0xqT0QxdWdpM1YycUYvemJOcXVBWmNZUlVXL3lVTjdlY3h4?=
 =?utf-8?B?WGNRT0Y4MDc2TkxNYTgycWhBUFA2cjdwNUN1Y0JNdXVrcXVwNmpGQVc1dTdC?=
 =?utf-8?B?YXpBQkRvL2ZkUWk0OHFtejhaMEpueVc1Q08zZk1XMjArc3pxcnA2cGlrNXZE?=
 =?utf-8?B?NUh3QkphOVdna2ExL00vUHRDV2hWbDZDcis0R25IYnlvcXMwdkpORUFJbVdV?=
 =?utf-8?B?THI5SklLVDh6Yjg0WllyOEdoV2xsSVZydDlHVm5tWjROMTVubldBQVRrWDgz?=
 =?utf-8?Q?nKwnMdVSIoDgme8PcI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2983.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ad7a4d-1b3b-4483-d536-08d8cd85777c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 05:33:59.0591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQBJHV6wwHSG4It2p4eM0w9jBIrZltiNTEwG4bopVy1CIaoxR2tXJ+oStk7qmsWzXQM07Dtq1MB9iD+fOWNVIdZnqGzF3ie+r1WRF+KcuxORTocO85yvnPXY1LDqoLh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5171
X-OriginatorOrg: toshiba.co.jp
MSSCP.TransferMailToMossAgent: 103
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgYWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFybmQgQmVy
Z21hbm4gW21haWx0bzphcm5kQGtlcm5lbC5vcmddDQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5
IDksIDIwMjEgODozNiBQTQ0KPiBUbzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4gQ2M6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pjsg
QmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD47IE9sb2YgSm9oYW5zc29uIDxvbG9m
QGxpeG9tLm5ldD47DQo+IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+OyBBUk0gPGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IEJhcnRvc3ogR29sYXN6ZXdza2kNCj4g
PGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgTGludXggTmV4dCBNYWlsaW5nIExpc3QNCj4g
PGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPjsgaXdhbWF0c3Ugbm9idWhpcm8o5bKp5p2+IOS/
oea0iyDilqHvvLPvvLfvvKPil6/vvKHvvKPvvLQpIDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGli
YS5jby5qcD4NCj4gU3ViamVjdDogUmU6IGxpbnV4LW5leHQ6IG1hbnVhbCBtZXJnZSBvZiB0aGUg
Z3Bpby1icmdsIHRyZWUgd2l0aCB0aGUgYXJtLXNvYyB0cmVlDQo+IA0KPiBPbiBUdWUsIEZlYiA5
LCAyMDIxIGF0IDExOjAxIEFNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+IHdyb3RlOg0KPiA+IE9uIFRodSwgSmFuIDI4LCAyMDIxIGF0IDc6MDUgQU0gU3RlcGhlbiBS
b3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOg0KPiANCj4gPiA+IGRpZmYgLS1j
YyBhcmNoL2FybTY0L2Jvb3QvZHRzL3Rvc2hpYmEvdG1wdjc3MDgtcm0tbWJyYy5kdHMNCj4gPiA+
IGluZGV4IDM3ZGE0MTgzOTNlMCw5NTAwMTBhMjkwZjAuLjAwMDAwMDAwMDAwMA0KPiA+ID4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy90b3NoaWJhL3RtcHY3NzA4LXJtLW1icmMuZHRzDQo+ID4g
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Rvc2hpYmEvdG1wdjc3MDgtcm0tbWJyYy5kdHMN
Cj4gPiA+IEBAQCAtNDIsNyAtNDIsNiArNDIsMTEgQEBADQo+ID4gPiAgICAgICAgIGNsb2NrLW5h
bWVzID0gImFwYl9wY2xrIjsNCj4gPiA+ICAgfTsNCj4gPiA+DQo+ID4gPiAgKyZ3ZHQgew0KPiA+
ID4gICsgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gPiAgKyAgICAgIGNsb2NrcyA9IDwmd2R0
X2Nsaz47DQo+ID4gPiAgK307DQo+ID4gPiArKw0KPiA+ID4gKyAmZ3BpbyB7DQo+ID4gPiArICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiA+ICsgfTsNCj4gPg0KPiA+IFByb2JhYmx5IHNvbWUg
c29ydCBvcmRlciBzaG91bGQgYmUgdGFrZW4gaW50byBhY2NvdW50IChncGlvIGJlZm9yZSB1YXJ0
MCksDQo+ID4gYWxzbyBhdm9pZG5nIHRoZSBjb25mbGljdD8NCj4gPg0KPiANCj4gV2Ugbm9ybWFs
bHkgZG8gdGhpcyBieSBhc2tpbmcgZXZlcnlvbmUgdG8gc2VuZCB0aGUgZHRzIGNoYW5nZXMgZm9y
DQo+IGluY2x1c2lvbiB0aHJvdWdoIHRoZSBzb2MgdHJlZSByYXRoZXIgdGhhbiB0aGUgc3Vic3lz
dGVtIHRoYXQgY29udGFpbnMNCj4gdGhlIGRyaXZlci4gV2h5IGlzIHRoaXMgb25lIGluIHRoZSBn
cGlvLWJyZ2wgdHJlZT8NCg0KUGVyaGFwcyB0aGlzIGlzIEJhcnRvc3oncyBtaXN0YWtlLg0KTGlu
dXMgaGFzIGNvbW1lbnRlZCB0aGF0IGdwaW8gbWwgaXMgY2FwdHVyZWQgdmlhIHRoZSBzb2MgdHJl
ZS4NCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZ3Bpby9DQUNScGtkYi0tR1N5LTB2
bkFGUzlQaWs0VGpyTlJUclllWnIyUkJaRDZTRk04em90eVFAbWFpbC5nbWFpbC5jb20vDQoNCkJh
cnRvc3osIGNvdWxkIHlvdSByZW1vdmUgY29tbWl0ICIgYXJtOiBkdHM6IHZpc2NvbnRpOiBBZGQg
RFQgc3VwcG9ydCBmb3IgVG9zaGliYSBWaXNjb250aTUgR1BJTyBkcml2ZXIiIGZyb20NCnlvdXIg
dHJlZT8NCg0KQmVzdCByZWdhcmRzLA0KICBOb2J1aGlybw0K
