Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA6D29A224
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 02:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503794AbgJ0BUs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 21:20:48 -0400
Received: from ozlabs.org ([203.11.71.1]:46659 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503792AbgJ0BUs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 21:20:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKv620vqKz9sSW;
        Tue, 27 Oct 2020 12:20:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603761644;
        bh=JqnLPt5PpfQpxYmHkHTWZuecwdhM0kzTZE1MAPG/y7Y=;
        h=Date:From:To:Cc:Subject:From;
        b=k4ErA3lx1Lx+J0XM9vO/Jkga9PpYn1tcocS9S+XvXhR388VChiDu6ddX2SRF/9JXh
         TG86XEvSoJARW52KphQImj2POMgiVXrvwzgSLk+ztOicOGWOVwxRjiPgZtEbPjORmn
         cdhULGMF+CidADASxUHoCDE3MfXcBzEtftL1WhnDpcLoIrB922RJIjRt5lNShyEghb
         Jjx8FB/3kcl1pCzIywF1AvtzDfXQD1wviz3WpgQVfj4ajODS/s9D5XdFStjGh/YO9/
         2JjKqPbWq/MkCR8E5hNpo42npMWTeb7jpwxUIxEczxLjg4XfuwAjHrBVETN4USY5BN
         KfrjqiduIrBYQ==
Date:   Tue, 27 Oct 2020 12:20:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Clark <robdclark@chromium.org>,
        Dave Airlie <airlied@linux.ie>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20201027122041.021ab60e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8ZwN35nvZKtnZAWySf_KM4h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8ZwN35nvZKtnZAWySf_KM4h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c

between commit:

  e12e5263bf1d ("drm/msm/dpu: clean up some impossibilities")

from Linus' tree and commit:

  351f950db4ab ("drm/atomic: Pass the full state to CRTC atomic enable/disa=
ble")

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

diff --cc drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f56414a06ec4,5ba9b49dfa7a..000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@@ -706,10 -753,12 +707,12 @@@ static struct drm_crtc_state *dpu_crtc_
  }
 =20
  static void dpu_crtc_disable(struct drm_crtc *crtc,
- 			     struct drm_crtc_state *old_crtc_state)
+ 			     struct drm_atomic_state *state)
  {
+ 	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_state(=
state,
+ 									      crtc);
 -	struct dpu_crtc *dpu_crtc;
 -	struct dpu_crtc_state *cstate;
 +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
 +	struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(crtc->state);
  	struct drm_encoder *encoder;
  	unsigned long flags;
  	bool release_bandwidth =3D false;
@@@ -770,9 -826,9 +773,9 @@@
  }
 =20
  static void dpu_crtc_enable(struct drm_crtc *crtc,
- 		struct drm_crtc_state *old_crtc_state)
+ 		struct drm_atomic_state *state)
  {
 -	struct dpu_crtc *dpu_crtc;
 +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
  	struct drm_encoder *encoder;
  	bool request_bandwidth =3D false;
 =20

--Sig_/8ZwN35nvZKtnZAWySf_KM4h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+XdekACgkQAVBC80lX
0GxiFgf+JOF9yTwW6s5sstWU7IcuyXmb57dSpnf3ExUxqm/gqvHzGQ/k83EUWoQC
lMOp84eQtrpB171N4+kzzJSlJzkUOOLHMPaQ/vI4jXPupP52Z6ZIMKCtx27rrrae
TQ5LvVaWrVFKVRR8SEsOEYKqvi1yBLb0BVe2jKMinlWIQsixYEFNXRpnjlHRTK56
JoFXBzXwT/KUC/xFcbXAD0xMnEu9WOTvH5FuKtIwc3UY+mOr1xsTjwjfzWcuWzmA
hq+j7npb0h4+wLVDw7NNqiX5sRrmLZlE9W6r7msbs/x+XPHkPOZ8juOm34vX+42a
WUJqM/Cu5gjtirEyQ0RxhTezI6xyvg==
=gWGt
-----END PGP SIGNATURE-----

--Sig_/8ZwN35nvZKtnZAWySf_KM4h--
