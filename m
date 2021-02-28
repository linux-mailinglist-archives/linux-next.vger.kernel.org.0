Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A183274DA
	for <lists+linux-next@lfdr.de>; Sun, 28 Feb 2021 23:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhB1WaX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Feb 2021 17:30:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39807 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231534AbhB1WaX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 28 Feb 2021 17:30:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DpdNz3hTsz9sWD;
        Mon,  1 Mar 2021 09:29:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614551379;
        bh=p+bZDgqx03t8WGhBZ6AXbMgZRxejBJLIyk/vWmrxN6g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OIudWXD3JgGfOn2NJmGGlusS0SzxB6I7ixy4Hdgf9QXGmv2EDlRNs449DRirf1Gf+
         z0zD6B3XJiQiriBaaWHZ5iqIb7JcJm07aI470eHvIbJ+UKl+yhck64fIOwCV2okstY
         OXZHFz16WquBW/pbrcfw8BNu01M4eOWzANTSxgAEABzbmprgVJ0lQYk81bMGc8D4X5
         mXnmOCnF3k5Fk9nwOlWemV7A6jTU3wcVbAnVS437GhmPh6ShThRCiX/2sVF1ECG0tC
         U2lv1qEDcxY4R1bf0v+jIcSR6Q24Rpc63uOp/U0/ZZ2noUu+3v+M8183TWRd4yQlra
         2RjTxVkk8Kkkg==
Date:   Mon, 1 Mar 2021 09:29:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 fscache tree
Message-ID: <20210301092938.33116d24@canb.auug.org.au>
In-Reply-To: <20210211212437.6d3df60f@canb.auug.org.au>
References: <20210211212437.6d3df60f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jt8wmJbd/vd120kPu_VcB8R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Jt8wmJbd/vd120kPu_VcB8R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 11 Feb 2021 21:24:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   include/linux/pagemap.h
>=20
> between commits:
>=20
>   13aecd8259dc ("mm: Implement readahead_control pageset expansion")
>   9a28f7e68602 ("netfs: Rename unlock_page_fscache() and wait_on_page_fsc=
ache()")
>=20
> from the fscache tree and commits:
>=20
>   cd669a9cbd89 ("mm/filemap: add mapping_seek_hole_data")
>   34c37da5f411 ("mm/filemap: pass a sleep state to put_and_wait_on_page_l=
ocked")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/pagemap.h
> index a88ccc9ab0b1,20225b067583..000000000000
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@@ -682,22 -681,7 +682,21 @@@ static inline int wait_on_page_locked_k
>   	return wait_on_page_bit_killable(compound_head(page), PG_locked);
>   }
>  =20
>  +/**
>  + * wait_on_page_private_2 - Wait for PG_private_2 to be cleared on a pa=
ge
>  + * @page: The page
>  + *
>  + * Wait for the PG_private_2 page bit to be removed from a page.  This =
is, for
>  + * example, used to handle a netfs page being written to a local disk c=
ache,
>  + * thereby allowing writes to the cache for the same page to be seriali=
sed.
>  + */
>  +static inline void wait_on_page_private_2(struct page *page)
>  +{
>  +	if (PagePrivate2(page))
>  +		wait_on_page_bit(compound_head(page), PG_private_2);
>  +}
>  +
> - extern void put_and_wait_on_page_locked(struct page *page);
> -=20
> + int put_and_wait_on_page_locked(struct page *page, int state);
>   void wait_on_page_writeback(struct page *page);
>   extern void end_page_writeback(struct page *page);
>   void wait_for_stable_page(struct page *page);
> @@@ -772,11 -756,11 +771,13 @@@ int add_to_page_cache_lru(struct page *
>   				pgoff_t index, gfp_t gfp_mask);
>   extern void delete_from_page_cache(struct page *page);
>   extern void __delete_from_page_cache(struct page *page, void *shadow);
> - int replace_page_cache_page(struct page *old, struct page *new, gfp_t g=
fp_mask);
> + void replace_page_cache_page(struct page *old, struct page *new);
>   void delete_from_page_cache_batch(struct address_space *mapping,
>   				  struct pagevec *pvec);
>  +void readahead_expand(struct readahead_control *ractl,
>  +		      loff_t new_start, size_t new_len);
> + loff_t mapping_seek_hole_data(struct address_space *, loff_t start, lof=
f_t end,
> + 		int whence);
>  =20
>   /*
>    * Like add_to_page_cache_locked, but used to add newly allocated pages:

This is now a conflict between the fscache tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Jt8wmJbd/vd120kPu_VcB8R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA8GVIACgkQAVBC80lX
0GxZYwf/bEUsErGa2YVe74mxg7z+Xm9GHNvIBb3GY0fCM+R9Vy/0J+3CORSKygaq
mSw3TG1PKfrPSrQCI4+UxV8OhZrm/uqi07ix3fac1JQSwv+TnnoOcb2Ly0ztta4+
1VKcO/wlGoHgWcX6f5iE1J0TK7J8XwE0FK+xh4e3RhI04oPiiNMbRdsyAfKsDvut
B2ughBalvR6eDi84aTp9N0sfyiVpyWenIE9yIgOmq6p8K1aWhIGF8bjc1LXie9lR
jQWLr+khYt2DW1s45fLz6FDF52JUhzGHTO7xX4R62FrVTOzS0ZsW0KYIeu3kQGIO
aNrw79TSBS6sVTxzEJ4kJKCJZnx+jQ==
=qw/J
-----END PGP SIGNATURE-----

--Sig_/Jt8wmJbd/vd120kPu_VcB8R--
