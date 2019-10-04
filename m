Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2E1CB2DE
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 03:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbfJDBK3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Oct 2019 21:10:29 -0400
Received: from ozlabs.org ([203.11.71.1]:42791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728345AbfJDBK3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Oct 2019 21:10:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46ksHg47mrz9sPl;
        Fri,  4 Oct 2019 11:10:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570151426;
        bh=9xF7O4ugUmejFoawtgnL4B57TpXYia5KNWt+3CH/1g8=;
        h=Date:From:To:Cc:Subject:From;
        b=UaPcZXUZg71Ts9S4FUbZm6EyJxMlZFWwNe3cic0VtyosMGTo1wJD6LwY1O6luwA8w
         Legev33i238czsZjmfXEGWX50N3+GhxRCzWy4dr/ObVWTRqv2ifZG1677nacnHBUAw
         Y0MLNP4s8XaZgq/Fa6uY2pTJArOrjsMe5m65blpD8+kk59cWWigzCcLvusX/8yCl2D
         YNJjJZ2PYsnGn7Hw398Qh9NNWD91H/VbS4lSlmc8JW8/ncs174zt6pgLrpMLSPW3Z7
         gyeSoxY5HPykDuPiTrrtl4mY7/Aw48WAZDomvyZgcGIkunnniBBPw07yuzXqM9NILR
         3GCNq8UR33DFA==
Date:   Fri, 4 Oct 2019 11:10:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lyude Paul <lyude@redhat.com>
Subject: linux-next: manual merge of the drm-misc tree with the admgpu tree
Message-ID: <20191004111022.28bde6dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7L4.J4D3cO5/Rn4FGcSo6.9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7L4.J4D3cO5/Rn4FGcSo6.9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c

between commit:

  2f232cf29e03 ("drm/amdgpu/dm/mst: Don't create MST topology managers for =
eDP ports")

from the admgpu tree and commit:

  ae85b0df124f ("drm_dp_cec: add connector info support.")

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

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 3af2b429ff1b,5ec14efd4d8c..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@@ -414,11 -416,7 +414,11 @@@ void amdgpu_dm_initialize_dp_connector(
 =20
  	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
- 				      aconnector->base.name, dm->adev->dev);
+ 				      &aconnector->base);
 +
 +	if (aconnector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)
 +		return;
 +
  	aconnector->mst_mgr.cbs =3D &dm_mst_cbs;
  	drm_dp_mst_topology_mgr_init(
  		&aconnector->mst_mgr,

--Sig_/7L4.J4D3cO5/Rn4FGcSo6.9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2Wm/4ACgkQAVBC80lX
0GzFRwf/WBPiEvkFmJsMLMuNNIGQgrcVmlJ29OLPyMqVGih9Pn++RZOa2LMBzbck
p7mk5w6cEU4nhpk7tIYfcwrDA1ymh9RtqANl60h+wjkEDCnCOBLyKWSYX3+9NsVZ
5HfuYp2vTKlJ39rRfRlhmBUMvaVA+0dtdH7OKRDB6BT3/bhlRIZKVsWwWRcQI9mP
irBzxPH/qMY2eER6FuGYRot6P9H3B8PWwyYFEh9gjHL9eZ/OD3g8zpMoTL62lMY7
+ZzcNwrpmZf39EQtnmI3//LZM22USRC53JFFTPXgzcN96OdV/+dlfZON++AkaQvZ
7XdAF9cBY4Vtj+jElHvMZczwACiA8Q==
=PU8N
-----END PGP SIGNATURE-----

--Sig_/7L4.J4D3cO5/Rn4FGcSo6.9--
