Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9310039ADDC
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 00:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhFCWWR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 18:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbhFCWWR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2021 18:22:17 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA73C06174A;
        Thu,  3 Jun 2021 15:20:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fx0hY5YQTz9s1l;
        Fri,  4 Jun 2021 08:20:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622758830;
        bh=nnwk3nDmz6mD1Mpm3cLyQowQcGZnGHtqIwI/HIBo+F0=;
        h=Date:From:To:Cc:Subject:From;
        b=M0/SBKWVmhw2/xUOVYBhGXmKLDNYdJpXaHiczFY4ck8FIj+FXW0XeGa7rTBD9Rqq3
         rrw5pJrry+TT+DjnDbTCwcy/gPdN/ZwMku7ZbK9gIfrTbfU5TZIlspZvBbKOn4EHfe
         MQVZKBcJ52wRodAAcD34U8bS6GVolKgc4rBkT7e+KSxpg90Zz5TckxCNDBQlyV14+x
         t65H2/qPQ/lqqDsc2uM6i90rF3YUdXgSUXMTPkzvhDzVNe1lIdz5GSP7AVu4FLAVdQ
         2xrPNLk1LekNKZdYqVhzgr7AQnzTkpBW6jXHSXO2UabhoDxtn+heHSDBvPdqE68+o9
         9YvQF6cHWrWkA==
Date:   Fri, 4 Jun 2021 08:20:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Anna Schumaker <Anna.Schumaker@Netapp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20210604082029.4b923ff5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O.ateFYYUfFwX.oy0jk/0f9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O.ateFYYUfFwX.oy0jk/0f9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  476bdb04c501 ("NFS: Fix use-after-free in nfs4_init_client()")

Fixes tag

  Fixes: 8dcbec6d20 ("NFSv41: Handle EXCHID4_FLAG_CONFIRMED_R during NFSv4.=
1 migration")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/O.ateFYYUfFwX.oy0jk/0f9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC5Va0ACgkQAVBC80lX
0GwW7AgAgfziKZqFP+HbjgxXvCGoo2USzetDo+6c/6KiXAs81tg03nv37mkSx5Dm
yDoCPL8DGtV8HnvBvdhwmCW1wm2+sjeFk2hB6cy5aSpzJXFkJY3df7hrtwut7L1G
prqJQJXbjkOtzX6Rn2rjwMzuwVIO2dtL3py3o+AW9ivdB7R9a6q8BFrugnIxSy3z
SNWHG1qhmih3+4PG8tEAylTFPtzRoX/ITeUMIN31i1oR5sok5rH9/Mcgz8OD3QpN
ZbR9e7gldzyzOribFb2CSQKfj7kAd7a65e0r2lM6jWKSNelx6eWiiAg+IcuK9ZsL
Wj0PGivDijOCRekIHjo/K3mC3UviwQ==
=d6ma
-----END PGP SIGNATURE-----

--Sig_/O.ateFYYUfFwX.oy0jk/0f9--
