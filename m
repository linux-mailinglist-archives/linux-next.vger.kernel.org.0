Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539941CD05B
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 05:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgEKDXY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 23:23:24 -0400
Received: from ozlabs.org ([203.11.71.1]:49193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbgEKDXY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 23:23:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L5qZ28x0z9sPF;
        Mon, 11 May 2020 13:23:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589167402;
        bh=ei+7VrtRtIWjZ6v1Y0Tjx02DowX18VkOoZ08mt7TJzY=;
        h=Date:From:To:Cc:Subject:From;
        b=LOVr45y6NbvfCyJz4PnG2KQFJDtVzNUYF/ATJGU7kx/U+yOEW1zLsWWub7DyWZGvA
         4UuticK1bQd07/vc1SD3ud0vQ6kEYtQAqLvM8Nswbb6MAc5bwQWrKW72m+j4tjpshj
         97uYHPTCRcYPhlu63pggcsy9/GYH0II0y4W3jJacjE5PrgeGROzcWUtCNshwGFU78p
         cxrQk9ta9gvhtoLllMfek10CtbVbGfoFMVzAJkH55cdNMScs7NXqgPKzYFXUut6Iet
         sUR6LuN+8G9ToatZ+63G0ACK/hOvuqxuijQsKFEykF0HBIdc7iO9qIgG9vpoB+4Ge/
         4uptuhQK1zF9w==
Date:   Mon, 11 May 2020 13:23:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: linux-next: manual merge of the crypto tree with Linus' tree
Message-ID: <20200511132319.2d39781b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YU9ipyUeRpaMQcaUOwyWSNw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YU9ipyUeRpaMQcaUOwyWSNw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got conflicts in:

  crypto/lrw.c
  crypto/xts.c

between commit:

  1a263ae60b04 ("gcc-10: avoid shadowing standard library 'free()' in crypt=
o")

from Linus' tree and commit:

  d099ea6e6fde ("crypto - Avoid free() namespace collision")

from the crypto tree.

I fixed it up (I just used the versions from the crypto tree) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/YU9ipyUeRpaMQcaUOwyWSNw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64xScACgkQAVBC80lX
0Gz7Twf/ZGQ5W1CsG3jk612T0kjSvC82Qn6Izn3RE2aW8pMdFqcBf2chnipHdy06
9oY7qGH7U9mNF6J7kmeFQ0/HeZPlHjYnhxqJ9bSZgzTfz/CChUu//Baz55X9usVC
R7qvicU/gnTkACBWn0yA2WHbBDaMm9EhupUjgxddpbMhant4xjLz7MZuEfzepbYb
whYKnuPfOjVQJWaWqmzZlHcDfYS9CFyjYsBflGP81aqg6k66cC+kwIGRitGG6fYd
8r91mblPlB360aoY7IRKUs0R/QOI3SO4tUZv7ayuXWC9LGpEo3REvoFf1jQQFFqJ
Y/BfuWUjCKMszXkJS6MUfbrfdxYw3Q==
=3CX3
-----END PGP SIGNATURE-----

--Sig_/YU9ipyUeRpaMQcaUOwyWSNw--
