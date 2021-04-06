Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487E2354C31
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 07:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243775AbhDFFPK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 01:15:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42349 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243771AbhDFFPJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Apr 2021 01:15:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FDwh15TRHz9sRf;
        Tue,  6 Apr 2021 15:14:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617686100;
        bh=h3/+ne8Gi0fW/GZnyjboAtdNaIyXFaj6o239XXmEAi0=;
        h=Date:From:To:Cc:Subject:From;
        b=m1UsHvPyOAs913fX7C6MQKcF2pP4J2fHZ/FRP7yUE1R799GcJaoAx5YTj6sSX7nqo
         EPbTySSBuK2JWjNBSC92z2oQeDcE6/lDZkn1aXrso+i/VFvHt047Qxcpf7ZceHWH4z
         T4GZ2finXd1Y+g4FNkqj+tyaV8SrSPS0ujxdSYeGHKi0fIYYPAT4HAhc3zZRSUehye
         toO97x3AGyM2FtOLRULs/Y2k3krz6m8A7CbVETI7qL2uQkPGzOIM9T/nWFyuAaTdSh
         BOZKdmI7hqHReaKigbyTaHZSP5umnjt4uM8oJcb/kefNfSutyeH0+h5dL+hfJhgS/L
         w7wYhXIMhWDuw==
Date:   Tue, 6 Apr 2021 15:14:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: linux-next: manual merge of the imx-drm tree with the drm tree
Message-ID: <20210406151454.54a9362f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AB3imQjM3xl=axh7cQMlgoT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AB3imQjM3xl=axh7cQMlgoT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the imx-drm tree got a conflict in:

  drivers/gpu/drm/imx/ipuv3-plane.c

between commits:

  ba5c1649465d ("drm: Rename plane atomic_check state names")
  41016fe1028e ("drm: Rename plane->state variables in atomic update and di=
sable")

from the drm tree and commit:

  49c826e1941a ("drm/imx: Add 8 pixel alignment fix")

from the imx-drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/imx/ipuv3-plane.c
index fa5009705365,26f2cc832101..000000000000
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@@ -590,8 -618,8 +625,8 @@@ static void ipu_plane_atomic_update(str
  	if (ipu_state->use_pre) {
  		axi_id =3D ipu_chan_assign_axi_id(ipu_plane->dma);
  		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id,
- 					  drm_rect_width(&new_state->src) >> 16,
 -					  ipu_src_rect_width(state),
 -					  drm_rect_height(&state->src) >> 16,
++					  ipu_src_rect_width(new_state),
 +					  drm_rect_height(&new_state->src) >> 16,
  					  fb->pitches[0], fb->format->format,
  					  fb->modifier, &eba);
  	}
@@@ -623,10 -651,10 +658,10 @@@
  		break;
  	}
 =20
- 	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, drm_rect_width(dst));
+ 	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, ALIGN(drm_rect_width(dst), 8));
 =20
- 	width =3D drm_rect_width(&new_state->src) >> 16;
 -	width =3D ipu_src_rect_width(state);
 -	height =3D drm_rect_height(&state->src) >> 16;
++	width =3D ipu_src_rect_width(new_state);
 +	height =3D drm_rect_height(&new_state->src) >> 16;
  	info =3D drm_format_info(fb->format->format);
  	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
  			     &burstsize, &num_bursts);
@@@ -690,8 -717,8 +725,8 @@@
 =20
  		ipu_cpmem_zero(ipu_plane->alpha_ch);
  		ipu_cpmem_set_resolution(ipu_plane->alpha_ch,
- 					 drm_rect_width(&new_state->src) >> 16,
 -					 ipu_src_rect_width(state),
 -					 drm_rect_height(&state->src) >> 16);
++					 ipu_src_rect_width(new_state),
 +					 drm_rect_height(&new_state->src) >> 16);
  		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
  		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
  		ipu_idmac_set_double_buffer(ipu_plane->alpha_ch, 1);

--Sig_/AB3imQjM3xl=axh7cQMlgoT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBr7k4ACgkQAVBC80lX
0Gz5Cwf+PsGsE9ePzR5fKy1nb8ByLswQZ0UtNIcu43gDcMC77w0O4G08PsV77J/F
7Y52C6fGqerrIf+gkyojwZQLkL7FAfGnDTUxrVm1Hn9v8cX4DBeFQIljvyCZ1s+n
M/8nP7r8KOYShKcWAZ3MvvJyi0+NnHLbiXeU8YBLr0RaHcSt+ESDPdUW+FM7cA8Z
/bmSagOiKzq6Q/vPfBVe1xX6IUXrFZOG1jVK1hi1nKvgaWz59AvrFCgxWz3CyqtU
RdNUpEsQ4ejEVi6dBSF/CFf/my2H4oIVdzKAm2OBuiFjmnZz9MDsRjIjKruB33T7
D5cYrXrAKf07TMTagAeJglQYvSwjRA==
=YMC0
-----END PGP SIGNATURE-----

--Sig_/AB3imQjM3xl=axh7cQMlgoT--
