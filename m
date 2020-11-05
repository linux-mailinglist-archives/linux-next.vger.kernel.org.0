Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BD72A7425
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 01:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbgKEA6O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Nov 2020 19:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732099AbgKEA6O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Nov 2020 19:58:14 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FA8C0613CF;
        Wed,  4 Nov 2020 16:58:13 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRQ9r6jfDz9sTK;
        Thu,  5 Nov 2020 11:58:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604537890;
        bh=27nvI50yUte+Q88fSY3JDzpkApvknTaK+OWR6Ij0tNU=;
        h=Date:From:To:Cc:Subject:From;
        b=KzaBpJM4Jc++XSbk5UXuDiD2KdZo9moB8JXVl0iTSxvEizpgm5NwlkYEQv7gUH39L
         lA0gtoEDcLk5kccvsXASr4OoBSaPwfq+IfrVpjaVSyTn4pL0EuAN1kfRSGSkJuQC7K
         DUAT1pAsyJrLPDfRnHcpNvaABmB/2LT3RGqem3UvhyPO7ZaCsGEprOCV/S0YRd9pgt
         PmMP4lOM00yP9HfYH8q9oZ53GmCbydM3dp2kOl7bMx2XN5smF0q9EuW5wPJsOT7Xk3
         68y5QbHzy3eNkk4EguqX7hKTe3LZncpjtZ3B91vKIS9vlST0BHzVzrsXRhEDLZ6pXZ
         2IdzlnRBCIv+Q==
Date:   Thu, 5 Nov 2020 11:58:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Clark <robdclark@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm-misc tree
Message-ID: <20201105115808.3aee29f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+UpkO/lwJvjogdGfigDwaWZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+UpkO/lwJvjogdGfigDwaWZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c

between commit:

  29b77ad7b9ca ("drm/atomic: Pass the full state to CRTC atomic_check")

from the drm-misc tree and commit:

  91693cbc13c2 ("drm/msm/dpu: Add newline to printks")

from the drm-msm tree.

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
index e55be2922c2f,d4662e8184cc..000000000000
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@@ -844,12 -838,12 +844,12 @@@ static int dpu_crtc_atomic_check(struc
  		goto end;
  	}
 =20
 -	mode =3D &state->adjusted_mode;
 +	mode =3D &crtc_state->adjusted_mode;
- 	DPU_DEBUG("%s: check", dpu_crtc->name);
+ 	DPU_DEBUG("%s: check\n", dpu_crtc->name);
 =20
  	/* force a full mode set if active state changed */
 -	if (state->active_changed)
 -		state->mode_changed =3D true;
 +	if (crtc_state->active_changed)
 +		crtc_state->mode_changed =3D true;
 =20
  	memset(pipe_staged, 0, sizeof(pipe_staged));
 =20

--Sig_/+UpkO/lwJvjogdGfigDwaWZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jTiAACgkQAVBC80lX
0GxkpQf/d4XQPifyB/OFigkbH0lYY1T6msn/1Sr9SQkcgIZI/uzZRM1dA825vlYV
AzqHQjCl0cJoa+Cj/KTr9npA4LEKy7FBjndFRqq8ioVo9I990U/WAKvFfD0FG75r
AO+U9c8RER+VodfRHefvMx7zne1QFxaYy0Kcq7Jqg5Fkm/rxrDJ4qk+ubdMVn2VE
yT3ey4/14qt3VOLJBFyNDrAIgZ4v0/ukaA/WFC4ORmKaqnym18plR82daOKLwCjY
8xFCqV4J1npC58AVc25lGddre7tv8qKR8FLw4qRV7kcGaa24DxCe8PIiDX749bYG
bx9dbI2thlv2MZJMENqX8Mud1Kq39A==
=diS3
-----END PGP SIGNATURE-----

--Sig_/+UpkO/lwJvjogdGfigDwaWZ--
