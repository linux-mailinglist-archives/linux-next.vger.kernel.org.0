Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCEE3EB68E
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 16:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240813AbhHMOKr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 10:10:47 -0400
Received: from mail-bn8nam11on2083.outbound.protection.outlook.com ([40.107.236.83]:62304
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240801AbhHMOK3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Aug 2021 10:10:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5vHIgZqcYpYPitMYcNGT2MeqQyJwzCVNbP8u0wVnTQJ+pbHsPzJNTLY+nkfUqOL3fBhyMdePWJUHDwewVCGVv9MNN/QRlOPKhSO35Pe8TRQFgzsMz1LMcmZon9tjL07rf/M4ZGQBrVLdpkUtN+JRbnkfaqF3a0aKlHgsEqhw/4C5nLDTcogDYHzQyZgDZPgx4Du1I2o8x8mIThSrM+e3+SjfrjbG+qdLGX+ETQvP+3a1UTMXiQ4PMF5XWUi3uuWuXqig5lfqIzaaa1C0TSFYEtOd4StpKnH9cCHmAZY0eBeQcmQhHJ+XL69/DSPidsaxy7R7bIJKXJ703rc4wg5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJa1uE/zsEucQ7jwCCICjmuOisAWVIAbKaaPGvHWhZM=;
 b=iZSYQMSFN2Wesim7tc7xU4b798efO5pjqTlslujMAXL0+sWbfoj1aeubjh6QniJmT10SX7CrQUPC53pnieysiyf7deQj8Ef5cdOXIUkJKfSjsrxRnC1XmFw5TbMTh3w/FLLgAXwVWFWv7zNTh043bWBMfBOrNQwsfJrTu2n3GnZCAX61Sl5pxi6PaPVMJCB/cU4xhMzI9I6qbjX3GGqkAhWnUao65dIQd6DCqZefoRP6hj0oZ+UQTlGRfw58ryCHSn7Mr1EQ+Yk3l+6Gl2GQEWArc1hgGod0xZFGi2eV0DYdrwvDcY57pHKXSuz0zJqWOalsi+ZXVs8HX7+BQ48Zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJa1uE/zsEucQ7jwCCICjmuOisAWVIAbKaaPGvHWhZM=;
 b=DfpRNF/dd0JSuwJ6GwO9nZyBKD2oPlagLrMIEJ2hU1s2UJs4uMwuyivjvfvqO1cQxIxzzZwrPQrTGJDGLLjvnekzEmeQOzOr6cszHme5km0U2pcrjvfBBP6jwnPR95ByT9KQK2krPL/lV8HFcwyCFJUtGYcjRYuUYEPu5RdCxvTSX3Qvhu1WM7wz54+CheHY+mIhgeCvoV9xcAxVCISDOuDt43SU/i4pf1S8IGk96FoWIOjlBZphSQNbqyxJ9gGCyL4Lo2+V+7pFtufQwnPMi4Inzi/1xP8QPCUxf1aOVU/2MY13eFASRcNEb0HaTHOek/eqw7mvi2M2yNOGo8SXfQ==
Received: from DM5PR16CA0026.namprd16.prod.outlook.com (2603:10b6:4:15::12) by
 MN2PR12MB3056.namprd12.prod.outlook.com (2603:10b6:208:ca::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13; Fri, 13 Aug 2021 14:10:01 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::43) by DM5PR16CA0026.outlook.office365.com
 (2603:10b6:4:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Fri, 13 Aug 2021 14:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 14:10:00 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Aug
 2021 14:09:59 +0000
Date:   Fri, 13 Aug 2021 16:09:57 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the tegra tree
Message-ID: <YRZ9NavtWV9pUinW@orome.fritz.box>
References: <20210813081914.0e541c40@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VaHIYH5eNEx4xK99"
Content-Disposition: inline
In-Reply-To: <20210813081914.0e541c40@canb.auug.org.au>
X-NVConfidentiality: public
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e1169f5-0116-462c-6201-08d95e6409fe
X-MS-TrafficTypeDiagnostic: MN2PR12MB3056:
X-Microsoft-Antispam-PRVS: <MN2PR12MB305621D12184802E21988F89CFFA9@MN2PR12MB3056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iaiZCQI+B5mhfUWUx14AMmbTbJrri4R2MIxb9Sc3RgmoQDYUYQ1NWyrTrIcsacjDjZ0is9FjrZzmeA+7SKzSojOBEj+rtlBTU8XS0LRJgC10qYwTzRPeqs3PvzJ6ZAnbgBiUzumonnbVsn7qJS6ikBqCqlcXqBm2Htmtx/EUM4na7tRT3dduueQaGgBwUgBhu0ctosuP+sifErOlcCNvRPODWBnnFYLBQjizxxLkvabvVGZru0xL5kHPlnljpwS7VcA7OA+Z4eWDLOQJiaGGIkRfQJThatYY4sNZC4J6Z/Ligp/WGqVe+wcK+mZvRSG9xJ33dwM9nHXNpNM8W6BwwW4eTNLt4R9vMGMxGmuMEvnUHH10SQLCCL77T6HRDY503IR2gQDbCNUAf0QQi9XnfuBZheoPFLGnYl2QwhQiLtPufsbSXy8YRZkQNXuFh+jO/bFyo+nKpnCB+Iy0p3hXe+05Ya01QvXjsvSyN8IaFlsTDRcR6DTs7FPBQy8u94/g+nJJ+N6RSfL3VS/3m0c5VJNj+xTp/tbHh8iZWPCI54Mt5heS/h0QQIh5iRyJtS1MqNrBsyQRaKrIwogNTpaMnDKxwzkyEadfPKg3XaH8CU+P1dgfnyV/I3U3qdnsIqhGsjUwpJuI+vZOCV4UQjskqSrbCC89jxjbeFqMYnZ6pVeXGbixYwMfZXrkBFg41oVTO6iIF8ncOsv8Nh5dtQ7dFMxkkh5H0qJAJ49NI2S2hhg=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(336012)(26005)(508600001)(54906003)(44144004)(2906002)(8676002)(8936002)(70586007)(47076005)(86362001)(6916009)(16526019)(9686003)(36860700001)(4326008)(70206006)(21480400003)(5660300002)(186003)(316002)(7636003)(82310400003)(426003)(2700100001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 14:10:00.5313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1169f5-0116-462c-6201-08d95e6409fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3056
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--VaHIYH5eNEx4xK99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 13, 2021 at 08:19:14AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commits
>=20
>   b3b3e68aaab6 ("ARM: tegra: nexus7: Improve thermal zones")
>   d97a74513cec ("ARM: tegra: acer-a500: Improve thermal zones")
>   0cae833ff518 ("ARM: tegra: acer-a500: Use verbose variant of atmel,wake=
up-method value")
>   ebfbd63602b0 ("ARM: tegra: acer-a500: Add power supplies to acceleromet=
er")
>   0c3136565b64 ("ARM: tegra: acer-a500: Remove bogus USB VBUS regulators")
>   3970dc6444c5 ("ARM: tegra: jetson-tk1: Correct interrupt trigger type o=
f temperature sensor")
>   0a6e9f9cc27b ("ARM: tegra: dalmore: Correct interrupt trigger type of t=
emperature sensor")
>   ad86e473e1f3 ("ARM: tegra: cardhu: Correct interrupt trigger type of te=
mperature sensor")
>   61f8c4f6eefb ("ARM: tegra: apalis: Correct interrupt trigger type of te=
mperature sensor")
>   303e2f343403 ("ARM: tegra: nyan: Correct interrupt trigger type of temp=
erature sensor")
>   c626fd7eeb11 ("ARM: tegra: acer-a500: Add interrupt to temperature sens=
or node")
>   4eb121af6184 ("ARM: tegra: nexus7: Add interrupt to temperature sensor =
node")
>   a371e9698e89 ("ARM: tegra: paz00: Add interrupt to temperature sensor n=
ode")
>   00786f61df89 ("ARM: tegra: ouya: Add interrupt to temperature sensor no=
de")
>   ffd8969c9100 ("ARM: tegra: Add SoC thermal sensor to Tegra30 device-tre=
es")
>=20
> are missing a Signed-off-by from their committer.

Looks like I messed up the b4 command-line. Fixed up now.

Thanks,
Thierry

--VaHIYH5eNEx4xK99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEWfTIACgkQ3SOs138+
s6F9XBAAnyOzOhTY2ygnaDdghGPNmjQ94rJZvxCJ30SON4G7Y6oAkkTBYEQOSP0H
2U/4e7s9JRUb8MItpWL8y1ME27MgwB7lWzjIfn+uM1NdiLn2zikWgHB/Dh3Oh798
BzwZxBaHKrj0fQjmh0yLC6/8mYFqHBJzvkYPMt4LU7YRsXkp1Dgdf5hQh6nQTTil
VBGkkxLKNoK1TKkL21s4uBdqUcI72dIcVT5QW/ov8kH5KvlpFQOjjFrgDHz0SUIk
cl4egu+yd2DDSU8PVL5J88k1sLy+GDR9HDVLwoLcp1Nq44skjG5SAxR4ZAT3kSNA
4Rusp4nvG/XnT0029c/t1umqX1xIgP0P020jxO/9ij6qiCF6x+w7p9Y1gOVpqNds
4q94swoVQoJvAHgCvuPqVmwVWWrbWf8jLlx1rC49wLmmqtygL6haCuilAPG04t50
Wcs9yf2D5lFqaKZhzZP3fpa8eh40LtBZZDuW4NR0ipXn1pqs4qZ2E4Ud7wFTYhx9
TaovCWKu/TcmF4OMOgRPIKIs2OdiftWZSHlzPcGcAAF4yhznqu4GcFtpgiygTifd
AuNpTk/kpfwv9YsEvvjPIcVjgT5QFVL1DL2TQd2x+A7IADrJqSviKs6WQBQU5F34
4z6V0VVQDuF8DbcyvIqP6XcjhzscBPQ4kTSH7rGg3urpF622OdY=
=PsHz
-----END PGP SIGNATURE-----

--VaHIYH5eNEx4xK99--
