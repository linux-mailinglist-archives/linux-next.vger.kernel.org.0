Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1761F319C28
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 10:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhBLJyi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 04:54:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44799 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229844AbhBLJyh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 04:54:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DcTNL34pyz9s1l;
        Fri, 12 Feb 2021 20:53:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613123635;
        bh=V6tZ9bJN3keYQ3P1n6itNnuQN6FwhXmN58WXFjXklwY=;
        h=Date:From:To:Cc:Subject:From;
        b=eSti4RUW+giXxWypA9JYzNr3vkb7z9otoxT3qVTARSZ7zLSfMuF2js7s449/4iH2E
         hnW7W556gOWjN1DTbr46ZxSTm53HM+nAmt+vUhKzJbJQttlw7IAJ+uuelJFufTO1vB
         bR297bEX0onPIgXu81YhFsbP6u13BLuRCeqjpK7+TZ/6eHyqEDK8GzKNwZKZwQsUow
         19htF/5wGIugHii4sWMH3UUzAPuLgo80qixT7v5fQEra4fDhRa8jZ+IfW8+/KAV3QB
         q3yBEQ+t2LN1A47sJcKwaY/35peR2foyPThyRr2bJyCwaXe14QMVuR6TSyjTSBpHF+
         KMGCZz40bMelw==
Date:   Fri, 12 Feb 2021 20:53:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the fscache
 tree
Message-ID: <20210212205353.3db305ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NGUf4dhp2i/IsNpftn1P90=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NGUf4dhp2i/IsNpftn1P90=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/pagemap.h

between commit:

  13aecd8259dc ("mm: Implement readahead_control pageset expansion")

from the fscache tree and commit:

  3ad6bba07ad0 ("mm/filemap: add mapping_seek_hole_data")

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
index d2786607d297,20225b067583..000000000000
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@@ -758,11 -756,11 +757,13 @@@ int add_to_page_cache_lru(struct page *
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

--Sig_/NGUf4dhp2i/IsNpftn1P90=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAmUDEACgkQAVBC80lX
0GzwuQf7BleQYh5H8zpxZL+Wu64753zcgfTvI4DY4weFf26AvogNAq07FVoJFqHm
vWKrUZzjeQuvD6w9a/8O1C36wm+zRr020K52fEz+eCrDnBCmA2S7Ihm4U2gv2J+u
33LcMyO9NyOI8IjmuQAbX5Wj6Ua54kqdYnquoaIrOpetDw32ltIdXsGgtBeLf4DG
zz5QNJf/R0i/hLVnp3Dx4eNR1HV2FsnmE3ltQLXAKyAPMUNPG8zaiYMJE3CXnCbj
bkCxWa/opQvDCkXZ7YyqXvJWDFnAOoYDnbncI78ese9smmQ3mSVS7qFewDEu1GCs
mhaBnxRPeHDiybiobUBrTjqvCf2cFQ==
=zOmJ
-----END PGP SIGNATURE-----

--Sig_/NGUf4dhp2i/IsNpftn1P90=--
