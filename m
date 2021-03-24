Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8850434855E
	for <lists+linux-next@lfdr.de>; Thu, 25 Mar 2021 00:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbhCXXhF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Mar 2021 19:37:05 -0400
Received: from ozlabs.org ([203.11.71.1]:53893 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231889AbhCXXgk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Mar 2021 19:36:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F5Pl83D74z9sRR;
        Thu, 25 Mar 2021 10:36:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616628997;
        bh=q8R9yTxNJakJ1zemN4cY0UWAXrRQAlD2+IhQFTngk+k=;
        h=Date:From:To:Cc:Subject:From;
        b=dpS+gFVYvttDEeDnNwXvLWbI8lQf5IAiEaqHIJwEcxqyflpf1ZRtyG6YSJHacKRWQ
         AyPtEEgcaY1pMoApG7CVvrAEml3ISLst4/5fmJzYwojUNilnXp1tZj8NOm/Z5tHgxx
         gExiVgxUon//1UELcH1RVQFQxXOIOPe83b2zIiS9iSSVdMiemDyZu2jHfroTV8CvRa
         gFKRJzBlEJnuFABmZjJzk1iN/HHsOc3Eo3qG3MGcgY2pXO38HYQbCMVeC+Oa+Q21C+
         hG/rbARcgNvQinEfBtgNQwt6NtoJM5KraCuELd5dDgIvGZklinsfousakO7TOEkEh4
         QwYLRpI7dCbcQ==
Date:   Thu, 25 Mar 2021 10:36:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the fscache tree with Linus' tree
Message-ID: <20210325103634.6e26fade@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xEY9JO1boMf=mPg5HxmA.DG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xEY9JO1boMf=mPg5HxmA.DG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fscache tree got a conflict in:

  fs/afs/write.c

between commit:

  75b69799610c ("afs: Use wait_on_page_writeback_killable")

from Linus' tree and commit:

  721597fd1aa6 ("afs: Prepare for use of THPs")

from the fscache tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/afs/write.c
index eb737ed63afb,b2e03de09c24..000000000000
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@@ -848,13 -845,16 +845,15 @@@ vm_fault_t afs_page_mkwrite(struct vm_f
  	 * be modified.  We then assume the entire page will need writing back.
  	 */
  #ifdef CONFIG_AFS_FSCACHE
- 	fscache_wait_on_page_write(vnode->cache, vmf->page);
+ 	if (PageFsCache(page) &&
+ 	    wait_on_page_bit_killable(page, PG_fscache) < 0)
+ 		return VM_FAULT_RETRY;
  #endif
 =20
- 	if (wait_on_page_writeback_killable(vmf->page))
 -	if (PageWriteback(page) &&
 -	    wait_on_page_bit_killable(page, PG_writeback) < 0)
++	if (wait_on_page_writeback_killable(page))
  		return VM_FAULT_RETRY;
 =20
- 	if (lock_page_killable(vmf->page) < 0)
+ 	if (lock_page_killable(page) < 0)
  		return VM_FAULT_RETRY;
 =20
  	/* We mustn't change page->private until writeback is complete as that

--Sig_/xEY9JO1boMf=mPg5HxmA.DG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBbzQIACgkQAVBC80lX
0GxxbAgAgSuT3VJ8P4NW9gbL2WuSTF+XlWuuShvg2x6/m+rw8vNIX3ndMiNxWc/9
UoWTyBBOQ52rX6O5RLD6GDwU3AvnGT9UYhaPM7ZRbp5i4x9IW7cCIMCcRMWqhEoh
+CtPbX5MBPGqBf0ar9XIpmFPQjCXDCDX5mbtLd1HDW0J7zQNfWu1Kr6ZlvpS4ZWa
LUYD4neNYdULLoLO8rTFF87icAYMDNM/NAF99NFcTdSpYbSo1MFNeFjuMhKNfbSK
nOQDtm+TGUEy+3F+lxgXAayguyWN9nB2fYDhq/ezRUPGn5MSnJ+Zey4nnH+CXNfh
DoNP0UTNJ3R4ko81yXaUc37nAESaCg==
=mu3o
-----END PGP SIGNATURE-----

--Sig_/xEY9JO1boMf=mPg5HxmA.DG--
