Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768633203B2
	for <lists+linux-next@lfdr.de>; Sat, 20 Feb 2021 05:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBTEwX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Feb 2021 23:52:23 -0500
Received: from ozlabs.org ([203.11.71.1]:37573 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229725AbhBTEwW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Feb 2021 23:52:22 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DjGHv6prKz9sBy;
        Sat, 20 Feb 2021 15:51:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613796700;
        bh=grLBHBn1q4Xz+1A2+TcFQVI7GILqnVyfk95GqmefIrk=;
        h=Date:From:To:Cc:Subject:From;
        b=WE1r9rwMhfrWEkDPl6B70jd187DKbKHwKW6FgkPidc+G1qz7h5eP86nbBFmUYI7yc
         BbtBCwYgST0fCIZeR7YCLFCCpWB4N3dtvWY9/s5/4u1CHZgqEiKE2diOqJpIxYPT32
         VzuJrSLZdnVYacXWZC+bQMTyhgNmGuDgt7q1m6tId4cIxPFlO4ZlAT0AeJntqap/ty
         eWGg/DFiOE+NtV0Y8ikeKrgJSwZ68XBwduvjLQwLXjDc93csH1h1HHtpNjp40RTV9Q
         KU+afIGjQ1VkckWCQK2XvuA8OpjEemRkAOLIRfrgSQEfbgb4NfOp2hzZxd071bcd9c
         LBzo3zpUYYFCw==
Date:   Sat, 20 Feb 2021 15:51:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210220155124.4bffc798@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DdWa2VbhhZTtwiIi7XXkooM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DdWa2VbhhZTtwiIi7XXkooM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  76676c992506 ("io_uring: fix io_rsrc_ref_quiesce races")

Fixes tag

  Fixes: 0ce4a72632317 ("io_uring: don't hold uring_lock when calling io_ru=
n_task_work*")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: a4f2225d1cb2 ("io_uring: don't hold uring_lock when calling io_run_t=
ask_work*")

--=20
Cheers,
Stephen Rothwell

--Sig_/DdWa2VbhhZTtwiIi7XXkooM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAwlUwACgkQAVBC80lX
0GyrewgAlyY0XF+4mAPmWkbzTIzADeuRWPsyXfpTeOy62gDJQ/Tk6omWQlpBzw4A
r0hVA1AybfhtPTffuFg3cXqcgo8mbSD9DVUYvwFrtM62pc5cmQ0wCPV1rJT4rieL
/ujd8kSt2E806BJR1FegE/lYaT4wxy05gVmxHNTBUkoGtwYpXduwnTWytIx78emX
9CHKoBDaTwDoqQ2UtKg61Bo5NDm9i3/8Y8GBXGtIC+bTlJ/yHR3UcEML8nIz4YKM
EXSiXZpnoh2lgFRGzgA2qoIg6lGrHhK9CsFDRAxRi+GPkcjFzx62IB+LzP4mzvHd
xPmAKziarWMvQvbUlWo8KdZWy68d0A==
=iGks
-----END PGP SIGNATURE-----

--Sig_/DdWa2VbhhZTtwiIi7XXkooM--
