Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B25206998
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 03:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388192AbgFXBgq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 21:36:46 -0400
Received: from ozlabs.org ([203.11.71.1]:48225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388035AbgFXBgq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 21:36:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49s5N82Wjnz9s1x;
        Wed, 24 Jun 2020 11:36:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592962603;
        bh=hE3syjjpUgG/Yw3Us91XR89PrAnJarPgCLuOWZUvYw8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FfUXPXnfgv1ztc/UbzBPlufFtMePjIrT24YQKhePA3w0oCrMQmKMpA+MbMUC3dfZR
         QzW5vTErerNe2PCTg/nTaS0SscjVjh9kdFQMI/Vyr+bVmLP/cL/L9fgPG+FInE9d7I
         8SgsuTPdqectA0WS3H8Sr7niwvh1Ul0kquJ78sLW/Cftoy22z1T0XWWx4F1+C2py6+
         GcWR/W92W33OLI093JAYfW0w1Xjrq/2W5YOn+ezBNDaiWG4MJLdrHhYGwe8FATuTq4
         qaTs09aSM6ViTdOcQN0PYZVmmKDtm+oUNKuC2Y0pN86oQ7Cv9nP4bNZJEmxvvGETby
         auvZU//J8Hb7w==
Date:   Wed, 24 Jun 2020 11:36:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200624113452.54b72fcc@canb.auug.org.au>
In-Reply-To: <20200617105929.534edd34@canb.auug.org.au>
References: <20200617105929.534edd34@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8DN3z5BV6jK2fslpma_1rH2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8DN3z5BV6jK2fslpma_1rH2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 17 Jun 2020 10:59:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c: In function 'amdgpu_amd=
kfd_gpuvm_free_memory_of_gpu':
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1357:2: error: implicit =
declaration of function 'drm_gem_object_put_unlocked'; did you mean 'drm_ge=
m_object_put_locked'? [-Werror=3Dimplicit-function-declaration]
>  1357 |  drm_gem_object_put_unlocked(&mem->bo->tbo.base);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |  drm_gem_object_put_locked
>=20
> Caused by commit
>=20
>   ab15d56e27be ("drm: remove transient drm_gem_object_put_unlocked()")
>=20
> interacting with commit
>=20
>   fd9a9f8801de ("drm/amdgpu: Use GEM obj reference for KFD BOs")
>=20
> from Linus' tree.
>=20
> I have applied the following merge fix up patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 17 Jun 2020 10:55:32 +1000
> Subject: [PATCH] drm/amdgpu: remove stray drm_gem_object_put_unlocked
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index b91b5171270f..9015c7b76d60 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1354,7 +1354,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>  	}
> =20
>  	/* Free the BO*/
> -	drm_gem_object_put_unlocked(&mem->bo->tbo.base);
> +	drm_gem_object_put(&mem->bo->tbo.base);
>  	mutex_destroy(&mem->lock);
>  	kfree(mem);
> =20
> --=20
> 2.26.2

This fix is now needed when I merge the drm tree :-(

Given that the drm tree is based on v5.8-rc2 and the commit from Linus'
tree above was merged before v5.8-rc1, the above patch should be
applied to the drm tree (and should have been part of the patch that
merged the drm-misc tree).  I am a bit suprised that the drm tree
currently passes CI.

Sorry, Dave, for not cc'ing you in the original report.

--=20
Cheers,
Stephen Rothwell

--Sig_/8DN3z5BV6jK2fslpma_1rH2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7yriUACgkQAVBC80lX
0GwNcAf/QqzDnDku/39dtXLSK2VfBLF7RPUofetUB1100VAIApOXKASbrnlJP5Hh
cDGYnEca819sC97bqgzGp8TqgfB2CiepISTcdmFVqd/5HQHWvr9LF4TmfmZ4wnzP
T4vquiMRi//Br6kJs2lCjcDsitdYcBcBfmXhVLmaauMVBh66L3Vc73UOR73X/nq7
4gEMZI39gzvXkrhQ5bCp+fuVYiRtWv8387hqoC9A+c7hNagyI3lpGhnfO9rxvmZh
eHvbfoqazGO4HDEUyxlVnrZqfv/4H65m8LECSWsPoma0uI5bD6Z/KtmjwipU8Rtf
DFyYpyk1TudS4z4rMy7aLtTYaAt1hg==
=ZvId
-----END PGP SIGNATURE-----

--Sig_/8DN3z5BV6jK2fslpma_1rH2--
