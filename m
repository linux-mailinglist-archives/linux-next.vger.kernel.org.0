Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74AB03DA309
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 14:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbhG2MZf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 08:25:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:35372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231674AbhG2MZf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jul 2021 08:25:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6BE760EFF;
        Thu, 29 Jul 2021 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627561532;
        bh=cTdmOQArPn6ATSTILiIII5np66XMW0StBSbvfoNKh/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MPi4DVs9K6K7HOerpcXnPq0YSf5HJirjjVTuSp8ZaPgnsK7SMuqvMdcWJesAUgjuS
         +E8ZEV0BVSU9pG4VeRO9+N3nTkquH3vZTGJAZwi69txRD6yKa1hopE0ZGKVQ2EG5Ie
         +GZeYtmPTLJlD5cE5GOHJ7Lo3z/tafwMtbArMbS4oZOWPCUKh7YkxKtnQSFDUSNjXL
         La8VKPyr3CtfqCuSZZkAkxFUts/MCVgSEe7vlupdShDbmghX84n5UGkqUfqLjwPodg
         69W2zt7FLtFA1LXE1JVRWkPYPp7KrMo7PukN1+BuqPB6p4XNx6AplGzCZwePslkEzW
         uDXI0drOJOoCA==
Date:   Thu, 29 Jul 2021 13:25:21 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: linux-next: manual merge of the drm-msm tree with the drm-next
 tree
Message-ID: <20210729122521.GM4670@sirena.org.uk>
References: <20210729111027.33028-1-broonie@kernel.org>
 <2306c0c4-1312-fcc7-1ed3-406fbd72cf63@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/YEZ/b5VMxfka8q2"
Content-Disposition: inline
In-Reply-To: <2306c0c4-1312-fcc7-1ed3-406fbd72cf63@amd.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--/YEZ/b5VMxfka8q2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 01:44:42PM +0200, Christian K=F6nig wrote:
> Am 29.07.21 um 13:10 schrieb Mark Brown:
> > Hi all,
> >=20
> > Today's linux-next merge of the drm-msm tree got a conflict in:
> >=20
> >    drivers/gpu/drm/msm/msm_gem.c
> >=20
> > between commit:
> >=20
> >    60f800b2bdfa ("drm/msm: always wait for the exclusive fence")
> >=20
> > from the drm-next tree and commit:
> >=20
> >    1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> >=20
> > from the drm-msm tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc drivers/gpu/drm/msm/msm_gem.c
> > index 39c35414d7b5,5db07fc287ad..000000000000
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
>=20
> thanks for the fixup, but something went wrong here. The diff is just emp=
ty.
>=20
> Any idea what's going on?

The change modified a function that is simply deleted so the resulting
diff was empty.

--/YEZ/b5VMxfka8q2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmECnjAACgkQJNaLcl1U
h9ClJAf/TWC+oENJPpeknzNXIUrMCfFPHDQWjRJnEUz2iV11i4T52TRBBNTS+AdE
3A+vO8jkqOpikm4CxmsnZ0avYr5r5N7eTdyDXNwkjqSPvbM8hGnbumtw6z5K/psD
tvaU4lmnYLsQsF0Hvlw5kJHeA9eyyLWzpDn0p2seJSTOMOZZJDRwI0hBsTVaWiky
XY5Uf7+KWMOdJTVXA2nqIw+2I3VI3Mii4mlhGYlTZMK0CFIlslLk+vklTQG3Uh/d
fYoWQvPWtcR6yjmxPBOz1dm9JaReNPW1uezE2V0Tm6S57XS3RO/3mr2h8FEt1Qd6
C35aONXyWUQgyo5yCH4OekASQSYJWA==
=MA7d
-----END PGP SIGNATURE-----

--/YEZ/b5VMxfka8q2--
