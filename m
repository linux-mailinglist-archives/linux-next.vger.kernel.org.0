Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A00843E109
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 14:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhJ1Mdv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 08:33:51 -0400
Received: from mail-dm6nam11on2089.outbound.protection.outlook.com ([40.107.223.89]:15841
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229448AbhJ1Mdu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Oct 2021 08:33:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9gpVEbaoUxopKXfTgYvk2nlRTLn7ekoWne7pxvGhCwwfF2kDRCLCqr57Gtv34/s5NeMyf7QowZ2ZonW0ZHHoMry9G9EkE7POl8flXR6ledXGIGTd/xOSHw6VsDFPPT8VzoHCnimsttijKB2jc5Fuswhp+2sQGPPllv0ZrxQoXzYvs+dFv8LBS5uZZMaimmw9/rmo4RLyvk/sf5JMbVc+WPOFcOw4CoO8ukeof9lHBtfz3AVZ4AqSpneeE6gVj96PrJjSQPleJAvzDatceRHon/sqxjCriemB2FIJ+ghpSzC8XAoUG/vcP1joMNDLwF11symj2oB988u2XDaxCLxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVfSBUBByVVXFBqViJupQ5a0Nmy+2k3k6bobA6S/auE=;
 b=JAyyIHzO/xckHEA1YHx6Z5KwACZyKGDzhmF9im2EYBXiV4T1ewFrO79umYgcAy/tANsKIJ4vojq5t7CZwuCsdBEps3dMDrh7smbTxXC6cdudXfNEF54K6ugV2P9R2iXvSNyRWduzzcnXGr/e62Tbzl8S11TkGGOmVyGW2EtIQ1t4m8USXCr4j1V7gflMTYZhR6muZEwOgAHQCS3Er9TMtAAGsVvhP8u2KStKmR3C8YbqCxZNyl+QBkY5v1rP9T7mw3hnrv27qoYT3rSp4ghhsbc4uriLox7t223MuLarAzU6B1ONmZ0mREpg/vezAhP7QrCunEm1fc0Hv+lASdAI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVfSBUBByVVXFBqViJupQ5a0Nmy+2k3k6bobA6S/auE=;
 b=pweVHBwRsCKfdLelR71O+PiAwE/IUIlTEXmP+lVv2Uj/Jb2UIAbZe7FfDNfvRSs5TbauTEEm3H4iCji+GrgtR7bHMliJ0MEcLhc7hMivmg5ZOy5tHM4PBSDe7fjP9fEUMoqNzxDt2WpR2kfCK/cJwB0ucq4OFUckscS54Tfh/wsi6SzNQB9GyI6gFeI+Zd+1nDm/ui1Jg623ruZ7fK36EDcf4AzrTz42Umv3sh/dfDf6hPbP5mryi0TI3YxKqGOHLrUYbTqw5NO3lRqQA8U2+aaqnqK6VV9NPJ7cto/NAH0+nnkLoGWGYkmTyfBBjaJZwoPlcYN3v+oEl1nOtFMxqA==
Received: from DM5PR12MB2406.namprd12.prod.outlook.com (2603:10b6:4:b7::23) by
 DM5PR1201MB0059.namprd12.prod.outlook.com (2603:10b6:4:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14; Thu, 28 Oct 2021 12:31:22 +0000
Received: from DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::5926:d2bb:5b4b:1b99]) by DM5PR12MB2406.namprd12.prod.outlook.com
 ([fe80::5926:d2bb:5b4b:1b99%6]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 12:31:21 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     "Kartik ." <kkartik@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the pinctrl tree
Thread-Topic: linux-next: build failure after merge of the pinctrl tree
Thread-Index: AQHXyipg4QvaXTY5TkqFKpAJpTJi4qvlNhSwgACUeICAAoopkA==
Date:   Thu, 28 Oct 2021 12:31:21 +0000
Message-ID: <DM5PR12MB2406509A3EB867608F604598B7869@DM5PR12MB2406.namprd12.prod.outlook.com>
References: <20211026162852.6cf2a2aa@canb.auug.org.au>
 <DM5PR12MB24064E6B3635CF9EDA7696CBB7849@DM5PR12MB2406.namprd12.prod.outlook.com>
 <dad7a9b1-6521-801c-d8b8-75dca8a4bfdd@gmail.com>
In-Reply-To: <dad7a9b1-6521-801c-d8b8-75dca8a4bfdd@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 374bcea3-6121-469c-62cc-08d99a0ed98c
x-ms-traffictypediagnostic: DM5PR1201MB0059:
x-microsoft-antispam-prvs: <DM5PR1201MB0059425C76157810B3B95CE1B7869@DM5PR1201MB0059.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:489;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XncbAOc5O2oCBst7Gvsj4Drw9aJeVeBohMjdDU1ZGQoFrP9OlZyQMX2UOpMBfSi7BT+R+qtN25AOrhY9msuXDgLaladLsW2CXOj3mstpp0giq1HXjBu+/bkRTHGpQivlIvZqcZm9d5Kt3k9OTXY2NUd/xJaMSzV2JHvIn8K5d8p1Ykex/uud++jbPSVQ0xSzAfzwRegpRcmPPsM7dVaQuRz1doKVT0ykF4eBpwsdZmQs51P9UvZYrzzZg1wd+Z3Q7LJlnwp+oHg11M275xvVAFFqbuvGwoD4lj5P/lE+DVQK+7/ncMwjMDPRxhAk8FpRAt2HfIA47sdqMxHDs4uyJsZ2SrPZao4YLfPkaddU/oabgK5yEb0f9+1G9ZD+QAUAZEac/a3MiFYB3a+QdOx8h84hmRPzw8PvBItnOxEPcRr4vjXoWqMiY6Y5C1a3WAyauQ/55vTrl9xbow3gepuLvyLr1cyhsfuenPzFnS5nmPQNobaYhtjj8ppUyoCoOLFcomQq0xOC6IJxr6eQW0hx6TqIDDMgIuzwGnMMYjjAQ21axwtkqaNDWqmXgxLr/ol2It+eqIiFI81TUblxqS2veeRtuhoPFgjzHjN+NyNNQ6FbmygWalVfz0p5jMBEN7bSC+6xYhwIwTidI2tKpntdpgMP9kOEnFprwxOWCk1DQriElMFS+CV6bLVTd6qINrcBCdunackBmf+iDIild3XqgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2406.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(64756008)(8676002)(76116006)(52536014)(6506007)(38070700005)(66946007)(38100700002)(55236004)(54906003)(186003)(83380400001)(71200400001)(8936002)(9686003)(26005)(122000001)(55016002)(66446008)(66556008)(66476007)(53546011)(33656002)(5660300002)(86362001)(508600001)(4326008)(2906002)(99936003)(316002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTFXRG9pYkVFV09aMTllRnRMK1VjY2ZNb0M5RndUeWVQdFlSaklQdUloWU5x?=
 =?utf-8?B?azc5SFQzT0p6V0Y5MkEveEhQeUZNSENYNzMrWkQzNVc1RTJTOUVVM2tmZFd1?=
 =?utf-8?B?dDljS1pVMlA5eUR0eUtEYWJyU0huWEp4QzhjbVMvbVIzbXBVenVMSTJwWkxB?=
 =?utf-8?B?VFdNTWZMaFZXY1ErR3VXd3BuVFhTeS8xK3ZiWTNQRm1jZ3ZQRkNDSHl2WExh?=
 =?utf-8?B?eDg3d2M5OElYck5qSFEyTE9GTFZ3dE9yUE5RUCsvZTFSNHJYbUhBcUlqR0NZ?=
 =?utf-8?B?VW8rQlV5MUNOMTE2bWtvUkhxaFRGOTA4dENYdGlLZDB2Y3lPVGFQeEVwdFBZ?=
 =?utf-8?B?dVA2bjBrS1YrVjBWL2JBWkVlZFdoUHlpSXM4U0Jyak5VVi96eXFRakN3MzFL?=
 =?utf-8?B?THVXaVRwbk9SOXRic3lKK0VPeHdMRHFnUGVJb2I4Y1J1VzNoYkVlMndUMmds?=
 =?utf-8?B?Tm0vdnVlakw5VjBtU1kvN3REeURUUFNRUG5tajBUQXdNMHZ2QUREVmNyeVRr?=
 =?utf-8?B?Wm5IOFA0VkM3VDZ4VkJzc0Z2QVh4MUFJSTBPSWthRkdlbUw0dzlZdFhjWFZH?=
 =?utf-8?B?a1VQS0dBRjdDVThEQVV5aU8xYmZnb3hsSHNWcEZFY05vVVc3WEkydFljdU95?=
 =?utf-8?B?SkVQU25PWm9xWlBhbWdIbmhsOWxOd1FURUJzRDI0QnEzVVFuNWJIMTZFbi9N?=
 =?utf-8?B?SWpMWThDYkdOTU5MK2xEdm1KamlNN0NzNzZWdjg1MXNOYk05MzVVZTFqSkxN?=
 =?utf-8?B?Y2U1eGhOMDlOZER6SFhEWFNNM1JqbjFUeUh1VGMvMlRKQVZrWlZzTjdwbWo3?=
 =?utf-8?B?SVVuUVdHcVBZSzVyVk0xaFBPNWxZKys3YVYvbm1RYWt4bjQxUnJvUUJmNzNS?=
 =?utf-8?B?bzZPVk5pbWNiNkxrMHVaSS9ONDlvMnFYa1JZdXZBV0h4SVNxZjB4bnVZNmdY?=
 =?utf-8?B?QktIWFpUNFBmQnpEWFAvWVJiUFNwVjZRYSt1bnY5UVJaYkROS1JCYkpKcnlH?=
 =?utf-8?B?bm40clFzNVhLM3BoZDJFMDNsNjdzRlMva3ZwZk1INTZiMElrTk53b3BtdHls?=
 =?utf-8?B?Nkszck1KczlZMXNWVTh1N0dacVVXd1RZSlRyN2kxaEtRVE1STDhrM1FjY2N5?=
 =?utf-8?B?T3NjSW5sQUovczV0RmdpQmhsb1hRNVVEc1ZWbHZZVW95anpSekpnM0xUdW5U?=
 =?utf-8?B?cFRhVVhZQVpHaXlnTVR2VUI2ZWdlVjFBalhZdFRrNjBrckNkcGN6aFNGV096?=
 =?utf-8?B?OXlhTlhBVU5MbkFMWnhzaVltRlVmbGZJUG9NNmc2dmw4b1d0TE0xdzJCa1lK?=
 =?utf-8?B?VFFxNlBGTks0di8rOVZZaWpPdGgrdFEwS0xqeTc1bisvSmh5cEVVMHdyVFNt?=
 =?utf-8?B?Nms0djVUc3N3dE9Vd08rN3hwTXplMkJDNDZ4NVFHQkZjdHJUZ2Y0RDdVd0Yz?=
 =?utf-8?B?OUdXNUhibnZBblF1WVJ0bk9aSHVydGlrdFFhYlYya0RQZEQvR0NSMlpPcGY0?=
 =?utf-8?B?bDlhelRWSHZ4WjcvU0NWSG0vMHA2VjBGZ3NJKzdaVVVFdUtvZU5sUTlweUpK?=
 =?utf-8?B?ZG15UW1YTGkyaGFlaEVBaWVtbUJXb0l4Q2EzZ0lHRVhCYkd5cmRwZTB5NDBz?=
 =?utf-8?B?dk5wL0FlTFpaTEs5REVEOEg1SjNrME45M3hRb1ZUTitieVR3djFhdVIvN21p?=
 =?utf-8?B?YW1RNm40QUZ5R0hkZnZDTEdzUjVmN2VQRVVkUm9aMmR4VzUwY3dXTVNvOWMx?=
 =?utf-8?B?T1Z1RlIwVzBLWFAzaktUS1FWMkJkYVRQZnl1M2FlNVAvS3NqSEdZM3NrM2J5?=
 =?utf-8?B?YmNUTTZNQ1R3Q25GdW42RUFNQTRqemVvTWh1K2VPY2RQZS9TQlJrZE9LemE3?=
 =?utf-8?B?MktWdTlGNG9qZEhtRFMxOUMvOTdZRi9PTlJyZ00rb1RydlFuVkhJa1hXVkRt?=
 =?utf-8?B?OC9NN0ZqcytFMjcwS1R5KzhITFNqdlhISUNyaVhLWG1rU0VLWWs4QU4zN3dk?=
 =?utf-8?B?a05zUGlLVjNHMzltUzhEVllMK3lHWXEzWXpJakNVWWZ2RCtSSWRyM0pjZU1v?=
 =?utf-8?B?V0hUQU50Wjh5aXp5ajU3QlN5TkIxcnVVbk9RaWhBbXN6MnJ5VVdSMTM2a0Zl?=
 =?utf-8?B?Sll1R1JHNld3R1FFdHppcEgwSnp1SHNRNlJKZ0s2clBQckFGWWM0a1hCcC9l?=
 =?utf-8?Q?fdUuFKLJh94YUtpCWL55IdY=3D?=
Content-Type: multipart/mixed;
        boundary="_002_DM5PR12MB2406509A3EB867608F604598B7869DM5PR12MB2406namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2406.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374bcea3-6121-469c-62cc-08d99a0ed98c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 12:31:21.8872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2gWP7+swPCDVNxEPEwFuPS5lyNvGjJ3DSCkGWYyem7tjmGgwQWM6F69DH3RGcDbzcMYhfxoHv0yS7UEVXRzIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0059
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--_002_DM5PR12MB2406509A3EB867608F604598B7869DM5PR12MB2406namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIERtaXRyeSBmb3IgcG9pbnRpbmcgb3V0Lg0KQXR0YWNoZWQgcGF0Y2ggdG8gZml4IHRo
ZSBpc3N1ZS4NClBsZWFzZSBoZWxwIGFwcGx5IHRoZSBwYXRjaC4NCg0KVGhhbmtzDQpQcmF0aGFt
ZXNoLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRG1pdHJ5IE9zaXBlbmtv
IDxkaWdldHhAZ21haWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyNywgMjAyMSAy
OjUxIEFNDQpUbzogUHJhdGhhbWVzaCBTaGV0ZSA8cHNoZXRlQG52aWRpYS5jb20+OyBTdGVwaGVu
IFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT47IExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4NCkNjOiBLYXJ0aWsgLiA8a2thcnRpa0BudmlkaWEuY29tPjsgTGlu
dXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IExp
bnV4IE5leHQgTWFpbGluZyBMaXN0IDxsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZz4NClN1Ympl
Y3Q6IFJlOiBsaW51eC1uZXh0OiBidWlsZCBmYWlsdXJlIGFmdGVyIG1lcmdlIG9mIHRoZSBwaW5j
dHJsIHRyZWUNCg0KRXh0ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3Ig
YXR0YWNobWVudHMNCg0KDQoyNi4xMC4yMDIxIDE1OjMwLCBQcmF0aGFtZXNoIFNoZXRlINC/0LjR
iNC10YI6DQo+IEZpeGVkIGZvbGxvd2luZyB3YXJuaW5ncyBhbmQgZXJyb3IuDQo+IEF0dGFjaGVk
IHRoZSBwYXRjaCB0aGF0IGZpeGVzIHRoZSBpc3N1ZS4NCj4gUGxlYXNlIGhlbHAgYXBwbHkgdGhl
IFBhdGNoLg0KPg0KPiBUaGFua3MNCj4gUHJhdGhhbWVzaC4NCj4NCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcu
YXU+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjYsIDIwMjEgMTA6NTkgQU0NCj4gVG86IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4NCj4gQ2M6IEthcnRpayAuIDxr
a2FydGlrQG52aWRpYS5jb20+OyBQcmF0aGFtZXNoIFNoZXRlIA0KPiA8cHNoZXRlQG52aWRpYS5j
b20+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IA0KPiA8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz47IExpbnV4IE5leHQgTWFpbGluZyBMaXN0IA0KPiA8bGludXgtbmV4dEB2Z2VyLmtl
cm5lbC5vcmc+DQo+IFN1YmplY3Q6IGxpbnV4LW5leHQ6IGJ1aWxkIGZhaWx1cmUgYWZ0ZXIgbWVy
Z2Ugb2YgdGhlIHBpbmN0cmwgdHJlZQ0KPg0KPiBIaSBhbGwsDQo+DQo+IEFmdGVyIG1lcmdpbmcg
dGhlIHBpbmN0cmwgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkIChhcm0NCj4gbXVsdGlf
djdfZGVmY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOg0KPg0KPiBkcml2ZXJzL3BpbmN0cmwvdGVn
cmEvcGluY3RybC10ZWdyYS5jOiBJbiBmdW5jdGlvbiAndGVncmFfcGluY3RybF9nZXRfZ3JvdXAn
Og0KPiBkcml2ZXJzL3BpbmN0cmwvdGVncmEvcGluY3RybC10ZWdyYS5jOjI5MzoxMjogd2Fybmlu
ZzogcmV0dXJuIGRpc2NhcmRzICdjb25zdCcgcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZXQg
dHlwZSBbLVdkaXNjYXJkZWQtcXVhbGlmaWVyc10NCj4gICAyOTMgfCAgICAgcmV0dXJuICZwbXgt
PnNvYy0+Z3JvdXBzW2dyb3VwXTsNCj4gICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPiBkcml2ZXJzL3BpbmN0cmwvdGVncmEvcGluY3RybC10ZWdyYS5jOjI4Mjoy
NTogd2FybmluZzogdW51c2VkIHZhcmlhYmxlICdnJyBbLVd1bnVzZWQtdmFyaWFibGVdDQo+ICAg
MjgyIHwgIHN0cnVjdCB0ZWdyYV9waW5ncm91cCAqZzsNCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICBeDQo+IGRyaXZlcnMvcGluY3RybC90ZWdyYS9waW5jdHJsLXRlZ3JhLmM6IElu
IGZ1bmN0aW9uICd0ZWdyYV9waW5jdHJsX2dwaW9fZGlzYWJsZV9mcmVlJzoNCj4gZHJpdmVycy9w
aW5jdHJsL3RlZ3JhL3BpbmN0cmwtdGVncmEuYzozNDE6MTA6IGVycm9yOiAncmV0dXJuJyB3aXRo
IGEgdmFsdWUsIGluIGZ1bmN0aW9uIHJldHVybmluZyB2b2lkIFstV2Vycm9yPXJldHVybi10eXBl
XQ0KPiAgIDM0MSB8ICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgIHwgICAgICAgICAgXg0KPiBk
cml2ZXJzL3BpbmN0cmwvdGVncmEvcGluY3RybC10ZWdyYS5jOjMyNzoxMzogbm90ZTogZGVjbGFy
ZWQgaGVyZQ0KPiAgIDMyNyB8IHN0YXRpYyB2b2lkIHRlZ3JhX3BpbmN0cmxfZ3Bpb19kaXNhYmxl
X2ZyZWUoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiAgICAgICB8ICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4NCj4gQ2F1c2VkIGJ5IGNvbW1pdA0K
Pg0KPiAgIGE0MmM3ZDk1ZDI5ZSAoInBpbmN0cmw6IHRlZ3JhOiBVc2UgY29ycmVjdCBvZmZzZXQg
Zm9yIHBpbiBncm91cCIpDQo+DQo+IEkgaGF2ZSB1c2VkIHRoZSBwaW5jdHJsIHRyZWUgZnJvbSBu
ZXh0LTIwMjExMDI1IGZvciB0b2RheS4NCj4NCg0KVGhlIHRlZ3JhX3BpbmN0cmxfZ2V0X2dyb3Vw
KCkgc2hvdWxkIHJldHVybiBjb25zdCBhbmQgbm90IGNhc3QgdGhlIHBvaW50ZXJzLiBQbGVhc2Ug
bWFrZSBhbm90aGVyIHBhdGNoIHRvIGZpeCBpdCBwcm9wZXJseS4NCg==

--_002_DM5PR12MB2406509A3EB867608F604598B7869DM5PR12MB2406namp_
Content-Type: application/octet-stream;
	name="0001-pinctrl-tegra-Return-const-pointer-from-tegra_pinctr.patch"
Content-Description:
 0001-pinctrl-tegra-Return-const-pointer-from-tegra_pinctr.patch
Content-Disposition: attachment;
	filename="0001-pinctrl-tegra-Return-const-pointer-from-tegra_pinctr.patch";
	size=1419; creation-date="Thu, 28 Oct 2021 12:08:16 GMT";
	modification-date="Thu, 28 Oct 2021 12:08:16 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyNDdhMjNhOGJhNjM3OGZiNmJkOTEwMGI5M2U4MmYxMDlkZWI5YzJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQcmF0aGFtZXNoIFNoZXRlIDxwc2hldGVAbnZpZGlhLmNvbT4K
RGF0ZTogVGh1LCAyOCBPY3QgMjAyMSAxNzozMjozNSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIHBp
bmN0cmw6IHRlZ3JhOiBSZXR1cm4gY29uc3QgcG9pbnRlciBmcm9tCiB0ZWdyYV9waW5jdHJsX2dl
dF9ncm91cCgpCgpJbnN0ZWFkIG9mIHJldHVybmluZyBjb25zdCBwb2ludGVyIGZyb20gdGVncmFf
cGluY3RybF9nZXRfZ3JvdXAoKQp0aGUgcmV0dXJuIHZhbHVlIGlzIGJlaW5nIGNhc3RlZC4KClRo
aXMgY2hhbmdlIGhlbHBzIHJldHVybiBjb25zdCBwb2ludGVyLgoKU2lnbmVkLW9mZi1ieTogUHJh
dGhhbWVzaCBTaGV0ZSA8cHNoZXRlQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9waW5jdHJsL3Rl
Z3JhL3BpbmN0cmwtdGVncmEuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvdGVncmEv
cGluY3RybC10ZWdyYS5jIGIvZHJpdmVycy9waW5jdHJsL3RlZ3JhL3BpbmN0cmwtdGVncmEuYwpp
bmRleCA4ZDczNGJmYzMzZDIuLjUwYmQyNmEzMGFjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9waW5j
dHJsL3RlZ3JhL3BpbmN0cmwtdGVncmEuYworKysgYi9kcml2ZXJzL3BpbmN0cmwvdGVncmEvcGlu
Y3RybC10ZWdyYS5jCkBAIC0yNzUsNyArMjc1LDcgQEAgc3RhdGljIGludCB0ZWdyYV9waW5jdHJs
X3NldF9tdXgoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAogCXJldHVybiAwOwogfQogCi1z
dGF0aWMgc3RydWN0IHRlZ3JhX3Bpbmdyb3VwICp0ZWdyYV9waW5jdHJsX2dldF9ncm91cChzdHJ1
Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCitzdGF0aWMgY29uc3Qgc3RydWN0IHRlZ3JhX3Bpbmdy
b3VwICp0ZWdyYV9waW5jdHJsX2dldF9ncm91cChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYs
CiAJCQkJCXVuc2lnbmVkIGludCBvZmZzZXQpCiB7CiAJc3RydWN0IHRlZ3JhX3BteCAqcG14ID0g
cGluY3RybF9kZXZfZ2V0X2RydmRhdGEocGN0bGRldik7CkBAIC0yODksNyArMjg5LDcgQEAgc3Rh
dGljIHN0cnVjdCB0ZWdyYV9waW5ncm91cCAqdGVncmFfcGluY3RybF9nZXRfZ3JvdXAoc3RydWN0
IHBpbmN0cmxfZGV2ICpwY3RsZGUKIAkJCWNvbnRpbnVlOwogCQlmb3IgKGogPSAwOyBqIDwgbnVt
X3BpbnM7IGorKykgewogCQkJaWYgKG9mZnNldCA9PSBwaW5zW2pdKQotCQkJCXJldHVybiAoc3Ry
dWN0IHRlZ3JhX3Bpbmdyb3VwICopJnBteC0+c29jLT5ncm91cHNbZ3JvdXBdOworCQkJCXJldHVy
biAmcG14LT5zb2MtPmdyb3Vwc1tncm91cF07CiAJCX0KIAl9CiAKLS0gCjIuMTcuMQoK

--_002_DM5PR12MB2406509A3EB867608F604598B7869DM5PR12MB2406namp_--
