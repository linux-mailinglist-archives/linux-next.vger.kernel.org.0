Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22480459F2B
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 10:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235280AbhKWJ36 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 04:29:58 -0500
Received: from mail-eopbgr130080.outbound.protection.outlook.com ([40.107.13.80]:46757
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234980AbhKWJ35 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Nov 2021 04:29:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esuJjKE7fWCGKdXiGdkMUVRUjRRNPVehzyWpzBJNAoPTtiJH8oWOJqEHdUZ6pmoTJWbRbEe7I7Q5HcjpmGUTNWx5GmLiBtqSA+4tUOSgjj0i5jY0K3zyq+PDpfFTlMaFPlcUXaivisOUZGQmfYlTcs/ZNwNPxy+5wo0DznY2L0yxUq0oXAlJr1PAzJBrEW+t11TIOh0Dreaz0ZdApLgGoNsWfFShpHkuIUkthqLhihAAvsjqBYrjGQ57xWPGyKrzH9eM6LjtJev4xamTAtLQE6fBZgc+j4zbbW1nQTJhnBEvh9rJdM4vRbV4NZCSjXJfAHBBEzJvLUyOdlneAjoE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cus1mBBrcMZ7cy4yPOoCTupmJ9FRqhxC9FbCWSRxinw=;
 b=Fm/De6DxvG64KQrnEzyWzOSCKKZTFror85p/zdW8TuIHodle20dXagfMikbfTvu36vDkgs1tTKn+Q6MS/BcmecP9DUAnyh3eLskF+uGYqCDfLiIbZdlCUUr8qISWIz/uj26f6bQZpJQ2qo9+AJGcHCSBRHUxWwSwhQrLXMD0n82dQRD/R/nkXQvN/kmbzjBLOH7V+b7qegjAYz1QDSPa22Pm+gHEZwThiOje4Vj4dQ/DJhGUcJ4a6grN2Ip+BVQnMjpcAd9wtTX2/FL8Jv7ozlVN/Jvxcdoy3nL6BTKDiuejbn0YdyPrzEwlzmW/58mwHNcwptcvMBK6nFksM8jAdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cus1mBBrcMZ7cy4yPOoCTupmJ9FRqhxC9FbCWSRxinw=;
 b=a9JkZP0LBv/0uu4UPiOgfJbBX5NV5XzA30rXZAZCzcr/t22sjrD7rZcSWXejcwDJJklA8thOAEzcIMa1Jff5Eopk0ZZGtPkJip7okigLROHBsvYcdP9qlC/K/fRlwBDLeW2IzCZZJV3cC/WxFAIot8fzKeD/pI61umoS+AVD7nY=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3129.eurprd03.prod.outlook.com (2603:10a6:7:5e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.24; Tue, 23 Nov 2021 09:26:46 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::544e:754:6241:aa7f]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::544e:754:6241:aa7f%6]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 09:26:45 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
CC:     "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Thread-Topic: linux-next: build failure after merge of the regulator tree
Thread-Index: AQHX4D2USFB6fNyejkmXjnndrEACuqwQ1/uA
Date:   Tue, 23 Nov 2021 09:26:45 +0000
Message-ID: <9df5380a-3fb6-8c1b-677a-3159e99c4869@fi.rohmeurope.com>
References: <20211123184142.50ff56c3@canb.auug.org.au>
In-Reply-To: <20211123184142.50ff56c3@canb.auug.org.au>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6e29e00-7478-4995-2355-08d9ae635e67
x-ms-traffictypediagnostic: HE1PR03MB3129:
x-microsoft-antispam-prvs: <HE1PR03MB312979F651727665FAD8101AAD609@HE1PR03MB3129.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f1QLPYKUUNpFu3VHvx3AuMpCNBLWjwosW5p+mOKN/WsABqWq1a1e34PnWqlM+OArZLJazFpjjMNAgFzr1+196xc4wMJI93Nb/PxumybScYXnscZNjDE0v3OqXxT3Oq5ewBSqimMhntGoeLeJIpNEVrMzuPW1Jl1FT2BINSZ8YSghc+Rbq7nLjbrGQYdIDPFNmT4n7/Kt5dhRAIVxx1Ba096T6gSlLHvvhyFx58qzMT2wpx9fBmC60moZrRscGONXh3YPq0xNnvxz0FVyLlOLiWm7+IhlD5eDjCVdp2kn3HJPELOd5NMav0V00lKQC7R/bREB4IXOeXTkD3M7bTjtCLF5kDyHqg0SC8xUYZhw4PxB0V24s2sLVQ+MlFzXFkfEq1z2EIq4Ya7MxLDwGek+YV6XYBqLGbbIumDRRckP29amXUNOYOHb5HAiFg0T2umSaiQ/hmMF5glskmyIz3BzoRZhEl8B9T8f/MddzgGIaBh2o+Iipjo0R427NXNEAWJ/fIxcPp0WICGKbP3Ja9TUg7mWhDSNrTGIcrn0olju2PBwUIpBBAgpqhV+SOOydv1p/jlCIE5uj8zaBFndrjDlGjsqTWJXlJ1dtGNTsApibu7Xr/EwIJGXZ6NrlM06PNETDU0ZXk18Fl5saikik1pKLk27b5vQoSHYdLm3rLWFz+oXdvwA73qBVucffQ2V//lPtwY8mKeHTFcXyCNErpqgYXWT1014Q8/84xBGSwly9RxN/5MZbSaE1bd4xiXreQRUdn2Kkd/QNeKuqd6SpQasAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(5660300002)(6506007)(53546011)(6486002)(316002)(2906002)(110136005)(122000001)(38070700005)(508600001)(31686004)(38100700002)(54906003)(64756008)(66556008)(66446008)(76116006)(6512007)(8676002)(4326008)(83380400001)(2616005)(71200400001)(8936002)(86362001)(66946007)(186003)(26005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVZBbEd3NW5sU2JSdFR4djlKT2N3VEZEL3c2OVVJYks5MytsdWdFOFI3em1E?=
 =?utf-8?B?WW9MaGtnM0wzRFdQdHJUWTBDdXZ4NjJXNmxMZXFCTU1wek1EMVJ5WjhjVklY?=
 =?utf-8?B?NFFZWXBhcTB3NSt1enJHVXA1K0dDSDBiTUdDMnErVGhzQ2NCb3RhM3l2QzFF?=
 =?utf-8?B?dEFFdTZUQjUvOUpERDhiZHN6UE1tUXh1NGxnRlk1N0txMTJKWUxYam9XVmtJ?=
 =?utf-8?B?YWdpRGZsNVgwMlk4TEgyOWhOWnlnUnhiWFdSTURUUllNSkpHK0FWUkF2NDJ6?=
 =?utf-8?B?T0hCRlJzNHd5VUdUR2ZmV2RzZlJUak9tZ1VhcTd3SmFOUytkajVYSXR2djBs?=
 =?utf-8?B?ais2UDlwU0J3dU9ucHcyNE5jaWhsRkxtUXFFV04wTENSck5Ya2FqbU1DekZW?=
 =?utf-8?B?eEQrdGpMZE9QYzN1NkRkcldkMmtFVkcrWW9Zd3hBOXhZczZXV3RGYTdWUFBn?=
 =?utf-8?B?ZHMzQlFSSGE1bWIzOG5BNTlNSElaZFBpUFdqMTl1SFNXUTV5WW9FSDJKTmky?=
 =?utf-8?B?RW1mL0VaZnIwQmFPQW9WTER0Y0R5UXVFNzFvVWlaUlRZVjRLRnoxSHBTOWRi?=
 =?utf-8?B?cDdwenpSdjFaUGxjakhMZ1RHSmlSZEhWZ3RaNGlmMVcwbVJ2K1FtSlkyWWNF?=
 =?utf-8?B?a0pXZjFCTVVzejRTRExXOTg3SnFaaUVYblp5NkdIWisvVnN5MW51QnJOZ0pR?=
 =?utf-8?B?QzVuT2QvclAxbjRENExlYVl0MTBXd2E4VVhOOHRjUElhOHdSb1pTclduVkNC?=
 =?utf-8?B?V3U0VUdYVWxZTnVNczBxQUlsQ2F0bUVUSGtzODN3MlAyMVdBTE1VTklZNGlh?=
 =?utf-8?B?bnpQUHlMc2hCWTZxb2p6ZWV0K2F6bzlvcTNHcDB0V0NSbEtidXJONmY0dmI3?=
 =?utf-8?B?RGdDa2tGL0RrekltMGlGeE96VzA3aVQxNmtKMXJpYUVmSThDbmRvM0VJMTgr?=
 =?utf-8?B?dlBMN0F1bUo5cWo3R3dpaXprVi9IdzBXUkhGK3JXRGg1blVRQ3JITjVTNXJk?=
 =?utf-8?B?cnNRenVHY0Rxbk9vcndiMFdNTk8zL2ZvLzZHSlhTT3RRUFAxTWVtRWxZRUdR?=
 =?utf-8?B?K29IdnZSWkNoK3FzRVpPZ21lQm1wT25hZmlOTmFIc05DQUEwRkI0TWN5VUwv?=
 =?utf-8?B?RjNFZXpyc2trYk9yc0lvbWc0VGFZNVc2WFhpZGlRdTFEbElMamkzQk1TM21q?=
 =?utf-8?B?NFNDaEU4S0Y5WXkrWWlGRWlPbE56UElyK0djWVBMU24vU2EvTU5DTUdXUjBP?=
 =?utf-8?B?RHZXUlZVOWkrK1BlN1NReXBHdVNpU0Zuby8raVZJL1FBWkR4SlpGWHZlcTZy?=
 =?utf-8?B?aHZ5eUFQcHJMTGFUcVEzeEIweStEQXp4SlpCOHRXWjhYQjdvNGZETTZ4N3RY?=
 =?utf-8?B?Sk9Hd3N1Qk1NMjZ4b0pqQ01BK05iMHNSL2dKSWFGa1UwVksrQ2NSVXFUUU5k?=
 =?utf-8?B?NnJtMmFSY1V6Q2k2MVQ4bEFuTUJnVHlqOHdwZjFBR0ZXbGRMbUtrWjdvZlZI?=
 =?utf-8?B?TXBFMGFWa0F5cHF5MHpON0w3bTI1alVPTjI2Wkw5aFAxcmgzVWpmYk1kSmpR?=
 =?utf-8?B?MXlmQXcyaWZpQnhQTmNoOXlTb1huUHFyVzYxVkRacEFabkF5TGFXOVFDZUt2?=
 =?utf-8?B?NXJVTFNwV0dFUVdaMGNQWG16cm1ZMUpFM3g4TWRvYi85bVdzZzNQbmY0WkJH?=
 =?utf-8?B?Vm5FeTB0a1JISzJKWG81Q1BLVFhpd1R6N0x6WjBTUit0aGVXdlFhbmhlYS9k?=
 =?utf-8?B?ZUJUMEZIRll1ZVhPQ2xhMXNZbkRPcmNrWG93VWdWZG9sTEx6eUpqTTBYU0Nl?=
 =?utf-8?B?b2JCdzZoQ2ZmNEh6YzluQWFtc0lGK1cvUitxU2t2RTUrRWpEd1M0TnJmT0Q0?=
 =?utf-8?B?VlNtdmZhV0VYWThmcGRVTHVkaXovVTNTRDdmQkdoQXhpU1dWNlJmVHNSYmR6?=
 =?utf-8?B?QUpnQkg0UHRJY1M2T21OWUx5S2NrRC82disrZmpHNDJ1Q0UwNFQ3a3dkNUUy?=
 =?utf-8?B?bzNhd0p2ZUNJVFZtSW1iclFPQjgwRDY5K2ppNEpMYUQrdUJzdStLb2lWWkQ3?=
 =?utf-8?B?a0JoWHB5eWVDNkRwSGlHSzJzRkVEeVdDVlRzbXF2Skt1aTFPd0ZqdWFOU0w2?=
 =?utf-8?B?Z3VRZWo4bEZGbzByZlpvWFptcGt2cnZvT2VNUUpESVRrdlh2blBrdDZGTGdw?=
 =?utf-8?B?RWRSL2NQOFlreGJ5Yk5HTnd2Mkw2KzArMzUwV3N4RTV1MmdHdUI1ekRSaEZh?=
 =?utf-8?B?eHROTEJSSDRYQ0FXbWNrMFBRK21RQmlUWGFJbmpDRHROT0NsaGZIWG1veUQ3?=
 =?utf-8?Q?OTjz6ikaUkShOTc/kD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED94533B6E1323438E73257CD74C8BEA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e29e00-7478-4995-2355-08d9ae635e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 09:26:45.6699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmfmMq7rIjIVqTeeRRCxQyOauYPm8Nj2TGWwx59oFYImtSA+flWSdT9vsbLMQUnr2aQ5B5faiMIaHfKXLstbvAthkRgadGSmNyLbpy/XjHEJQi1YHhS6FTahOIPTVbZl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3129
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgYWdhaW4sDQoNCk9uIDExLzIzLzIxIDA5OjQxLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0K
PiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSByZWd1bGF0b3IgdHJlZSwgdG9kYXkn
cyBsaW51eC1uZXh0IGJ1aWxkIChzMzkwDQo+IGFsbG1vZGNvbmZpZykgZmFpbGVkIGxpa2UgdGhp
czoNCj4gDQo+IGluY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oOjkzOjEyOiBlcnJvcjog
J3JvaG1fcmVndWxhdG9yX3NldF92b2x0YWdlX3NlbF9yZXN0cmljdGVkJyBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVuY3Rpb25dDQo+IGNjMTogYWxsIHdhcm5pbmdzIGJl
aW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQo+IA0KPiBDYXVzZWQgYnkgY29tbWl0DQo+IA0KPiAgICA4
YjZlODg1NTU5NzEgKCJyZWd1bGF0b3I6IHJvaG0tcmVndWxhdG9yOiBhZGQgaGVscGVyIGZvciBy
ZXN0cmljdGVkIHZvbHRhZ2Ugc2V0dGluZyIpDQoNCkFzIGEgc2Vjb25kIHRob3VnaHQgLSBkbyB3
ZSBuZWVkIHN1Y2ggYSBzdHViIGZ1bmN0aW9uIGF0IGFsbD8gSSBndWVzcyANCmFueW9uZSB3aG8g
aXMgYWN0dWFsbHkgYWRkaW5nIGEgY2FsbCB0byB0aGUgDQpyb2htX3JlZ3VsYXRvcl9zZXRfdm9s
dGFnZV9zZWxfcmVzdHJpY3RlZCgpICBoZWxwZXIgc2hvdWxkIGFsc28gaGF2ZSB0aGUgDQppbXBs
ZW1lbnRhdGlvbiBzZWxlY3RlZC4gRmFpbGluZyB0byBkbyBzbyBpcyBwcm9iYWJseSBpbmRpY2F0
aW9uIG9mIGFuIA0KZXJyb3IuIENvbXBpbGUgdGVzdGluZyBjb3VsZCBwZXJoYXBzIGJlIGFuIGV4
Y2VwdGlvbiBidXQgdGhpcyBpcyANCmN1cnJlbnRseSBub3Qgc3VwcG9ydGVkLg0KDQpTaG91bGQg
SSBqdXN0IGRyb3AgdGhlIHN0dWIgb3IgbWFrZSBpdCBpbmxpbmU/IEFtIEkgb3Zlcmxvb2tpbmcg
c29tZXRoaW5nPw0KDQpCZXN0IFJlZ2FyZHMNCgktLSBNYXR0aSBWYWl0dGluZW4NCg0KLS0gDQpU
aGUgTGludXggS2VybmVsIGd1eSBhdCBST0hNIFNlbWljb25kdWN0b3JzDQoNCk1hdHRpIFZhaXR0
aW5lbiwgTGludXggZGV2aWNlIGRyaXZlcnMNClJPSE0gU2VtaWNvbmR1Y3RvcnMsIEZpbmxhbmQg
U1dEQw0KS2l2aWhhcmp1bmxlbmtraSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fiB0aGlz
IHllYXIgaXMgdGhlIHllYXIgb2YgYSBzaWduYXR1cmUgd3JpdGVycyBibG9jayB+fg0K
