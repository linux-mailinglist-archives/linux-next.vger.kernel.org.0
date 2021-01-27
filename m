Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFCB305A65
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 12:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhA0LyU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 06:54:20 -0500
Received: from ozlabs.org ([203.11.71.1]:51565 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237388AbhA0Lu3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 06:50:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQhjN3mtXz9sS8;
        Wed, 27 Jan 2021 22:49:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611748184;
        bh=g2q/HZguZ1ZnDiCFKZnmDOfmIZPxicnT9F3kFhQh6/U=;
        h=Date:From:To:Cc:Subject:From;
        b=vGeN01SJRFi3oa6W1dtEWxaivfUJWTwZ7TcAslTSKX9Ytt8LWa5mm4zw7dpr7VVq+
         QmcRqwm9M4AH1H/7EVf5gBCGGBs9WideTVlpFOtmgTYvVRpqnXhej6IB2tVYD9jhql
         jwuHiik51yaymnrALmADfeKK4Qpo7lPLFKlecsEOzw4efBpXDPzQjRe7lOVgprW7Pc
         yg6gbq1MUAbYkAUIxhRNdD4ikN7hHe3plJkTAoWy0TVxZlbMQBiaCrWn5j7nENSS5s
         RU2gNH+2eBQIuj/NImzxDkzFkmQVSWjruCEye4kvAymT4iqwJAgl79nvNs8W1htCzK
         o7IENrbK1ABsg==
Date:   Wed, 27 Jan 2021 22:49:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the fscache
 tree
Message-ID: <20210127224943.34b087ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hr.Q4ImlBSuL2U6G_8T8iwT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Hr.Q4ImlBSuL2U6G_8T8iwT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/pagemap.h

between commits:

  fa4910177245 ("vm: Add wait/unlock functions for PG_fscache")
  13aecd8259dc ("mm: Implement readahead_control pageset expansion")

from the fscache tree and commits:

  f5614fc4780c ("mm/filemap: pass a sleep state to put_and_wait_on_page_loc=
ked")
  7335e3449f74 ("mm/filemap: add mapping_seek_hole_data")

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

diff --cc include/linux/pagemap.h
index 4935ad6171c1,20225b067583..000000000000
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@@ -682,21 -681,7 +682,20 @@@ static inline int wait_on_page_locked_k
  	return wait_on_page_bit_killable(compound_head(page), PG_locked);
  }
 =20
 +/**
 + * wait_on_page_fscache - Wait for PG_fscache to be cleared on a page
 + * @page: The page
 + *
 + * Wait for the fscache mark to be removed from a page, usually signifyin=
g the
 + * completion of a write from that page to the cache.
 + */
 +static inline void wait_on_page_fscache(struct page *page)
 +{
 +	if (PagePrivate2(page))
 +		wait_on_page_bit(compound_head(page), PG_fscache);
 +}
 +
- extern void put_and_wait_on_page_locked(struct page *page);
-=20
+ int put_and_wait_on_page_locked(struct page *page, int state);
  void wait_on_page_writeback(struct page *page);
  extern void end_page_writeback(struct page *page);
  void wait_for_stable_page(struct page *page);
@@@ -771,11 -756,11 +770,13 @@@ int add_to_page_cache_lru(struct page *
  				pgoff_t index, gfp_t gfp_mask);
  extern void delete_from_page_cache(struct page *page);
  extern void __delete_from_page_cache(struct page *page, void *shadow);
- int replace_page_cache_page(struct page *old, struct page *new, gfp_t gfp=
_mask);
+ void replace_page_cache_page(struct page *old, struct page *new);
  void delete_from_page_cache_batch(struct address_space *mapping,
  				  struct pagevec *pvec);
 +void readahead_expand(struct readahead_control *ractl,
 +		      loff_t new_start, size_t new_len);
+ loff_t mapping_seek_hole_data(struct address_space *, loff_t start, loff_=
t end,
+ 		int whence);
 =20
  /*
   * Like add_to_page_cache_locked, but used to add newly allocated pages:

--Sig_/Hr.Q4ImlBSuL2U6G_8T8iwT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARU1cACgkQAVBC80lX
0Gw/2wf/Yi3SJ7hLGwzQ4duzqkhsIDk/h8g6QgXmUbPJtkqAu9v1VbOXyXND+nNx
vZwcRQjU7hl4rqwnyCgUMP8lursyIcGyuxVsCGQx4aherCCgVU8aEOxKCzLKWg5a
qNVspP6U+h15Uy87PMaF3I/IlRDKL+X/VTqzMVCN/vEig3332iw19+5osjmvN4Od
g29Q/JZIK4Y0l1lzRxnBmxw5txChBmbKYeMl2rtMRtJyFkXw6PDzj7qPMA4LqImK
85s/xcjut/9qRRDkuTH/bapXv/AEDWA35jxViutPOEjvA1Wm0+E3IlY1DREMI5of
h0LJZ8CGVJF6svB2XmpYAgwXC2iIaw==
=6iN8
-----END PGP SIGNATURE-----

--Sig_/Hr.Q4ImlBSuL2U6G_8T8iwT--
