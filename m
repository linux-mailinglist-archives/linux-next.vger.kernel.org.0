Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415838C9CA
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 05:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfHNDB4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 23:01:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45991 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfHNDB4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 23:01:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 467Z9s0Lz5z9sNp;
        Wed, 14 Aug 2019 13:01:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565751713;
        bh=G7TA1FgQY5xyFwXvPhiSM4ybVZ5VkU9A/oH3axymBjk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VJ9t/yRqnX1Peo7B0l9n9i2kfHKghZGAO4cn1u8h7JxPUzX/GB5OWuBcrZNVMKRal
         lStDPU/9gniEt0Jy4Dib0AHKqKzXWkuWiXIDEn4dfnoB4mbdVS0qWOoApqK6EdaKsG
         FrjCismGfiKWdMpnO4PKo4GR2p8ooM84qlp4+A03XmEcE+47sOK653UsEEwp0e6dfw
         4fvanpBrPXd9AUbtrwwJySZN46y/eFwRFAXrJQzWVMjxMyUQ7fOSm/0osgQFk1g9WQ
         ts8MCyIDhbh3TKMtqEYL4s1+n/VJHMS4v/GXMuwvABiqna+46BmqQ3v5JEZ1X9jzRJ
         NWrDUMjyekc3w==
Date:   Wed, 14 Aug 2019 13:01:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20190814130152.129e86d1@canb.auug.org.au>
In-Reply-To: <20190814125859.35c1a2ca@canb.auug.org.au>
References: <20190814125859.35c1a2ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9=kbS_Ym36rpqk1vELFy8bT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9=kbS_Ym36rpqk1vELFy8bT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 14 Aug 2019 12:58:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-msm tree got a conflict in:
>=20
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>=20
> between commit:
>=20
>   e78ad7654179 ("drm/msm: Use drm_gem_fb_prepare_fb")
>=20
> from the drm tree and commit:
>=20
>   ddc73f32ba95 ("drm/msm: drop use of drmP.h")
>=20
> from the drm-msm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 8cf0b8a4ed03,cd6e9bb1fedf..000000000000
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@@ -10,9 -21,9 +10,10 @@@
>   #include <linux/debugfs.h>
>   #include <linux/dma-buf.h>
>  =20
> - #include <drm/drm_damage_helper.h>
>   #include <drm/drm_atomic_uapi.h>
>  +#include <drm/drm_gem_framebuffer_helper.h>
> + #include <drm/drm_damage_helper.h>
> + #include <drm/drm_file.h>
>  =20
>   #include "msm_drv.h"
>   #include "dpu_kms.h"

Also in file

  drivers/gpu/drm/msm/msm_atomic.c

with resolution:

diff --cc drivers/gpu/drm/msm/msm_atomic.c
index 169d5f915e68,20387be1b810..000000000000
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@@ -5,7 -4,19 +5,8 @@@
   */
 =20
  #include <drm/drm_atomic_uapi.h>
 +#include <drm/drm_gem_framebuffer_helper.h>
+ #include <drm/drm_vblank.h>
 =20
  #include "msm_drv.h"
  #include "msm_gem.h"

--=20
Cheers,
Stephen Rothwell

--Sig_/9=kbS_Ym36rpqk1vELFy8bT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1TeaAACgkQAVBC80lX
0Gxg1Af9Eln97X1hb3IR2+fovPLB9B/4rRWFj5o0IcDHMXxKIwUTQp2ZyLdffrPm
zJG3JnZpeRUFGxJvxfHLaF7X9KDXLbe0usEOOUsPWX6jsbLQ2lljojRyNabLkvk4
tET+s+5pz9V41QGtDp7i1SjxY6Zi62OsCqmhbMTJeZ6OjcyR/RAZYyRJP9Qa1WZ4
h7BkzR97EUdqvDgb6D4VQqzvcJdF52aXlSBLILDOBkD1D/vD/Zooz3JOT667ZSSY
w0B1r1xp2P4bcqQdZGrfPPnlbr1pcK30+gveJ7WjMm78c5GJQRjAqBgUiQKOBXeX
gva/XLahskhdSDZ3LTG4d5s2BbxT3w==
=qNqU
-----END PGP SIGNATURE-----

--Sig_/9=kbS_Ym36rpqk1vELFy8bT--
