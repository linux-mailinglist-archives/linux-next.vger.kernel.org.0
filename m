Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3EA435843
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 03:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJUBfO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 21:35:14 -0400
Received: from mail-eopbgr1320090.outbound.protection.outlook.com ([40.107.132.90]:48640
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229771AbhJUBfO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Oct 2021 21:35:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lo/t1RQB84d3dsIgKzqUkH4Ad0ZwZbgEuI5IMSSYyho8ckmOM9CG80rgN0lbahzrS+APfGL7gOvkTZ+WSH5Q59UZxmkDDBI0eKDwD4p4K+2Sn9d0gcQMgs9V2Uwa3mGs8lcV4kZI4uEwNeY+uD+xIo5y3J93JaQtW2zMwyqK905Qd6KJ6DzZLt2D+nwCB+usWJTumIVVl00k2VMu3VLS2gRZ3NHKW6KzPOHTNwjBmvrDlx7+mVvT8nzVT9gV2Sjcs9fFjMDUt6l68cLutxSScDKrq3hukcBTE4DZuBWpQ4zMpPwrm5Sa3I/pEW1yZAKsBapjfQwtR5At2qRuOxzCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koXwhOOK6mavFGDKwGs1oTRLZe9PwYJoMsn7+VyTLTI=;
 b=d4GkG9ACTQXaN2wfVMOKVM6Gtr8av0561C0r8AVJJawV4qSuxfOXvsrdRHlQVv45vlnNSQeMYuFc7Pcn/E0GRIg1G8Q0DVcmdSK2qk/MncPgiQHU24Xtfmp5riUys15/4XWdRxbjwvVI5fNvRQi84ROKASBJexPAhpFLshRO86JxM+kL2bVjWtODqPGZQrlAo4ZbQLVyAv/WVeoN6dex09xx7W11O5Wmn8Ve0o978o56uHy9/F8nqDK+uqRXZOYFUlWIC0ESwk6kb3/rNW1AEQjOZ9D6/tIKGvgOVfkxS0qzOLJDLdTSqb+J07CmUDRX6Rh6sh3Oohu5Wnef/nWkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koXwhOOK6mavFGDKwGs1oTRLZe9PwYJoMsn7+VyTLTI=;
 b=MXvMDMEAw64KUL7TbLx2wpa2VEdYSf/4H8LxnL9jc3vqw4cQ4cLC79BqZKmB/FMdB3eAoTmn8BskWD8SFvw6b8MVHCA+vLU/ekrzsbxUt87r+FLNCmYEYv1913glfE/eR/BM440YG9BPq8WC54JSzY25+z/tWHQK6LnZV7d065o=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3702.apcprd06.prod.outlook.com (2603:1096:820:11::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Thu, 21 Oct
 2021 01:32:54 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%7]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 01:32:53 +0000
From:   =?gb2312?B?s6O37+mq?= <changfengnan@vivo.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Jaegeuk Kim <jaegeuk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning in Linus' tree
Thread-Topic: linux-next: build warning in Linus' tree
Thread-Index: AQHXxhru/PPyv1oui0e7WlsPFCRQNqvcqqyg
Date:   Thu, 21 Oct 2021 01:32:53 +0000
Message-ID: <KL1PR0601MB4003D9125769D4D8FE6558ACBBBF9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211005202900.29285789@canb.auug.org.au>
 <ANQAFAC9EhHeWK1g5-2FP4ol.9.1634779695838.Hmail.changfengnan@vivo.com>
In-Reply-To: <ANQAFAC9EhHeWK1g5-2FP4ol.9.1634779695838.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6d85327-faae-42ad-bd11-08d99432b3cc
x-ms-traffictypediagnostic: KL1PR0601MB3702:
x-microsoft-antispam-prvs: <KL1PR0601MB370243C7CFCF5FC1CCAD7163BBBF9@KL1PR0601MB3702.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G4T17QC/8G7HSEh5UnBA297hFYdR+z1GaJO4N5ZudkZFZue1m53O/Lw2ZpekaveG/AOkw/H4As0nKs7qXkV6upZwbvrxrLkY8bhkoXcL+z/3NV1evRQ78ea2qT8hRFsBKl1PTYozIJimi18c5ruYKWkUCYcrenBxN/cRfQv2ezIkksfWZCcStsfhGG2y04nAkna0wZxadldnGkL95+/sXsTIP8QbB3kHZr49LAjGx8LTEHCLtcLEQrqIkRzmvqg5Ufhxtz9a3+DKuvOLQJa9QmYrDwQuNoDYuVg2PR4f5mh7GEqdtHYU+ze07rsVKmDBtgPTJzNvC4v7AlXuneXPKJ1pe0QKVUELrIv10Bwf6WjdcnKQk5B0uOxVm/eygHz9ItHmPXb1y8kj3+QP4kboL7ThDWSjppLoN3JEPDDvavz/VY1Eszzwg1ILCEvfj3XsDJDzeaqV4tp0su5t+DHQ1sKjuBDMrhsl/x0db0CnnuRiBR2Vhdz9iuQl6t+zZABadpMKtc4xUZ2ODiRn04befJ0jHsZ2GzBoXCcjHK1hGPsAXyF1l74w/INHG0jmyNJCePC3KaT1OaVWPb8tSy25AYkyWh7aBt7xxVnsIbRCKmXnEM2SpfVXO3kpLpvEcMGUPTsVR1fSudj+g43sDZacJ3eAkXH4QOVnePyktPibF2K/I9/zBAV90UKyp4xJxW2g
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4003.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(66946007)(54906003)(6916009)(4744005)(4326008)(66476007)(64756008)(66556008)(8676002)(5660300002)(7696005)(508600001)(316002)(2906002)(53546011)(55016002)(86362001)(76116006)(26005)(83380400001)(66446008)(8936002)(38100700002)(52536014)(9686003)(85182001)(6506007)(71200400001)(38070700005)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?emREK056K0k5WUZtZEdwSVRLUEt0cnhEOGNzaTkrRU9RWHZqak5RYlFBKytV?=
 =?gb2312?B?SWpCTTJrWkp2ckFPSnJwUlJNU00rQkNrdU80NHJFdnlKZUZhai9qQkZTU2JW?=
 =?gb2312?B?MDV2dXZDaDYycFNqSlJPVGVmSnJNQTFJNlQzbVBuY3Y0TkFoOVRJR2lnN3Nz?=
 =?gb2312?B?ZUpTQWxZMkM1N09qNnBlUTVwa2h4Vm9aejF3RjVldUVuWks0b0U4aHpkRjMz?=
 =?gb2312?B?bEIyS0Rrd1ZNVlFkUVBWak5uSi9OQnYvbzl6SGlnMlQwcXc3eWw2K09BeVh4?=
 =?gb2312?B?ZlBYUVdtM2oveUpGbnAzNVZOWC9BQWNBZ2xCZktWTElpQytGY0p5cnFlcGRr?=
 =?gb2312?B?dXRBcmVmNUZxL0JveU9DS1Q4MnlvMmtLdGRMMDF4RDd3czB0dXRHRUdqbVo2?=
 =?gb2312?B?NUR6UzJTWkdJSDBZNEtVdkxIME1xQTBzYXhqbHNydkZmaU4wbG5qUjJvRHlU?=
 =?gb2312?B?T25VbVNVTitZQjJsRUZJc1dEdWpQeDh5WDBYamhFVFoxcmtWMjZLeGk1Mk9W?=
 =?gb2312?B?SmN4TUR1NmRkZHlBVFNnUHBmdzU0TVNqWndqVkxhMmR1Y0phQkRvVldGa1Zu?=
 =?gb2312?B?REJKdUMzeWxEeGdkVUpoYWF6eCtkUlVXaHdmaktkQkJRb3lFODBSVDRJb0lu?=
 =?gb2312?B?eStzY3BsRHZlQmR3ZW15UFl1TE1CaXVnWi82bHJ5bUZkSnhQajVOcUhaYXI2?=
 =?gb2312?B?TWd6dVpQSW11MXRCNS9lK3J0ZytTUThLNDZRMlR4RDdsVmpMbUpnYkZRL0NG?=
 =?gb2312?B?YXY5ZktORFpMQjBiRCtPbGFIa05lekNZUFZRdzZadmJsUG5VbTJNaUVJa3JS?=
 =?gb2312?B?WEQ5QVhsb1poUXI5N2ZDS0U1RklGZm9FTFlYVHhoalU4V0NEKzBmOUxpanBu?=
 =?gb2312?B?Tnhlb2k4KzBENmJnaUhjaVRONzZqUUJrdjZoT2hQdW9oaGNZd0lCRkFWUjlw?=
 =?gb2312?B?MnNrTnJjbnZObVhnZVZwN0RDN0c0WTF0ZWdrMDA3TXhSU2Vrblphczd6RXFB?=
 =?gb2312?B?dm1MOHVsMkFlNXhMdXVqUlRyWFA1VDZ2QURIWnlrU0VTZ1VNZy9WWWVueXhF?=
 =?gb2312?B?bTFEb1haOUFidTFTajIyUEZ6bFZrRFpUNmtZNnlHbjBkY2ZSekl0SUZQbEJ1?=
 =?gb2312?B?SlVEay9udlpmMUhWV0tlb2l3M3BOVVFnekZzMHVYOExxei8wbTVJVkRMQlVm?=
 =?gb2312?B?TmRqelArY0hkVUdBWCswTlkrR293ZUpzMjQ3L014VmRnM2Q4MkZYTkR1Z3ZT?=
 =?gb2312?B?aU5wUFV3blMzVHFsSHZTcWFTWTBpOTJWK25HbHNDU05KdmsvY1JRaUFVR3Zw?=
 =?gb2312?B?anhZRWYzOGh0QnJQc0lKeTJRVXhSRWNhUW03emRiTlFQb1Vmc0RDQzdDQXBk?=
 =?gb2312?B?dTRxbmVHUEROR3MwSldIT3BzbXdkQVZrSFBzK1hPNFlpNGdWL1ZsNnFXRWRN?=
 =?gb2312?B?emgycnZWK29FTmQrUTlWTWt1YjVobWM5WFZpeWFNWEV6M2w4S2ZIc2RmcEFa?=
 =?gb2312?B?dUxwZTB4TWEwOU1uOWZBQlpNKzJ2UVhlbFkwWGlZMFd3UGV2eGhwdFFSQldZ?=
 =?gb2312?B?ams3S0FtNG5JeEJSU1cwU2xoTDJ5bE5TUmcveC9EQUQ4aG5JWWpjWGZZTFBX?=
 =?gb2312?B?QzJoT3JXazNFVVNXdEVOQUVtUVVHdXlqeTg3SzI1aFVySmZ1ajBTc0NNQ0NR?=
 =?gb2312?B?OGFrbFFBY1g4Z0xZaGpoQ2JJRStWVXhSajliMnhIaG5wWnorNUM5V0lKbzNV?=
 =?gb2312?Q?lzSswgbrj3tsNpOxuA=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d85327-faae-42ad-bd11-08d99432b3cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 01:32:53.2065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11126892@vivo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3702
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SSB3aWxsIGZpeCB0aGlzIGxhdGVyLCBUaGFua3MgZm9yIHlvdXIgcmVtaW5kLg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGNoYW5nZmVuZ25hbkB2aXZvLmNvbSA8Y2hh
bmdmZW5nbmFuQHZpdm8uY29tPiBPbiBCZWhhbGYgT2YNCj4gU3RlcGhlbiBSb3Rod2VsbA0KPiBT
ZW50OiBUaHVyc2RheSwgT2N0b2JlciAyMSwgMjAyMSA5OjI4IEFNDQo+IFRvOiCzo7fv6aogPGNo
YW5nZmVuZ25hbkB2aXZvLmNvbT4NCj4gQ2M6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5v
cmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0DQo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPjsgTGludXggTmV4dCBNYWlsaW5nIExpc3QNCj4gPGxpbnV4LW5leHRAdmdlci5rZXJu
ZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogbGludXgtbmV4dDogYnVpbGQgd2FybmluZyBpbiBMaW51
cycgdHJlZQ0KPiANCj4gSGkgYWxsLA0KPiANCj4gT24gVHVlLCA1IE9jdCAyMDIxIDIwOjI5OjAw
ICsxMTAwIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pg0KPiB3cm90ZToN
Cj4gPg0KPiA+IEluIExpbnVzJyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKGh0bWxk
b2NzKSBwcm9kdWNlZCB0aGlzIHdhcm5pbmc6DQo+ID4NCj4gPiBEb2N1bWVudGF0aW9uL2ZpbGVz
eXN0ZW1zL2YyZnMucnN0OjI4ODogV0FSTklORzogQmxvY2sgcXVvdGUgZW5kcw0KPiB3aXRob3V0
IGEgYmxhbmsgbGluZTsgdW5leHBlY3RlZCB1bmluZGVudC4NCj4gPg0KPiA+IEludHJvZHVjZWQg
YnkgY29tbWl0DQo+ID4NCj4gPiAgIDE1MWIxOTgyYmU1ZCAoImYyZnM6IGNvbXByZXNzOiBhZGQg
bm9jb21wcmVzcyBleHRlbnNpb25zIHN1cHBvcnQiKQ0KPiANCj4gSSBtYSBzdGlsbCBzZWVpbmcg
dGhpcyB3YXJuaW5nLg0KPiANCj4gLS0NCj4gQ2hlZXJzLA0KPiBTdGVwaGVuIFJvdGh3ZWxsDQo=
