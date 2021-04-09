Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10C735A506
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 19:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbhDIR51 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 13:57:27 -0400
Received: from mail-eopbgr1310099.outbound.protection.outlook.com ([40.107.131.99]:17762
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234313AbhDIR51 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Apr 2021 13:57:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOkkI8t/1q7IDJiOAsi5zYgkuGRgG/b9/51WYWLwv5MrVD1cuC7aeGR9Zg9eIAz5P6D/svSLFl/9Omf7ynA6JL9rozXDoHb0zNUahM9zhcDI/C+EclW2cvBwpdZnNNMM3v6JiS16+AGWiLB5csPOn+f8vnLC2HWs4z370n/dawilszB1AvUMKQtYXTczDfjaeloEqCzNB+cp4bojwUWGEcFyizGrYgVMM8e3C24TONlmfFUoIPlo9MqnC1UDWgz6qZ/zEbj7809kcUC3bPPeMGYu4Qhv3Y2w2NL3osXQB0SsyBJCB+euYWCVjIKXdKvvgjHq48rKvmEFcHLrdm8W7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMceFfzVBzt2CBaz6zVRVG0BCVBYsMDJFyXy3v7J30Y=;
 b=PKpWq+Hp2EvFW2ufepRia75FgTut+D9R9iVdX9Xv5lbxFrVnqk5g5KefksvgIX4IxehXf8pQgC6jzZ887l/GUh0bTFSJC+TMFi1xGM15QevS6hGNXDDW0sdXmF3G8j7Ffjeg50Omck8q1SbJJZArfBILGcOwA8Fiicebrub95MeE5sZuE5jO7J0JBkL8GejklZML1P9b/e+Mamua0uu7Jh2B7zABexAPRnsyMwhxwZKm7xixVXF7n4lDHFv7jg20GDGeGiCVyosTeqIw3PO2JlpvmO0a/rgcYAv/2HY0+430SOoaKD7cJ6/dacBs3VU9KMTg6cKwc3tZX0CDhz1lTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMceFfzVBzt2CBaz6zVRVG0BCVBYsMDJFyXy3v7J30Y=;
 b=OtxE7Kk5Ppsh8YQ8nfzjbCDPijs891yo1uIGn6S1zzJxloZ4VWW57mozWQ137Xhq7ibolIwbEwn6As4AJ9a1O6mfq69pGv1pOIiZyTcOwJpLYkWFP4mnek/9cvr6ccpscofqlxZtCs1O4gnvKBmsGetp6zQR7+d+ji6tqaymzzk=
Received: from PSAP153MB0422.APCP153.PROD.OUTLOOK.COM (2603:1096:301:38::12)
 by PSAP153MB0439.APCP153.PROD.OUTLOOK.COM (2603:1096:301:3c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.1; Fri, 9 Apr
 2021 17:57:04 +0000
Received: from PSAP153MB0422.APCP153.PROD.OUTLOOK.COM
 ([fe80::24d9:ce8b:8c06:2299]) by PSAP153MB0422.APCP153.PROD.OUTLOOK.COM
 ([fe80::24d9:ce8b:8c06:2299%8]) with mapi id 15.20.4042.010; Fri, 9 Apr 2021
 17:57:04 +0000
From:   Shyam Prasad <Shyam.Prasad@microsoft.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
CC:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Maciek Borzecki <maciek.borzecki@gmail.com>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Steven French <Steven.French@microsoft.com>, pc <pc@cjr.nz>,
        Pavel Shilovskiy <pshilov@microsoft.com>,
        Steve French <sfrench@samba.org>
Subject: RE: [EXTERNAL] [next] ERROR: modpost: "dns_query" [fs/cifs/cifs.ko]
 undefined
Thread-Topic: [EXTERNAL] [next] ERROR: modpost: "dns_query" [fs/cifs/cifs.ko]
 undefined
Thread-Index: AQHXLP5LXQfVY2XqbUK9ec9lTWpxV6qsWVlAgAAdcwCAAAHrAIAAAI2Q
Date:   Fri, 9 Apr 2021 17:57:04 +0000
Message-ID: <PSAP153MB0422295B47CE0D299103585C94739@PSAP153MB0422.APCP153.PROD.OUTLOOK.COM>
References: <CA+G9fYu60T=vymv7gA0eaopfNDWXAVT9WRS11Rrk1OfTkrCevw@mail.gmail.com>
 <PSAP153MB042218315B664B15A59A80B094739@PSAP153MB0422.APCP153.PROD.OUTLOOK.COM>
 <CA+G9fYvcSK-Z7+VrRbHp7ADDDgw2tWWaqTfQMyC2dxuOYGLz6A@mail.gmail.com>
 <CA+G9fYuNHTscCZDwGnxv5axibgUw1iRKQ4RJrJxHQpSNrQPaBg@mail.gmail.com>
In-Reply-To: <CA+G9fYuNHTscCZDwGnxv5axibgUw1iRKQ4RJrJxHQpSNrQPaBg@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=9f8bd808-0da6-4745-8078-a27ffdf3de78;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-04-09T17:56:11Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [2404:f801:8028:1:60f6:ca47:5dfc:b1d0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 565688f7-6538-49fa-a16d-08d8fb80e28f
x-ms-traffictypediagnostic: PSAP153MB0439:
x-ms-exchange-transport-forked: True
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <PSAP153MB0439CF884D37AE98B6EA0D0794739@PSAP153MB0439.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qhFxQ6w70smiqdrwNW5kvfHE0RtJ9chjskQdI7H7Rg8senBaDrI3dgC7ztn8DmJSpxi1fmW8syUAvlhXeBkEdrX3yN+PKYlkMuSpvaGE7Kp8raTXXKQjsCmS5CcMGP8UqHs3pEBS2VuI2nOffcUGk74Ctv+TwqAPT+2DObE9+XaomCksG2CC71No4HadLIFNTDV+bTxXGcO+MEz+i8/YvtD00tuTlqp9JLvXGsJlrdsa7XhmHAlJvWS18a9TVkkgEz8mX681lIs8we3gL3PYF37sVZ8bla7/rj9fK67t0GVpnpj8KavbxPi1/YVdYG2/gmc5uRc1MkwdKC1s8wOgNbzpDEtzP1vgoN6LtEuWWVCXzXIN6aWpkBQE7yGUYCAYR8bZ7rm/fNAtgMH51wxVj4Fj1QElXZjYOj0EuVgw5VhblIWjSaurJwE56BLorSbjGkhcHwe/cmnR39dh0VbzBRt8a5HoPHa0rLXdx8/vj9t6LOzHK/nP629VaWp7uzJqsi7xzIPAKQhd6VPbUcst+f8mENY00V0dm8CYEMZ7VS4rkEGe3ZSGo2wEkvA03oShFq6Wtj1wdKgzBw8IIGOzCTBYkfCQGZ5fzqwvFx74mQpmlRx6kQfKPHwY8fqguFDgBFL+LS1p4r0vlata5/eGqQ1uUTy+tXphqq4f2ek73AU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAP153MB0422.APCP153.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(4326008)(478600001)(76116006)(71200400001)(66946007)(66476007)(4744005)(66556008)(186003)(66616009)(64756008)(8676002)(6506007)(66446008)(6916009)(53546011)(316002)(2906002)(52536014)(54906003)(7696005)(86362001)(8990500004)(55016002)(5660300002)(33656002)(10290500003)(9686003)(8936002)(82950400001)(82960400001)(99936003)(83380400001)(38100700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aHRBdEh5YWtlV2V1YktVNW4yL2xzd3h0VzJMelFueW8zdkJlZnR6U1RhVmN5?=
 =?utf-8?B?SlQrZWRJRmJNZzhuNXB3cGNmMkdnbHNPbnZmazlkemtyZzV5SGtHQ3FrSGtC?=
 =?utf-8?B?Q09mcHpPeHpIbUk3ZmNYTHJqWWlaQ2hzL1l0VXFoaUpnb1Bha2wrWTVPL3NW?=
 =?utf-8?B?QnNNR29wMjF5ZDVlN0UxZjdnUGNiT0ZlOHlOY3l1V3BxUS9hSnJoMTMrNGdD?=
 =?utf-8?B?dGhTc282SXJkOGJZcGllcXJhTmJlbWpSdm14NWt2bFpnM3JvNG5zQ0tYUTJR?=
 =?utf-8?B?K3pPb0VOY2QxUFFMMGVRSnZjUlZLczM3RXY4SjVicURWZHhPUHVCbEFQZThJ?=
 =?utf-8?B?QXVqSDhUZk80cklSWVJFTkJicUNCUGI4VzZ0K1BBOGlBbytKR24xTWVLWUJs?=
 =?utf-8?B?VkZRMEEyeUNTWDkzMTBjTU03NGhqekMzNkVnWnY4WnNPckVTL3N0ZFdGRGth?=
 =?utf-8?B?SEk5MFV0djB1NHNiY3p6L0lLQnd1bHc0VENUNjd3OUk3Z3NaSlNCQTArbUR0?=
 =?utf-8?B?MnArV1lJcTRyemcyR0I0RFQ2QWZQaFVLTWhSeVlSWHIyTXZYalVFYyt0d3FX?=
 =?utf-8?B?cXpmK2lBM2RHY1p5YWlqZk5WMW5nRmVESGJBQWlFU0xIZXErdGV4U1J1Zk5K?=
 =?utf-8?B?dEh2NjJPOEhuak9Ya2ZJODRLTFI2cFNiNkJUaHo0ZlIwQ21oVlgxbDhocER0?=
 =?utf-8?B?dVZkM1AwdEpZWUhteFhBVFNOVThLcmYzMjluT2NqOUZNcmxvZ291UVlYYXM5?=
 =?utf-8?B?TnE5a3REU0g5emZxSWtwOXlpTUhrSUNSUWlLd2s5L1lMeDJmeHlSejFBMlBs?=
 =?utf-8?B?Ukc0dExEd0VlNjUyK2hhT00yUGE0cCsxUkxhTTFFdzVpbGZMRDUxK2txdzV6?=
 =?utf-8?B?a0xpemVOOFZLaU1PUHYwazQ5b2hmS1F2bVRQNjllQjREL216MTAzUVpnblRU?=
 =?utf-8?B?MS9pU3NNS2kyTlk1S3hSVkFudjF0WHo4NmRUVmh2UGNaajdobkc1WHcyS0hP?=
 =?utf-8?B?NXByVkFaWE1Hd1FLcGQybVRUWU1QVUdGOXhadEt6THhwKzNQZXUxbExRUVRm?=
 =?utf-8?B?Nm5saG40NFdkbmhJa0N3SEJNbnlVS2pRU2drMU9yR1pXNFZuRURJQjlIb0tk?=
 =?utf-8?B?ZFJReTZYaFdnYUNHRmVWNjU2N0gyOWNmYW5LRHdWK0dxc0YrWHg2dmUzRXRn?=
 =?utf-8?B?c1pWaHVlT093dTJ3Q0kzZFoyc3c5UmJwbnJLQ2trYXBLWXhZQ3JZeHVhWGIx?=
 =?utf-8?B?ektlRkp2VFhXUStXSzd4ZGdTcjZGekc3NURBVUVRcmFmdk02d2pTWmo4elo3?=
 =?utf-8?B?YnZpQ21ubU50UUFpeDd4WHllUi9Nb1JBOHRoM0dKLzcrcjFuWTlzdkJRVGs1?=
 =?utf-8?B?Tm5NVTZSNkkrWklmN0t4WjZEUHFRRjNKemRQeElLKzBHTXkrd0dqTWdrNWJv?=
 =?utf-8?B?TzlWbXZ5M1BvZ20vQktHeUswQm13azEvRWc3NU9tRDdNb2MvSUk4bXFqamZl?=
 =?utf-8?B?cXpKUTNpU2o3a3c1NVI0V1puS1NrNG9Rait3UlpPZ21IeWpSNVNqdU5PUTVs?=
 =?utf-8?B?VndBYUs2OHRrOVBoeDR4UGdOL0JnUDc1eGlXRTdieUEzdTFHelo1VGUvK1B4?=
 =?utf-8?B?WW4vT1NFejlrNC90TU5FOVlOK1hlcGRySFZucU81TmFJZEMwVXJBVEdXcTNX?=
 =?utf-8?B?OURveXlsZDl1UTY4R01NY05aSzdtL1ZGN2pxMU1DSjZESVhNVlVySnFDc0pB?=
 =?utf-8?B?YWlEWUJQVjhWMEZiRVdKaWJZU3RtZU5vSCt2VVl3VlpwSTUrZUJ2b3RHRTJB?=
 =?utf-8?Q?jQhKY4rLe0w8AjDnlEYbmQhKR08zoIcAdfWQQ=3D?=
Content-Type: multipart/mixed;
        boundary="_002_PSAP153MB0422295B47CE0D299103585C94739PSAP153MB0422APCP_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAP153MB0422.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 565688f7-6538-49fa-a16d-08d8fb80e28f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 17:57:04.6024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANXSuBQjMefqOGxw3SkXiuChcbu+JixeNY8cgrqEi4JswYxMe8+BmG5beNWWbsJvIvY9uHmXiVCqz/cLzkXWYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAP153MB0439
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--_002_PSAP153MB0422295B47CE0D299103585C94739PSAP153MB0422APCP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXR0YWNoZWQgdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4NCg0KUmVnYXJkcywNClNo
eWFtDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBOYXJlc2ggS2FtYm9qdSA8
bmFyZXNoLmthbWJvanVAbGluYXJvLm9yZz4gDQpTZW50OiBGcmlkYXksIEFwcmlsIDksIDIwMjEg
MTE6MjQgUE0NClRvOiBTaHlhbSBQcmFzYWQgPFNoeWFtLlByYXNhZEBtaWNyb3NvZnQuY29tPg0K
Q2M6IExpbnV4LU5leHQgTWFpbGluZyBMaXN0IDxsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZz47
IG9wZW4gbGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IHNhbWJhLXRlY2huaWNh
bEBsaXN0cy5zYW1iYS5vcmc7IGxrZnQtdHJpYWdlQGxpc3RzLmxpbmFyby5vcmc7IE1hY2llayBC
b3J6ZWNraSA8bWFjaWVrLmJvcnplY2tpQGdtYWlsLmNvbT47IFdhbiBKaWFiaW5nIDx3YW5qaWFi
aW5nQHZpdm8uY29tPjsgU3RldmVuIEZyZW5jaCA8U3RldmVuLkZyZW5jaEBtaWNyb3NvZnQuY29t
PjsgcGMgPHBjQGNqci5uej47IFBhdmVsIFNoaWxvdnNraXkgPHBzaGlsb3ZAbWljcm9zb2Z0LmNv
bT47IFN0ZXZlIEZyZW5jaCA8c2ZyZW5jaEBzYW1iYS5vcmc+DQpTdWJqZWN0OiBSZTogW0VYVEVS
TkFMXSBbbmV4dF0gRVJST1I6IG1vZHBvc3Q6ICJkbnNfcXVlcnkiIFtmcy9jaWZzL2NpZnMua29d
IHVuZGVmaW5lZA0KDQpPbiBGcmksIDkgQXByIDIwMjEgYXQgMjM6MTcsIE5hcmVzaCBLYW1ib2p1
IDxuYXJlc2gua2FtYm9qdUBsaW5hcm8ub3JnPiB3cm90ZToNCj4NCj4gT24gRnJpLCA5IEFwciAy
MDIxIGF0IDIxOjQ5LCBTaHlhbSBQcmFzYWQgPFNoeWFtLlByYXNhZEBtaWNyb3NvZnQuY29tPiB3
cm90ZToNCj4gPg0KPiA+IEhpIE5hcmVzaCwNCj4gPg0KPiA+IEFGQUlLLCB0aGlzIGhhcyBiZWVu
IGZpeGVkIGluIGFuIHVwZGF0ZWQgcGF0Y2ggbGFzdCBldmVuaW5nLiBDYW4geW91IHBsZWFzZSBj
aGVjayBpZiB5b3UncmUgc3RpbGwgc2VlaW5nIGl0Pw0KPg0KPiBQbGVhc2Ugc2hhcmUgdGhlIGZp
eCBjb21taXQgYW5kIHN1YmplY3QgaGVyZS4NCj4NCj4gRllJLA0KDQppZ25vcmUgdGhlIGJlbG93
IHN0YXRlbWVudC4NCm91ciBidWlsZCBzeXN0ZW0gZGlkIG5vdCB0cmlnZ2VyIHRvZGF5IHRhZyB5
ZXQuDQoNCj4gVGhpcyBidWlsZCBlcnJvciBpcyBzdGlsbCBvbiB0b2RheSdzIExpbnV4IG5leHQg
dGFnIDIwMjEwNDA5Lg0KDQotIE5hcmVzaA0K

--_002_PSAP153MB0422295B47CE0D299103585C94739PSAP153MB0422APCP_
Content-Type: application/octet-stream;
	name="4e456b30f78c429b183db420e23b26cde7e03a78.patch"
Content-Description: 4e456b30f78c429b183db420e23b26cde7e03a78.patch
Content-Disposition: attachment;
	filename="4e456b30f78c429b183db420e23b26cde7e03a78.patch"; size=4033;
	creation-date="Fri, 09 Apr 2021 17:54:56 GMT";
	modification-date="Fri, 09 Apr 2021 17:54:56 GMT"
Content-Transfer-Encoding: base64

Y29tbWl0IDRlNDU2YjMwZjc4YzQyOWIxODNkYjQyMGUyM2IyNmNkZTdlMDNhNzgKQXV0aG9yOiBT
aHlhbSBQcmFzYWQgTiA8c3ByYXNhZEBtaWNyb3NvZnQuY29tPgpEYXRlOiAgIFdlZCBNYXIgMzEg
MTQ6MzU6MjQgMjAyMSArMDAwMAoKICAgIGNpZnM6IE9uIGNpZnNfcmVjb25uZWN0LCByZXNvbHZl
IHRoZSBob3N0bmFtZSBhZ2Fpbi4KICAgIAogICAgT24gY2lmc19yZWNvbm5lY3QsIG1ha2Ugc3Vy
ZSB0aGF0IEROUyByZXNvbHV0aW9uIGhhcHBlbnMgYWdhaW4uCiAgICBJdCBjb3VsZCBiZSB0aGUg
Y2F1c2Ugb2YgY29ubmVjdGlvbiB0byBnbyBkZWFkIGluIHRoZSBmaXJzdCBwbGFjZS4KICAgIAog
ICAgVGhpcyBhbHNvIGNvbnRhaW5zIHRoZSBmaXggZm9yIGEgYnVpbGQgaXNzdWUgaWRlbnRpZmll
ZCBieSBJbnRlbCBib3QuCiAgICBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+CiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFNoeWFtIFByYXNhZCBOIDxzcHJhc2Fk
QG1pY3Jvc29mdC5jb20+CiAgICBSZXZpZXdlZC1ieTogUGF1bG8gQWxjYW50YXJhIChTVVNFKSA8
cGNAY2pyLm56PgogICAgUmV2aWV3ZWQtYnk6IFBhdmVsIFNoaWxvdnNreSA8cHNoaWxvdkBtaWNy
b3NvZnQuY29tPgogICAgQ0M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDUuMTErCiAgICBT
aWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+CgpkaWZm
IC0tZ2l0IGEvZnMvY2lmcy9LY29uZmlnIGIvZnMvY2lmcy9LY29uZmlnCmluZGV4IGZlMDNjYmRh
ZTk1OS4uYmY1MmU5MzI2ZWJlIDEwMDY0NAotLS0gYS9mcy9jaWZzL0tjb25maWcKKysrIGIvZnMv
Y2lmcy9LY29uZmlnCkBAIC0xOCw2ICsxOCw3IEBAIGNvbmZpZyBDSUZTCiAJc2VsZWN0IENSWVBU
T19BRVMKIAlzZWxlY3QgQ1JZUFRPX0xJQl9ERVMKIAlzZWxlY3QgS0VZUworCXNlbGVjdCBETlNf
UkVTT0xWRVIKIAloZWxwCiAJICBUaGlzIGlzIHRoZSBjbGllbnQgVkZTIG1vZHVsZSBmb3IgdGhl
IFNNQjMgZmFtaWx5IG9mIE5BUyBwcm90b2NvbHMsCiAJICAoaW5jbHVkaW5nIHN1cHBvcnQgZm9y
IHRoZSBtb3N0IHJlY2VudCwgbW9zdCBzZWN1cmUgZGlhbGVjdCBTTUIzLjEuMSkKQEAgLTExMiw3
ICsxMTMsNiBAQCBjb25maWcgQ0lGU19XRUFLX1BXX0hBU0gKIGNvbmZpZyBDSUZTX1VQQ0FMTAog
CWJvb2wgIktlcmJlcm9zL1NQTkVHTyBhZHZhbmNlZCBzZXNzaW9uIHNldHVwIgogCWRlcGVuZHMg
b24gQ0lGUwotCXNlbGVjdCBETlNfUkVTT0xWRVIKIAloZWxwCiAJICBFbmFibGVzIGFuIHVwY2Fs
bCBtZWNoYW5pc20gZm9yIENJRlMgd2hpY2ggYWNjZXNzZXMgdXNlcnNwYWNlIGhlbHBlcgogCSAg
dXRpbGl0aWVzIHRvIHByb3ZpZGUgU1BORUdPIHBhY2thZ2VkIChSRkMgNDE3OCkgS2VyYmVyb3Mg
dGlja2V0cwpAQCAtMTc5LDcgKzE3OSw2IEBAIGNvbmZpZyBDSUZTX0RFQlVHX0RVTVBfS0VZUwog
Y29uZmlnIENJRlNfREZTX1VQQ0FMTAogCWJvb2wgIkRGUyBmZWF0dXJlIHN1cHBvcnQiCiAJZGVw
ZW5kcyBvbiBDSUZTCi0Jc2VsZWN0IEROU19SRVNPTFZFUgogCWhlbHAKIAkgIERpc3RyaWJ1dGVk
IEZpbGUgU3lzdGVtIChERlMpIHN1cHBvcnQgaXMgdXNlZCB0byBhY2Nlc3Mgc2hhcmVzCiAJICB0
cmFuc3BhcmVudGx5IGluIGFuIGVudGVycHJpc2UgbmFtZSBzcGFjZSwgZXZlbiBpZiB0aGUgc2hh
cmUKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvTWFrZWZpbGUgYi9mcy9jaWZzL01ha2VmaWxlCmluZGV4
IDUyMTNiMjA4NDNiNS4uM2VlM2I3ZGU0ZGVkIDEwMDY0NAotLS0gYS9mcy9jaWZzL01ha2VmaWxl
CisrKyBiL2ZzL2NpZnMvTWFrZWZpbGUKQEAgLTEwLDEzICsxMCwxNCBAQCBjaWZzLXkgOj0gdHJh
Y2UubyBjaWZzZnMubyBjaWZzc21iLm8gY2lmc19kZWJ1Zy5vIGNvbm5lY3QubyBkaXIubyBmaWxl
Lm8gXAogCSAgY2lmc191bmljb2RlLm8gbnRlcnIubyBjaWZzZW5jcnlwdC5vIFwKIAkgIHJlYWRk
aXIubyBpb2N0bC5vIHNlc3MubyBleHBvcnQubyBzbWIxb3BzLm8gdW5jLm8gd2ludWNhc2UubyBc
CiAJICBzbWIyb3BzLm8gc21iMm1hcGVycm9yLm8gc21iMnRyYW5zcG9ydC5vIFwKLQkgIHNtYjJt
aXNjLm8gc21iMnBkdS5vIHNtYjJpbm9kZS5vIHNtYjJmaWxlLm8gY2lmc2FjbC5vIGZzX2NvbnRl
eHQubworCSAgc21iMm1pc2MubyBzbWIycGR1Lm8gc21iMmlub2RlLm8gc21iMmZpbGUubyBjaWZz
YWNsLm8gZnNfY29udGV4dC5vIFwKKwkgIGRuc19yZXNvbHZlLm8KIAogY2lmcy0kKENPTkZJR19D
SUZTX1hBVFRSKSArPSB4YXR0ci5vCiAKIGNpZnMtJChDT05GSUdfQ0lGU19VUENBTEwpICs9IGNp
ZnNfc3BuZWdvLm8KIAotY2lmcy0kKENPTkZJR19DSUZTX0RGU19VUENBTEwpICs9IGRuc19yZXNv
bHZlLm8gY2lmc19kZnNfcmVmLm8gZGZzX2NhY2hlLm8KK2NpZnMtJChDT05GSUdfQ0lGU19ERlNf
VVBDQUxMKSArPSBjaWZzX2Rmc19yZWYubyBkZnNfY2FjaGUubwogCiBjaWZzLSQoQ09ORklHX0NJ
RlNfU1dOX1VQQ0FMTCkgKz0gbmV0bGluay5vIGNpZnNfc3duLm8KIApkaWZmIC0tZ2l0IGEvZnMv
Y2lmcy9jb25uZWN0LmMgYi9mcy9jaWZzL2Nvbm5lY3QuYwppbmRleCBlZWM4YTIwNTJkYTIuLjI0
NjY4ZWIwMDZjNiAxMDA2NDQKLS0tIGEvZnMvY2lmcy9jb25uZWN0LmMKKysrIGIvZnMvY2lmcy9j
b25uZWN0LmMKQEAgLTg3LDcgKzg3LDYgQEAgc3RhdGljIHZvaWQgY2lmc19wcnVuZV90bGlua3Mo
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTsKICAqCiAgKiBUaGlzIHNob3VsZCBiZSBjYWxsZWQg
d2l0aCBzZXJ2ZXItPnNydl9tdXRleCBoZWxkLgogICovCi0jaWZkZWYgQ09ORklHX0NJRlNfREZT
X1VQQ0FMTAogc3RhdGljIGludCByZWNvbm5fc2V0X2lwYWRkcl9mcm9tX2hvc3RuYW1lKHN0cnVj
dCBUQ1BfU2VydmVyX0luZm8gKnNlcnZlcikKIHsKIAlpbnQgcmM7CkBAIC0xMjQsNiArMTIzLDcg
QEAgc3RhdGljIGludCByZWNvbm5fc2V0X2lwYWRkcl9mcm9tX2hvc3RuYW1lKHN0cnVjdCBUQ1Bf
U2VydmVyX0luZm8gKnNlcnZlcikKIAlyZXR1cm4gIXJjID8gLTEgOiAwOwogfQogCisjaWZkZWYg
Q09ORklHX0NJRlNfREZTX1VQQ0FMTAogLyogVGhlc2UgZnVuY3Rpb25zIG11c3QgYmUgY2FsbGVk
IHdpdGggc2VydmVyLT5zcnZfbXV0ZXggaGVsZCAqLwogc3RhdGljIHZvaWQgcmVjb25uX3NldF9u
ZXh0X2Rmc190YXJnZXQoc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2VydmVyLAogCQkJCSAgICAg
ICBzdHJ1Y3QgY2lmc19zYl9pbmZvICpjaWZzX3NiLApAQCAtMzIxLDE0ICszMjEsMjkgQEAgY2lm
c19yZWNvbm5lY3Qoc3RydWN0IFRDUF9TZXJ2ZXJfSW5mbyAqc2VydmVyKQogI2VuZGlmCiAKICNp
ZmRlZiBDT05GSUdfQ0lGU19ERlNfVVBDQUxMCisJCWlmIChjaWZzX3NiICYmIGNpZnNfc2ItPm9y
aWdpbl9mdWxscGF0aCkKIAkJCS8qCiAJCQkgKiBTZXQgdXAgbmV4dCBERlMgdGFyZ2V0IHNlcnZl
ciAoaWYgYW55KSBmb3IgcmVjb25uZWN0LiBJZiBERlMKIAkJCSAqIGZlYXR1cmUgaXMgZGlzYWJs
ZWQsIHRoZW4gd2Ugd2lsbCByZXRyeSBsYXN0IHNlcnZlciB3ZQogCQkJICogY29ubmVjdGVkIHRv
IGJlZm9yZS4KIAkJCSAqLwogCQkJcmVjb25uX3NldF9uZXh0X2Rmc190YXJnZXQoc2VydmVyLCBj
aWZzX3NiLCAmdGd0X2xpc3QsICZ0Z3RfaXQpOworCQllbHNlIHsKKyNlbmRpZgorCQkJLyoKKwkJ
CSAqIFJlc29sdmUgdGhlIGhvc3RuYW1lIGFnYWluIHRvIG1ha2Ugc3VyZSB0aGF0IElQIGFkZHJl
c3MgaXMgdXAtdG8tZGF0ZS4KKwkJCSAqLworCQkJcmMgPSByZWNvbm5fc2V0X2lwYWRkcl9mcm9t
X2hvc3RuYW1lKHNlcnZlcik7CisJCQlpZiAocmMpIHsKKwkJCQljaWZzX2RiZyhGWUksICIlczog
ZmFpbGVkIHRvIHJlc29sdmUgaG9zdG5hbWU6ICVkXG4iLAorCQkJCQkJX19mdW5jX18sIHJjKTsK
KwkJCX0KKworI2lmZGVmIENPTkZJR19DSUZTX0RGU19VUENBTEwKKwkJfQogI2VuZGlmCiAKKwog
I2lmZGVmIENPTkZJR19DSUZTX1NXTl9VUENBTEwKIAkJfQogI2VuZGlmCg==

--_002_PSAP153MB0422295B47CE0D299103585C94739PSAP153MB0422APCP_--
