Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D77E230054
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 05:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgG1Dla (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 23:41:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52585 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726782AbgG1Dl3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 23:41:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG2XP2svDz9sTj;
        Tue, 28 Jul 2020 13:41:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595907687;
        bh=sKjpOkEIibJEqcox3rSxH9CKwWRN+tFx/60devM8aoY=;
        h=Date:From:To:Cc:Subject:From;
        b=hdFI5assRmcIl/MPxCxaoGHtaH0S0MZmUDkm4E/XGjYCz1FujwhuVAdoEW5KAAxSL
         W5/AKynvwm3TNZdEhloxaPaWHt3T6BokBSKdef6w9yqzV3efmCqBAnh9JDpHE3A0Xs
         qosMSAMJIRPs9So/WmNciE1e+sqt8nIt4fgydxcrsVNqW2BWM3TAzhmJnwvn9a+3fP
         fSMI//ArfTxShbZsaEWlrjrXggPoqrO91JyEC3lBa5VjqEAFAI20n2PWGXw8noBinN
         VtZpQF8HWPUNwSgTicqHDiL2V1HTHgNDIIvtTQPzxI0xQHSc0tlgHvcVT8OS0nSGaB
         pSVaxEmfyuHYA==
Date:   Tue, 28 Jul 2020 13:41:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steve Cohen <cohens@codeaurora.org>,
        Emil Velikov <emil.velikov@collabora.com>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20200728134119.57a54f2a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BVxTvCBDRzX0/QPHxAMG5IG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BVxTvCBDRzX0/QPHxAMG5IG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_gem.c

between commit:

  8490d6a7e0a0 ("drm: hold gem reference until object is no longer accessed=
")

from the drm-misc-fixes tree and commit:

  be6ee102341b ("drm: remove _unlocked suffix in drm_gem_object_put_unlocke=
d")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_gem.c
index ee2058ad482c,a57f5379fc08..000000000000
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@@ -901,9 -913,7 +909,9 @@@ drm_gem_open_ioctl(struct drm_device *d
  	args->handle =3D handle;
  	args->size =3D obj->size;
 =20
 -	return 0;
 +err:
- 	drm_gem_object_put_unlocked(obj);
++	drm_gem_object_put(obj);
 +	return ret;
  }
 =20
  /**

--Sig_/BVxTvCBDRzX0/QPHxAMG5IG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8fnl8ACgkQAVBC80lX
0GzCcwf/RSfKiNgMs/9X0/IjhLfqM3Dn9J67OsBVs10ohNmxiT7aRrHWSEs+Kbu+
bTSYGsCa0gpoVlAHQHROFhS+cqEnlQcmGJ1qEMRG6XX+OBw7D1HIzJPJMmtL4m82
9AOA6SORd5nJG39MOaLwEufhvaZlTc4vURg6A1SLj7PGtwZCsNMyMlGOQvHNkhoz
I0uny55OGAME98c+w0RHwSsFf9XetbKhEyW7uUnhsSro120HiQVqhZ95y+9Ol02i
1gpLcliCn8y3T6cHqTGw2zb7L5kQWpDL784p17US5cSudn2zbZD4ccioQAWlMQg2
gWT7eHLtelkBPiJVSjntQy/dJmAfpw==
=8U80
-----END PGP SIGNATURE-----

--Sig_/BVxTvCBDRzX0/QPHxAMG5IG--
