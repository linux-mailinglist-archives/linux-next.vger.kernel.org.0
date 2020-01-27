Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558FA14AC6A
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 00:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgA0XJN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 18:09:13 -0500
Received: from ozlabs.org ([203.11.71.1]:40905 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726164AbgA0XJN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 18:09:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48656B6LLXz9sNF;
        Tue, 28 Jan 2020 10:09:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580166549;
        bh=Lee0wghCHwfvG/dzrUHoE66Ck0s/ZaMLkLJ+nlT/0rc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TbMlOArIxRnWUdkNloo/Qe4xvugQ6tNq7SRlev/JvSsL+1hxPU83t3xQzppSTen/i
         GaXDowQQPQya6moo9SPI4p4RXnI3b/adEc9BNRxLOehk4Sz2o+8K3W+QzUGvnv4A1p
         51qqKlWk8hIwlXHEVdqWHzSVf0QSYawtS/36SBDxwf8/CIhYKxBAEx/WxQwlmsl1yy
         Cy6vl/1ORlP201qfO8tpgkp9VuJXyGB2u/Y53YD62aM4kF0Q2JNYszxIJJ1W84nijA
         2vXfrcP5Ok/VfCYVT9UYyzClUQPy0zkvxn/0hsULUbfYNdQuCVC2Kpf+wvDTfar0OC
         up/zXQQfbGHxg==
Date:   Tue, 28 Jan 2020 10:09:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>
Cc:     Christoph Hellwig <hch@lst.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Auld <matthew.auld@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: linux-next: manual merge of the generic-ioremap tree with the
 drm-intel tree
Message-ID: <20200128100906.12a51b44@canb.auug.org.au>
In-Reply-To: <20200108170803.1c91b20d@canb.auug.org.au>
References: <20200108170803.1c91b20d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/297FrBGGBY7qmNBqHuQblq4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/297FrBGGBY7qmNBqHuQblq4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Jan 2020 17:08:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the generic-ioremap tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/i915_gem_gtt.c
>=20
> between commit:
>=20
>   2c86e55d2ab5 ("drm/i915/gtt: split up i915_gem_gtt")
>=20
> from the drm-intel tree and commit:
>=20
>   4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")
>=20
> from the generic-ioremap tree.
>=20
> I fixed it up (I used the file from the former and added the following
> merge fix patch) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 8 Jan 2020 17:04:59 +1100
> Subject: [PATCH] fix up for "drm/i915/gtt: split up i915_gem_gtt"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/=
gt/intel_ggtt.c
> index 99189cdba8a9..1a2b5dcde960 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -801,7 +801,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, =
u64 size)
>  	 * readback check when writing GTT PTE entries.
>  	 */
>  	if (IS_GEN9_LP(i915) || INTEL_GEN(i915) >=3D 10)
> -		ggtt->gsm =3D ioremap_nocache(phys_addr, size);
> +		ggtt->gsm =3D ioremap(phys_addr, size);
>  	else
>  		ggtt->gsm =3D ioremap_wc(phys_addr, size);
>  	if (!ggtt->gsm) {
> --=20
> 2.24.0

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/297FrBGGBY7qmNBqHuQblq4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vbZIACgkQAVBC80lX
0GyPUwf/cOdH8wGIQF8qDXYMHIg7zAjgBwqmSw20bgsp8uol38cquKMzkcYUu75A
bAPpcHWSqTuIpZLg77W4Ne6oty9YbkqcMKtPyz5gOBZaNShSLRBN7jJwpqwQu1Ct
hJ3erBLNpklZjqOzFtQfPJm8FDQrQzHy/iRyfex+R90pjVcZEXP1vZlDN0o3LWER
9HysEeK/qjYY1bu79Bd4sHp/Cg+B8RNXCI1Tf9rlo1hgKoeqVTBeh1qLyQ9iU+NJ
/nRgPlQK1VpidM1mj2PLmVuzZS0QdAt6ArL6nLQFepvRX+v0arUaD/hsaeT8UVMD
S8muodtczl45alwxZxOB1EnV7KDAxA==
=KJKx
-----END PGP SIGNATURE-----

--Sig_/297FrBGGBY7qmNBqHuQblq4--
