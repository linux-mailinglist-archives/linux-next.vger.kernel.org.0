Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CE931F281
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 23:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhBRWtl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 17:49:41 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:45250 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229535AbhBRWti (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Feb 2021 17:49:38 -0500
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11IMmWud008809;
        Thu, 18 Feb 2021 22:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=KAfkV50SSC0TZQ2DiPQn5fKwUFQkdCSWAYneWe/W+kc=;
 b=LFBCBd+PpZpKy7N/6nLfZ2mPeuj397wUxgmRhdDWXKoAheT+U1boepAgWqMFJbnvYK/n
 NjD3u1iX7EE7hpPxDMrW4FQugxaFvrv1dXPqOfuh5p08+akzk/pIfPVSwwcoJXlcz/Lj
 E1aocl/x7sZdD+J6aSuiQ1XzP+ZoPUzHYkbtBeQuancaoXWY42LvYI8WV4A/VYKav87c
 4di5e+ALndVP09Elwr6xU5oRUKcxRCGO8kAlkUsou/aJQr2m2q2CD+yaWPiDItjRJYuA
 Z/YZlO8xDMzDXX5Fo9kLC5SCH5EPVgj3ryOaEuy+8moKkRlERPZgddkNXbAPbfdWT0Gg pw== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com [15.241.140.73])
        by mx0a-002e3701.pphosted.com with ESMTP id 36shwxf4m0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Feb 2021 22:48:48 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com [16.193.72.61])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by g4t3427.houston.hpe.com (Postfix) with ESMTPS id 859246C;
        Thu, 18 Feb 2021 22:48:47 +0000 (UTC)
Received: from G9W8675.americas.hpqcorp.net (16.220.49.22) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 18 Feb 2021 22:47:58 +0000
Received: from G2W6311.americas.hpqcorp.net (16.197.64.53) by
 G9W8675.americas.hpqcorp.net (16.220.49.22) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 18 Feb 2021 22:47:58 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.241.52.11) by
 G2W6311.americas.hpqcorp.net (16.197.64.53) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 18 Feb 2021 22:47:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNzud8clWZtWtFNPPumVKSkeBufPj1cPJ3/Vgf/rM8yiMJTTEoz2Buw/GkYRvOdEkXNB/OPqu2U1Wo7SKKA+8zHz0SSIErEIPEQ+EvW0VBAoAKMTzXThYTKoPnbR5npwcJXPabrIF6c7rO4+2V0V8LiulhD1eAnDdehcnYhwAZarM1LapVkEuudP6j1OgAlIz4R15ecjsWVRuYfFNdc9rS4Yq1bmbrlpcSQVvk+UMslclfuVxbi+gpOLRSTCzHxNxjudbxoVaU1P2Pfbg5M7X/laIeXFxYsLPqfVdP0hBCue/y2dd5OyIA07GUbkz4UUJKneg+ZUSswLlKTvwXj4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAfkV50SSC0TZQ2DiPQn5fKwUFQkdCSWAYneWe/W+kc=;
 b=lOqY8AmK4bgfPHQJU4vnzWNzLkx6UJFJaiGtVgAC18ug/HDaC4+zb+2zeIOrTxVfqzSMR3fua0R3Qeuz2TrpV4eXgQih2IEnaWcSSGRKgPRkKX5kgjc3ZcvQjuy8agxmZlJs99zI2ljD0ke5n6YpjyyJQG58fX03xUFRlhSPW28g6Upw3NJ6jz702BsyUFPf9f2I99r3reJXa7B6gn8D/DLHx7WvgDd3ZhVEC2kMvie77wLJDyFfW+zVUERZ15dq8UomAT/mP2xIDhwNr0XekKXJ0+gkrneCr4T3mAFTrRXHmgTrNccMGt9VOY1MOpfZedCOgm12vN1KI+cx6RkMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742b::18) by AT5PR8401MB0371.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7425::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 22:47:57 +0000
Received: from AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f177:a85:ecfa:1d4b]) by AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f177:a85:ecfa:1d4b%7]) with mapi id 15.20.3868.028; Thu, 18 Feb 2021
 22:47:57 +0000
From:   "Ernst, Justin" <justin.ernst@hpe.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Borislav Petkov <bp@suse.de>
CC:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning in Linus' tree
Thread-Topic: linux-next: build warning in Linus' tree
Thread-Index: AQHXBjjl4JuM7BbKhUeFnMrD5bnN/qpefB0w
Date:   Thu, 18 Feb 2021 22:47:57 +0000
Message-ID: <AT5PR8401MB130092CFAECCDB469375063487859@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
References: <20210219075853.0514c9f9@canb.auug.org.au>
In-Reply-To: <20210219075853.0514c9f9@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.60.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d554c80-fca1-42e1-b00e-08d8d45f3c74
x-ms-traffictypediagnostic: AT5PR8401MB0371:
x-microsoft-antispam-prvs: <AT5PR8401MB0371991CFBF048729D4CC95587859@AT5PR8401MB0371.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VbdCILCwUivsgmE7pTjZsC+iHuny3uWhZIt1Kbaqab2MTEB1ggo1/FGIkmQllueeRr2nGRwAwuEYwHIquuZEichKcI2bO3sEVrzyNC0op1E0qe2QGt+7SJBy5HividpOfUuLxnpL2kSAfGlh48AX4Gz3G5Wu4fmHVk/giJtmFlwRX7FHCRZtlRQo6+MWDIoejmrJYXzqQ1vE1hnn4zQwHKPUANwpFryJo7aO4boJO4R8r71mOtwIo40J1e5tGXsJZrHfX6oX+vmtzQFp14rKPuiPQ+m1BDo3kDyiuMQ786mJhXvxk86UBZ1ctqe58P+zGD3XW0j1wLqBE2ITKDEAQ3/B8arZ15W1s5KsDArnEPk1J9vy3D+JAyK/q2pQ9rHL7NEtRhqPr0dRH73r+z/A4qINnRUXHoQ29wItte+hgVFNooRibgGCKaBA95twGZRXp5IfH9n0ZnS9PfgYzy7oZBMc+U2hQ6og5ZmlDo3/O5LuYWjnNfbDzzkdkmRGyIVpWNDWeg8A15yiqIpi5zaZJ4q28eZgQwYVu4xXUK/5hz97MBQk5xioUxg8Q4GAKCOO8WUlmw/a6lPKRYD6vLSBVe96v7O8bjrO3wkbATDdax0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(39860400002)(366004)(396003)(54906003)(55236004)(6506007)(66446008)(8676002)(9686003)(110136005)(52536014)(55016002)(26005)(5660300002)(478600001)(316002)(186003)(33656002)(83380400001)(76116006)(71200400001)(2906002)(4326008)(8936002)(86362001)(64756008)(66556008)(66946007)(7696005)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ea6cW0iBEEM7wm0Xly228yMZqFxJtPHrSCmInRNPr+s2ktbNwZqppj6mV1tw?=
 =?us-ascii?Q?v/K5LpdNPV48P1lgrUcnzuq/cgBgWY/uN6jzaXMVLrut8DzZP3r8VcEN5cT/?=
 =?us-ascii?Q?2EMVRmiWtAu37rMQEJmi/eBflANWnhp/o96BQdJcqWBv9QkGy/gIg2ER5Im4?=
 =?us-ascii?Q?JJ2RPnNGRjhpf+t083oRMn1Masl0ix+q5lVdsMkjqi0HLYpn898XD4wCnnj7?=
 =?us-ascii?Q?SiL95/vOdpnpX9phkTAUI7Gwrur9fIQeYVeoIS2R1yndF3vlTwavk2kfwuON?=
 =?us-ascii?Q?Xb7GBw9Zj5HX6sN3+c9D5ESwVT6FOVChrZboFqo4TB26l+VyoGYPlLv6U6kL?=
 =?us-ascii?Q?S/ep+6qbldhfVq4jzCEvWlK0PqICTLYMPIYZEARJei0ipjS9ldWeQpZyB3g7?=
 =?us-ascii?Q?BRQZjGrgTkrHl+PqE0Aw4ewvVtVtX8P+4YhN3wVoLrz+JnGZhO8UMH/GzQwP?=
 =?us-ascii?Q?ZHIpSLg049zcEOjEyrIm59CSmiDFPeybsdjSmaCpNGQ5xgDgx8DbFNgHycA3?=
 =?us-ascii?Q?dODprB0LqVz7CIpAw0iN4xNncgTiD0yY80W4fc8Oowd1kE8mLQLE6Joo8q6/?=
 =?us-ascii?Q?aBSu59r567Xes0Q/cjk4XEwK/kIExQiOEV3q56YCvQkINdDwE5i9SaVAPX2F?=
 =?us-ascii?Q?GuFKoR/CNWontklv2MtmRfz9ZKel5cyL3Q21R0doaXFpk0VDJqHokhBjzHzM?=
 =?us-ascii?Q?CL8k2CZskX1rmQr/HSqjZBE+n+cCLupFnNiwyf5lRENOae7VKKBlo3OWl/ni?=
 =?us-ascii?Q?blRIvyAA4VUKiRA48MwLbaPfVFc7iIzGBPSu6xyYoPW0kYqKvSLlaoZvuk34?=
 =?us-ascii?Q?vvnmW6KWcpXCWNPSNWb4jD8w7/Y5fME7XDxNWkQwIkA9jFf+T8QuWpzu9lo+?=
 =?us-ascii?Q?2Mw9x+BbtjnRxB5UjVrnv6jZTCu4V8G+UcOD3zd37cnyNgIL0NEPbz4kPmnF?=
 =?us-ascii?Q?ZedGX0IT3/3K26BWMkaUPLqRgHRNIrt1/I3b7okAcecfRMDLIF7HyfsXy4iw?=
 =?us-ascii?Q?RJwFa6XqoIyFEWHcTvncUy992cGxWxzRwlfjTOrKzTKKQa2M+vw7tyUMnFRC?=
 =?us-ascii?Q?7TNkd0N2V2IDQamKDOlV8LWlxfCvMu9c0gFp1rGBvQQ2V6afmAzn0i93mCk/?=
 =?us-ascii?Q?o6ZUq1oH07u4IbfDN1x4YqINe/84olyC2BBSChgbZO+HCeMGw8qSkxrDBLHo?=
 =?us-ascii?Q?xzF+FX/u25xLIf6zS1pL7c2bT5sq6T6F2FA/GKxARTBwYTJDFOnoF545E2yF?=
 =?us-ascii?Q?HdvI0pDf38Asf/uHUaCQV8clYG8C4je3SPFa2F0h1AoutuRRx7/mHE5Ed2aa?=
 =?us-ascii?Q?amRH9HBM+NmucNn+PQ1MHLT2?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d554c80-fca1-42e1-b00e-08d8d45f3c74
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 22:47:57.2777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ug8jMtbxv4Axn3qYq5SMY9SVG1VwShX7Gk0m3vfslqDSxcoty2pAA3gI4/nKgwD3pPDcwZL4P7BT6FLTOhl37g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0371
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-18_14:2021-02-18,2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 clxscore=1011 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180190
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,
We made a special effort to squash the unexpected indentation warnings in c=
159376490ee (https://lore.kernel.org/lkml/20201130214304.369348-1-justin.er=
nst@hpe.com/), so I was surprised to see this again.
Commit:

	c9624cb7db1c ("x86/platform/uv: Update sysfs documentation")

is the culprit here. I suspect it was written and submitted before we made =
the effort to fix the Unexpected indentation in c159376490ee, so it misplac=
ed the first line of a codeblock, the original problem that was reported an=
d fixed.

The fix:

diff --git a/Documentation/ABI/testing/sysfs-firmware-sgi_uv b/Documentatio=
n/ABI/testing/sysfs-firmware-sgi_uv
index 637c668cbe45..12ed843e1d3e 100644
--- a/Documentation/ABI/testing/sysfs-firmware-sgi_uv
+++ b/Documentation/ABI/testing/sysfs-firmware-sgi_uv
@@ -39,8 +39,8 @@ Description:

                The uv_type entry contains the hub revision number.
                This value can be used to identify the UV system version::
-                       "0.*" =3D Hubless UV ('*' is subtype)

+                       "0.*" =3D Hubless UV ('*' is subtype)
                        "3.0" =3D UV2
                        "5.0" =3D UV3
                        "7.0" =3D UV4

Thanks,
Justin

> Hi all,
>=20
> Building Linus' tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected in=
dentation.
>=20
> Introduced by commit
>=20
>   c159376490ee ("x86/platform/uv: Update ABI documentation of /sys/firmwa=
re/sgi_uv/")
>=20
> Or maybe an ealier one.
>=20
> This has been around for some time.
>=20
> --
> Cheers,
> Stephen Rothwell
