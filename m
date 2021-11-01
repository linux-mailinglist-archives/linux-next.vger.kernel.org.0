Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D8E441583
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 09:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhKAIpD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 04:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhKAIpC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 04:45:02 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4270DC061714;
        Mon,  1 Nov 2021 01:42:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjRNx3Hdrz4xbC;
        Mon,  1 Nov 2021 19:42:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635756147;
        bh=zeBNRU97MSWpu1D2Ts3/Tp8r/3C233Ohd7glZC2TBJw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=c52KPRl251BVXF489gMOE2VQI7MZgyoDLzJR7/hJJw61N/sIcR+X2cZkA3e9+Od/q
         83luLwx7TN40+DeG5r6cy3xpqNlsdB7JEC8Haxg/ezWyt3B69aQPAujy1QGIKhnTB6
         fmhTXJxaLsj5ytHwOIM8EnCDvfrBYzdDRTC+0bphfvdP9LM5bxlAOfOhgwEcZulc18
         pZxc4s937mKthLXnaZXV/csQ+icDoiAPfVBEiTtiZFI1xAbqHvtKhCv7CABnS7SyAS
         k79pQEW9a95T8fstx62jFvezS5/CbcdL/1rS0sc+5XA8GaHdBGrqxddI+s5w/4baWV
         NI4GDm8Me8WbQ==
Date:   Mon, 1 Nov 2021 19:42:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211101194223.749197c5@canb.auug.org.au>
In-Reply-To: <20211015202648.258445ef@canb.auug.org.au>
References: <20211015202648.258445ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AvYxcYE9xVAnbawWvDaH9ME";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AvYxcYE9xVAnbawWvDaH9ME
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 15 Oct 2021 20:26:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/drm_modeset_lock.c:111:29: error: conflicting types for '=
__stack_depot_save'
>   111 | static depot_stack_handle_t __stack_depot_save(void)
>       |                             ^~~~~~~~~~~~~~~~~~
> In file included from include/linux/page_ext.h:7,
>                  from include/linux/mm.h:25,
>                  from include/linux/kallsyms.h:13,
>                  from include/linux/bpf.h:20,
>                  from include/linux/bpf-cgroup.h:5,
>                  from include/linux/cgroup-defs.h:22,
>                  from include/linux/cgroup.h:28,
>                  from include/linux/memcontrol.h:13,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from include/linux/regulator/consumer.h:35,
>                  from include/linux/i2c.h:18,
>                  from include/drm/drm_crtc.h:28,
>                  from include/drm/drm_atomic.h:31,
>                  from drivers/gpu/drm/drm_modeset_lock.c:24:
> include/linux/stackdepot.h:18:22: note: previous declaration of '__stack_=
depot_save' was here
>    18 | depot_stack_handle_t __stack_depot_save(unsigned long *entries,
>       |                      ^~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks w=
ithout backoff")
>=20
> This may only have been revealed because of another fix I have had to
> apply today.
>=20
> I have applied the following patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 15 Oct 2021 20:17:52 +1100
> Subject: [PATCH] drm/locking: fix for name conflict
>=20
> Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended lo=
cks without backoff")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/drm_modeset_lock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_mod=
eset_lock.c
> index 4d32b61fa1fd..ee36dd20900d 100644
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -79,7 +79,7 @@
>  static DEFINE_WW_CLASS(crtc_ww_class);
> =20
>  #if IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK)
> -static noinline depot_stack_handle_t __stack_depot_save(void)
> +static noinline depot_stack_handle_t __drm_stack_depot_save(void)
>  {
>  	unsigned long entries[8];
>  	unsigned int n;
> @@ -108,7 +108,7 @@ static void __stack_depot_print(depot_stack_handle_t =
stack_depot)
>  	kfree(buf);
>  }
>  #else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
> -static depot_stack_handle_t __stack_depot_save(void)
> +static depot_stack_handle_t __drm_stack_depot_save(void)
>  {
>  	return 0;
>  }
> @@ -317,7 +317,7 @@ static inline int modeset_lock(struct drm_modeset_loc=
k *lock,
>  		ret =3D 0;
>  	} else if (ret =3D=3D -EDEADLK) {
>  		ctx->contended =3D lock;
> -		ctx->stack_depot =3D __stack_depot_save();
> +		ctx->stack_depot =3D __drm_stack_depot_save();
>  	}
> =20
>  	return ret;
> --=20
> 2.33.0

This has reappeared today.  I don't know what happened to the drm-misc
tree over the weeked :-(

I have reapplied the above fix.
--=20
Cheers,
Stephen Rothwell

--Sig_/AvYxcYE9xVAnbawWvDaH9ME
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/qG8ACgkQAVBC80lX
0GyNiAf+Ms39LuFBShnOv9eD0ADdpHrEZTj45+fbpivngOM/Ezt/r5mrf5QEI2VN
DW6TpcExT8EnKmA6OmOVwJ8aoGfZagU6iyFOLd7JZ3rjxpJJTxTmzAPn8YQmBRAh
4Vkgl2CHv73+J6ptIuu+cHeqB75mIRsUJJ3Ig7sjhhdWncF7OQrWWXhLMSE0M6Lm
WQOzGOQm13QUKhGupADWHq1a5NoRiKpHR+dI6DnmgM0PTgM1PoVxqnfZ3UvGOQmi
eXsyUZbaK4EHqo5cn/0+p8/K6MpjVCupcrIr+dlJ9JPntducoFS3OzDpIhzgTBJL
kvN4/iz2JTwrvuMjVbDwdedpmJAi3w==
=9avb
-----END PGP SIGNATURE-----

--Sig_/AvYxcYE9xVAnbawWvDaH9ME--
