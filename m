Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6720F3103F4
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 05:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhBED7s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 22:59:48 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65217 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhBED7r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Feb 2021 22:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612498034; x=1644034034;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=Bb1aOs5OTPBbH31uOdz2R6Xk1gYI0etXRAUoj/buXRE=;
  b=V+DJ0knYu9WIcq9UdZ4BmQZ7XGTBTUAPYvkgXqlDfsRJ1LRB6h7LOQEU
   dWQ1T0Ttww3pgRGkZykGEFmKt1uGUWfIuoDZv7kftM4l4SOfBo5zN/d+Z
   sJr1SvSrdGQUAUmZUt7bEwPY3lF6CuKzHTH+JqD5DS1PCUi7/Br+W9YLX
   HIGoiHZ9y0Zxb9Y/TlCLS2l5vltEwvo1HJy2yrSjQjiAboMxsQR8q/RxO
   TMTaiPuxFpWZWmTZa10IAyXSwM8tLrkHgOCLFR1pFvTmZaOMsDgo4S15I
   Z8qedFFS1+H5uZfZtGdnSKzdc5JhFYXH9GO/UdiBCmnAVSxoraRwyzC9s
   Q==;
IronPort-SDR: G+tNhZ6y/xTOjmXadDx4UWbIXTXXPImYdGm88AYXkoPYYDDDYh7LU3/HSixJaSYU3vsLEYTCIS
 VI0y4rINV5RJAhZ4aVEvpyg+/S0MFL+jbPF4nXzaT5zDCPeh1OW4Gu94hk/vunyE67+w4bPhZg
 12JklKKtE0Fd4/KAj4C5aL8Gdt8kamx4r0Cl/R0FfC5uYAeOTPyILFOtFkKn9vA95jebagUW3g
 FnFGSTvxv7lWPd21kDn4kXkfWCml1l437ibY5maYRDbRfnNACBjD4hcI9otw62GExdP/RXIuvh
 puQ=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="263301277"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
  by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 12:05:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qiw91hheWe2tdzWPrxXP1TwO+v+BuP1xagG9hqBa79ssJr+pyHeBtkUO9jVrzwrvz/QSh0rpdiVgB0Dhajhh+GtwTaVGjnCbc3YWiamPzBumCKmvwrPbuQLC61Msex2advsWvMDP2LcGOx2X7YEkEb0/2ywBncUKMRG8NgbP50SuW1KrU/Ztb3grTZNGRPsFN4Mg5UEJCZmDtMKXLAAXh1Jl+FKXfu5eVB/hlrMVVb2olDbdyaArkVVMQgAZYt3tnSVPsIwc08ZPT8dVK8ooDI2wSFPEkALLbTb+ZV0hrcqdvrKQQa8lUEoK3J+9p+Hhzs1CB90UpvbqATpr+Up70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb1aOs5OTPBbH31uOdz2R6Xk1gYI0etXRAUoj/buXRE=;
 b=lfQqCP2uitudbG6KrfRd5YOa6cUWsCk6d2OaDvtUa3dxguGen+lOHnmEWCXvh3pT2XaRnlIzMxzGCD1njhosWxvXZZBZR1K5kPusdnQgl05zEBVP+8vfqRCdoaW0Oyym/G2lFBly9BPWHlx49IUSfFtnqQNLD8ROydBJMqVQP/rfIstqiPLpvnMEHVT6/JDU1U1mRLJR6gD8S9Ysgeb0hM0wpJFKDwXDyRgIrmm+PFUwHZ3mSEqlYuR4Ur2vIVESG5CyRUF/dNTgJF4FYMNGihpwLICGw5cBrr/Sx2QFLB2yODsu2HCA/BBl3cejH+Tm5zWpwK6jupoqCk4oPLADkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb1aOs5OTPBbH31uOdz2R6Xk1gYI0etXRAUoj/buXRE=;
 b=jSiH3SELs9Qs6z3lGWTME7wv8h6prxaZTItQ2LvcfHkKSAV79PnDP2ZEnn9lHlcZU7WxiaTCUla126tuZoduls1KjPK2X7ZWaKRxLtsAvyj8QiZaDUufUfgH4rN5pQSqYOeidL1l0dIaCk67HLxEJSomvqw1QcFfDLuvdhalUaY=
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM6PR04MB4619.namprd04.prod.outlook.com (2603:10b6:5:2a::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17; Fri, 5 Feb 2021 03:58:37 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::9a1:f2ba:2679:8188]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::9a1:f2ba:2679:8188%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 03:58:37 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     John Hubbard <jhubbard@nvidia.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Brian Foster <bfoster@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        "Darrick J . Wong" <djwong@kernel.org>,
        Allison Henderson <allison.henderson@oracle.com>
Subject: Re: [PATCH] xfs: fix unused variable build warning in xfs_log.c
Thread-Topic: [PATCH] xfs: fix unused variable build warning in xfs_log.c
Thread-Index: AQHW+23kQsA7cCSeiEqJ4AXiSFMA2Q==
Date:   Fri, 5 Feb 2021 03:58:37 +0000
Message-ID: <DM6PR04MB49720F81D97DD7C51AA9B21786B29@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210205031814.414649-1-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 489a90a8-cbd1-4971-b108-08d8c98a5145
x-ms-traffictypediagnostic: DM6PR04MB4619:
x-microsoft-antispam-prvs: <DM6PR04MB4619728C55E83EFA5F7B1CBD86B29@DM6PR04MB4619.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wfVZgTpJLDVBOi622eTbNXLZuxzZf0rTnhmeXVC/xd3wetGOi8O0ICC9xpLIbu10LkVNljbLRTqTfdbmVO46PEjxsI30OU5VZklLWJ5zeTCXdIljy2iosSFHHEmeSFapYJ1lmGb0NoiZb/+ucXloUMD/PCYR0f8nRgJJFqnXUzAvpgNCEuXLDqBeIcBw6eVmj7bwNCA+ghcIDWxkcNXDlNj3Hr2/0kaw5qS16a00A+uLHFyc0JWCxud1agG0vslw8cLtpOBhedgprt6B2294Y8kzvUvX+THJFelZcrTc3jx7IQG6gG1+QkC8SP80uSsro757k0OPGN+2V/0kx5nnp+Dk/G54Wkg4g57xRTr/89uEHnnH0Y/Y4LVxpur4V2/EfDfUo8eA3mdKFpGCxLgsdizrZMinsrYO+Xo0d8nnkYKc8MbAFr5+5uitr3nSbdtA2eS7787E1YAetCRGbzOhNywE/W9CAOh8JCQr4kk1JAxSrhPxquimLaQ1e9X3khGM/jUeyPwPZJKe8HAXAvIpEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB4972.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(186003)(110136005)(86362001)(54906003)(52536014)(64756008)(91956017)(7696005)(2906002)(66946007)(8676002)(76116006)(5660300002)(33656002)(53546011)(6506007)(478600001)(83380400001)(9686003)(316002)(4744005)(66556008)(26005)(71200400001)(66476007)(55016002)(4326008)(66446008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Wxt2gOS787dpeygQbR51+gTmu5MZAqVpxi5XZUrdWJUrCvL5scxDMnmkjAmZ?=
 =?us-ascii?Q?AbJa1RKKT5YsWQLYJtr07X89d5QHP6XJrNMKnQMCf9pEsYqO9YVRcbYe8bHk?=
 =?us-ascii?Q?qh1KvsyqYESCFsykOIjGaO1mjMYiUdyZm6cSB4aNlsGUbXB1sn0jqYZr7s35?=
 =?us-ascii?Q?1Pf6twCNOg9LnBJImmTj1fkTAwlo1gFKbSZVl959QLL1E0+k6yCWPGrMayFr?=
 =?us-ascii?Q?v4IxR2D/K9iEJhpIce+TKMmbV2VIdopBkbv6scVo5jAKVpLWNcTOpthx1+/x?=
 =?us-ascii?Q?ODRCcSQXTwR7I6uvt3FAzXmODJVvrJ1laG61AZy1MBbVNy5ZGWzpwhzpyiNB?=
 =?us-ascii?Q?JH4q22XuOWjFBq7rXVse3pPguEBulHgT+vCzxZgw4ZT/rLZURQnB4p/V0zb5?=
 =?us-ascii?Q?bfk8dvRn7WJWX719t+/2V+5zXC80HWR8DjaSuF3eAf5eJcK3bliyq3xTPrHU?=
 =?us-ascii?Q?0RTlH/fJsZka7rIeJEF89xByHZpTQIreJrZ5TdGeHUlnHi14AaPfD3NTpAxp?=
 =?us-ascii?Q?lQaJYBwokJ3V1OuD8vGQTa3fGb81uqE8/u5gl2xkuSo7kcznCCSKThsMrBdq?=
 =?us-ascii?Q?wESlB5IwtUGSr1NY5jzrJrnuheV6945iu7WmwFRbIaImnxoi9aPI4QmUAThY?=
 =?us-ascii?Q?65Y2P3n81LRQiShHyHBipIWyUyUtr9/Pw1K9KfwVTCmZfc1UCUt8g6NxvEha?=
 =?us-ascii?Q?I/cFezd5oyeU3s+CIjyk+jGHb8N7c1QcS3BtRMzPijuiqL35cv5j47seQ9C9?=
 =?us-ascii?Q?I2YGSGZmdWNVZVoRS1R8+2p8anZf2L2oKIgdBIlsr6AluQHmjR7WH1DImX3f?=
 =?us-ascii?Q?ppe88xDh2fmAZAduHTXDHoSotYtyYXl0baMgyfg7VQ93bm2pj1qIvLC4CsfK?=
 =?us-ascii?Q?FHi6TXEujMGuGPlB3A2wJv0TsfZq0RvILaNSlnT8nBAuBRQV87NMMtN5TreA?=
 =?us-ascii?Q?NbDrMXT55iZLt4iEqqJ2b/yJl0UQDKnX7Ebega3e0XTuz7I044/2dP7P8Efe?=
 =?us-ascii?Q?Ou43ykdArrsgOScmdZMXUMTsnSeFCvkcUiAMy04voLM6QqmIdGnaK+oELz5v?=
 =?us-ascii?Q?WgCubzS/gEwAwkjzwUmmmXB9XHDzZc16G+VUM8Sa2Ak1Nq4GXFXGcIcrrSDx?=
 =?us-ascii?Q?Mn4KpVeZQm7aDslbE0qUDM1l0YIVO/r4cY2PTqvbnX5BEuMUEpof3h2XdzyQ?=
 =?us-ascii?Q?9C0SuGx/xUJj0HSoj8eivKqsvDg/dmiv3CL7vGU2RRFRJHoljdKL2SNESto3?=
 =?us-ascii?Q?lDDguVqqK/TTUsnKwf53Wsjmc3CmuksNIdjkZgLOJXjT7FDhnp8Cnn3AdNgl?=
 =?us-ascii?Q?ZCCF2KNEGQwOOqLgkEI3/WKk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489a90a8-cbd1-4971-b108-08d8c98a5145
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 03:58:37.8007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LU+KxZ2hoYEutT3U5JFXalmd2yH3ca190wk7efowZHHdhRvc196gFgcyXAe0n+MznKPN68l9ODW2fPd5PRcfRADWn8QFbfjUUZgY8htg/Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4619
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/4/21 19:20, John Hubbard wrote:=0A=
> Delete the unused "log" variable in xfs_log_cover().=0A=
>=0A=
> Fixes: 303591a0a9473 ("xfs: cover the log during log quiesce")=0A=
> Cc: Brian Foster <bfoster@redhat.com>=0A=
> Cc: Christoph Hellwig <hch@lst.de>=0A=
> Cc: Darrick J. Wong <djwong@kernel.org>=0A=
> Cc: Allison Henderson <allison.henderson@oracle.com>=0A=
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
