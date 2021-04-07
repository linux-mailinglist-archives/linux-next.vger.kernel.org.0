Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B043567D5
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 11:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350025AbhDGJTD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 05:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbhDGJTA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 05:19:00 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46099C061756;
        Wed,  7 Apr 2021 02:18:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFf2q0vrJz9sCD;
        Wed,  7 Apr 2021 19:18:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617787126;
        bh=EDnaGP3ss/eA+SXrY38KkDa0TpIq0mgpfpWkqaDj5mM=;
        h=Date:From:To:Cc:Subject:From;
        b=p0YwolNiNG4aSINXKbb7I7oKl9X4yjDz6R0mIDjYkC+EJ/c9bR0YubR8yE4fEqMdi
         wJ9ga8LEVquD4mDBGxRG/kg1Eb+tMbShoL9zrYiskr9damQAenFu3IK+PKStZ+Hjsd
         S8eZUV5nSG4CwQtXEUMREiL+6liPq/TVuU5E64t8hUAB+uUubRiPka+/pqzfIHgMN7
         99J4xJwR41IK6Sdeu2A4k1fv2/2gbo0ZS9nmmnUakvfpDJLH5biSwEkM/ncnKWV1Z2
         KNBEizpH3XUwXqVQw7jt4wWwzl/MLHYG59fG9xK+xNFTTJpSyaMHegCYmbjDjIlkPM
         3ku2VxHKupi8Q==
Date:   Wed, 7 Apr 2021 19:18:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Message-ID: <20210407191841.0919b2bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/859ki+tP=dhmUFljfRp1.r2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/859ki+tP=dhmUFljfRp1.r2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  block/blk-settings.c

between commit:

  9bb33f24abbd ("block: refactor the bounce buffering code")

from the block tree and commit:

  1d4982a2dc66 ("include: remove pagemap.h from blkdev.h")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc block/blk-settings.c
index 9c009090c4b5,976085a44fb8..000000000000
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@@ -7,6 -7,8 +7,7 @@@
  #include <linux/init.h>
  #include <linux/bio.h>
  #include <linux/blkdev.h>
+ #include <linux/pagemap.h>
 -#include <linux/memblock.h>	/* for max_pfn/max_low_pfn */
  #include <linux/gcd.h>
  #include <linux/lcm.h>
  #include <linux/jiffies.h>

--Sig_/859ki+tP=dhmUFljfRp1.r2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBtePIACgkQAVBC80lX
0GwnHAgAnP++9m1JJrqRmdQqbfUh5lrlYUTWaBwdzyw2rwx0OzwvwijuzAtodH2j
TzHe4cV0iuwU06tdlMiZYxN1p8kPistfWcMzrJhSlwv9+Sj9x9csGZpqEHP5x3Zn
VyQ/DmrMSmLxlfPvn/3y/ZH0FeiH3LNgMpqAFAvQtSjuXWebMNAKA1EWX7GaWxoS
8sRFPXih2ECuto6qoPpI2HybtEvzs92NMhdUfgfzcPgNJGbfAKcTvGIIgCSEpPpp
QcKTNqI1Vo0n+yxgk+8IVLCqq6avmPGGDgMXp5Q3n/h9M5IPdutot7ePnlGE59Ss
4Cvd7+3P85GTZj+1crU2Sl104Fd3AA==
=x8MI
-----END PGP SIGNATURE-----

--Sig_/859ki+tP=dhmUFljfRp1.r2--
