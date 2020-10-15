Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A9128ED0E
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 08:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgJOG1Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 02:27:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53541 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgJOG1Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 02:27:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBfTP5HMzz9sT6;
        Thu, 15 Oct 2020 17:27:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602743243;
        bh=eqeJWAJfbVhFMvpv4QGHZeVSz1eFH5jHmY13Cc1Net8=;
        h=Date:From:To:Cc:Subject:From;
        b=AoWGO7wi2MIDH7mK3ex46Ln1Iq7WaLSVk4pBcWxc7xApcyF1FtTyJEbeOP9j7akYE
         Qpw8Ql9m/Oj9FsDQ2Ga2RJ9VwYISNi7A3G1lkevWbXg5tPkSuAkDpQqTyWmSE7Y2Nl
         saFY+cNDR2SMHAxhJRAnjut8Yavv+PH39E9S7vLKgE3k4dcNi5oKpiANWtJ2qQCODH
         CaLqry4SzBsPoTeiWFl+9+Fq8lBTV9oW08eeqPMjOCiJUkDQtjGl7/K0XKNaG3S6fF
         cmtga9F90eJ9Z/PCSn5G1vbj5dnfAnxlqjthfl40HTpRTPsI34VwnLWPo3FxLC9jry
         Pd9QLGbk4Xjpg==
Date:   Thu, 15 Oct 2020 17:27:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Message-ID: <20201015172721.31ef7d5e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jwGMZOKqcoOcNuv7ejq1dbK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jwGMZOKqcoOcNuv7ejq1dbK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/readahead.c

between commit:

  fd0ec96ec35d ("readahead: use limited read-ahead to satisfy read")

from the block tree and commits:

  16681dc9dd92 ("mm/readahead: pass readahead_control to force_page_cache_r=
a")
  f65bd470e7ed ("mm/readahead: add page_cache_sync_ra and page_cache_async_=
ra")

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

diff --cc mm/readahead.c
index e5975f4e0ee5,c6ffb76827da..000000000000
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@@ -548,42 -545,23 +545,29 @@@ readit
  		}
  	}
 =20
- 	ra_submit(ra, mapping, filp);
+ 	ractl->_index =3D ra->start;
+ 	do_page_cache_ra(ractl, ra->size, ra->async_size);
  }
 =20
- /**
-  * page_cache_sync_readahead - generic file readahead
-  * @mapping: address_space which holds the pagecache and I/O vectors
-  * @ra: file_ra_state which holds the readahead state
-  * @filp: passed on to ->readpage() and ->readpages()
-  * @index: Index of first page to be read.
-  * @req_count: Total number of pages being read by the caller.
-  *
-  * page_cache_sync_readahead() should be called when a cache miss happene=
d:
-  * it will submit the read.  The readahead logic may decide to piggyback =
more
-  * pages onto the read request if access patterns suggest it will improve
-  * performance.
-  */
- void page_cache_sync_readahead(struct address_space *mapping,
- 			       struct file_ra_state *ra, struct file *filp,
- 			       pgoff_t index, unsigned long req_count)
+ void page_cache_sync_ra(struct readahead_control *ractl,
+ 		struct file_ra_state *ra, unsigned long req_count)
  {
- 	bool do_forced_ra =3D filp && (filp->f_mode & FMODE_RANDOM);
 -	/* no read-ahead */
 -	if (!ra->ra_pages)
 -		return;
++	bool do_forced_ra =3D ractl->file && (ractl->file->f_mode & FMODE_RANDOM=
);
 =20
 -	if (blk_cgroup_congested())
 -		return;
 +	/*
 +	 * Even if read-ahead is disabled, start this request as read-ahead.
 +	 * This makes regular read-ahead disabled use the same path as normal
 +	 * reads, instead of having to punt to ->readpage() manually. We limit
 +	 * ourselves to 1 page for this case, to avoid causing problems if
 +	 * we're congested or tight on memory.
 +	 */
 +	if (!ra->ra_pages || blk_cgroup_congested()) {
 +		req_count =3D 1;
 +		do_forced_ra =3D true;
 +	}
 =20
 -	/* be dumb */
 -	if (ractl->file && (ractl->file->f_mode & FMODE_RANDOM)) {
 +	if (do_forced_ra) {
- 		force_page_cache_readahead(mapping, filp, index, req_count);
+ 		force_page_cache_ra(ractl, ra, req_count);
  		return;
  	}
 =20

--Sig_/jwGMZOKqcoOcNuv7ejq1dbK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+H68kACgkQAVBC80lX
0GzOYwf/X2RH5+5uO1Fo3UBHZx6M1rdO98rOPN0PpkaiyZcw5asOH5CEN6eCXkPW
zUt80fTWyHJ53ZpKeFMTjHI2sDFyx++GWSdkFhlCajyTNlFnvAeCqPboLGzCxfY9
GFm8jq4daVSOeGKyLnaePlX+ed/8hd72Aq/fYQcQkSilhr/K1umdHmN185Bmi1t5
ATUrbKSdd5iCJN4sXuR6d9REpKV+XZTRiHADXSdyTmEkuhp9tHHY22KisJlmVYfl
XtlfUlNKXZ7B81umTvqbTNOjuKtZqALXjGGd5Z6HszjuZWrVexnYvVMnpi7WIhNx
J/4LiwDhFibiaXbvRJw28ibBgTp1Fg==
=lJls
-----END PGP SIGNATURE-----

--Sig_/jwGMZOKqcoOcNuv7ejq1dbK--
