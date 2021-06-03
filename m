Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F2139A0AE
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 14:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhFCMTB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 08:19:01 -0400
Received: from mail-mw2nam10on2046.outbound.protection.outlook.com ([40.107.94.46]:45281
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229765AbhFCMTA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Jun 2021 08:19:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbM0wgZKjXnis8YFa/CDOSKrxxXDec3Ufp4BqL8aM08GLhle4v9AYzyfU7SInIPbdCP/sIxdgc+4Z+ibsiKqcEFQ6h3548aldYflXUn+7y9n+eLdYcFpZEpdmYp5Cn7jZWP/DcMTPMdLzjK/UVHJeGLDBkQJfQGMXRI94eHMuUdyFWN9NaJHCgyid242K+tl3vpqje3G6EcWE6T+dCtOwiYrf53KN2DohQ0ecNwEptt9eYjVeT/KXmyPqfhSQGbWtyYEz4I/iUbEAJFABfTMek0ES/dYXo+ONLqrMJecThqkOEos3hDK23gKpMAiP/qOGJIQrqLgvRGZ4QJsK4QJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03ji0AX+unGo5WKn5QIXNK4VnzVB5f6nAQF2B+Mmj7k=;
 b=bLEoo7usTB/zmb6rw+L6NTHH6alTt4whkoS0xEa3ojn3aXeweMdxGv8h086BLt5PKKu8ikoQcnVuT34USvi/MRRvNFLFup0jqcBBT3A+5jVSjym+Fqs+DJpPKkGc+p/MyQuUyHQiiJMY3gcv7xyDZ31/bOPZGZZpaElI0YCDh2zNKoilWZnGaYWBVaNZW9KvIOVt318yX54oY2nJ6iWJgOA9JrxGzzPA3crmzlYzadZgaPq+ezpdp5fd5kM4GmFU11ttH/1lspsounv6176cIgmPtIyRGxp8sn2rWy2ViSKVotn9+rCLTh4/YtroBrehqZwbSe2I8CepMVzRXzpMSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lixom.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03ji0AX+unGo5WKn5QIXNK4VnzVB5f6nAQF2B+Mmj7k=;
 b=nwBzrWD3mOv+RXd+ND2h0UMec8bh1op6wfVFWbnluBlWOzsuAbLD66tz30FkEy6R7GPxdftCwEqB0S8BC6woXgAUK5JhbrUmSS3XCoFRgR0l5+yguiw2FS+NOqDJoUOYTumWLf3gIqZItxTb3s+QZ1SjY5/0s1V603zY+4YOK6KRLksFSWvbvKGExGR+byErMY/YUmTTxK0JnTjwMcmKJqJ+jUDdgoF3p4B2r5YvVMjZCdYh8AvPj5QKYWdRBGgh9nrG8oVzqfe7pPrK3bnDY2KdeDvkAmVFsWVJHUNs4rASI3B6GcoKblc1MBJz5ryaFk3TotR328+PFnkHMVqu4Q==
Received: from BN6PR13CA0036.namprd13.prod.outlook.com (2603:10b6:404:13e::22)
 by CH2PR12MB3991.namprd12.prod.outlook.com (2603:10b6:610:2f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 12:17:15 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13e:cafe::1) by BN6PR13CA0036.outlook.office365.com
 (2603:10b6:404:13e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.10 via Frontend
 Transport; Thu, 3 Jun 2021 12:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lixom.net; dkim=none (message not signed)
 header.d=none;lixom.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 12:17:15 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Jun
 2021 12:17:14 +0000
Date:   Thu, 3 Jun 2021 14:18:49 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tegra tree
Message-ID: <YLjIqfeiaJqeJQtw@orome.fritz.box>
References: <20210603103507.304b7626@canb.auug.org.au>
 <8d8f947e-2ba4-f7b8-cb85-dcee940c96b4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+UJqigYrIox1WPeM"
Content-Disposition: inline
In-Reply-To: <8d8f947e-2ba4-f7b8-cb85-dcee940c96b4@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7f0f32f-d5a4-4bc1-26a3-08d92689861c
X-MS-TrafficTypeDiagnostic: CH2PR12MB3991:
X-Microsoft-Antispam-PRVS: <CH2PR12MB399196C21DEB03416F4E0283CF3C9@CH2PR12MB3991.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2jLRFBb1HsQzkeWOBr0b2j9krIquY2REavSMMN0EqGbYtLW0kokRx4plIqCMbHS0hgy9kciHAGWn8HIc8puYZT5cBFCoqkTRYaU90Bp/STIKdxD34yj6OimN22XWucxKOXT9/ruS8TFSzOwnmPzgIXNE55LV2uu0STMazv7zWdUnRLLJ+B8GJcY0/Pl8v/BtJV1UV1GygxX/J684bCCLMJPSrzJWLmjSTuRJOTDSrCu+NaKce4BJZHIST7CNOKW8wSNPmGdmHsuUQfGMAOT/pexNBC/L14Lgmf3jHfDGVYqbL59zFdp2+JcrtMg1+pfBKoiU8NJlNjdoajHR1Ltm4ZTvwAMEEcdXolPXkFiHRtokX8sYuTGTW5vlfGYgvFeeFeAlDSzDY8uRG9lVcTsHoc5VJ4CH7wxmkeGIeKhi10XJZkfxBnZydCp1IzI1/237Hy5D2gApxUBmFGRmIQnEQL1FYj+5qUSsSgOvZ1VRrMjFuB7A/Sum9xbHgLVB8j5j+5mm0KoIWtP92/MmtapKuvA/wOLdxIUYaRfAGrLQTxco6u2RZ13TNtKpeMZHLgeZXaZ3UQiYnoADcTvh4xRRAi+DyCP4SQsYzE0T0O25FDtbvl0zU9dEb0SA8X/XfD3sjKVUVsJscutvUem+chO27iSHTi4PRiyiaaD0HsJOzgWfFq1pPxEfyPdAvtqBdRKV
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(70586007)(16526019)(6666004)(186003)(4326008)(44144004)(70206006)(33964004)(36860700001)(82740400003)(26005)(8936002)(2906002)(9686003)(356005)(86362001)(5660300002)(47076005)(21480400003)(82310400003)(336012)(54906003)(36906005)(6916009)(426003)(316002)(478600001)(8676002)(83380400001)(7636003)(2700100001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 12:17:15.0335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f0f32f-d5a4-4bc1-26a3-08d92689861c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3991
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--+UJqigYrIox1WPeM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 03, 2021 at 05:01:48AM +0300, Dmitry Osipenko wrote:
> 03.06.2021 03:35, Stephen Rothwell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi all,
> >=20
> > After merging the tegra tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >=20
> > WARNING: unmet direct dependencies detected for TEGRA210_EMC_TABLE
> >   Depends on [n]: MEMORY [=3Dy] && TEGRA_MC [=3Dy] && ARCH_TEGRA_210_SO=
C [=3Dn]
> >   Selected by [m]:
> >   - TEGRA210_EMC [=3Dm] && MEMORY [=3Dy] && TEGRA_MC [=3Dy] && (ARCH_TE=
GRA_210_SOC [=3Dn] || COMPILE_TEST [=3Dy])
> >=20
> > Probably introduced by commit
> >=20
> >   08decdd5b448 ("memory: tegra: Enable compile testing for all drivers")
> >=20
>=20
> Thank you. This is a new warning to me, apparently this case wasn't previ=
ously tested by kernel build bot.
>=20
> Perhaps this should fix it:
>=20
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index 71bba2345bce..3f2fa7750118 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -47,7 +47,6 @@ config TEGRA124_EMC
> =20
>  config TEGRA210_EMC_TABLE
>  	bool
> -	depends on ARCH_TEGRA_210_SOC

Why not just add a || COMPILE_TEST like we do for TEGRA210_EMC? Because
TEGRA210_EMC being pulled in under COMPILE_TEST (and then pulling in
TEGRA210_EMC_TABLE which is missing the alternative path) seems to be
the root cause for this.

Thierry

> =20
>  config TEGRA210_EMC
>  	tristate "NVIDIA Tegra210 External Memory Controller driver"
>=20
>=20
> Thierry, please squash this change into the original patch if it looks go=
od to you.

--+UJqigYrIox1WPeM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC4yKcACgkQ3SOs138+
s6FH9w/9FXuzZM1yIlevTJnP7FbiciRuxPp1HRk1QLoR1fPYyTRF0iuH/9IrOpPC
gejiE4vbHXrcezjLJ6sdYvBuqhZ0enRxnEZOYVBSEgJeNuDh/MEeJ2IE+KiHluqi
anl5YgM8nlNO+0VzjRBw4seWi0e64YyjblYAJCcX3tHQZTJ6X4iC0FkU5ApSlGvx
4cxT9Fh55r4HmP7L2QY728zECXIsIIiA1yaBggS22CUG20Q9qpH6pKsSe1Nj/Dkz
f65uSse3eDyDn/NFQy3a8kJPXSDTJlmHmj9hEmHMZF2N1K2dYxWuIjxk6C9a/Vli
jO3jeXCHm2mbI8hJhINNgR34oQplhYUkVFiYeh5ShRb10XxWrChbI8xVcxrm8kTE
H4PJuzKf7y5Ko25aAeW6rVNn7/fHMHgoGVKfJRvn046mibSU5ptgumz/l1ooeXsH
6lEu1yUFn1AajpJTE+aqpUDSCYA2Y5OeS5mc9GXBGsijnET9r6Z6CyDoTvUx1F5I
aoHCQrP1G+ohFWhNx4ukOKGuy69nySXRHQAkxXDQCZ5UXFxQG6v2mJICkx9cQw+q
MRiqmZOn/C4GUrJXV5cLQvuYCkrzDp/FTks88Pqz7ysEn9C++7vOOtJhSIlxGBQ9
V0agHGt+v0citHlYvg/g2JTfsFSlW7vX5WiqqzFFDWrNeoTL/fI=
=9Y/K
-----END PGP SIGNATURE-----

--+UJqigYrIox1WPeM--
