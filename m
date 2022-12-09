Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E281648158
	for <lists+linux-next@lfdr.de>; Fri,  9 Dec 2022 12:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiLILKb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Dec 2022 06:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiLILKa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2022 06:10:30 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7177E54762
        for <linux-next@vger.kernel.org>; Fri,  9 Dec 2022 03:10:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRivlNLRH1VXdaMJ3MQy0bxU3uomB0vUUK+AgVOzIobek+O55LLw3ibfJmQdvg22tml1nU2T+2VQ02nQkhrmBHk6JEvsIsRs0oOOpCJix4ajjHrLgM5tztBNDyYQ6Ty752aNbY1dpr4B8cut7BpMOLzuHjZW2nbsjfL3DX/a/OwMJ3HjGzPlX2kvrwbMC834nlLiDN8Vc2AOlmE37+nTL/fxUclrEhEDAh3c6CeiZZBpeJFak7iwhP/Fj7b2gLj7+eUfbgV0G9m29rZFxLlsqGfDFGVA4aQTOfSga5UrJxNxmLEmt4YPQ2D1wDltQgUIMbxC3r25EiXnA+odw2ogsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLlXB8m+2cAFHibJ214QzvNvqdmS99Ba74aKkRpUrLo=;
 b=MtXGyCIZovrbbPMEeZXZEi1yZ9qq40dtJ0Zg8W7zg2cPTCZGWgnLZ1aqdUOjy/E74LqBpIkge6yKcrY8HRYeFRLY7Kih3mgnkl1+BTveM7S/AOjXnpEZ0lwRq0Q7Mqg/n8f9tHlWcElP8feOTdLkAocmyg/VafJYBskQ+/v8lsudcn1eTLzIiFi/u+Vp85/zuuPu/ImDajQdL1iy3jMdDdbb7ctNS50I19hUjXSHVt+9y/FN1mzZf7v8PNtiUxGsOaKELf4S+0xYEMaDEiH8HgqsV7lcclY8e/m/QKGCM1Hgr1HtBaB3VxlUTgXd3LpT7lTSxfenArUFDhrQHK6AVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLlXB8m+2cAFHibJ214QzvNvqdmS99Ba74aKkRpUrLo=;
 b=vvHDqvrn2cwaXIBH/Hxr26VFv3J+QeajFmqX+rCnFquyqtJ/x6yZv/xw3PCY3ewSRAVB4RJYd3ta0WpxST41lEhUVOCxlcyo2iV72Xs3P1LebBXmoe2qDsNCwoifwCdRSQ3+KcbvqZZVfP4Vm6F2ejgaWqcGn+zlA5yGp/evbhgDRuqG/i00JFQAwXssjFHdRzPAPDj2qkD5A4Z+wWPRCBcxhUWLBVnesMLYQFKkuvIHU6yWtl0NU3ger/FeR5TICUTPZXkWj+kpZIB9oxj/zIjzeDnLe3FNdkG3LEvC6wfM2JCUTpxn8SM+vFSl3izs6FDoSghY4B8xzkGOSEBZ7A==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AM0PR10MB3330.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 11:10:27 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ddda:691a:9da:c150%3]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 11:10:27 +0000
From:   "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
CC:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH] memory: omap-gpmc: fix wait pin validation
Thread-Topic: [PATCH] memory: omap-gpmc: fix wait pin validation
Thread-Index: AQHZC700X1XCI+mIlEOBrKRWoxYI9a5lZG4AgAABxQA=
Date:   Fri, 9 Dec 2022 11:10:27 +0000
Message-ID: <8d7b2fb49791cddc34355cdd9d7907fb8484ae7f.camel@siemens.com>
References: <20221209105817.576532-1-benedikt.niedermayr@siemens.com>
         <35af7393-71a0-b15e-856e-0429cf4a177d@linaro.org>
In-Reply-To: <35af7393-71a0-b15e-856e-0429cf4a177d@linaro.org>
Reply-To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AM0PR10MB3330:EE_
x-ms-office365-filtering-correlation-id: cbd3a331-cccb-4134-fac1-08dad9d5fa08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f18y9SScqFkxyOOqfO6065sC1OpXoMfTd/JWYP6Km5JnAOv2TiCBJFr0bbkS8DrTjcaG6NwNKFkw6PHaNkDeIdTbkh2nzI9qT231o4xwQZEd58OrqFne4w+PQBud3Of1NpcNlFd9gWpbujTp6XCyd4zV97EHZKyYflwe7SeF07hCfzGeGoJ+xadLCxoNd5zA4tCY7WfgzSVGWn3R6h0oE6i69oJXHgFbO+UwKiflJfeVA89L/ic2EG3TEHCYnxFC3Js+DyhLEp1KchlNsp0recoK/drSFLYjcNG9qyBDQQ7zOZIvDCiHWQfvptuEt3cBo+JcDFCqGAMp1fzUcTjjTyvDt2IDX5YhchHvhB4yuBYiVzabJIPyAOuGz4EKVQ5P1Inh2LR8c7XrJ/Qqjzsa2Yprr3QAvEvKv7G2ixZvg8tfxHwfNG3ZR1ZZEqG0N5qO1BRW+zuFaxXcNxXtWAw3tf+8b6bI9DOtdVhSDg+PIOooqM++DMjPyRHPIcPC1WnGmToLmNG8YI8dkDHKmxXdRPol+/y9BRP7BPt9iq//wyEdW29e8jRtoGtkAqu+Sf6qIx45aNP7ii4eFeb3xsp7aSKaPmaxHcay20LuC3Vo4f/0shQ/IRY+XPDviuf6I3otyECy/B3VwWLljbAoE2O7ccLPVn4NsMvzW6IciRQHQSc242XVtpx2mh5qvfxO8GADRTocBuyQkZcRWf1yvsp/gA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(53546011)(36756003)(66946007)(6506007)(6512007)(26005)(186003)(110136005)(2616005)(3450700001)(76116006)(316002)(54906003)(38070700005)(2906002)(41300700001)(5660300002)(82960400001)(38100700002)(8936002)(122000001)(4326008)(86362001)(66476007)(66556008)(66446008)(64756008)(8676002)(91956017)(6486002)(478600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzd2alZyTmNELzhlVS9YZnhGWDFtaS8rZnZJM2I2WXYvMTZ2VlUwZ2tqRXhJ?=
 =?utf-8?B?ekROemhiaEVjcnVEN1BIU3ZjRlZLZnQwNWJlR1RUNVZaNE9KSnh0aHhWN3cr?=
 =?utf-8?B?WkR5VXo2Y2ZlbWVzNSs1T2duZXd3MVdmVXRRNzh3eXp6dVpzdFhmS1JXKy9u?=
 =?utf-8?B?ZG8rTDVCOC91THd4UUc3U0tZUzk1akpRWVB4bmtJbkFEQllBM0NrNFNoV2c4?=
 =?utf-8?B?dVhtd3hXa2J6T2FUUEN5VEJQeitHMy9CYStnSzF0S2E3c1N4K3pvMGhzT0N6?=
 =?utf-8?B?R3BIK3o1MDFLbHFkcERBZVd3Myt2c0VOVFMwRGljQ1hFMVI5V3hhcEJDMmtw?=
 =?utf-8?B?VzFkVzRsOUtmeDVhWVNIM0RRMndsaHArdENhZ1Fldjk2d0s2Q3huc2JUVVYx?=
 =?utf-8?B?UlBiS0UxTVNidEVtTVhOaE52cEN6MGhWdy9nZlBTKzNvUTNBRXNMb0lNTHVU?=
 =?utf-8?B?Z3lLNk5jN3V5dzFOZUx6bmdQalExVVZQd1pZd2w0bDJnTFdFZWptV25GZzBG?=
 =?utf-8?B?cmtjYjFuemUyZEdpQjI5QlJreXljbTdXOXowKzZHMWdWK3hGTDFkaXZkcWpN?=
 =?utf-8?B?bGJUbjBSdEhnbWN0WDd1bHpsS0RlWkhpK2Y3TEJkdXZEQTdlcWJMTzRqdkxy?=
 =?utf-8?B?Z2JuV0JRc2FNU0g2Zkk3YUs0ZEszVVAyVlc0cUkvYmMzVDV5cWplNWpZRzVy?=
 =?utf-8?B?eFZ4UXBkSWUxVm0zdmFpZzgzTEdZR2ZQeWVud3Vpckk5VURJVjN0NnBNZlhN?=
 =?utf-8?B?ZnRwTWp4ZGxHd3BMUWFuSmlERElzbUt2eVA0M3R3Nkoxd2ZCNGUxNVZqYnFz?=
 =?utf-8?B?TEhHZHMwMFFlTkpxSGZReFJ5bjRPancwVk1EQ1Y2bXNjVDVFOVRrOEJOaEJk?=
 =?utf-8?B?Ry81dmxTbDBMcllWQWpQRnJCY2JKMnJCek5pcHhiZERHd0hmdWIwRUpGMUlu?=
 =?utf-8?B?aHVJN3dNbTd6b2UreVlESFRKTTdya1VHeVNFWFpnaDlKeG5rUFFCbGhxVEkv?=
 =?utf-8?B?ejlMSWludmZVQ0tIRGtTQ0NtNHlzRExkdjIzRmJzSzR1a0F6dUpDYy9WQklC?=
 =?utf-8?B?RmF2aUpubFF1ZWxIUVl3aEJVM01tYVhRdlpRS3hjOFgrUFZiMTNsazFNZ0ty?=
 =?utf-8?B?ZjlEc1ZuS2s4TG9naXYwcVA4dW1CbExxR2dVaThpRWhQNmZiRDA5NjZ1dms3?=
 =?utf-8?B?ay9PNzZ0N05CeUZtV3NQRVJlWi81Mkx5bU50U25FL2NoMnE4UkppUUdIZTJC?=
 =?utf-8?B?akN5blN0Z21pV2puSmR1YmxLS2JqZXpIbjk0Zkg3aDA0TjNmVVJFY3A5WWY5?=
 =?utf-8?B?c24wVDFMZzg1QUpxSjRzMERCa3l5cVdOc09mbE9CY0w4TnhWaHNpUDFUcWE0?=
 =?utf-8?B?M1VVVzhCL0kvSE1CaHlyUVR2QkdHdzE5b3J3Z0ZCdjB3a3R0TE9jZXpLb3Zi?=
 =?utf-8?B?UEZ0L3IxMDVUYjA2Z0srUENJZk1sRXErKy9EaHhnRDBlcnBOZkdzQzFqczFj?=
 =?utf-8?B?MzFmN1JsaFR3SVNhUEVlMExMb1RWY2N1aWJOemdFTHozZ1pXb2Zna0tWV3pS?=
 =?utf-8?B?NmluUzhkSmp1RUxLdllnZGhaclBIUEE4dUZFRExlWU5HeVRvbmxxdmRmM0lu?=
 =?utf-8?B?VGhzWG5PaWhZYlhYMWVNL1NRVW9nUTkrRVkzSUl0VEloWGdQSjVjU0V3LzUr?=
 =?utf-8?B?NXVlZlQ1alk0ejVGY3ZjbXlQRmYwWmdNMGJJVmlTQUZGWEdNNGdyODVDS1Mv?=
 =?utf-8?B?aE5sMmtkV0drbVVwbTlpM3ZRQnZMZVIwRzQ3RjJTZ1dkZ2lCSUFhVGpEaFFM?=
 =?utf-8?B?cER4ZEd1Z0RURVQ2aUxqNERzd1RZQzdXa0p5L0ZNYzhIdWRvZXhySGp5RkRJ?=
 =?utf-8?B?enJIbWFiRFlGbkw0a1RZU0JIcnRRUWpWemxCVlk2U0VWd0ZUb1JwTlQrS0N2?=
 =?utf-8?B?UUpEMDhsWWtHUk9ybVJoWVZ5U0VmVDd3N3dUK28wejhOSUNuci9OOWFLRmVX?=
 =?utf-8?B?enpyR3d4bHRZRFdIOEF5NUtKTUJpcTU2d0puVTlDWEtKQ3Byak53a0czMFo1?=
 =?utf-8?B?cWphV0V2S05id3FqUDJuK0lnNmtES2JQTkw3c1A5SjBHRTVybHRuME0vQ0pG?=
 =?utf-8?B?WExJVVJzRXMxWmV3ekJiWFhCSHNvZnBXOTFRWXJ6RUU1NHVRVVFIVEFSd0Vk?=
 =?utf-8?Q?NNoZoXPsz+WJlW6VC4Hulo4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AB3F4943DD87E4EA7202A5B0844C67A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd3a331-cccb-4134-fac1-08dad9d5fa08
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 11:10:27.2188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ctrl5u0pLIkV8m/bqSThZcUlQiiIAN7wQqA0xaX2CLLn1YXS5nPhrjnZnI6KGTLwvAOC/matX334Hh2rL9GHNgk60C17HsPci7cx60fXGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3330
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gRnJpLCAyMDIyLTEyLTA5IGF0IDEyOjA0ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAwOS8xMi8yMDIyIDExOjU4LCBCLiBOaWVkZXJtYXlyIHdyb3RlOg0KPiA+IEZy
b206IEJlbmVkaWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRlcm1heXJAc2llbWVucy5jb20+
DQo+ID4gDQo+ID4gVGhpcyBidWcgaGFzIGJlZW4gaW50cm9kdWNlZCBhZnRlciBzd2l0Y2hpbmcg
ZnJvbSAtMSB0byBVSU5UX01BWA0KPiA+IGZvciBHUE1DX1dBSVRQSU5fSU5WQUxJRC4NCj4gDQo+
IFBsZWFzZSB1c2Ugc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwgdG8gZ2V0IGEgbGlzdCBvZiBu
ZWNlc3NhcnkgcGVvcGxlDQo+IGFuZCBsaXN0cyB0byBDQy4gIEl0IG1pZ2h0IGhhcHBlbiwgdGhh
dCBjb21tYW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVyDQo+IGtlcm5lbCwgZ2l2ZXMgeW91IG91dGRh
dGVkIGVudHJpZXMuICBUaGVyZWZvcmUgcGxlYXNlIGJlIHN1cmUgeW91IGJhc2UNCj4geW91ciBw
YXRjaGVzIG9uIHJlY2VudCBMaW51eCBrZXJuZWwuDQo+IA0KPiBJIHRoaW5rIHlvdSBnb3Qgb25s
eSB0d28gYWRkcmVzc2VzIHJpZ2h0IGluIHlvdXIgZW50aXJlIENDL1RvIGxpc3QuLi4NCj4gDQo+
IFBsZWFzZSByZXNlbmQgd2l0aCBjb3JyZWN0IGFkZHJlc3Nlcy4NCk9LLg0KDQo+IA0KPiANCj4g
PiBUaGUgYnVnIGxlYWRzIHRvIGFuIGVycm9yIHdoZW4gdGhlIG9wdGlvbmFsIGdwbWMsd2FpdC1w
aW4NCj4gPiBkdC1wcm9wZXJ0eSBpcyBub3QgdXNlZDoNCj4gPiANCj4gPiAuLi4NCj4gPiBncG1j
X2NzX3Byb2dyYW1fc2V0dGluZ3M6IGludmFsaWQgd2FpdC1waW4gKC0xKQ0KPiA+IC4uLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJlbmVkaWt0IE5pZWRlcm1heXIgPGJlbmVkaWt0Lm5pZWRl
cm1heXJAc2llbWVucy5jb20+DQo+ID4gRml4ZXM6IDhkZDdlNGFmNTg1MyAoIm1lbW9yeTogb21h
cC1ncG1jOiBmaXggY292ZXJpdHkgaXNzdWUgIkNvbnRyb2wNCj4gPiBmbG93IGlzc3VlcyIiKQ0K
PiA+IENjOiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPg0KPiA+IENjOiBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KPiA+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+DQo+IA0KPiBEbyBub3Qgc3RvcmUgbWFp
bnRhaW5lciBlbnRyaWVzIGluIGdpdCBsb2cuIFRoZXJlIGlzIG5vIHBvaW50Lg0KPiBNYWludGFp
bmVyIGFkZHJlc3NlcyBjb21lIGF1dG9tYXRpY2FsbHkgYW5kIHRoZXJlIGlzIG5ldmVyIGEgbmVl
ZCB0bw0KPiBrZWVwIGF1dG9tYXRpYyBvdXRwdXQgaW4gdGhlIGhpc3RvcnkuIEtlZXAgb25seSBw
ZW9wbGUgd2hvIG5lZWQgdG8gYmUNCj4gQ0NlZC4NCj4gDQpJIHdyb25nbHkgdGhvdWdodCBJIHNo
b3VsZCBDYyBhbGwgcGVvcGxlIHdobyBoYXZlIGJlZW4gQ2MnZWQgb24gdGhlDQpkaXNjdXNzaW9u
Lg0KU29ycnksIGZvciB0aGF0Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4g
DQoNCmNoZWVycywNCkJlbmVkaWt0DQoNCg==
