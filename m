Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56AB9AA429
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2019 15:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731660AbfIENRR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Sep 2019 09:17:17 -0400
Received: from mail-eopbgr740071.outbound.protection.outlook.com ([40.107.74.71]:43328
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730780AbfIENRR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Sep 2019 09:17:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa4j93z59d4xwwpS/Nj+CBM8uhHQvFUlFkqfd+FkwNCWDpmO2jzsqT30iQ+BXLprmZ9U4F7NaJKg5KwFa7TUMUD5vJGW9rz2OevpwkXiMrB+HAzX6uxwFFfQXNj1KTxO+WB3GRAwDkTsSOTVikcXpBgfwqI+k1ufPWn8gAt7PSU5ZfPlxnCYaQFLxoqHXJFj/3M2fAj5GVxhL6Xprh3m/GPxUVNpvYss46FR652UaDy2/QoJw6x5ljzgOJvWnN1aCfxVV4HFwCA2AZqBNgsUcumMBBFw9VAHKQ7VqrM5mwCBeEY8Yj4a/+GVKH//Oq1DQpdfjtUzJu75S3CcDwGSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVTmM3a0Z1LL3nxtcwTLTK+lmTNNgQZj8TQjhIg9/84=;
 b=hbyZrcCPApPEuzhVOBnSMTk+vzoMplc3TSuPCggREG4N+CWp7uUfsvZoT/sPSwiG2R3uWO/8hf5taLOzZpGoLLpLMdSvIua7Z1/97XIYZQDHroVT9UKCkYNskA4pBAaVbl8K4wjvqEtyazgE4La0ZpP0ifpjLMyt/ezI9ylQfbQwzFdnYUOYRkHzPvn7XkPSsNnhmhulnRz+0YnwUkX6VdIBTQ/gRrivinErNcJsBBQhx0CuYRpUk882POUGfbn1iT72aKotjM92fyRs3p9SOWiqdJVYdRycM6QlJUmpNDZXtjH8/9iPn3kxmWjItwjj+KXS4sY1/5yz1AV8IUMYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVTmM3a0Z1LL3nxtcwTLTK+lmTNNgQZj8TQjhIg9/84=;
 b=IU6LoCZV9XJmKxznDGS/0w0ta8hOpOIF1iB7VhbB8F5Z4pbqmObP8UK09UCv0SGr8lvILw8hDJGYVxW5Q9KahxAGSFny5PF37WgU3ewEUBTqfphz0+gP4tmedBVqymk0IgIfUCU9ubSxzaJu0wo+N0nbH3qflO6vXZXjstPBuHw=
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0232.namprd12.prod.outlook.com (10.174.52.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Thu, 5 Sep 2019 13:17:14 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 13:17:14 +0000
From:   Harry Wentland <hwentlan@amd.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Wentland, Harry" <Harry.Wentland@amd.com>,
        "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
Thread-Topic: linux-next: Tree for Sep 4 (amd/display/)
Thread-Index: AQHVY2OBXMezq3awGkCsLLALyRll+qcdEayA
Date:   Thu, 5 Sep 2019 13:17:14 +0000
Message-ID: <752f74d6-f6ff-6013-25ad-a8fdce934d17@amd.com>
References: <20190904233443.3f73c46b@canb.auug.org.au>
 <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
In-Reply-To: <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:925f:916c::2]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To CY4PR1201MB0230.namprd12.prod.outlook.com (2603:10b6:910:1e::7)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4b54925-03ea-4518-e384-08d732035dff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:CY4PR1201MB0232;
x-ms-traffictypediagnostic: CY4PR1201MB0232:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB02325ADDA607B3D789B7E8608CBB0@CY4PR1201MB0232.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(199004)(189003)(53754006)(486006)(6306002)(99286004)(446003)(14444005)(4326008)(6512007)(11346002)(478600001)(476003)(2616005)(14454004)(966005)(36756003)(25786009)(256004)(229853002)(53936002)(71190400001)(46003)(71200400001)(6246003)(6486002)(31686004)(52116002)(6436002)(65956001)(65806001)(31696002)(4744005)(5660300002)(6116002)(81156014)(81166006)(8676002)(186003)(58126008)(76176011)(66476007)(66556008)(66946007)(66446008)(64756008)(8936002)(7736002)(386003)(102836004)(6506007)(316002)(53546011)(2906002)(110136005)(305945005)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR1201MB0232;H:CY4PR1201MB0230.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vr8Qt0hj8MmbyEtAM4B1R+94qbhO5Vc5tHiBSSOXP4GCl7yQq7c8GCzkZa4PNLaIXkbdm09dEsIBiTkTbxd+8X0YOnTPG5vNDjI62J/xsS45+ykcuSji+BkJ3jOQSeC2HxADQT7t9tQtCKnWEgRcDr8G5ixSwQx/8qyftaPQW1Jfv85bdTdpnJ8bp7xSd8Z9o0kEbQESIiOs2wCUCP61hV+NVUINKMJ5U0RP7pNly+n1/u86NBkUztAm3FpL84LGNhpst67GGn08umoLbu9AyfWag3F4F+FMkBGbv2cGjIZzmDH/I1zl4erob7INkjBIeZjvFwcC5DiDstAvAxvj9CXhcEAfW7s4XICF+sdfd/Ege+cunh9QNEYKq08SJlCTMbM8XK1x+VFr4x6Ajqs0CG7t52CZnwJMq4WVG6U6ruI=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C2E148370D9A45438625E22C870190C8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b54925-03ea-4518-e384-08d732035dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 13:17:14.3764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJtQcbnVEA1TLmfwJ79NE01a6aKt2SvcWziquaCLUtj/o2nmYxsNadRt/1hkIkvSdSbIaR807HsbSg2R8rcr+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0232
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2019-09-04 4:58 p.m., Randy Dunlap wrote:
> On 9/4/19 6:34 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> News: this will be the last linux-next I will release until Sept 30.
>>
>> Changes since 20190903:
>>
>=20
> on x86_64:
>=20
> In file included from ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn=
20/display_rq_dlg_calc_20v2.c:77:0:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/../dml_inline_defs.=
h: In function =91dml_min=92:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/../dml_inline_defs.=
h:34:1: error: SSE register return with SSE disabled
>=20

Is that fixed by Stephen's fixup here?

https://lists.freedesktop.org/archives/dri-devel/2019-September/234292.html

Thanks,
Harry

>=20
