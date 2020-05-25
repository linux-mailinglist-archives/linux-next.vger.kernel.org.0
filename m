Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3301E064B
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 07:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388539AbgEYFIy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 01:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388211AbgEYFIy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 01:08:54 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67ABEC061A0E;
        Sun, 24 May 2020 22:08:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49VlVj0b3qz9sSg;
        Mon, 25 May 2020 15:08:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590383327;
        bh=F+DJJAfNWOCcSHZcR2Yj5hkGS2U1BgJDwkdg9LBXq5c=;
        h=Date:From:To:Cc:Subject:From;
        b=n1htx9JQiezUvnpufuv61/+O2hTe5aQzE7L6HJG+6xnzH073neKdT9fvdn8kHf+zO
         ec91O71NFuZyq3/Jh25S14A0vmq3RbImBG3Ofl3PRDch2CroZLy65OgWB1N8N6EwXR
         RjWvgPtKTzHZn7zwueXngv648s0twWLGNgi1Fs1Of2zfP24wP6QyXGwjABKFZOjypl
         qZ4KmvAjB/KE+m092GHQQA9k7HrX7zaa1rMwkVoys7Y1XJMD4fMg3vN71c7Pba6zIu
         pcfT/PfQ4EMoYI1tVrXyKyPLZ1FztSCVJRMS/TpL36hcNmRN26wIRd73odGGLxpCzP
         NKKLHMSo3MFOw==
Date:   Mon, 25 May 2020 15:08:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200525150837.54fe6977@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7gBx1a6cPvmeoXQ7VXvq9OV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7gBx1a6cPvmeoXQ7VXvq9OV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/filemap.c: In function 'generic_file_buffered_read':
mm/filemap.c:2075:9: error: 'written' undeclared (first use in this functio=
n); did you mean 'writeb'?
 2075 |     if (written) {
      |         ^~~~~~~
      |         writeb

Caused by commit

  23d513106fd8 ("mm: support async buffered reads in generic_file_buffered_=
read()")

from the block tree interacting with commit

  6e66f10f2cac ("fs: export generic_file_buffered_read()")

from the btrfs tree.

[Aside: that btrfs tree commit talks about "correct the comments and variab=
le
    names", but changes "written" to "copied" in the function definition
    but to "already_read" in the header file declaration ...]

I ave applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2020 15:00:44 +1000
Subject: [PATCH] mm: fix up for "fs: export generic_file_buffered_read()" m=
erge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/filemap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 742998883d9c..208095551a17 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2072,7 +2072,7 @@ ssize_t generic_file_buffered_read(struct kiocb *iocb,
 			 * serialisations and why it's safe.
 			 */
 			if (iocb->ki_flags & IOCB_WAITQ) {
-				if (written) {
+				if (copied) {
 					put_page(page);
 					goto out;
 				}
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/7gBx1a6cPvmeoXQ7VXvq9OV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7LUtUACgkQAVBC80lX
0GwWdAgAlG7GWe4av20SGsQef429kNxCI2e2YZDzj4Vh0OZOQpSSuD8vzFFUpO0H
RlyfnpMcIhHxhd0hrU7995vEfUz13+nty5oViOGbd4eX7L3nJr9Btf1EEAMKZ/FG
b3VnvC4JA5ZwgVfB17lCcDhDHrKhO52QKdrUcxBLIg3OXV3mUjslM32H9/JQnPx/
PZKz/UAOvqmDAjYo1PdoL4FKdwRerKV3KORDCZCSIXjhBJ3tvsFWDfZfVnNkIGwp
jftYrog/AHSRtfQBr+F3+BXlWKYjX2nDqOXhdAHeYP37h3n7cuowrpCClF99S42z
2Wr6jp7R719uLkGSKEisZpoOrAWhBQ==
=+/BU
-----END PGP SIGNATURE-----

--Sig_/7gBx1a6cPvmeoXQ7VXvq9OV--
