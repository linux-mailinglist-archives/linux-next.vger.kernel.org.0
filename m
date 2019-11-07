Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC659F3A1E
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 22:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfKGVLZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 16:11:25 -0500
Received: from ozlabs.org ([203.11.71.1]:44457 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbfKGVLZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Nov 2019 16:11:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 478GKj2gtzz9sP4;
        Fri,  8 Nov 2019 08:11:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573161082;
        bh=DqoFjaTZQRDfZA2fZkgv0zwhVGYU6OelHQKxH+WDsiQ=;
        h=Date:From:To:Cc:Subject:From;
        b=j95uG9wU4r0F0qIdKklgRuZ0B6qGF/B55YbuHVoQTbQVhM6QzysmUn5D0GQ2Vyj0A
         p5iOZdSRdvcm/ze1BO3vaHrE15Fdva5I9yax0p4rMndTDfwhUGrF0dSyoYOnjb2tIh
         8WbGxecXrETC43+0+srTkLEgWMm6k9l/8akctJAWpbqt1I+ausACanvbYm1oAAL2pV
         NJvVv88PORWM9JWPYKO6JEanLkt04z6jyCYEEptDHETzF0uN55QfeqG+XppWhu2qbA
         M1TpkCHqC7OsgKjEgaFP6lagvRGMerA/FGeksj4FzNtNBchMpwI0NH4VLMxQrh9yjF
         r4wEgqNqeSiQw==
Date:   Fri, 8 Nov 2019 08:11:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: linux-next: manual merge of the arm64 tree with the dma-mapping
 tree
Message-ID: <20191108081109.28867ba1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U6c804ldPHEs8oBD9=TaX3_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/U6c804ldPHEs8oBD9=TaX3_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  include/linux/dma-direct.h

between commit:

  b0817901ba21 ("dma-direct: check for overflows on 32 bit DMA addresses")

from the dma-mapping tree and commit:

  8b5369ea5809 ("dma/direct: turn ARCH_ZONE_DMA_BITS into a variable")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/dma-direct.h
index 6db863c3eb93,d03af3605460..000000000000
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@@ -3,11 -3,10 +3,13 @@@
  #define _LINUX_DMA_DIRECT_H 1
 =20
  #include <linux/dma-mapping.h>
 +#include <linux/memblock.h> /* for min_low_pfn */
  #include <linux/mem_encrypt.h>
 =20
+ extern unsigned int zone_dma_bits;
+=20
 +static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t padd=
r);
 +
  #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
  #include <asm/dma-direct.h>
  #else

--Sig_/U6c804ldPHEs8oBD9=TaX3_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3EiG0ACgkQAVBC80lX
0Gzrmgf9F0EJ6X6GP7knhR0Pxq1/XXlIb8EvhDJTuAbTR9FeLBISLm1ptgXYE4+G
11E+IgxnhLNvSuJjYKy8mjbC1zCZX3TXLc6LEbyLhC4119fIpvG1LrfM5+9ptkfA
H+IxA0E9n5bFc3mFjDomuMF/AFKHxcDvfIOs6JNknbdwjRU90MyjuxG/5KMDgjyN
KvKMImWZzR76erivz/QFt1bfn3COSW0S86bdHswcbcN9fbKvpETMJJX/qH3wTW19
SQ+wjAzaxKPM6M+7uEXyaEW4vuXNF9YZYzVO1wKanhaoS/n/cs+/BTl3cIDZoijT
XGk2tIxwIx07GKy1QELFay2wxGk8VA==
=nJXk
-----END PGP SIGNATURE-----

--Sig_/U6c804ldPHEs8oBD9=TaX3_--
