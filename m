Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47EEE410DB9
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 01:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhISXJD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Sep 2021 19:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhISXJD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Sep 2021 19:09:03 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3C9C061574;
        Sun, 19 Sep 2021 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632092853;
        bh=/y3BMjdPouVMaRIxDFH1zDnVpECOAnWjGL7jfG4p6KU=;
        h=Date:From:To:Cc:Subject:From;
        b=cNdPyGwxLSPoMadDLwNaK/7sp/kr7gC3LQQn9C3FsZo//2vtgKKd+7LHe17pcBALA
         NVruV0G+BywEgjK86xX9joygfdRYJgVh70AH5BC51Ems2tbcn71d/F54EBnvqoxfV9
         CRVtyYJmw/yKyGUZRSx7hCqPDaE1LWRwijRP9z22a2+qP4JdBlmQmftBqcRcA3h8qW
         GZra8XKA17g8PPl9FGq4wg/xbMnV/aW+yZsDk9PGT0cAnKWpc978i5LMxrSiIsLGWK
         o6+VTmYWB62U/exeDLW8fVb1C1HBj7QN1pHqkSDL3+koqsGlKlbsQ5EOxGAMwgt3uy
         51zT8LIK9//Xw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCNcz64yQz9sR4;
        Mon, 20 Sep 2021 09:07:31 +1000 (AEST)
Date:   Mon, 20 Sep 2021 09:07:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: linux-next: manual merge of the drm-misc-fixes tree with Linus'
 tree
Message-ID: <20210920090729.19458953@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/STKEsFTlVk9UE/CSsnEVvBS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/STKEsFTlVk9UE/CSsnEVvBS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc-fixes tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_hdmi.c

between commit:

  b1044a9b8100 ("Revert drm/vc4 hdmi runtime PM changes")

from Linus' tree and commits:

  36e9bcb8edfc ("drm/vc4: select PM")
  a22dad7fa0cd ("drm/vc4: hdmi: Rework the pre_crtc_configure error handlin=
g")

from the drm-misc-fixes tree.

I fixed it up (I just effectively reverted the change in Linus' tree) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/STKEsFTlVk9UE/CSsnEVvBS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFHwrIACgkQAVBC80lX
0GwKZQf+KNVEEMRpeML0EC3GVZmsVTbhrVGlTjlN1Je3T33hBSxO5WRkmEM7f4pY
k5IDtwnhFRsJmCgsE4H04w7TITimEtxqyY9ADZFt0qWO1+i06qMz70URT32+0WIs
uhAyc8yPp4Ii/ZesRQ7dUcveUkAL4gfhW27VCUVZWmcMLUN/MjIVK2Ed3MuATsOM
kedG0mvk+Pa/RRJTeva6ZrjkFNNspHWrMzPSt7iV+pUom20xB+VpcOLN2W0M2mFk
JwdrQVBKZjBlSPrdd9DRp8yskOuaKdAiFjqNaIbSkLkmPO5eDBI9ao2rSMtfMwXF
2tdZvcG3pw6GoZWwykGDgKSlUDFL1A==
=OrlO
-----END PGP SIGNATURE-----

--Sig_/STKEsFTlVk9UE/CSsnEVvBS--
