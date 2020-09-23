Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1961275000
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 06:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgIWEeZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 00:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgIWEeZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2020 00:34:25 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0DBC061755;
        Tue, 22 Sep 2020 21:34:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bx51C1K0Zz9sS8;
        Wed, 23 Sep 2020 14:34:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600835663;
        bh=rWyXm4FwJi84iyOR3I5pzw6zG34ItOmSSYW1HqrboOI=;
        h=Date:From:To:Cc:Subject:From;
        b=Nr9X3j4zzYMHgAkCtdCCdl2b7r4RGlm1w+8KtU7iA1Dgi7lt7b1rhcJJaZ9Zbudl8
         RwEu951rM8bH7KH4ZaF8FGbMG1rW5LNwxlHc3HbK5niYoEwutQXYHU/dey+ViLPgLV
         VcPLwRs6EJv8IsmF4K248OKWadDGN19PRNKMf7cpikIyNq+WTkBty3dqwvLcAPfKee
         SRleWX+gwo6xeU6ZMnyY+hD1m5hv9W+CdDV/USGkDvxMn1LLT2M1QSU4vwneMxHdwd
         IfILx9urRTbajHCvpFG+PCV8W3TIfo20Q9eWUxUzB5jaFM9qySkg3sU4xkerqJgxMt
         r/k4aiunVZvgw==
Date:   Wed, 23 Sep 2020 14:34:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200923143422.413c3e97@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e7FLB01PJw=LROj=WPavc7E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e7FLB01PJw=LROj=WPavc7E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/io_uring.c: In function 'io_resubmit_prep':
fs/io_uring.c:2357:10: error: 'struct io_kiocb' has no member named 'io'
 2357 |  if (!req->io) {
      |          ^~

Caused by commit

  8f3d749685e4 ("io_uring: don't re-setup vecs/iter in io_resumit_prep() is=
 already there")

from Linus' tree interacting with commit

  76c917267129 ("io_uring: get rid of req->io/io_async_ctx union")

from the block tree.

I added the following merge resolution:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 23 Sep 2020 14:30:01 +1000
Subject: [PATCH] fix up for "io_uring: get rid of req->io/io_async_ctx unio=
n"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/io_uring.c b/fs/io_uring.c
index 5aefea5bb383..0a72f4eed845 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2354,7 +2354,7 @@ static bool io_resubmit_prep(struct io_kiocb *req, in=
t error)
 		goto end_req;
 	}
=20
-	if (!req->io) {
+	if (!req->async_data) {
 		ret =3D io_import_iovec(rw, req, &iovec, &iter, false);
 		if (ret < 0)
 			goto end_req;
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/e7FLB01PJw=LROj=WPavc7E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9q0E4ACgkQAVBC80lX
0GxMjAf8DZJ/ntWgK+7IARJ50yQps7SaOovSbmqCYqrGSBOFdDn8z9qYehWZrBJR
ZbAUoAjAU1VHybVi/BYVtnW9h17ra04zJDTCNIwPEnZ/0CVQcuVwA8n30DPvaOXz
z07YqRLcTE1mTmvCRHNOaoA55dVj/4rlSiqh/tK4WuBDXpT/05JPW4SCcRGpFVr4
S9jsia3OCxRHxKB0rNKUhO6E0S98f6ReSSIqHhjdGdgVlh4W+/+KQn/wXjorM5aT
1yx47hUUru6clxmSkykPNfuSPtQeewpxS59tYJGxwdO32GKzG7/3m5K1BmHUHhBI
dog420o9lkycazAoKLV0s0TLfjlQ9A==
=8uyx
-----END PGP SIGNATURE-----

--Sig_/e7FLB01PJw=LROj=WPavc7E--
