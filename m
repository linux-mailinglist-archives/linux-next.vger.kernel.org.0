Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC7D331CA9
	for <lists+linux-next@lfdr.de>; Tue,  9 Mar 2021 02:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhCIB7L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 20:59:11 -0500
Received: from ozlabs.org ([203.11.71.1]:34135 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229475AbhCIB6k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Mar 2021 20:58:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DvdfQ0NHGz9sW5;
        Tue,  9 Mar 2021 12:58:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615255118;
        bh=b02qCUSk+8Dtz++zYg6GWz8qUm89BxbuOTm1R/MeNz0=;
        h=Date:From:To:Cc:Subject:From;
        b=fbtw53knS34/xKwHub0u+ey45KybumnXK51FJrTQtFw13SGHb+ozPJQsEbinO2AzT
         LCui8/yw2Q52VsYYGtG7Paj0k9AbZ/J3jfc+JXdhJp4FeyKGrzTHUvPaYwC8mGVcaD
         +Ydyujy/J25xFntNPhcp2P3spjOOgqqjiNwb37eiv2+nZV15HCkwq4ydudXXdGDnde
         TTsJHI9WHv5WP3JXh/nWDQTLO+7+e+e32XUyXgLHfM7pcfx85GjaLwaS6hLKOp9Zl2
         6nMG6RPfZpuynMC6dUOcB78jQpGbIcCblo1GNCNigYDoFB/9ANdcha1UuwOAJdOQFa
         CbvUN8R3qTP9w==
Date:   Tue, 9 Mar 2021 12:58:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>, Takashi Iwai <tiwai@suse.de>
Cc:     Anton Yakovlev <anton.yakovlev@opensynergy.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vhost tree with the sound tree
Message-ID: <20210309125833.0355a754@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XseBjs6DCsd10DardSdYt5T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XseBjs6DCsd10DardSdYt5T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got conflicts in:

  sound/virtio/virtio_card.c
  sound/virtio/virtio_card.h
  sound/virtio/virtio_ctl_msg.c
  sound/virtio/virtio_pcm.c
  sound/virtio/virtio_pcm.h
  sound/virtio/virtio_pcm_msg.c
  sound/virtio/virtio_pcm_ops.c

between commits:

  de3a9980d8c3 ("ALSA: virtio: add virtio sound driver")
  9d45e514da88 ("ALSA: virtio: handling control messages")
  29b96bf50ba9 ("ALSA: virtio: build PCM devices and substream hardware des=
criptors")
  f40a28679e0b ("ALSA: virtio: handling control and I/O messages for the PC=
M device")
  da76e9f3e43a ("ALSA: virtio: PCM substream operators")
  ca61a41f389c ("ALSA: virtio: introduce jack support")
  19325fedf245 ("ALSA: virtio: introduce PCM channel map support")
  575483e90a32 ("ALSA: virtio: introduce device suspend/resume support")

from the sound tree and commits:

  1e2fb08629e5 ("ALSA: virtio: add virtio sound driver")
  3fb7ce161568 ("ALSA: virtio: handling control messages")
  83ec5db56076 ("ALSA: virtio: build PCM devices and substream hardware des=
criptors")
  68742d8557b8 ("ALSA: virtio: handling control and I/O messages for the PC=
M device")
  def2208d373b ("ALSA: virtio: PCM substream operators")
  613515055d34 ("ALSA: virtio: introduce jack support")
  96db428c31f1 ("ALSA: virtio: introduce PCM channel map support")
  1f77f124f2f2 ("ALSA: virtio: introduce device suspend/resume support")

from the vhost tree.

I fixed it up (the sound tree commits have newer author dates, so I just
used them) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XseBjs6DCsd10DardSdYt5T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBG1kkACgkQAVBC80lX
0GzU4Qf+OfDU1QFNa0JIlHbEk4MehOIAOhXGYr1pkShbCB/V4QCw5ko3RkTb6Ymg
q81F0jPvrxwsNdVdBpHfC4WUwj/LEsMIxfbf/tJcU4EWp6B+ZuPeCB1lYIm6Mmx6
xkYxvsNaTu+3PtMf8iPytgs5ZCnl7UNhWaw4hbf7rbyEPB8nlompUwaBDK+EjTNQ
UAMnzvIngIfA1z+2tB1kBvs4DRVdvDyF9DGMzPjWbo8iOmXrM+oswa+5I+Z2DfAq
eh86CYK2NR9PayrZQl6pk86PQeLB76Ap3pGlriz0Mp8CMXOzkS/ANgYnY89CmSh1
C398Fg2K+KeLpVs08kyejPL6FXTpzA==
=flhv
-----END PGP SIGNATURE-----

--Sig_/XseBjs6DCsd10DardSdYt5T--
