Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C4743D97A
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 04:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhJ1Cue (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 22:50:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56635 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhJ1Cud (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 22:50:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hfqjw41TSz4xcC;
        Thu, 28 Oct 2021 13:48:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635389285;
        bh=98LBQjd8SWx4eW7nPK8+c9joxFzfiz5GTPiWTgydAcs=;
        h=Date:From:To:Cc:Subject:From;
        b=BXwKl3YwpQqZPI9CUL6DwHMG9qVb3m8ooBZ/0i1DP5inGI0Qj3yPqpJNY8HdD1gm1
         SvxFlsDs05DjO+alxmz7LDBB4mC9/Ei7Xhts9LIAM06QJYs5OpQ//MnqCPSFaPzIrU
         lAIBjq4SsjG2UULppdDtfdSnObUILS+L96wV7JfDDiv0UQp0m7id3VpuPJHlL7Pfu0
         SLCBGZW7gg0Wv4PFhBI7iZGQ/jDNCs6McwaIDCLJMreY+Qv5QfbftvS3BSJYOGFaJQ
         1D1zJ6MFIv9NP0wyw92Q5OyVRkKK/gdI+nMHr/QPqgCqHXfRA8J/hrzfGCQRSCpfwc
         lz4mWzHmTrVzg==
Date:   Thu, 28 Oct 2021 13:48:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20211028134802.5740588b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3/XP01o0t4L5C5=_jC4K1.9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3/XP01o0t4L5C5=_jC4K1.9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/kmb/kmb_drv.c

between commit:

  c026565fe9be ("drm/kmb: Enable alpha blended second plane")

from Linus' tree and commit:

  099afadc533f ("drm/kmb: Enable support for framebuffer console")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/kmb/kmb_drv.c
index 961ac6fb5fcf,7e1fda9f9a3d..000000000000
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@@ -172,10 -173,11 +173,11 @@@ static int kmb_setup_mode_config(struc
  	ret =3D drmm_mode_config_init(drm);
  	if (ret)
  		return ret;
 -	drm->mode_config.min_width =3D KMB_MIN_WIDTH;
 -	drm->mode_config.min_height =3D KMB_MIN_HEIGHT;
 -	drm->mode_config.max_width =3D KMB_MAX_WIDTH;
 -	drm->mode_config.max_height =3D KMB_MAX_HEIGHT;
 +	drm->mode_config.min_width =3D KMB_FB_MIN_WIDTH;
 +	drm->mode_config.min_height =3D KMB_FB_MIN_HEIGHT;
 +	drm->mode_config.max_width =3D KMB_FB_MAX_WIDTH;
 +	drm->mode_config.max_height =3D KMB_FB_MAX_HEIGHT;
+ 	drm->mode_config.preferred_depth =3D 24;
  	drm->mode_config.funcs =3D &kmb_mode_config_funcs;
 =20
  	ret =3D kmb_setup_crtc(drm);

--Sig_/3/XP01o0t4L5C5=_jC4K1.9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6D2IACgkQAVBC80lX
0GzidAf+PsQyEkcawbqlQpxrML1k30a4myJfKSuDO8FjVyUwScJ+/jKC4xpDQP2d
WyX8z60qsqPHiLR9//9madIPs1QlKUDCRIxPPdRI8CsdrJdNU/N0ppFwd7cSWmn8
gqjrB8JDExrcLFITWW8Q66suKOu2qO448qdYxkvmkHqCSqPABR8XBYzOvAbiHAGI
SQUleRcB3xzch3zGtF8/0NLMl5liglQhuaqEwL7Uk2t1uCV4CNKeS7qZSIV91DvU
BmAzVqEU3w6si3Fn7OS8G/hwxKTiDIONw4eDfWe07bj8unAGiIaPXU4YE4f66ckN
LlhuRvy+orm4yKQk0sOW8s9MsctMiQ==
=uuXO
-----END PGP SIGNATURE-----

--Sig_/3/XP01o0t4L5C5=_jC4K1.9--
