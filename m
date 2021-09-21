Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929C1412D90
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 05:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhIUDzw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 23:55:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56395 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229557AbhIUDzv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Sep 2021 23:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632196462;
        bh=0BzMHsy1hpymZlL6NJ8oZ6u/HRveT4hYBexymK9AGfM=;
        h=Date:From:To:Cc:Subject:From;
        b=MGgS250hdua+NRRuQrftB+Qh4HlkjFi5NHcmww/oshONsaVHQQpxx2NSIPDTgKnSY
         IANijUNI9RGlj0C+vf89g5yNHdOhLRSiHSMc+niwE7Bnbo8e8gTuBQsQ4ifpHy8djq
         vrotX/0h9l1qBsSqq2vT5IIRle0jUhqdPTz+x9wrrtfMmwVPA5kYo4bRXSPFcRv2DE
         gtv40k4oSRT3SoKI/f5q+f1nKUH5jFpIJNzpl44grAI+MIIWv+OQBgWfn2cEoC3318
         cLlQ2mxu6m2UvYFpiUEdZUwO7zUsCk4Gc0C3/g9DOA9thHqTlekKU+g0UGtGRZp1iN
         45Mz+QYF662RA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HD6xV3NXPz9ssP;
        Tue, 21 Sep 2021 13:54:22 +1000 (AEST)
Date:   Tue, 21 Sep 2021 13:54:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the folio tree with the fscache tree
Message-ID: <20210921135421.13eac778@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rz/pi.tYV_5ktpC4kYtjCMJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rz/pi.tYV_5ktpC4kYtjCMJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the folio tree got a conflict in:

  fs/cachefiles/rdwr.c

between commit:

  405f4ff7f8a3 ("fscache: Remove the old I/O API")

from the fscache tree and commit:

  2e96a1a81b3f ("mm/filemap: Convert page wait queues to be folios")

from the folio tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/rz/pi.tYV_5ktpC4kYtjCMJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJV20ACgkQAVBC80lX
0GwR1QgAoE8m/H1eN4UfrZi9P2FyQdbKUgHwj46WPo955gIERDoIivLoBfAmvy6X
GP/UuhxaDXH+Jn/RToZOCwNTHU4Ah0U9HJQ+1rQRuRGHGNz93HRu5eRhgOQU61sz
u3tBw0F7gCZQHaGYcQ/1YLjfvEJAKWWUL9xOatO48Vv0y+VUjWKphPZVSFjpHU+G
QOATCqaJmjvWvGMAcxKC8JdqfhlfC5NtGS07ACNO/AAid6dcWY7AUAe1CW074vX2
IyWHt0BCfeOMXlVJZYvbKgNY8FM53yXydz+jZ8OQ0HfVgmEQLjISwQ3t98LjOzSZ
3/r0CuC4IgI8SnJV3Raewcr616qdBA==
=mlnV
-----END PGP SIGNATURE-----

--Sig_/rz/pi.tYV_5ktpC4kYtjCMJ--
