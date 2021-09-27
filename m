Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB7141A169
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 23:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237358AbhI0VhC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 17:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237381AbhI0VhB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 17:37:01 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529D8C061575;
        Mon, 27 Sep 2021 14:35:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJGBx1tvzz4xVP;
        Tue, 28 Sep 2021 07:35:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632778521;
        bh=ldpYx0cQdcPSDO4hGkNCyKF3aAUshCs7gIrXokMxBPM=;
        h=Date:From:To:Cc:Subject:From;
        b=myXCiCb2OuHGDkuiMss9w1D7ckuBJdWmiOX3eqQZq4w7kNa9ota+jkFkWnB2uOTt5
         teGfQRgLAUS7gPjZa3xZLS9UUK1ypJEcrBdUGZmwgR2izcCDYY34xHqq3GGJTGTlyZ
         lWCGinhixq9tZwAsgxlzEQyoFkiH6nto8R0lnjpU5tmNW3z925+5pM7gfG0w7Lk2b4
         GMHy8L2OyYMmYrYV7stbYNXXXjCsw2pwHP7unFDp0uZ4r4qZ+wzZ9vlAA2jIC4lPns
         jeCTbpOO9iuhDKFY1Z/psocFmLl05j0ALQhr6SMbzjJxfWtIvGV5L1jckdGg7SyLtC
         79bh3Xvxt6HQw==
Date:   Tue, 28 Sep 2021 07:35:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Ian Rogers <irogers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the perf-current tree
Message-ID: <20210928073519.34ec0811@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6zcrSIpQc3Fl8vryzKBOQcU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6zcrSIpQc3Fl8vryzKBOQcU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5c34aea341b1 ("perf test: Fix DWARF unwind for optimized builds.")

Fixes tag

  Fixes: 9ae1e990f1ab ("perf tools: Remove broken __no_tail_call

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more then one line.  Also keep all
the commit message tags together at the end fo the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/6zcrSIpQc3Fl8vryzKBOQcU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFSORcACgkQAVBC80lX
0GyAqAf8C9PqjTejRHOi482WNG9Qj1iiPaVd6i8mEMzIZydUU16SRIKx6zuWCfFR
dA4QpYMId1kAYH48gD/1stfTZOZzjh6tKMj189lSYo8L7syyxCzcq44WY/RE94qp
X1Q4IDsB1vnF/L0SAbxwhjIuHE7u2XbxRdN7lnsmn8UVFnFRUqGGaKSLFg/SJFda
zUMCQMYj+yt97VeUasM1YvQsqZHoBU0KvnbyPbQSvY2bl38WcuPSGJWDruKAjRcW
P5l8ykwQ+OOmf6xpGgbraHxcobtZVFtC+rHezp4c5uqgTc0B49hHAalEH9kJIyg8
/jTAdIsFKorJ7qjnUKBrFU1fHGvEnw==
=hPeu
-----END PGP SIGNATURE-----

--Sig_/6zcrSIpQc3Fl8vryzKBOQcU--
