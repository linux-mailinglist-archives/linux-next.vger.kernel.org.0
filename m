Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13FAB2163F5
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 04:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgGGC0Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 22:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgGGC0P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 22:26:15 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8514C061755;
        Mon,  6 Jul 2020 19:26:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B15sJ091Hz9sRK;
        Tue,  7 Jul 2020 12:26:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594088772;
        bh=+QRyoY+PF5bX2Z+tL1MEqsiIaaw8+XF1cDa2puZUbyc=;
        h=Date:From:To:Cc:Subject:From;
        b=p0UhfDYivkqwP8p4mrTu1kKIHtP8XPbUwZt9lqJzIzzu3Yre0BIft1y+gca2ZweIN
         w8O+DNrlytL6VKbEoA22Cmd6QqZDMBQ/G1s/zzsWm81be9uP92LVBf0/+XhkxhkhSy
         5vPgGDcZEKyto7IViibezwFnLDPln+WNqgLx5C02mZbiKVVBU5uDDDpPV3+eeUhy6z
         emrcUt/unzycGxF3uepqVCPl2FGmYE8MAKcpaK3a/+3G1dZL1rJFVGZY442FJZSiuS
         emH9iA3Vobl75X3Gz3I2QNYrZpShl9j+wViswDcnyaqq3ugF19RdM7MuVCKuwUHRs0
         ZJQlIFRlxCCTw==
Date:   Tue, 7 Jul 2020 12:26:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Subject: linux-next: manual merge of the block tree with the gfs2 tree
Message-ID: <20200707122609.75970e83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q./GODUFtSqVlQ1GhFU+Tm+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/q./GODUFtSqVlQ1GhFU+Tm+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got conflicts in:

  include/linux/fs.h
  mm/filemap.c

between commit:

  00a83a3c014a ("fs: Add IOCB_NOIO flag for generic_file_read_iter")

from the gfs2 tree and commits:

  dd3e6d5039de ("mm: add support for async page locking")
  2e85abf053b9 ("mm: allow read-ahead with IOCB_NOWAIT set")

from the block tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/fs.h
index 90b9f8b4c540,da90323b9f92..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -315,7 -318,8 +318,9 @@@ enum rw_hint=20
  #define IOCB_SYNC		(1 << 5)
  #define IOCB_WRITE		(1 << 6)
  #define IOCB_NOWAIT		(1 << 7)
 +#define IOCB_NOIO		(1 << 8)
+ /* iocb->ki_waitq is valid */
 -#define IOCB_WAITQ		(1 << 8)
++#define IOCB_WAITQ		(1 << 9)
 =20
  struct kiocb {
  	struct file		*ki_filp;
diff --cc mm/filemap.c
index 10e7eb3aada0,a5b1fa8f7ce4..000000000000
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -2028,8 -2044,6 +2044,8 @@@ find_page
 =20
  		page =3D find_get_page(mapping, index);
  		if (!page) {
- 			if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_NOIO))
++			if (iocb->ki_flags & IOCB_NOIO)
 +				goto would_block;
  			page_cache_sync_readahead(mapping,
  					ra, filp,
  					index, last_index - index);

--Sig_/q./GODUFtSqVlQ1GhFU+Tm+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8D3UEACgkQAVBC80lX
0GxsLgf5AVWE/uJlguY54VXfGGN4c+jTJz2X/t1uzSGy7ZlMe2g9Vu+tW3psmBEf
6AHPVVlBfpIDimQ0LnzH0YbzxZokDYt2soRJ1wUweBXYo5AAIrNzeTwLINJw20Zk
AIYlagy3KgjA32ISfBGLaevbJOdsl9nc6kCD4HOXaQa/RFfIWezex9GLEQwt/ZaT
BneuSRqk2lMWzaZ3G/qvA9+s4Xl7VErrBJ5YwLERpHuvUhLslOKln0aSdefBixvr
a9oXpg/8ARyipWUcc8Km8av3SWvImnL8lrw+HsK2o2BduOXFIgdhIaftaADAbDE/
ex0aa06jH/8KlXQAW5PSffbQMxqaHw==
=kobP
-----END PGP SIGNATURE-----

--Sig_/q./GODUFtSqVlQ1GhFU+Tm+--
