Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1276A14AD47
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 01:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgA1Aiy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 19:38:54 -0500
Received: from ozlabs.org ([203.11.71.1]:45491 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgA1Aiy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 19:38:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48675l5F8Kz9sPn;
        Tue, 28 Jan 2020 11:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580171931;
        bh=ZFt22swylBexWXxCjDtzrVb/gug9eg5TVHthriwijXo=;
        h=Date:From:To:Cc:Subject:From;
        b=nMH4Aix/KxRe2sNjxNdFXqhHR74+65e3ajN0W7sfcyZwNBlOES+n8fTqaMw3Wjk9X
         8fzTyUMnuh3LCkofgKnhsMMSqQkrJ9iQRzPNqcEPn/WRufEWzPF5YGWM0BFePM5Ssh
         MMc1ZBV24Ei3XzxMtarAKGHnYxTuUCrI8nYbF6dHoDIQGJZyIclM6/EyAvq9FF9PrK
         azZ2rJ70YUCmnC7meN9wMFJ1iWhycsbMdO/VM6dR+zaLheGjyHbevzoUeid9PUjee2
         uF9sc4qtyw2AIRKzhTBjtADDST0otF6u9w+LcI9/aW1XLf9Qebn/Y7rbLtX+YcZZaL
         cS9j4pY1Vbg3g==
Date:   Tue, 28 Jan 2020 11:38:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20200128113851.50161614@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RfCmZvQZ3be/nInvFS6ReTJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RfCmZvQZ3be/nInvFS6ReTJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/io_uring.c

between commit:

  73e08e711d9c ("Revert "io_uring: only allow submit from owning task"")

from Linus' tree and commit:

  9ef4f124894b ("io_uring: clamp to_submit in io_submit_sqes()")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/io_uring.c
index e54556b0fcc6,82fd87e3a6ca..000000000000
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@@ -5157,7 -6384,12 +6380,6 @@@ SYSCALL_DEFINE6(io_uring_enter, unsigne
  	} else if (to_submit) {
  		struct mm_struct *cur_mm;
 =20
- 		to_submit =3D min(to_submit, ctx->sq_entries);
 -		if (current->mm !=3D ctx->sqo_mm ||
 -		    current_cred() !=3D ctx->creds) {
 -			ret =3D -EPERM;
 -			goto out;
 -		}
 -
  		mutex_lock(&ctx->uring_lock);
  		/* already have mm, so io_submit_sqes() won't try to grab it */
  		cur_mm =3D ctx->sqo_mm;

--Sig_/RfCmZvQZ3be/nInvFS6ReTJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vgpsACgkQAVBC80lX
0Gwwtgf/YSTxRUUrIXexcc2DSII7iOPm5vAyA4dNTt6ggG9jWL8wmcYzvXcl+EkT
xmGgk5L9jWuCn35CDARJReaYjIxidpgqYZp2ZYaH6FIzULWDAVicyuz2V3f/v5m2
asjKS1bF8hvGPhXyXWYGhZHW1kNtOoImUdQRRtGWwl5EfZFrRw5C7mg+BN7uRULh
wjxE0SLv7pYAXmEcMty/eAJ0Kc2pOuv3Uy812FeX9+N0q0iG9GM3DvBhBQu49+u+
TV7r5dM2x+zcIT+wo5lCtebENkvRWrS0OxQra1QEghknIXbPCc1cOTuP3+07pqea
0rg4OyxiWbqWebU8dnaWFoHWsuqrIw==
=kpaS
-----END PGP SIGNATURE-----

--Sig_/RfCmZvQZ3be/nInvFS6ReTJ--
