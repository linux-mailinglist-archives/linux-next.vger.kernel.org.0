Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA722AAF3E
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 03:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgKICQd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 21:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgKICQd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 21:16:33 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F791C0613CF;
        Sun,  8 Nov 2020 18:16:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTvkL02vKz9s1l;
        Mon,  9 Nov 2020 13:16:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604888188;
        bh=850yCADLEwMJTBdfiOiNR5gW6UAvBHPX20KTwrNsbUQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gsx+GOKEpNJJXuX5mz4J7KGzFd+DPyTw6PkCOpB6szbt71fHiW9IQixpJ7dBgnqfX
         /2l34HhfN6KYSFURw0i9+zBp9WUdo+cVrSuIQMREsY/sQrYIIS3Kq9hxTN4ZwmWfvI
         iLccCCCRaYl5gBi68PZeMa4R3jj83d5gcdA+3DSO7CTq9UZGqofILIQF0YMSVwVy5+
         Qay+zt5uI8qz4bhCZk2K3HBx9bK5mCr2JNzTbztVQTRysqT6JOl80s/ob0h7ZXslSZ
         xDEwr8+Aj3NbmANN9ZzpjZ/BMziXANev36wpfuwtwvofEW5YHZdYTZrg5pN1bsmAFV
         QnLbpI9uKH13g==
Date:   Mon, 9 Nov 2020 13:16:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the amdgpu
 tree
Message-ID: <20201109131620.10282da8@canb.auug.org.au>
In-Reply-To: <20201103142108.129da15c@canb.auug.org.au>
References: <20201103142108.129da15c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QD+vvGU3..AqhU0FwrDzcNR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QD+vvGU3..AqhU0FwrDzcNR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 3 Nov 2020 14:21:08 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>=20
> between commit:
>=20
>   e8a982355f96 ("drm/amd/display: Add tracepoint for amdgpu_dm")
>=20
> from the amdgpu tree and commit:
>=20
>   29b77ad7b9ca ("drm/atomic: Pass the full state to CRTC atomic_check")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> =20
> diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 28dcaae06993,86fd4420f128..000000000000
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@@ -6003,19 -5514,19 +6003,21 @@@ static void dm_update_crtc_active_plane
>   }
>  =20
>   static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
> - 				       struct drm_crtc_state *state)
> + 				       struct drm_atomic_state *state)
>   {
> + 	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(st=
ate,
> + 									  crtc);
>   	struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
>   	struct dc *dc =3D adev->dm.dc;
> - 	struct dm_crtc_state *dm_crtc_state =3D to_dm_crtc_state(state);
> + 	struct dm_crtc_state *dm_crtc_state =3D to_dm_crtc_state(crtc_state);
>   	int ret =3D -EINVAL;
>  =20
> - 	trace_amdgpu_dm_crtc_atomic_check(state);
> ++	trace_amdgpu_dm_crtc_atomic_check(crtc_state);
>  +
> - 	dm_update_crtc_active_planes(crtc, state);
> + 	dm_update_crtc_active_planes(crtc, crtc_state);
>  =20
>   	if (unlikely(!dm_crtc_state->stream &&
> - 		     modeset_required(state, NULL, dm_crtc_state->stream))) {
> + 		     modeset_required(crtc_state, NULL, dm_crtc_state->stream))) {
>   		WARN_ON(1);
>   		return ret;
>   	}

This is now a conflict between the drm tree and the amdgpu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/QD+vvGU3..AqhU0FwrDzcNR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+opnQACgkQAVBC80lX
0Gx3ZQgAnqiuf8lX60p47PxoyJnIyB1VLzkRmb5qqvefTrd7QvQtkMogzxTlxmXs
Z9KKj/l8L0e/Is6L4bxUDSJBuOnOIiGXMV0MScLTXzr+oTeuqgxS70+9FxUxdJ0z
jjAkBLswnFvloNJRE7QfRAh+2tgJ1Mwdk2WcZM8t5h3mDoCu+s6Bj18+BdG3Rl8M
kspmY5+pYq3as13aK+o6glpJ7UwIXG+cXAIboqg2L84/szLKt8MW6W5+mJZ8o1n9
TiRHQeElEWN7utjfDptkqcaH94fJUcTteT/iDqGRoLGMnRuo8CopfsLt4T2vlfo0
wv6tz1cHQFHKgGT2/CXBTuivMxOdXw==
=Nc+j
-----END PGP SIGNATURE-----

--Sig_/QD+vvGU3..AqhU0FwrDzcNR--
