Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A75815ACF1
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 17:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgBLQPJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 11:15:09 -0500
Received: from mail-dm6nam10on2045.outbound.protection.outlook.com ([40.107.93.45]:23489
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727439AbgBLQPJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Feb 2020 11:15:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMXAkLH4ueFVVq0K3kkDmuimSHFP3B19/LGT18c5lta7plAly6sEH4ADLfzEGvqTtsTs8WTftbWpb1LUwVbXTl+7PUxlhXelfFbhowdCTnWTbrwNqnHF/cAyobbgxJ1O1IWZfLUgs+sMjdKKwdfRoVU69s8RoBOeQsN5Bw4ReJJkom7SaXGha9wO2mhAgKW/ASlCnvmpVitiCzfCsqOZDGRgWKj+Mhw1bEWH2dKyvhk87GyDpbhoAAW1AHkVYeYHVs7BPA/cgmLLJAq3qey3nHTa8o0SR7w5azeS9yrhG6qn0iIniOkHZZwT2ot/byybC3qeUcBAdeHyNZ7ceTQVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NHCy4DuKN9F7W6AsOPSnaJ6eMCAlmaQ51Gvf2AIXLo=;
 b=Ikuov+lU9WC3CHONWLi4O+c39QsbIvUVFSGWXq+VhYjZsVqEy/uM+q5jgY2l84s98TDUkMI5HBUmUi5hs7/X2ZMKNI9u5MmpiDEpU5OqeqkWRrLcnyq/vI7WveSyaE0CJLEqV1iwzMH5h5QFmJc8ATX9heQPL3mB9fEqZMrYhYhpFLZ4GRZk91J8/katBGkWHdVxPOb3Cfp1Tj3ef134MVXHAtewTSx0M/0bO0puG+mqba4yTbN/jf+sBSVN5SlYWaHGfoO3YPmoN8UFvcM7reDs8p3E1aqKVRtEylV9abdbOMcBS9b+glo3Bq5/XNJPL6mXieIWs0XMbzS790uLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NHCy4DuKN9F7W6AsOPSnaJ6eMCAlmaQ51Gvf2AIXLo=;
 b=Z1P6PqCU6SgaZZ4OUPDvFBr8/9aSYzbwMYyHIV3je1AzXsmJJR7uHjyL/w2hQmsgYN5o4/8YPIj/V0ld8jkncu42zczFbXPaXuUIfz4i6UXiCAVBtM8ei2lwmefM4aVySHo1aqNLaRyzLPLAgvIbKy6gtbsri9WnLfN/mGoC2ag=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (52.132.180.155) by
 MW2PR12MB2348.namprd12.prod.outlook.com (52.132.183.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Wed, 12 Feb 2020 16:15:02 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::c15:4b9f:526:4736]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::c15:4b9f:526:4736%7]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 16:15:01 +0000
Date:   Wed, 12 Feb 2020 11:14:53 -0500
From:   Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
        Eric Yang <eric.yang2@amd.com>,
        Michael Strauss <Michael.Strauss@amd.com>,
        "Wentland, Harry" <Harry.Wentland@amd.com>,
        "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
        "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20200212161453.x6ijsoeitik2xfqn@outlook.office365.com>
References: <20200212094838.4465f954@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vejvm5ky6sii2nop"
Content-Disposition: inline
In-Reply-To: <20200212094838.4465f954@canb.auug.org.au>
X-ClientProxiedBy: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
Received: from outlook.office365.com (165.204.55.250) by YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend Transport; Wed, 12 Feb 2020 16:15:00 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07eebf53-cce7-4abe-29e5-08d7afd6b62c
X-MS-TrafficTypeDiagnostic: MW2PR12MB2348:|MW2PR12MB2348:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB234847AF0B708E85790EFCCB981B0@MW2PR12MB2348.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 0311124FA9
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10001)(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(8676002)(8936002)(86362001)(81156014)(26005)(956004)(6916009)(66946007)(16526019)(54906003)(5660300002)(316002)(2906002)(81166006)(66476007)(66556008)(186003)(44144004)(52116002)(6666004)(4326008)(1076003)(6506007)(55016002)(7696005)(21480400003)(966005)(9686003)(478600001)(2700100001);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR12MB2348;H:MW2PR12MB2524.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIvp6sTbT2175ByuhVgjTTG5OkT+TcuT3DpipmVsQ1I8P2Q6pJ+njMBP2+YW8RvduQxJLQmQB/8USfAynrz/AQ3Q9LO4qZTpIA8EHntbMebOTmIwfgIhinh9d0ENmeXzFyqU9Y7c7zS4x3sxwOYWWrgvbjdfZLdqsFUIVEhaaw+fxw0uv8wU0R8UJ4l6r1l0bEQPGZXscQumAzlAna8vVoUvkrRP78J+iimnud9V23eBCGzwwzWr0JQhhHJwcBo3TVKo8V5Dgc2i2aExzOAH3FOFOTbJnUdOd2tbfgSYabFnRPQ1I4ifI+YypSLAJBKaTqHkL9fo1AqX3woP+e2Fgtefe583XLfdK1AIXEfYFnJO/rZ7U51uPxkJP2IZ1LqFvMunePHm38BU0UUpkj9lQcOByOX1Iwt4DCSnYs5GOVDPjBc4BzQhS4wS1OawiO5D7vs66iukmg5rAdUe9iZ9OVcm4H/4bfUsMVi45EqE21NEtLwchyiC3MbD8hI54/iEbHAA3x1Dj3czPbqYrUYe6b/QXdsQ86bJ/4mHPsU922ykqO0OLbQ8TCDaS4/f/cqow/nCFErkl0eT3nhxv19TY341GUWlP6SYd7X/DyuMETwCJkJLL48b6lps/tVvyfbyybf3nwv2AAbnpXxT9ZzX3w==
X-MS-Exchange-AntiSpam-MessageData: xYi6t5M0xX4UAcRcjLfRCpuRPfPdk4PjhTM2y/vjvZDMQjx+8pK7dR8szlGYqhT1/mI6wHWbCOzVjHx+E5z7c+lAxonI+rBvNPE5fGqM3QPHOC8vamdNFBNJY5XIEBVDnvjwtaXfnvRNJ+YIWVGW9Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07eebf53-cce7-4abe-29e5-08d7afd6b62c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 16:15:01.2812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6a5tl57MhqKTn24SV8JbU5wh0PBoH3OCv1bac8E7MlOOqLOUPwnpefE862FmnZlz15VxbvwpqUrVUK1mRedSYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2348
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--vejvm5ky6sii2nop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

First of all, thanks for your report

On 02/12, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: "get_num_odm_splits" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefi=
ned!
>=20
> Presumably caused by commit
>=20
>   5bf24270d1cc ("drm/amd/display: add odm split logic to scaling calculat=
ions")

Today I managed to reproduce the issue with 'make allmodconfig', now I'm
trying to understand why my .config file did not trigger this issue.  At
first glance looks like 'make allmodconfig' does not add
'CONFIG_DRM_AMD_DC_DCN=3Dy' as a result files under
'drivers/gpu/drm/amd/display/dc/' directory does not get compiled which
includes the file that defines 'get_num_odm_splits'. I'm still looking
at it...=20

Thanks
=20
> I used the amdgpu tree from next-20200211 for today.
>=20
> --=20
> Cheers,
> Stephen Rothwell



--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--vejvm5ky6sii2nop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl5EJHgACgkQWJzP/com
vP8HZA//bMsHUtPkmCZU1U9+zoOm93x/vhDWl6lldWKubHKMkK0CmGbO4R6OuIbJ
++jKXShBuZ8kv5/37DgjxDMVSwTueH9pmti11cwiH4/OdlpArFBLpLRrfdrb0OEa
6QYcO9uDKEYRoSnXWfcNZQ0FXN8pCQRfaRhNBqVQwu04gr4U51XoIR2+yftOnaef
JgqTYzFcCXKVYW0OafgtEbFjCkOuwdq+kgScXL7NGfUShzB6djDINt4xeLeXed+O
CVVgchS/s6r4mvLAHaNxqVLj4o059dYh9wC56ScYbs45ejQHDNh1pDHP7v9FthX3
mV/iGQ1QUJYu/oTUJxoAroI1rMOZHz2airW+dMXEUlj38Tpj/L18nfJ4a/SRjqPj
+yStuaronhqbYFCUM5p5qWk/F31H21h5sZTf4btz5VeCUZD0DotVJkd1S3B+CIJO
9Uaqb87e0VMG/alZUlXxdmjkqNoNWSZ3/4Oexiv+0fJ1lL6YMiCsQO4yx7MRcrPU
FNKlxKARhn/OFJzdHHoo/5gFkw4pwbDUt1oXaZZnYohJ3UGc3976NJC6nwhnWo0s
3RhDQxtbpQcdHP9V7xqgw9qwnXNKE7roqmZkmSXa1jZIiLPyzzRNazNfUyV2HXmH
CKmqCHrWZpQMCl7ASj6+tJnQ47GmeQqQXmVWH8y6/TVg2e4an6o=
=PCSk
-----END PGP SIGNATURE-----

--vejvm5ky6sii2nop--
