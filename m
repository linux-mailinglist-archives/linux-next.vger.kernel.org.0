Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB23943C1D8
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 06:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237921AbhJ0EvT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 00:51:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41585 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbhJ0EvT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 00:51:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfGRc47Kwz4xbC;
        Wed, 27 Oct 2021 15:48:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635310124;
        bh=Qv+oot2a6GtzL8PFiesl4PSukLPc4LQRRD/sYU0S3Pc=;
        h=Date:From:To:Cc:Subject:From;
        b=XhIUvo/PPzI4iJE/IBGBNFOuJ8QYguKFE4I3B2H1yhuIdcJq5wxRX/C5hdQaXhbzp
         q61lByYDFS/EpCw487p8CHgi0dFdwVqj1Zx3VIk8CAK3sGn89s8VRKiY/8DYXFzkGK
         KpSuT3fnQMrDnDuqmirAQxALNJN4pimFtItLe9n6CSZHUpu8k2JmRRNwFH2IcDGQv5
         NFw9vb7TMe1fQ2E24KY7Ydpq9T/AmTtZW/Ug0me76tpqbLwhHIdD6oMxIn0aH7t250
         0bb2s2jySdAE2dZ2D98E0hsxe4fZQMsPyZkdlRCyzCjsO2BKma+hhG1VIQjU/RKLJr
         8RSa9kGfU/oeA==
Date:   Wed, 27 Oct 2021 15:48:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the char-misc tree
Message-ID: <20211027154843.622961fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L2jv/qu73mp00DLZHTtR4TT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L2jv/qu73mp00DLZHTtR4TT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: modpost: module drm_shmem_helper uses symbol dma_buf_vunmap from nam=
espace DMA_BUF, but does not import it.
ERROR: modpost: module drm_shmem_helper uses symbol dma_buf_mmap from names=
pace DMA_BUF, but does not import it.
ERROR: modpost: module drm_shmem_helper uses symbol dma_buf_vmap from names=
pace DMA_BUF, but does not import it.

Caused by commit

  16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF module name=
space")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 27 Oct 2021 15:44:18 +1100
Subject: [PATCH] fix for "dma-buf: move dma-buf symbols into the DMA_BUF
 module namespace"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_g=
em_shmem_helper.c
index 57ceecb3f4d8..f7324582afe7 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -22,6 +22,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
=20
+MODULE_IMPORT_NS(DMA_BUF);
+
 /**
  * DOC: overview
  *
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/L2jv/qu73mp00DLZHTtR4TT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF42isACgkQAVBC80lX
0Gw3XAgAoFO4/kBV5lhDraVh8oG8qfFfF+lCcB3F7iz/vF7FZ9BMmKtnDuRCykAz
vruBaiF+pAIEc0G2mznlHFuwNGxtuTJtXwMHUAt+ZStUzz7frRHeDAC4uAwllqWj
0lV0YXHpkY245+RjU1roZT6pt23Gem1ci9KgMcsaiLx6uo567MgSmu5PyZ8Dygg8
R+KVtLS+m/GU5hX3t2mwBl2faOxa4YBZiM5sRcCUFNr0vbm/DCU9TroozlG4mXMi
70zwypI1aLKz7qIOqvmuWhZ7JoAM5QGKsrH/rEObBggrJzhaEC+q9hIym8NBjsTp
fennb64sQUo1bwQQ/VylLm21fiOLiA==
=hQZJ
-----END PGP SIGNATURE-----

--Sig_/L2jv/qu73mp00DLZHTtR4TT--
