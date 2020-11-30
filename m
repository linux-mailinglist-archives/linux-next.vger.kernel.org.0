Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF462C9063
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 22:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388242AbgK3V5z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 16:57:55 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:21814 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387576AbgK3V5z (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 16:57:55 -0500
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AULidpb016239;
        Mon, 30 Nov 2020 21:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=X98vnGwQ73W6kOPHQredh6+uiECp6jCYGquDD+Ho/14=;
 b=f47Mat3c0fgz7ink4vRptPgWQlLT/PfF4lW6FMBo2EDBf56NDa/wYd6ImdmogoewommX
 ItSp43gRoJqAeLKlkcpi5xcpV9UjckhylEsQEclH59WuLHWtKzvoAs5cwxMqjPG0RHl5
 748qhFs2r1ChTp/KpVdJKUWzCWjFZZl6DyqXAG32BLBx4aZAPLNADAsY1agweidoWHc+
 vJurtEHX0ak0lzBu7TAq4HWvb9ceFM9bf1G5W7R1DDtFPFa2Lm/FMtt6IIi/yg/zkTmJ
 /UuZpxEdfEpz+rVt5kA5LTvG3LmiXw7XcFSVYL1rRqvkmDwvmIwV1/dq7VaKhYelWKH5 hQ== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com [15.241.140.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 353c2eamd5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Nov 2020 21:56:52 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com [16.193.72.61])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by g4t3427.houston.hpe.com (Postfix) with ESMTPS id 5FC6471;
        Mon, 30 Nov 2020 21:56:51 +0000 (UTC)
Received: from G4W9335.americas.hpqcorp.net (16.208.33.85) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 30 Nov 2020 21:56:31 +0000
Received: from G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) by
 G4W9335.americas.hpqcorp.net (2002:10d0:2155::10d0:2155) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 30 Nov 2020 21:56:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.241.52.10) by
 G9W9210.americas.hpqcorp.net (16.220.66.155) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 30 Nov 2020 21:56:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlYl2PTCB5mLPq3wefXv7j/T6chXxzm5mk1Mx9foH1W12Z0h/rIh1RnZ97aD2c6x4/XkUa6dmlqyANyQLRnx1H64k9eEd5ZmKslbgx9HTkh97WUXmUBedLfo24lpJCZBU3n2jSB321FpXwYRn3xNG1nbNhUG5luhkFCNRvliisWppnXLYvo2U3SmWxr6WMRcU8zTb28XBISqczEAIYw3YcJVdHZGtX0LdQiIwrV1bgDPeQLbMiFJr+JzNY7SPYvTPGvaWc1RWzTORYavgpnvNRskR5Ww6ELbZcZ/QjsChzOdX0KYKgsgZ2271U/LTfPobiCRwoL+PLjzhWNhbK2lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X98vnGwQ73W6kOPHQredh6+uiECp6jCYGquDD+Ho/14=;
 b=P39+ZGzJGBM7wcc9XbNVe4KSZRxJLZSOdgi/ovgAAouCcH6wTEPemB3nghNPceuHYLjxAdODnB/OKebws4N9jf9pVEFLYNIdUMRQBjpH3OpbNUDqlEC4Q322vyAXZe9Xgs+dLyI0dBWOdSdROHqIUn/wxs1c7vN8aKBsWFRraikssyFFYxz5GvAiNRFGy9SQ2UqlSP2lp41NokcNgc5h3IrK6emJ1Q5cVMZfGQO9MWHK1gusnGdIT2xYZUafL7IhNqfTkxs1AR+r0UMGMZstBLKT9INEWBazSOhThzW0w4NgCsldwEP95rMUdw9vWvoAymGzREyHyYHV5AQ5zUk0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742b::18) by AT5PR8401MB0884.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7428::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 21:56:27 +0000
Received: from AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::715b:815e:72d8:d802]) by AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::715b:815e:72d8:d802%12]) with mapi id 15.20.3611.023; Mon, 30 Nov
 2020 21:56:27 +0000
From:   "Ernst, Justin" <justin.ernst@hpe.com>
To:     Borislav Petkov <bp@suse.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Travis, Mike" <mike.travis@hpe.com>
Subject: RE: linux-next: build warnings after merge of the tip tree
Thread-Topic: linux-next: build warnings after merge of the tip tree
Thread-Index: AQHWxucqR39swjzg7k6h3mJDbWAGPKngdjqAgADAV9A=
Date:   Mon, 30 Nov 2020 21:56:27 +0000
Message-ID: <AT5PR8401MB1300D1F5019C5C489BB20E9887F50@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
References: <20201130180503.5c173e05@canb.auug.org.au>
 <20201130101733.GA6586@zn.tnic>
In-Reply-To: <20201130101733.GA6586@zn.tnic>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.61.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 03b55c5b-f662-46f2-7052-08d8957ac97e
x-ms-traffictypediagnostic: AT5PR8401MB0884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AT5PR8401MB0884D55E4B0AC9457B960F6F87F50@AT5PR8401MB0884.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zu9j6zaJ0cJkVm+GgSbjPfqXboMUc7FtgrLMlSDnc6uDCwk+9WFoColNCaYr5aBvlVidnyJDgURTIvKhGLW2AU2c/dpji7M0psblllUFJ5VdpNJNeII3+1xV7HmUNbTmSXGCRa42byU2b5YXthfl4g+nI6kGoG6Z0SjzQ2TEkOIJA950VncEIwF7FyoOHjlD/ja4em9ML6jVds6JHIDyalo5YcOiHHjRecoupN7hTEM/aE45KfFOsmUOe4hK0wvH5lRCEjA8LWTZLLYPmnI/CgIC0ZvnkcMuxfzILUqptZgba1vDY2TiSvY4vid6rL2mBbfjfyG1po6CRvGRcD03Ae/tVJyT+MDLCWw/p7XYIxtiiO3zbuYYC2yui3KI2R0CuFCxctdjsJFKV6j6E5Cdrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(39860400002)(396003)(346002)(366004)(136003)(316002)(26005)(5660300002)(71200400001)(83380400001)(186003)(2906002)(52536014)(66946007)(33656002)(66446008)(86362001)(8676002)(110136005)(54906003)(66556008)(66476007)(64756008)(66574015)(4326008)(6506007)(966005)(8936002)(7696005)(478600001)(55236004)(55016002)(9686003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dXl4dVo1eVo3bys2N1RvN2JRbkUyRHRreVpWZ1pHcm9YdmtWSkRBUEFzSE1H?=
 =?utf-8?B?bzF6MGFQMk5QK2xaWWw2M290Uzgvc1RlZUpYd1I1ekZ4Vks3bTVuSnluZzB6?=
 =?utf-8?B?LzVoVTJCYzYxL0VKZGUvc0dqdEp0VitWVlE2b3g3aWVtaG0wZXhoSVlzUGd4?=
 =?utf-8?B?eGJVSWJnaGxNcFVsMnBtbWxEZEtzaG53azhuN2Y3R3gxRkJUdG9tM0JpUWFQ?=
 =?utf-8?B?R2JUSGgvamNTcXFnWmhYbCttRmplMnZ0MUpWUFIySTRFcFJ5TTJuT0doVVJl?=
 =?utf-8?B?amhSNlVLZEczNU5qSUQrb0ZjWHlTOCtmUDBMYWFPa051d2l3TmhCcEVteEg3?=
 =?utf-8?B?bWM5UEtQOXBuaDFhRU1OM25WbDJKVllRV3ZQNEk5ZjlCbmtUdUMvZU9yREFy?=
 =?utf-8?B?bnZvak42Q09sY29QekdmOHlodWNRMy9NV0RTdDJzei9Kb1NNeGNzRnRMRVRp?=
 =?utf-8?B?R0ZYUTIyZFlLa2o4eWx1MlhqUkd5bjF5MFNMUURXZ25rV3hicCtkRlAvYlpW?=
 =?utf-8?B?dktjKzBaMlZyNGQ2bWVZYVhUbVJYN0lzOHVSekZwTDczcXRFSHRGWUl3Wmc2?=
 =?utf-8?B?ejlsbktUSGFmZEtFSkJ3R0Q3U1FXcEJTbGNCZmZRTjdqOFBRSXdBTHg2QUtF?=
 =?utf-8?B?OXQ1aTF1b2UzYi9HZytaeE5VMmRJVEpHL254ZUp0aU5oMVBYblo1MERJazF1?=
 =?utf-8?B?T2JWZVp4UjgrOXFkWjlBbTNlclRiaTZqd2lDeStsTXd4SDg0NExaVFB1ZU1n?=
 =?utf-8?B?bEhjM0NtSEZQbWFhUmlkbjhic0NiZ1JpRVhQZ1AwSTEyTTJrNmZ3N1hUNlND?=
 =?utf-8?B?VjhEb01uNTlaOEFvTGdqeDYwQzdRS1QydWpQeUpMK2Z3TEpPSHhXL0MyRVJi?=
 =?utf-8?B?eU1XTjVkQWJGWFI0TVk4Z0RqQVprckUzUGFJS3hMakxZL0lSTExHRjhsbVBQ?=
 =?utf-8?B?OWhQb2l1aWYyYUdQM3BDb1J4V3ZPdmdSaFZmMHVoOE9jTjFROGpuWFRTODli?=
 =?utf-8?B?M2JHTEhzNVZkdTVmeE1JTXFoTXRYN3h5TkQ5dGtWVXJHeVpueDFITCthT0U4?=
 =?utf-8?B?R2paZVU4SHhRb2hrSFhGRGdvWTZwcTFNcStMWkRzSHA5QWl2R0dLTGI4cEN5?=
 =?utf-8?B?N0w4U2RwdGVKODhtdVlxYTZjU2ZlV0JFVm1kV0VWZHlUNk9nemo2RmpzU2xW?=
 =?utf-8?B?QnZiczFydHdMZTR3N01BTGlYa2FGSk9zMTRyTVRtMXAydEZVNkx4N2YxazZK?=
 =?utf-8?B?QUtEdEtBS3JLOVd3SXhhYlB3UGJpbjRBS2pqSkFlemdmSXRGeUJ2Y0NpUTFN?=
 =?utf-8?Q?tMxzS0dgmO+4c=3D?=
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b55c5b-f662-46f2-7052-08d8957ac97e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 21:56:27.1340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nQH7GeSCwn03GdnNIQ8solgxlbFOz0P5MyX/862ym9erR/tF50r+j1AWgcxWfjzw5EWkEW6rGIO6NJg8Yf2wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0884
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_11:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300136
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

PiBPbiBNb24sIE5vdiAzMCwgMjAyMCBhdCAwNjowNTowM1BNICsxMTAwLCBTdGVwaGVuIFJvdGh3
ZWxsIHdyb3RlOg0KPiA+IEhpIGFsbCwNCj4gPg0KPiA+IEFmdGVyIG1lcmdpbmcgdGhlIHRpcCB0
cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKGh0bWxkb2NzKSBwcm9kdWNlZA0KPiA+IHRo
ZXNlIHdhcm5pbmdzOg0KPiA+DQo+ID4gRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1m
aXJtd2FyZS1zZ2lfdXY6MjogV0FSTklORzogVW5leHBlY3RlZCBpbmRlbnRhdGlvbi4NCj4gPiBE
b2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZpcm13YXJlLXNnaV91djoyOiBXQVJOSU5H
OiBVbmV4cGVjdGVkIGluZGVudGF0aW9uLg0KPiA+IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcv
c3lzZnMtZmlybXdhcmUtc2dpX3V2OjI6IFdBUk5JTkc6IFVuZXhwZWN0ZWQgaW5kZW50YXRpb24u
DQo+ID4NCj4gPiBJbnRyb2R1Y2VkIGJ5IGNvbW1pdA0KPiA+DQo+ID4gICA3YWMyZjEwMTcxMTUg
KCJ4ODYvcGxhdGZvcm0vdXY6IFVwZGF0ZSBBQkkgZG9jdW1lbnRhdGlvbiBvZiAvc3lzL2Zpcm13
YXJlL3NnaV91di8iKQ0KPiANCj4gWWFoLCBJIGNhbiByZXByb2R1Y2UgYnV0IEkgaGF2ZSBubyBj
bHVlIHdoYXQgc3BoaW54IHdhbnRzIGZyb20gbWUuIExpbmUNCj4gMiBsb29rcyBvayB3aGljaCBj
b3VsZCBtZWFuIHRoYXQgdGhlIHdhcm5pbmcgbGluZSBpdCBwb2ludHMgdG8gaXMgYm9ndXMuDQo+
IA0KPiBKdXN0aW4sIHRoaXMgaXMgYWxsIHlvdXJzLiA6KQ0KDQpBZnRlciBzY3JhdGNoaW5nIG15
IGhlYWQgZm9yIGEgd2hpbGUsIEkgZm91bmQgdGhhdCB0aGUgaXNzdWUgd2FzIG1pc3NpbmcgZW1w
dHkgbGluZXMgYmVmb3JlIHRocmVlIGRpZmZlcmVudCBjb2RlLWJsb2NrIHNlY3Rpb25zLg0KVGhl
IGxpbmUgbnVtYmVyIGlzIGRlZmluaXRlbHkgYm9ndXMsIGJ1dCBJIHdhc24ndCBhYmxlIHRvIGRp
c2NvdmVyIHdoeS4NCg0KWW91IGNhbiBmaW5kIG15IHBhdGNoIGF0OiBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAyMC8xMS8zMC8xMTk2DQpUaGUgcGF0Y2ggZGVwZW5kcyBvbiB0aGUgdjIgcGF0Y2gg
c2V0IE1pa2UgVHJhdmlzIDxtaWtlLnRyYXZpc0BocGUuY29tPiBzdWJtaXR0ZWQsIHdoaWNoIGhh
c24ndCBtYWRlIGl0IHRvIHRpcCB5ZXQuDQoNClRoYW5rcywNCi1KdXN0aW4NCg0KPiANCj4gVGh4
Lg0KPiANCj4gLS0NCj4gUmVnYXJkcy9HcnVzcywNCj4gICAgIEJvcmlzLg0KPiANCj4gU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJILCBHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZw0K
