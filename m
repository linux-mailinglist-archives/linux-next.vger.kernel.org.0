Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D68422315F
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 05:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgGQDBU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 23:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgGQDBT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2020 23:01:19 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C032C061755;
        Thu, 16 Jul 2020 20:01:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7G982TDhz9sRR;
        Fri, 17 Jul 2020 13:01:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594954876;
        bh=U2Tnf/HcMs0gQ5e8UfmJ+vj+/z/9ARYZLFITxMERuKw=;
        h=Date:From:To:Cc:Subject:From;
        b=BuIhtwGtidD5iMfctGKN0TdBoKK2HKwUWjWPiPe10BRkPb0e48DTg4F42ZeRs6Jt0
         JBAKBgNYBgPkiOuksneCw8UrO6hku9YUunUS6AOJd2CdZs1ncX7Jh3zRCRTTbX4+H/
         kwhnKTVHtm8x7NAOKW1gMwjdEmZ4l25WGplyQs4S2vHynxYzA0gTwUqkhxKfO6BG7h
         JefOI6IHtrTuAmuAqtrKk618XdgPJ+OGqxTI7KF4gp6VniROaXV4y2d+rJ5ZFesOGw
         ev5IiYsT4laGItYdp7cSaM2MDz0AsGxI6MX4U7LsGti8XRNdJgwhSMFWNaGgipFA+6
         XydkDS5m9p6hw==
Date:   Fri, 17 Jul 2020 13:01:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <20200717130112.469f8f8f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//rCox/5s.=.+peH2IgXYV4X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//rCox/5s.=.+peH2IgXYV4X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/core/pcm_memory.c: In function 'do_alloc_pages':
sound/core/pcm_memory.c:47:7: error: implicit declaration of function 'dma_=
is_direct'; did you mean 'd_is_dir'? [-Werror=3Dimplicit-function-declarati=
on]
   47 |      !dma_is_direct(get_dma_ops(dev))) {
      |       ^~~~~~~~~~~~~
      |       d_is_dir

Caused by commit

  3ad796cbc36a ("ALSA: pcm: Use SG-buffer only when direct DMA is available=
")

interacting with commit

  d3fa60d7bfdc ("dma-mapping: move the remaining DMA API calls out of line")

from the dma-mapping tree.

I am not sure of the best fix here, so I just added this hack to make
it build for now.  Suggestions welcome.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 17 Jul 2020 12:57:38 +1000
Subject: [PATCH] merge fix for dma_is_direct() removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/core/pcm_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 795af1b88051..89480f12086a 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -44,7 +44,7 @@ static int do_alloc_pages(struct snd_card *card, int type=
, struct device *dev,
=20
 #ifdef CONFIG_SND_DMA_SGBUF
 	if ((type =3D=3D SNDRV_DMA_TYPE_DEV_SG || type =3D=3D SNDRV_DMA_TYPE_DEV_=
UC_SG) &&
-	    !dma_is_direct(get_dma_ops(dev))) {
+	    1 /* !dma_is_direct(get_dma_ops(dev)) */) {
 		/* mutate to continuous page allocation */
 		dev_dbg(dev, "Use continuous page allocator\n");
 		if (type =3D=3D SNDRV_DMA_TYPE_DEV_SG)
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_//rCox/5s.=.+peH2IgXYV4X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RFHgACgkQAVBC80lX
0GyDLgf+Ju6GhO8uAiyiRa1ACl5zCRFCs602sTJtwuWMRSlX8NS5DgdH87wl4NTs
0hNWRjbyc4glMyz0oPR1nfF84M4koW+X2NBhm2MPXD27u/N+qVly/c3/kv7EkMki
GNUzUqXxHbgGRzkw4VMLOJZsfAiQM3ndt9BDGu1AFLqki+HX1Y7TfYO/vDUPkwLn
/jIG1fQuXi/ngDvm0mq97m1vrdolQHwfT8SNlyPNLF7hYIsQC6irxzIUXx7pSiuj
Iy80lKwHeeRcJCaA9a5CW8elDnKpCh6LfpavR8OWuYc/WOQFISAmhV24R89QdD9P
qxz7hJjbxV6T+wW1fZnF+iYM1HsUNA==
=FlK7
-----END PGP SIGNATURE-----

--Sig_//rCox/5s.=.+peH2IgXYV4X--
