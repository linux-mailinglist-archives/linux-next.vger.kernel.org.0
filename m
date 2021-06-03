Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260CC39A348
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 16:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbhFCOfU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 10:35:20 -0400
Received: from mail-bn8nam08on2054.outbound.protection.outlook.com ([40.107.100.54]:31713
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230386AbhFCOfT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Jun 2021 10:35:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntCgKMNLsQe3ExnQ5JvQDL4Hjz8ry1JmKl8l/u5HjqAqJtJ7Mt7hks3HlMPwL2eEikSwmmqqlAcDbDfus+HcY+mZLNJ9JqsnVu+kn+a4hHxzSf0oDp5HNhlhNrS8vE89wbi1hk/5zDUdglIkj8RE5igBqfAfeOrzQq0ZhZbvZ79RfIth9gDhtdhhzw4e2QPm5PG/fLcnh5B0kncUO7nIdU2i+VI71e6qDEf+KduUamN6BkhIIa9f028/5RdwU/aYS197IYT7nmPdHD91mRZXZHxBm7l8IDyw6imtwZlRh7Vwn90LhHSDba7+eZYKqrOddZ42fkSz+JtGVMhfPb1Vxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvnLXUAltcfGxhfGQi0OG+zV2ObzUlLlpUcjS8KUjSA=;
 b=TBBeQxlCzVT7nCk6ia8bV+fvvElFmoh/nXAbmTLIjLUwm1gpiR+Eo6wI4B3l64ZDBkjkGerH3Pzo+Mcm2NGyIQ6wC2kNXCrczVJ4Fi3oFx9lmAzHOg9C9CgqQdvlfKdM/U48xwC4PHThVEm7kVAB6aDLW5UxYtIhqRgTC9GDQ+QiA/KvDZiB3swQNAHxalBTxUiajU0EO0HFMxR2X/HBi1WJls++b6XsPiB/gYXg9jhFrn/2zjymYXuT19xZdi5pT3O+TLjdWQhY1u7PzJEqjd/2ZmefapJMe/fRgDsy/VZgvaVsDQ9bjO3yh7C25lVXklur7Y/s1XUII/cF+wJWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lixom.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvnLXUAltcfGxhfGQi0OG+zV2ObzUlLlpUcjS8KUjSA=;
 b=lATyGb9W1OCScnrqe4QJu3GXG6m5/hvNJZ+t8bIMwbhkPP+mApRjaD8VkzMtr8kql2LmZKZaDcg1+mtSyt1JIMsL6ujZqI5aOkffE1syBL1HCjI0GE4XEYt7qSzeRfgzsOFSGcgQ+55TSWEzI1TYSggJ73sDWvfnRyUdodmabiJA9LyI+jlc7G4j03XDcbarg1UxjNp2IgckGeDPveZRgi5V1CMT48+OesshbXpomSI8TNOc0PlBoAHnz/Y/4X26jxVgKAZ1fTgURZYEcig2ZKcpnvq6wNT8QtyFas82ER78N89QXp+RhG6TwCgwsGctFR1qKCHtpDqW90d74rW7Mw==
Received: from DS7PR03CA0244.namprd03.prod.outlook.com (2603:10b6:5:3b3::9) by
 BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21; Thu, 3 Jun 2021 14:33:31 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::60) by DS7PR03CA0244.outlook.office365.com
 (2603:10b6:5:3b3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23 via Frontend
 Transport; Thu, 3 Jun 2021 14:33:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lixom.net; dkim=none (message not signed)
 header.d=none;lixom.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 14:33:31 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Jun
 2021 14:33:30 +0000
Date:   Thu, 3 Jun 2021 16:35:06 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tegra tree
Message-ID: <YLjomqomVuJ3QZNC@orome.fritz.box>
References: <20210603103507.304b7626@canb.auug.org.au>
 <8d8f947e-2ba4-f7b8-cb85-dcee940c96b4@gmail.com>
 <YLjIqfeiaJqeJQtw@orome.fritz.box>
 <8966e56c-4da4-b360-7ce6-19d0af114bb7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Rp0EjJNSdc/8+ji6"
Content-Disposition: inline
In-Reply-To: <8966e56c-4da4-b360-7ce6-19d0af114bb7@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed14c9ac-70be-4be1-87a8-08d9269c8f90
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:
X-Microsoft-Antispam-PRVS: <BN8PR12MB35872BE5439403C4E85669DECF3C9@BN8PR12MB3587.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fr4cw76rLRWyoeKUXd/UHrfVgrf2F5IT5/y/G8rQplD2OUYSDl8HvzCoyuwMuXdLOtY7nnskGdnFBnbSQO55sJNvytIJYrIWpDMy7nuqpuqnLVyGsvMiZNRtDL1LZQCszY0eMrLj279Cbz6Z4wP46bvywrpCUeH+LO5yN5FKNBnKVzurezg72dtuDG+4rFKkB4BceB7lENaRVR9r7sswwM7HJT5vsh0kQOlc0HurrM/Cez1RFsHuJdnJ9FObfgNDh/D+Jn/3MJr9brWl6twW7sTnaYlo9t+aTtnuLT/3rlneUZIHzB+FnU5CCkHBLBKDi0ScIOGpthEt4YVnW4Cp0+vwwSzFsgfJGPAuM74lCRku7JzBaTtUwaPGkYDFWAfdIALu2TB2rHDO0skRyU4+WqhmDI5WX07DMZ/YQXTegP5frMLncLT7P1hhMud9lwjbIKewkcWin7iPcAz6F1STna3mR6qr5NCjo6xE8lkeYUIKipAFy8lQFY7SB2sTaA8Im8q2O+vzNOJjuJvyM4VvokZQh/b1Uwmqn4LIwnxlVzvd4Yt/blWDIR0Fi1S5mTkP4yrlhnOaejFu/h5pMdpLWp0l8MgLawgxaoVmqBU7XLHvRTAzC0T0nGUaq9J7rmu9b1ABCco9ay7tSCKkJvGmwwFUpGxtUDABHI2dBPbYiVXKUPh65sMACJrHVCRe7E0f
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(36840700001)(46966006)(7636003)(8676002)(83380400001)(47076005)(16526019)(356005)(86362001)(26005)(70206006)(54906003)(6666004)(478600001)(316002)(36860700001)(44144004)(82310400003)(36906005)(5660300002)(9686003)(2906002)(186003)(82740400003)(21480400003)(8936002)(426003)(33964004)(6916009)(336012)(4326008)(70586007)(2700100001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 14:33:31.3930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed14c9ac-70be-4be1-87a8-08d9269c8f90
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3587
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Rp0EjJNSdc/8+ji6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 03, 2021 at 05:03:38PM +0300, Dmitry Osipenko wrote:
> 03.06.2021 15:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Jun 03, 2021 at 05:01:48AM +0300, Dmitry Osipenko wrote:
> >> 03.06.2021 03:35, Stephen Rothwell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> Hi all,
> >>>
> >>> After merging the tegra tree, today's linux-next build (x86_64
> >>> allmodconfig) produced this warning:
> >>>
> >>> WARNING: unmet direct dependencies detected for TEGRA210_EMC_TABLE
> >>>   Depends on [n]: MEMORY [=3Dy] && TEGRA_MC [=3Dy] && ARCH_TEGRA_210_=
SOC [=3Dn]
> >>>   Selected by [m]:
> >>>   - TEGRA210_EMC [=3Dm] && MEMORY [=3Dy] && TEGRA_MC [=3Dy] && (ARCH_=
TEGRA_210_SOC [=3Dn] || COMPILE_TEST [=3Dy])
> >>>
> >>> Probably introduced by commit
> >>>
> >>>   08decdd5b448 ("memory: tegra: Enable compile testing for all driver=
s")
> >>>
> >>
> >> Thank you. This is a new warning to me, apparently this case wasn't pr=
eviously tested by kernel build bot.
> >>
> >> Perhaps this should fix it:
> >>
> >> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconf=
ig
> >> index 71bba2345bce..3f2fa7750118 100644
> >> --- a/drivers/memory/tegra/Kconfig
> >> +++ b/drivers/memory/tegra/Kconfig
> >> @@ -47,7 +47,6 @@ config TEGRA124_EMC
> >> =20
> >>  config TEGRA210_EMC_TABLE
> >>  	bool
> >> -	depends on ARCH_TEGRA_210_SOC
> >=20
> > Why not just add a || COMPILE_TEST like we do for TEGRA210_EMC? Because
> > TEGRA210_EMC being pulled in under COMPILE_TEST (and then pulling in
> > TEGRA210_EMC_TABLE which is missing the alternative path) seems to be
> > the root cause for this.
>=20
> The anonymous Kconfig entry is unavailable by default, it can be only
> selected by other entry, IIUC. In our case the TEGRA210_EMC_TABLE is
> selected by TEGRA210_EMC, hence additional dependencies aren't needed
> for TEGRA210_EMC_TABLE.

The code guarded by TEGRA210_EMC_TABLE makes use of some symbols that
are only available if ARCH_TEGRA_210_SOC is also defined. If we don't
list the dependencies via Kconfig this could lead to a problem where
somebody selected TEGRA210_EMC_TABLE without having a dependency on
ARCH_TEGRA_210_SOC, which would then lead to a build error.

If we do represent the dependency in Kconfig, we'll get a warning like
the above during the configuration step and the offending Kconfig option
will end up disabled, and avoid the build failure.

Granted, this could be caught during patch review, and yes, there's not
technically a need to encode this using Kconfig dependencies, but at the
same time there's also no reason not to use the safeguards we have at
our disposal to avoid this in a more automated way.

I'd prefer to stick with the explicit dependency in Kconfig, so I've
updated the patch to match the dependencies to that of TEGRA210_EMC.

Thierry

--Rp0EjJNSdc/8+ji6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC46JgACgkQ3SOs138+
s6Fu/Q//aSAS4+BnIjvq2EW0zNG191Iq2KO8Sx1UHPKj8ZXhYCknAlohyS0iJuXC
g9rNYmZQDi7UeSU7w0hi7vU3sdiEMP2J/KK5Xsu+ZaZ0bh+ScXM6A9LAYNqtlSjY
jpAMpKXt3ImM0opvChaZFruor/VEhZqPTgxelo4Rqng011OuAc8tXL2NbyLPePsI
CVEF9jvM9EIq+yNLjNMJXkeRaHh5i6/M2vfjAShAmZRwU3r+mdqFC6r/uPMX4gtl
wd1aeW/ejdpwAGpVowDD1Wb3UK3by88XBWjinKO6oSvc3KDcWvLLk23zzU6jl6XS
JBGZEZpNNMINgVpefOefjffEXnaXjvRAb2h9754o8gFPRB5Bl3rQkqztBCnODLJS
Bc3IaBuuM4MQfVXqylFXmieLAvYQLTU6Y9FbZgsjTLH5hX3cY4PFyOH8E+sMdNKw
vlq95/Z1DLPvv0h1VwZkT2j/qPtoX5iYMMO8W85+BiaqWoIxoVWLSsnTGJYm6UNt
5Rm3MTT2IKmCaFuUSsIzAn9JK3648zg4lLrs/i35NqbOulP5Ug2VLs9ox3qpM37x
u+nYmtWM7lXIYVoY338Z+Wg31MDT/u/rnBkdFQzFlV1e1GSckGTGtgX/nuRUGsrV
KJUuzq5bVBTlb71tmPGIWWN19ayAVgfXXeSBgD2O+/oz/wMIxjY=
=Sd+M
-----END PGP SIGNATURE-----

--Rp0EjJNSdc/8+ji6--
