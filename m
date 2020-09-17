Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED5726D56A
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 09:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIQH6K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 03:58:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgIQH6I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 03:58:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsTpz0LtWz9sTS;
        Thu, 17 Sep 2020 17:58:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600329483;
        bh=EPn/KIsEWg4qP+mChd9xQIyx9odP5Kr6Q7ENForP53o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NfRf3TJedGCwAsuVwPNV3NV986bOtiVKMfpnWTOqEvoSrtxLhL0qR09FlzLjGvs3G
         zgUPnFA2TDYggXYmwx5mfw9U1EB3SIruFt+vJwsHkvLCv4JSGwCjSUrtl3VjmdzJRI
         0Oiq1Iwl2gKrWLo686yCkifJ2cS3Z+7DffwKLNSYpCdk/LMQnfYoqptOBEvC/QzPkP
         Tg8Nt71YlB2g7j9ZZNAquXoKcluhTXbyOPLdAf5CYQuKeHsEWXWZdR+Am+jjIDuMew
         pP/78XbepgvagA1q6iZqsG4uZ5dskOyuI/UpB6XcvCIZVNCubcXiE0O8rIQnP1E7zp
         6F+ho5OkwdJ+w==
Date:   Thu, 17 Sep 2020 17:58:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-msm tree
Message-ID: <20200917175800.7a55e4fb@canb.auug.org.au>
In-Reply-To: <20200914121022.2c5c494a@canb.auug.org.au>
References: <20200914121022.2c5c494a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rFJhFWUqe0ohZy1McHleVwY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rFJhFWUqe0ohZy1McHleVwY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 14 Sep 2020 12:10:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-msm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c: In function 'msm_dsi_pll_7nm_i=
nit':
> drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warning: conversion fro=
m 'long long unsigned int' to 'long unsigned int' changes value from '50000=
00000' to '705032704' [-Woverflow]
>   882 |   pll->max_rate =3D 5000000000UL;
>       |                   ^~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")

I am still getting this warning.
--=20
Cheers,
Stephen Rothwell

--Sig_/rFJhFWUqe0ohZy1McHleVwY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9jFwgACgkQAVBC80lX
0Gyx8wf8DDIt3TppVeZWpG8t7e0f9t+UkOcrzJMcgwlpHf7jNowlP2qaZe1D2qlv
efLdmGI+XP8A9AL53dbEOSxY0NRDTBJBhwrEC5KcyieiHopGYaqUl+miE7K5rOx0
cuJWuGPt2SBJ88pkDmAKp41sxctnOSpNJukhz656P+rufUqIhDC1JZa9jIWyOYAY
KXurNu1+leiH/h3sxHayZIdFWvw6TBClwxUt1Al3Ml7p1xYj3LucCUTD926uj1nS
1XkFAobJcMkaEMtuVSiaGsvAD0QgcqLki0qmhapQPWsKr5UJHzx9XhVQE/sRBzVK
brYZYmkdbUwv4JnfWdTBQ8qZtj9Y8Q==
=+3l+
-----END PGP SIGNATURE-----

--Sig_/rFJhFWUqe0ohZy1McHleVwY--
