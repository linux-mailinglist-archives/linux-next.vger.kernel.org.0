Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6DF03D0809
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 07:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhGUEVd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 00:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbhGUEVb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 00:21:31 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CFAC061574;
        Tue, 20 Jul 2021 22:02:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GV3NG0Yzvz9sS8;
        Wed, 21 Jul 2021 15:02:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626843726;
        bh=6jHVXxsENGHMKsqQdwUp/5VdSk4SlhPEYaFa/V27tnA=;
        h=Date:From:To:Cc:Subject:From;
        b=BtmoSuuGmgUbuXuvDfcyYyutXBKcamgfHzAgUjeJRBqtCrXXwlHJnw+qqaosVWB0q
         pAIhiHTOEMfbNbpm9sKkgl1d6ou10ccklhGQ0ADuEWVd2n+iL1TnwfOSbbAVGCTyrw
         9sqO3KY+A+NuKa5WLJ9SRl8V5gFfCsZgwHkaTMe7i8AIlsY6BNWiz9hCWnPYZXNAYR
         kCvK5zzBEY3anQhdjBGJP0dIlDkXBBDNaYhZnADtxHj+l8lIimhvZMGBH7O2MStdZF
         XS/ZXpy9Sny1cigwocOnIOfY3Abg8a3HC2e9IaftOXWxYb5Fvkm/Wq56JvBcxYj+MW
         FrAOfAVfxQR5Q==
Date:   Wed, 21 Jul 2021 15:02:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the folio tree with the ext3 tree
Message-ID: <20210721150205.2a7f4fb7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I67XNDAujQVr1Rb3Xo=imif";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I67XNDAujQVr1Rb3Xo=imif
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the folio tree got a conflict in:

  mm/filemap.c

between commit:

  730633f0b7f9 ("mm: Protect operations adding pages to page cache with inv=
alidate_lock")

from the ext3 tree and commit:

  e3700f8b6abe ("mm/filemap: Add __folio_lock_async()")

from the folio tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/filemap.c
index 0fad08331cf4,104b27c372bf..000000000000
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -999,54 -997,16 +999,54 @@@ struct folio *filemap_alloc_folio(gfp_
  		do {
  			cpuset_mems_cookie =3D read_mems_allowed_begin();
  			n =3D cpuset_mem_spread_node();
- 			page =3D __alloc_pages_node(n, gfp, 0);
- 		} while (!page && read_mems_allowed_retry(cpuset_mems_cookie));
+ 			folio =3D __folio_alloc_node(gfp, order, n);
+ 		} while (!folio && read_mems_allowed_retry(cpuset_mems_cookie));
 =20
- 		return page;
+ 		return folio;
  	}
- 	return alloc_pages(gfp, 0);
+ 	return folio_alloc(gfp, order);
  }
- EXPORT_SYMBOL(__page_cache_alloc);
+ EXPORT_SYMBOL(filemap_alloc_folio);
  #endif
 =20
 +/*
 + * filemap_invalidate_lock_two - lock invalidate_lock for two mappings
 + *
 + * Lock exclusively invalidate_lock of any passed mapping that is not NUL=
L.
 + *
 + * @mapping1: the first mapping to lock
 + * @mapping2: the second mapping to lock
 + */
 +void filemap_invalidate_lock_two(struct address_space *mapping1,
 +				 struct address_space *mapping2)
 +{
 +	if (mapping1 > mapping2)
 +		swap(mapping1, mapping2);
 +	if (mapping1)
 +		down_write(&mapping1->invalidate_lock);
 +	if (mapping2 && mapping1 !=3D mapping2)
 +		down_write_nested(&mapping2->invalidate_lock, 1);
 +}
 +EXPORT_SYMBOL(filemap_invalidate_lock_two);
 +
 +/*
 + * filemap_invalidate_unlock_two - unlock invalidate_lock for two mappings
 + *
 + * Unlock exclusive invalidate_lock of any passed mapping that is not NUL=
L.
 + *
 + * @mapping1: the first mapping to unlock
 + * @mapping2: the second mapping to unlock
 + */
 +void filemap_invalidate_unlock_two(struct address_space *mapping1,
 +				   struct address_space *mapping2)
 +{
 +	if (mapping1)
 +		up_write(&mapping1->invalidate_lock);
 +	if (mapping2 && mapping1 !=3D mapping2)
 +		up_write(&mapping2->invalidate_lock);
 +}
 +EXPORT_SYMBOL(filemap_invalidate_unlock_two);
 +
  /*
   * In order to wait for pages to become available there must be
   * waitqueues associated with pages. By using a hash table of
@@@ -2406,49 -2362,42 +2402,50 @@@ static int filemap_update_page(struct k
  		struct address_space *mapping, struct iov_iter *iter,
  		struct page *page)
  {
+ 	struct folio *folio =3D page_folio(page);
  	int error;
 =20
 +	if (iocb->ki_flags & IOCB_NOWAIT) {
 +		if (!filemap_invalidate_trylock_shared(mapping))
 +			return -EAGAIN;
 +	} else {
 +		filemap_invalidate_lock_shared(mapping);
 +	}
 +
- 	if (!trylock_page(page)) {
+ 	if (!folio_trylock(folio)) {
 +		error =3D -EAGAIN;
  		if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_NOIO))
 -			return -EAGAIN;
 +			goto unlock_mapping;
  		if (!(iocb->ki_flags & IOCB_WAITQ)) {
 +			filemap_invalidate_unlock_shared(mapping);
- 			put_and_wait_on_page_locked(page, TASK_KILLABLE);
+ 			put_and_wait_on_page_locked(&folio->page, TASK_KILLABLE);
  			return AOP_TRUNCATED_PAGE;
  		}
- 		error =3D __lock_page_async(page, iocb->ki_waitq);
+ 		error =3D __folio_lock_async(folio, iocb->ki_waitq);
  		if (error)
 -			return error;
 +			goto unlock_mapping;
  	}
 =20
 +	error =3D AOP_TRUNCATED_PAGE;
- 	if (!page->mapping)
+ 	if (!folio->mapping)
 -		goto truncated;
 +		goto unlock;
 =20
  	error =3D 0;
- 	if (filemap_range_uptodate(mapping, iocb->ki_pos, iter, page))
+ 	if (filemap_range_uptodate(mapping, iocb->ki_pos, iter, &folio->page))
  		goto unlock;
 =20
  	error =3D -EAGAIN;
  	if (iocb->ki_flags & (IOCB_NOIO | IOCB_NOWAIT | IOCB_WAITQ))
  		goto unlock;
 =20
- 	error =3D filemap_read_page(iocb->ki_filp, mapping, page);
+ 	error =3D filemap_read_page(iocb->ki_filp, mapping, &folio->page);
 -	if (error =3D=3D AOP_TRUNCATED_PAGE)
 -		folio_put(folio);
 -	return error;
 -truncated:
 -	folio_unlock(folio);
 -	folio_put(folio);
 -	return AOP_TRUNCATED_PAGE;
 +	goto unlock_mapping;
  unlock:
- 	unlock_page(page);
+ 	folio_unlock(folio);
 +unlock_mapping:
 +	filemap_invalidate_unlock_shared(mapping);
 +	if (error =3D=3D AOP_TRUNCATED_PAGE)
- 		put_page(page);
++		folio_put(folio);
  	return error;
  }
 =20

--Sig_/I67XNDAujQVr1Rb3Xo=imif
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD3qk0ACgkQAVBC80lX
0GxCYwgAnWEyoSuNdNygoZKaJgYnOVd1+z3Ik25QhOBeCANCWlzlO7AMOVy6jO4K
wEP/CXHhPtvwPp42pisgxnIjbdxnZr7iiXH6shHdzeRZID7QPBUWZwo9zS+4edoN
Yv4nQK9FNZxqErGybLV7r0fD0SNarXdNIz36YtAv4xjd4bB9cmFPjd+KaAHFjFjH
NU1SwljH7EqdQdyOVTsmSQXCoxHBqsQMF/9yyOUmC6A+75Ynh73yuJgFstGAPgup
Ep56esDxA18fh6pLA9a/ZOZQQGtrEx2drr4YrqcHMw9G9smkD7tfQhC9IEJMwfbA
xOhkMODyOwdDXWOdfqAn270yPGpBbg==
=dvqy
-----END PGP SIGNATURE-----

--Sig_/I67XNDAujQVr1Rb3Xo=imif--
