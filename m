Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7C844B92C
	for <lists+linux-next@lfdr.de>; Wed, 10 Nov 2021 00:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242326AbhKIXCy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 18:02:54 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:54877 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241379AbhKIXCy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Nov 2021 18:02:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hpk2t3rNbz4xbM;
        Wed, 10 Nov 2021 10:00:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636498806;
        bh=36NQwa+v7z0bqEwwezEfdSbMHBxYEGKdfOhjsPw/UTI=;
        h=Date:From:To:Cc:Subject:From;
        b=ibUglZ4LGbgf9ieRH0beCAFqJhAECyUBeRyhrOxyrQMv/rys3cW51Ll00TVI+/pvl
         umh41dGuYTxN4DWD/hbCF1Ig8h/EA0dOlSjH8gJwW8J/0HedFCx1sTLq2Eg+4sGUaJ
         imzBe7aBUcSuSBvhzRStVKcSi2JcHCPP4ovwvP39wcVmlJ9Ev346BR+eaKLqjk6ueK
         u/I3jZTJmJeD1STiIq6bc6X9TuL11uXXhLV3OsX6fRa91/3jPRjkh3XQ+1Kb4cCSaX
         GUo/vAKrijI+MFSWtQpWocKMdLEFzVcgHAiKcVTaPNUxreG5jnGfZiUxRfKhhH8j94
         itmMa6xSv6FAg==
Date:   Wed, 10 Nov 2021 10:00:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-current tree
Message-ID: <20211110100003.07043ecc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8UjdkSKU+jbaAEXswHeSZWH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8UjdkSKU+jbaAEXswHeSZWH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/core/memalloc.c:720:32: error: 'snd_dma_sg_wc_ops' undeclared here (n=
ot in a function); did you mean 'snd_dma_sg_ops'?
  720 |  [SNDRV_DMA_TYPE_DEV_WC_SG] =3D &snd_dma_sg_wc_ops,
      |                                ^~~~~~~~~~~~~~~~~
      |                                snd_dma_sg_ops
sound/core/memalloc.c:651:12: error: 'snd_dma_sg_wc_mmap' defined but not u=
sed [-Werror=3Dunused-function]
  651 | static int snd_dma_sg_wc_mmap(struct snd_dma_buffer *dmab,
      |            ^~~~~~~~~~~~~~~~~~
sound/core/memalloc.c:641:13: error: 'snd_dma_sg_wc_free' defined but not u=
sed [-Werror=3Dunused-function]
  641 | static void snd_dma_sg_wc_free(struct snd_dma_buffer *dmab)
      |             ^~~~~~~~~~~~~~~~~~
sound/core/memalloc.c:628:14: error: 'snd_dma_sg_wc_alloc' defined but not =
used [-Werror=3Dunused-function]
  628 | static void *snd_dma_sg_wc_alloc(struct snd_dma_buffer *dmab, size_=
t size)
      |              ^~~~~~~~~~~~~~~~~~~

Caused by commit

  d51f779940fb ("ALSA: memalloc: Unify x86 SG-buffer handling (take#2)")

I have used the sound-current tree from next-20211109 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8UjdkSKU+jbaAEXswHeSZWH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGK/XMACgkQAVBC80lX
0Gwjtgf/Ykgeh1Jj3A7g8xJ8qvJpDZFh6UaM29Tjb+4qGuWy2wIhVdpD8mV5RrNX
dn7wYVLENINN7wJwnGt6gJOPBFlLyisxLsMc2nCOb4Rkqd4lB3jcWcjaukEaIxTk
oVKSSMiGSKyT3KvTGIPpia4bkJyOD41STvJnqe+sEwcsQkI8kcZOiL2SY1FG8xXJ
BaJHXyQXrfhfia4zm8c+nnC+CqvIHI5Bx0nTVe8qX8psA9DZEsSjhFtulR9UvTHX
rq1B2ZUUoV1Zg5xvkYGM4+pCSMP/IHgh3oR9OEDeGl/6SDEyWkusgb+veHGMWxfe
ckLNAaGCPqE9kyLfjFVCTnFzzpfJuA==
=hF3m
-----END PGP SIGNATURE-----

--Sig_/8UjdkSKU+jbaAEXswHeSZWH--
