Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5809D38BBD9
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 03:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237627AbhEUBqq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 21:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237548AbhEUBqo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 May 2021 21:46:44 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF544C061574;
        Thu, 20 May 2021 18:45:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmTvL4zJ0z9sRK;
        Fri, 21 May 2021 11:45:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621561520;
        bh=iEOCz9qR8arWskbdULZRl2jgRo6Knjh5dKYZ8jhu/Jw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OqNEZVGcqPVQYcmHH3/Zb6dADrlmnRUgYMdFnXDcgN0AFHdx87nKUnYhzPQm7YwZh
         tXSiYJzNPWu0vEu2+vAFry4p/P78Ywkkl4HrKQa91VjapQP4McgDJRbckTknDYPQ65
         bwhrVn7MxDaMRUvGgoSgNjWQIWygVMBnfRFeSUzBLCufLurnxslDBHAWgs8E1hpe2c
         rA1MXK4DqxI963w8/O65OT+GReUsH1oQgeRENgDLcierbNxvLfPztDzLqG71xavRI7
         apY5tt1B7z/Fi/TlsYgiGAZFnAfeRr9VJJbNwFepHH2pyGHprcNHSTaK6MAExaVsuZ
         aDB4y0MDIjORQ==
Date:   Fri, 21 May 2021 11:45:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        James Ausmus <james.ausmus@intel.com>,
        =?UTF-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20210521114517.4142ad73@canb.auug.org.au>
In-Reply-To: <20210520101910.26606a78@canb.auug.org.au>
References: <20210520101910.26606a78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pg6YS3gjPVSluMgd_C8D.Z/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pg6YS3gjPVSluMgd_C8D.Z/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 20 May 2021 10:19:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-intel tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/i915_mm.c
>=20
> between commit:
>=20
>   293837b9ac8d ("Revert "i915: fix remap_io_sg to verify the pgprot"")
>=20
> from Linus' tree and commit:
>=20
>   ec279384c6a0 ("drm/i915: Initialize err in remap_io_sg()")
>=20
> from the drm-intel tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/gpu/drm/i915/i915_mm.c
> index 9a777b0ff59b,25576fa73ff0..000000000000
> --- a/drivers/gpu/drm/i915/i915_mm.c
> +++ b/drivers/gpu/drm/i915/i915_mm.c
> @@@ -82,13 -46,8 +82,13 @@@ int remap_io_sg(struct vm_area_struct *
>   		unsigned long addr, unsigned long size,
>   		struct scatterlist *sgl, resource_size_t iobase)
>   {
>  -	unsigned long pfn, len, remapped =3D 0;
>  +	struct remap_pfn r =3D {
>  +		.mm =3D vma->vm_mm,
>  +		.prot =3D vma->vm_page_prot,
>  +		.sgt =3D __sgt_iter(sgl, use_dma(iobase)),
>  +		.iobase =3D iobase,
>  +	};
> - 	int err;
> + 	int err =3D 0;
>  =20
>   	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
>   	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) !=3D EXPECTED_FLAGS);

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pg6YS3gjPVSluMgd_C8D.Z/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnEK4ACgkQAVBC80lX
0Gw6YAf/aeg4JrR4rCb8nASAZb0h7i4+5RVa9o7ZUEmUSB3efm7BJa7RPlbIzgfz
uXUc8dk1E01ehMuGXEUQM1wCMAsIR4OaHacgFw79w6b/hUpcHxl60uhmr1PEceYT
+rTiqfdL+Z3aCSlMdt94F6UUQ2uMZCm15zXG5FzZxFUrvs7y/Hf5caWCJv37VVIi
hs7eRDLBDSQ7ty5R2Cp5f2pHluoqkjgzI2SQdPm/I4E8D/1Izc9U13oPsaT3SWz2
2lbqslTyLw5tHhFyAMqkENuVu2g4pIh9hEQJxkomZNR8BmGzObYaojt/hkGd3jO4
w+307JGIfTNtJ19Q4YRgj6fnbCnnvA==
=rRoU
-----END PGP SIGNATURE-----

--Sig_/Pg6YS3gjPVSluMgd_C8D.Z/--
