Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBAB31881E
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 11:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBKK11 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 05:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbhBKKZ0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Feb 2021 05:25:26 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1078AC061756;
        Thu, 11 Feb 2021 02:24:42 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dbt6H1Sr6z9s1l;
        Thu, 11 Feb 2021 21:24:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613039079;
        bh=BUG7vAG2VrZC38eVKhxwglUAgWPvt1WFae0cPZ3pRG0=;
        h=Date:From:To:Cc:Subject:From;
        b=hH66fuAE7+vzbPt2y/cNbtBkQCxPeVSGdrlC/ozjijRgN+UT5hurPIpt1BOjBoKAi
         m8VJIS0IxF4cw3EuyLS3+JTeOgxr7FCNfBaLwPCEwTriAYU42FnXHNex3IT+/CoFUF
         wZo/JViZOEAxhJPCMPUGf5WzqxA8IpQBv5KRAQYV1Z8fSviBGxSlzg9YpO++O2rJls
         Fkh9D0Ga+ZpwrhSbaxTsU/ZSE94KZaTu8hau0+IGORhNjlUKKX9Bj1RafGN1BY/Uka
         vz8S73OLpQP9oOcKg9GhSXYrEKxrvsrKONU9Q7nVuRpvRb08ZR7P04nWtQ6JcksFQm
         uUtJONT1BJdhg==
Date:   Thu, 11 Feb 2021 21:24:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the fscache
 tree
Message-ID: <20210211212437.6d3df60f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TAKX3aZ=qAMZbdB9aem2c04";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TAKX3aZ=qAMZbdB9aem2c04
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/pagemap.h

between commits:

  13aecd8259dc ("mm: Implement readahead_control pageset expansion")
  9a28f7e68602 ("netfs: Rename unlock_page_fscache() and wait_on_page_fscac=
he()")

from the fscache tree and commits:

  cd669a9cbd89 ("mm/filemap: add mapping_seek_hole_data")
  34c37da5f411 ("mm/filemap: pass a sleep state to put_and_wait_on_page_loc=
ked")

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
index a88ccc9ab0b1,20225b067583..000000000000
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@@ -682,22 -681,7 +682,21 @@@ static inline int wait_on_page_locked_k
  	return wait_on_page_bit_killable(compound_head(page), PG_locked);
  }
 =20
 +/**
 + * wait_on_page_private_2 - Wait for PG_private_2 to be cleared on a page
 + * @page: The page
 + *
 + * Wait for the PG_private_2 page bit to be removed from a page.  This is=
, for
 + * example, used to handle a netfs page being written to a local disk cac=
he,
 + * thereby allowing writes to the cache for the same page to be serialise=
d.
 + */
 +static inline void wait_on_page_private_2(struct page *page)
 +{
 +	if (PagePrivate2(page))
 +		wait_on_page_bit(compound_head(page), PG_private_2);
 +}
 +
- extern void put_and_wait_on_page_locked(struct page *page);
-=20
+ int put_and_wait_on_page_locked(struct page *page, int state);
  void wait_on_page_writeback(struct page *page);
  extern void end_page_writeback(struct page *page);
  void wait_for_stable_page(struct page *page);
@@@ -772,11 -756,11 +771,13 @@@ int add_to_page_cache_lru(struct page *
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

--Sig_/TAKX3aZ=qAMZbdB9aem2c04
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAlBeUACgkQAVBC80lX
0GywEQf5AU9Aw0yK8O15jq94iMibX/EZIzlQmZT+UyynCnQFLSLXFkRnggffBsqh
duMSac4ZPvIQxhCsjvBcYPhcvzHOjACKzuBnA2X4FJEarrujLu7I+8rk5vYpNw8p
uUmWO2k3sCeAVVAXtcnIcvsw1ykOunumFZNg73vSi0lU5OmWtcJA5Co5vUOSeFDQ
4Le/MSYW8g9SNjeb4PlSolJSoUrIn5zmyTJOB0m485IV1DOXN0QycTk3B3Qi21bs
AZAIfsIZyp5xrG2lmyhQbMsmQNfpy8c594W2facENEHVHfeP1DWwj6uR5kqDzkJZ
M0xGT2WrVaQ95lvBtcPXk07krhn1wg==
=SvDN
-----END PGP SIGNATURE-----

--Sig_/TAKX3aZ=qAMZbdB9aem2c04--
