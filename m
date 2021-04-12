Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FBA35D015
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 20:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238145AbhDLSOH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 14:14:07 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26929 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239584AbhDLSOG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Apr 2021 14:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1618251227; x=1649787227;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=DY1ysdVfFER54juyjkyiIzZqSbdFMo/zh6O0cx+z8ss=;
  b=YGOnr+PAuD6nvdIvtRpXEdxLw3RZPGcPfTz3/2ggnkhvWcwaFLUXuqbF
   w98BA/hm1Wz+rKPd7aEUD0FGpvYSXgqQmmZO1JoV++ywQwluUwD4rvwxu
   OS+XT0jGFhpYfsTulZWdkSeX6SjQfxWD51BrUKSc92J6jXKmzajaLWSIi
   NOAsAEfIXPtaKVIyAKh2QyFTrCx/02FK1aioWh3LdjlfqRFRGWzI+0TBx
   egeFOp7uQ4hDzxtjIvFRMpLXUdRg+4Lq+6MM+DA5Pgq3sCmlkQ16Jdh4c
   9neZIV2GAUpCf+/Dj+X0UAD6MWZTeo9Sg9dHPLyBtyvY1UaFsHivMOnVd
   A==;
IronPort-SDR: 21gVZJR/C8DezWCjZbwag/68VBkodSZSXJcubl+mdRl6O3s7yv9wKXuvtD4OlVN5H6fx9JMRVK
 TFINZL9y/943ey3F7o4IZmqetLHN4nDIFBStXq8t0Eekho2p2xohc6uPsBdWIMmeCwi9HGhxzl
 sRP5edvgWWDhwTddmb8zNTOI412qGaLJ4/Lqm9+nissJ2TW9zEF2qxKrCcpM9UFye7Mnd7T7Tt
 b/pPljIczSUR0edaDp4TAfHcRUAGfKs3JXYEqGqrqSIvLpE477oi/Fk33S411BsU3PvoKgPyDY
 eV4=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; 
   d="scan'208";a="275418322"
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
  by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 02:13:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsjGlAMJ4tCFZQwZlOEdh3HMjXIydVdAkowFHKes8tSCZTA147NTuaBodxqc0Ur6E+wGkP4yuz36pFyB3hXtYK+vYqQHGkfHCvdXdtyUmaOTpbKxAy8ak+dOySFgehsVilGiRx/l4a+vOCneflTLOT7eP8SR730XWj1yOFscO2YMZvHnt9Qu1Z3dAgYPsM6zXzPlFhL0GuVGvoll7laHrYvHhkB3jWVI/VxOIdCioU751x4+sy6UEUR9V2JFNTjIt3Qe0RE1y5xMyQ3KwF0JrzWB1G7HTr8YxjP7bmVE8JDik4M9Tgu35+Fo9NE1/4/Mjl/WTvNmC+NY9jMhMBCSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vDsQqul2moPCC9H9G9PirZDPLJVMbBQbMBVRNUfsDU=;
 b=H5K0W55RH2T5aEu/iYlWThSUV0ryYxUVfonaluEQ0BedEvsa72p2nvvuPjz93L/d6cKjankBui4f6Hrj+u7FGhRg6KVDEphIdLnbiajNJUaf6hi3mxhbHpaehwPDW0ATMTCT2mfxae8MOqKvgA/rN9R+5jEZI8zC+8cPR7//uCY+Rnp+4VpNTe7CjtBaR3le0R50SrJJ0PPXhKtqonI74eamKCGqa2vS9FDwx0G54kA1CPxlvuWaD6wGNgMaV5KPZI160iGF3ywHZqKbSEgirL7dqYiRghINJ9mO12PWIiTcZ6+F8eME6rVDd+A/b21rjNKZb0mHbUkndocuqriHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vDsQqul2moPCC9H9G9PirZDPLJVMbBQbMBVRNUfsDU=;
 b=JT8r9oIq9lt4q5KufFAXJYyVVYXqR8PtWo+kc9x+pO7+1vC1NQpfFO4vDm0XWdESrzkUEWNRz/7XTYYUEXOu3TMltv2UE2m+f7XWE7lL9u1ghKenPDLjAE17UxDxUDtQWuDfAokRCsRBR23Ez7wvxCeX03K7ZBMO9OHcPav2uWA=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB3782.namprd04.prod.outlook.com (2603:10b6:a02:ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 18:13:45 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::c897:a1f8:197a:706b]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::c897:a1f8:197a:706b%5]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 18:13:44 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
CC:     "hch@lst.de" <hch@lst.de>,
        Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
        "hare@suse.de" <hare@suse.de>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        "naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] gdrom: fix compilation error
Thread-Topic: [PATCH] gdrom: fix compilation error
Thread-Index: AQHXLyQhhz+woxn5uUe7+SfZ3oKY1w==
Date:   Mon, 12 Apr 2021 18:13:44 +0000
Message-ID: <BYAPR04MB4965E1BB67DFE1745D5CB50186709@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210411224330.4983-1-chaitanya.kulkarni@wdc.com>
 <0880e158-516f-9d87-ff8c-3835da10d92b@acm.org>
 <69c6b2b5-4f13-3f9a-4187-2bb4b721b3df@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30933102-e958-47f6-4507-08d8fddeb5e4
x-ms-traffictypediagnostic: BYAPR04MB3782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB3782B219BCEA3045081E6FB086709@BYAPR04MB3782.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: szmHXDtE+HUMBdYeNiuvHoty+Qi1PFwU6asusY1jijsoV6twGOw3VHPIf6C1PubhDqBko1u1f6HcFm2rK2Jt/rCp/3A+WIqF/mrklDKCx6hwvUw3Tjnnt9iI9qiJbt0amuWLAEFKPxEZtWCAYroUgkDsqQcq08tVoFSZ9xhJF2NQM80/XjYuC9ibKhXjD7lNzdAF+dl6kBSPrPA+dSkDkF1lyGMxyB6csczSdVih1jn3YyUfErciwtOdyfRNLPR3rkC7s6hCz4I8oe4dEWazbyFjhA8Px5I5RGxo89v6p5ImW2zdk4h0assEa5cVJy8/8u6yOBnLtyyfT2TQMxLbdonEyZUEqC5U+UCDyRlLsSW7zmJY/kSPkab1fy0b+ftOusDLhHgOE0YDNzfIiBoJcgRon+EE0Hg5phlM9Stlr+8WQmZQHdNG2WMGrlGbIzRqhrhbpuT+ZlUrU8X3Wet96i/S/dqg3lTlBqXHkN/23qX7FE04YplIsHQh1TOzfGCvP3hFnUwrOjLxVvpwKwFgu8vbMnxHEg+wDiE5APfWBkS97z7Vuzefv08IOomqArTwTPvCvpZupajUX+OaqRIl2jzyp8Kg1FXgFZwKd+joEqY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(478600001)(110136005)(186003)(66556008)(4326008)(5660300002)(38100700002)(9686003)(316002)(6506007)(55016002)(53546011)(66476007)(52536014)(7696005)(2906002)(54906003)(26005)(64756008)(33656002)(8676002)(71200400001)(86362001)(558084003)(66446008)(8936002)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?T0PalHpD9boaivhReuNch9ciB2OIUwKZWeqhEixRhxmJdajS+g+ZFvnh9aUm?=
 =?us-ascii?Q?9Le4KcU15CPferL58rvEuygMLtA7mEQRRKnm/Mu/kIQ4Bp4mZE+XSvlSatpE?=
 =?us-ascii?Q?vKk9YPWlIZWwbVuQv99aJlrj4nlCa3Pyw5aaWOl408L734YDSYKNcl70Qdjd?=
 =?us-ascii?Q?6IRjQXhrG8H49w0GQmL0/o02SW9MFk4XDzeeZkUM+zH4dTdPRUJP7hYrxq9+?=
 =?us-ascii?Q?e824imvsSJLCC7SroVmFfY9EVjR2vkgLbQ8ifKFnCEeWbuZNcQJ2sDLg9reJ?=
 =?us-ascii?Q?Krzl0zmCWUl1HMxoVfGOAYwy9cbHdaDgbAihAzPQczF74tjTnodFdxfe9w9f?=
 =?us-ascii?Q?zi1ceQdlo1mgOQ9ZEKVOiCluRC05RZ0YebLq88prkVN3bK5df87ZsA1W4Q4z?=
 =?us-ascii?Q?RoR9j0kIRszG0gHHGR8SR3k7ELZAdH1aHr9/2wU4LCY/rm/GPug8cgU7hnUA?=
 =?us-ascii?Q?6d6TYD+Z3WfkhIHYYE8Z8FfnfOcFVHBR+F9IyQRPLv/mn6a8oJ+yjqa7TlIp?=
 =?us-ascii?Q?GQLs/9YVStQbhVTS8Qz3dlVdifKvJo3KZNUnerpufBnBs1Q5Q0yshpK3JddP?=
 =?us-ascii?Q?1HGD1JGW+LyWPSBQPT9s5sb3go/uCHuCEmi+WpQTtiMeM1OzXDxBK7qf96KL?=
 =?us-ascii?Q?Om+3QPwUE6uXuRlnF0uQKOtEaPAablv80PVVitd+Do2caDVmeXFx7LrDYaV+?=
 =?us-ascii?Q?PwJnB5GNfAKsuJ0lvPN+G4KtVE9t76CKijtcsqJU9Js0ekO805r0cc2AbLQK?=
 =?us-ascii?Q?361rcXag79bXF1ubBm7gEVONILdMUr5PPnPKTZLrsKDZj5/S5UztMxAOAhfO?=
 =?us-ascii?Q?d3TGSSLGM5XZ7D3KKPD8r6a96jSuldhTNgPQyAhCdpfuDFhrKfDNAMf3PakJ?=
 =?us-ascii?Q?tBZBnPI1BjNWSk3hg3a++7lKiTrp7s3/Rm6AjHg74MsZstYvsVz3nhWpLnSX?=
 =?us-ascii?Q?nDRVux0SgvNy0Ayvq+svzHSqEKFGAKmrIDacqbqNJiG6R68oNtqJkJldiIN9?=
 =?us-ascii?Q?QYOUYDBRAaNUTLuAlVfhMEZz2s0SemvoGYhqhhspu87UN7ZW9vvqaU4Q/vy8?=
 =?us-ascii?Q?4+XSgK8ls1WdnDcA6a9mMa3EUu3VYrF/YrUiXJzRP16Ysn8G4j/HGYA3E/Mn?=
 =?us-ascii?Q?7yNaGLuBhSSZ1ViNKQiFRNfpliU4wrrk9XqLbKbMvb6x1yJil6lJR1oCgHlK?=
 =?us-ascii?Q?+D0GDAVguLajrnu0fLdYvjR/G60Mk0eLUfO4vnOpaIZgn+41EX7Ka8UWx5sU?=
 =?us-ascii?Q?+61mh0BYA3VnBWhFJ7VysromMtWgBQsNaCmGgxsVB1U/nZgd/cDeSZCn2W17?=
 =?us-ascii?Q?D4ajCfAH30mH+BPwEz/NX3cM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30933102-e958-47f6-4507-08d8fddeb5e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 18:13:44.7219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZhE4nLzNHk9KWArr1UmmUlJwFxGV2vZ/Ta0gxj1QlS1Zl1pp6oXryNaYEbFrqjMlLc1kXxS7hj1gkItJ5XE00SybOwbe9c6WZmhwtdXHgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3782
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/11/21 18:33, Jens Axboe wrote:=0A=
>>>   586 |  __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq-=
>bio),=0A=
>>>       |                                                             ^~=
=0A=
>> How about adding a Fixes: tag?=0A=
> Indeed, that's definitely missing. I've added it and applied it.=0A=
>=0A=
> -- =0A=
=0A=
Sorry about that, thanks for fixing it.=0A=
=0A=
=0A=
