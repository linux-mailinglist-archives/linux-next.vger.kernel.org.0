Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC24840BCBA
	for <lists+linux-next@lfdr.de>; Wed, 15 Sep 2021 02:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236107AbhIOAqI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 20:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbhIOAqI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2021 20:46:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E856C061574;
        Tue, 14 Sep 2021 17:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631666686;
        bh=v/q9VM0TeFKoRzIhkJIsO6+m9+3iW0KlByTAGJfNRkA=;
        h=Date:From:To:Cc:Subject:From;
        b=tqWF7w5oJWPF3neuba1Rw4DL+T3ajuSytwl1uj+QasO343Lc60c006trCUrq0rSYF
         kkS/pfcTfsOItMFza0U5bQjFc9lsPnoDvlqVZNU5q3hZ059bynPH4Z0u49PEPm/hC7
         T6Qpy6vjwWDKHX5cjPtzG1S+AoZ3B8lx2c4oEF/ozm9cM7p2dCCNb1686g87JF8XCl
         4shLl5gLzs2nqadmtruNTE0zu1tuE4XSA33gnZvaiK9dyP0TzOaAmW1nc4dryXOYUG
         kAA5ABQgur+p+CxwHihdJ5vtvaG5B6WXCdTTCxEI7CDFbqrGkoNVyeabzZzeHdoWZZ
         m0nQRn4t4hZUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H8M1T5sQDz9sVq;
        Wed, 15 Sep 2021 10:44:45 +1000 (AEST)
Date:   Wed, 15 Sep 2021 10:44:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20210915104444.700fdb7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gQl=wG43h+OYZLIMdwuQE9E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gQl=wG43h+OYZLIMdwuQE9E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  lib/bootconfig.c

between commit:

  77e02cf57b6c ("memblock: introduce saner 'memblock_free_ptr()' interface")

from Linus' tree and commit:

  6c7324bca2ec ("bootconfig: Fix to check the xbc_node is used before free =
it")

from the ftrace tree.

The new memblock_free_ptr() inroduced by Linus' tree copes with NULL
pointers, so I just used that.  Which means that the ftrace tree patch
will be redundant.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/gQl=wG43h+OYZLIMdwuQE9E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFBQfwACgkQAVBC80lX
0GyBHwf/fGu6KzsdpRVJnkbwbxJ7fy7EL7glJVkZd5if+U7JJyF1s0Hw2GZfcgg2
K7BGnFAFHQThZoqcz7MkfpSbKt3iUx0shbmkKxQEGGsmrY1+6WiZdf+1cuQ/nstC
IAqt6a9NpKmgM00oKBOE8WZbukrPte4s4V5Isqb/23DCm5o/mghWNWJkGMfAwzs5
mgCeIGJm0ZbfOjBtn6ljICHQjApSJ4LTd3EWA7GgciAREvxdPu/ms4H7qbaxjLnC
ewehHt0KVUdT7LJFEMl/7N/e6z8x9JSoIHw/Zpfa08GFNJaVVmcUO8bpazT175HE
iXCGc70lhviWOfVaQNPCyXO+KSYsgg==
=h1L9
-----END PGP SIGNATURE-----

--Sig_/gQl=wG43h+OYZLIMdwuQE9E--
