Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1C6325B51
	for <lists+linux-next@lfdr.de>; Fri, 26 Feb 2021 02:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhBZBap (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 20:30:45 -0500
Received: from ozlabs.org ([203.11.71.1]:60879 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhBZBao (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Feb 2021 20:30:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DmsXT46Zyz9sRR;
        Fri, 26 Feb 2021 12:30:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614303001;
        bh=vYjrrdyz1D/kTP8EJO28hOD7aS7TC14WbbTGWFOeKZU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mpRiaTe9CUqTzWGQMaiI0Qtrt7z7mwST2bQDBPaP3gapXZaiYAxzL1ufWfizWraGf
         c6ct7/KMHsWHaFle4WUqtYyXv8GAcqM3WzWETu5HcXW/Xa/KUJjMljd+3jbXSUDa1V
         D53wUWDLlHQJjxVyKdddyIzjiUq0K5SvNF/tJ/UucdNdykYGe9XiAJT1U+X9UGCt/4
         GOblJAGfA3+1b1H8qUaSFFGlTdBaIRt41HmytgutXokXTR1NwEtSkf80i7dRqFRYG4
         jlNMo/rkCf+ZWzI4IrtUNwIm5fJERLJ3ifR0jzH5PKjr1E5TQ8eIRcJvjJ7gPNjdZG
         sjfNqexUpPFxQ==
Date:   Fri, 26 Feb 2021 12:29:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the amdgpu tree
Message-ID: <20210226122959.68baae71@canb.auug.org.au>
In-Reply-To: <DM6PR12MB29394B1C0B88CE17F8CB98D4FB9F9@DM6PR12MB2939.namprd12.prod.outlook.com>
References: <20210224132849.439973d5@canb.auug.org.au>
        <DM6PR12MB29394B1C0B88CE17F8CB98D4FB9F9@DM6PR12MB2939.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X_Dy=2M5J5cizqhC1tYETbg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X_Dy=2M5J5cizqhC1tYETbg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 24 Feb 2021 04:09:31 +0000 "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>=
 wrote:
>
> [AMD Public Use]
>=20
> Hi Stephen,
>=20
> Thanks for your feedback. I will submit a fix for the warning.=20
>=20
> Thank you,
> Lillian
>=20
> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>=20
> Sent: Tuesday, February 23, 2021 9:29 PM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Zhuo, Qingqing <Qingqing.Zhuo@amd.com>; Linux Kernel Mailing List <li=
nux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kerne=
l.org>
> Subject: linux-next: build warnings after merge of the amdgpu tree
>=20
> Hi all,
>=20
> After merging the amdgpu tree, today's linux-next build (htmldocs) produc=
ed these warnings:
>=20
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:380: warning: Function =
parameter or member 'vblank_lock' not described in 'amdgpu_display_manager'
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:380: warning: Function =
parameter or member 'vblank_workqueue' not described in 'amdgpu_display_man=
ager'
>=20
> Introduced by commit
>=20
>   3cfd14b67b2c ("drm/amd/display: Fix system hang after multiple hotplugs=
 (v2)")

Those warnings have now made it into Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/X_Dy=2M5J5cizqhC1tYETbg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA4TxcACgkQAVBC80lX
0GzYrgf+NfUhdLD7RUasSa+Xe9vWxrYrhv7xKl/NMCPB0UO/nYzbPsSA6Yy2WGgW
6FF7no1esSZNERv2mUuItOncLxexrFNVr0LwQHHdsSeb1rkrdAU6N3WobJxEefgf
+82ZkzvjuzYxTWlEZ8IS1nsQDLBRfIVD+viw3eagRWmPsyf1qNQlKUaQ417Y9RuE
NIcKRiyyHK2Uv+F+j/D8i+lP+IcDCsdZRAK2Q10+Mp1Hdj4s83xglDK0j4S16A8q
qvXxnqbT/jdwnldHHnDONnws32dQayi1q/pswPSOQw7PzWIv6hcrEfjIHEgmSLE0
r6zCkN27SM59Ol9BFiFDJbaVhXat5g==
=W/MH
-----END PGP SIGNATURE-----

--Sig_/X_Dy=2M5J5cizqhC1tYETbg--
