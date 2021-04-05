Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDD435488A
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 00:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237663AbhDEWL4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Apr 2021 18:11:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237174AbhDEWL4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Apr 2021 18:11:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FDlHl6xSkz9sVb;
        Tue,  6 Apr 2021 08:11:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617660708;
        bh=g9561A/LKoImkZIWByyngIzNhct6ImC/xswGlR8c0Ns=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TI0JcoOsQACu4gUOoN+UgyJ2xsmK38udX9/QI+80azZ/mjKk4tn/AicWdVvGRvnnp
         KfOIMh9GsyQBIrrYC2QZPyqVVNZAgCS5up6LsM2kcWl1rzoLtvdVJ0SDNUX3/gD0yz
         rdWi4z7zLvONbkCJ7EWWW5CnhSqJ2bir+lpGqdqmev7Bk7OPyY6qwsbonJHEtvGosb
         yj4ED+KsoFxwgz8Dt9J45BeTIDU34gqpV5bvMCdNMOWRmCObGcexP2R9gAbhMn7+6D
         umrDVbABuyrLgInGyI4Z08ERZLWy/MKyYdny7mT6Dg4/7Iv5eVtn3XfzNvh46rFnBF
         3owfMM0z9DiBw==
Date:   Tue, 6 Apr 2021 08:11:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc
 tree
Message-ID: <20210406081147.7a5332ed@canb.auug.org.au>
In-Reply-To: <20210406081100.4a866aa6@canb.auug.org.au>
References: <20210406081100.4a866aa6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PS3gypCrJ6VuHnM3bnpmuy+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PS3gypCrJ6VuHnM3bnpmuy+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Apr 2021 08:11:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> Commit
>=20
>   3b493ac0ac04 ("arm64: dts: allwinner: h6: Switch to macros for RSB cloc=
k/reset indices")
>=20
> is missing a Signed-off-by from its committer.

Sorry, that commit is in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PS3gypCrJ6VuHnM3bnpmuy+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBriyMACgkQAVBC80lX
0GyW8wf+Om4Pwfwgk0aNZOcJXW8EyisX4Py6vuNrAPvVNNzsJRLxW4WZPMaTj5LG
PnRo+hEKj0Kn48RgN6DoJ/xf7eVx5FNhdeDCV2KKe9NBYzF6cW+9MCjr357p+qwA
sPil7p+apVUvev3b/SPyOziKhnweMmgmSiklDw6UANpblZXc6ks3TvV3D/VLl2Pz
d0Jy3K8JjTpMA1OLJz0dzw8A4OQW2SWPKXpoZx9RfoY1WRgkntBtOs14kp4Zvi3T
YJsmFMxV4bzq8Y3tiaKqEV+w6Okb2g3mRWotuBIeCYTdTK0WOnCf7AjUO1Obhvgm
UYh4nh74tuCxxePEe/fAKg2kOmECBg==
=zEzt
-----END PGP SIGNATURE-----

--Sig_/PS3gypCrJ6VuHnM3bnpmuy+--
