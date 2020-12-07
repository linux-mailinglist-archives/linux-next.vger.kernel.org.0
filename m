Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B342D0BA5
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 09:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgLGIVK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 03:21:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42933 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbgLGIVK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Dec 2020 03:21:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqGTT0KMFz9sVs;
        Mon,  7 Dec 2020 19:20:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607329229;
        bh=JhyVHmkyoGEJqe0Rw7TXq5mFsKpfUzl2Ks3vJMnF5JI=;
        h=Date:From:To:Cc:Subject:From;
        b=TmMz0NDklCQbSyUq/lL1etTuRxtNZkrhJNQWbBi+uQnhx8zWFd1LmnRn0SLyckkTU
         oYu/UK1S4oLx2XvkjhxF62jgqDoGW0a4HAkcswH4UEHppkBWGbqIgYufZmOWCVQ7hE
         VTJrKWJjt+sgbVo9gaTR8HmnNv575yqdJvN2C8/hV2WxHrzyTVGeGsUxHMnIt1KyT6
         ibJU4vpFnzEY95atWup1l5xMpM1zPrQh/E3I4RCLmrkwqLBbvD7fadnMsgJKnOU1jo
         hVCQN3HdlWM3D9eJom60RZo/XDdSX11q9TeRMIL2ucJS/BRn6q4RjBLOaoBRbmpqul
         sypk3uJ43sqyg==
Date:   Mon, 7 Dec 2020 19:20:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rcu tree
Message-ID: <20201207192028.5333e4d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/exgxrHSnWUo6snM7cm.5WOL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/exgxrHSnWUo6snM7cm.5WOL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/core-api/mm-api:49: mm/slab_common.c:569: WARNING: Inline lit=
eral start-string without end-string.
Documentation/core-api/mm-api:49: mm/slab_common.c:595: WARNING: Inline lit=
eral start-string without end-string.

Maybe introduced by commit

  f7c3fb4fc476 ("mm: Add kmem_last_alloc() to return last allocation for me=
mory block")

(or one of the following ones).

--=20
Cheers,
Stephen Rothwell

--Sig_/exgxrHSnWUo6snM7cm.5WOL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/N5cwACgkQAVBC80lX
0Gz39wf/cigMi54ihgzx9sbTkvg5IjFAh0P9Z3WUbH0sYQMBqp9gL+QclVCChwOt
IsTDHBaWCdUItEWwCfdyrVOiuMaQAGvhj3VYRh6leo60s68xuzlAs73gfJ9NBqRB
YTrbtEmZY+LgACvGd9ptNiZ2zY3dAwTNTmwSC+udpjokDnCirHJnDT5PE4oBIU6o
Pp0sRlONEchKufkOXum5qmWbspDtnGsC6puD5vsm1uwu4ROlJbbLiC0g0Xij1Snb
WwoFsc4REls8gxJ7oy4WGnwSxrybIUzKMq169akPXpVo/MGYs9E5GRwFDxpe5TPi
j7+Z/mAusu/PaVHu/mEWp9SthS1xRg==
=Q1KF
-----END PGP SIGNATURE-----

--Sig_/exgxrHSnWUo6snM7cm.5WOL--
