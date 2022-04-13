Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27394FEBD0
	for <lists+linux-next@lfdr.de>; Wed, 13 Apr 2022 02:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiDMAMl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Apr 2022 20:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiDMAMh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Apr 2022 20:12:37 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A842A279;
        Tue, 12 Apr 2022 17:10:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KdNJl28pNz4xLS;
        Wed, 13 Apr 2022 10:10:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1649808615;
        bh=EVFOUzA5JLcwY6/XtoHPpmTyw16RQs66BduNRGsxnto=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hZmPURVpaqAizSN2J/qnu61+GG3pjrcIdSEY9iXhe0YiKNwG2UIq7x0Gyjp4s2/Av
         fO4a+VCShDMTG/PxIZXt0bsKvGYiEO988nv3ahbvj+nZzvpnRj//uwK3mYskAmLkHb
         rON07DYWhnU8zBBUHIi6ty803Ffv4RrkOQ28ThDw9v8Rus1aHch4xfjZ+5pw2s+noc
         PvoiN8CS86paQ7uYWJ/0LziOFcmXG42Dk/3nKODbLFokOWiE15NSrS1o7mxz8fWOfs
         szO8IC1AYAOLkquES6QRJ0tcB12p6sQV+8g26Y5fgTyPBEwVHyxJDQwlPAnPi582iY
         w/23HrAwhWcRg==
Date:   Wed, 13 Apr 2022 10:10:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-misc
 tree
Message-ID: <20220413101014.6b6c4db2@canb.auug.org.au>
In-Reply-To: <20220406103405.299c06b9@canb.auug.org.au>
References: <20220406103405.299c06b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W0BVo/W6EWR0DXAkkUO0Fz0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W0BVo/W6EWR0DXAkkUO0Fz0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Apr 2022 10:34:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>=20
> between commit:
>=20
>   fee2ede15542 ("drm/ttm: rework bulk move handling v5")
>=20
> from the drm-misc tree and commit:
>=20
>   184a69ca4d41 ("drm/amdgpu: separate VM PT handling into amdgpu_vm_pt.c")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (I used this file from the latter and added the following
> patch) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Apr 2022 10:28:53 +1000
> Subject: [PATCH] fix up for "drm/ttm: rework bulk move handling v5"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm_pt.c
> index 958d7ed97882..a29933fa001f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -630,7 +630,14 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_ba=
se *entry)
> =20
>  	if (!entry->bo)
>  		return;
> +
>  	shadow =3D amdgpu_bo_shadowed(entry->bo);
> +	if (shadow) {
> +		ttm_bo_set_bulk_move(&shadow->tbo, NULL);
> +		amdgpu_bo_unref(&shadow);
> +	}
> +
> +	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
>  	entry->bo->vm_bo =3D NULL;
>  	list_del(&entry->vm_status);
>  	amdgpu_bo_unref(&shadow);
> @@ -653,8 +660,6 @@ static void amdgpu_vm_pt_free_dfs(struct amdgpu_devic=
e *adev,
>  	struct amdgpu_vm_pt_cursor cursor;
>  	struct amdgpu_vm_bo_base *entry;
> =20
> -	vm->bulk_moveable =3D false;
> -
>  	for_each_amdgpu_vm_pt_dfs_safe(adev, vm, start, cursor, entry)
>  		amdgpu_vm_pt_free(entry);
> =20
> --=20
> 2.35.1

This is now a conflict between the drm tree and the amdgpu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/W0BVo/W6EWR0DXAkkUO0Fz0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJWFOYACgkQAVBC80lX
0GzHYQf/XJ/uqXCJmI1AIMq26uOLqPK6VhkK1DAd6t9xFJZM9ypVmQjTt/N42TwZ
xKbjN0FTHuSJiPbe4/0K+5691bAFKDkxdnNGecK9qa1WiWpLtC6b+rTd6HMA2K/r
APSeLxmpxjPEHFDyeEyxzLh+1IOt+tvHOetc+wSs1nXyQfPHjFpyoOvmEj94bW6h
Pc/oxxdtIvIZOeKjP5dD0/d3B8vGLl0ph5zr4OXc2ojo7cgcZ6Ijm3zvRnN9xtsB
hi0I6e2V+9lu20NMU4ryXp4iTr1aMYS4JuUvFDECuj1wuJ37N6vmccC4rt7IvbQI
bvxsI7ECfG3h6bdwUdgYk5147a4dgw==
=5tNt
-----END PGP SIGNATURE-----

--Sig_/W0BVo/W6EWR0DXAkkUO0Fz0--
