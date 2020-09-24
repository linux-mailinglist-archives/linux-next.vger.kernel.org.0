Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206F1277BB1
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 00:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgIXWk5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 18:40:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33557 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgIXWk5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 18:40:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4By94Q4mZlz9sTC;
        Fri, 25 Sep 2020 08:40:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600987254;
        bh=hv63+vXvcDdLa0bBXJKAk5YHBg1OMiyKhExHjV/FYk0=;
        h=Date:From:To:Cc:Subject:From;
        b=S9ISAO2vkhQ0EjQE4LB/C9OVef6wktk1rjOFCMcN1caPc5Z7wk6WogD6rDHYqQ9As
         jsVB2uCZz2JZxkrdrYX1S4mL7+g1NlV7ErACnxTP8NhcYkayWfVVcbaOuUjmey79Ns
         Sv4c3ulTW9wT5rl+JEWl6yTw5BWzV5pS7RLLeyRXwtp8K9velkhfctddeWdh2TZz2F
         vpHmXjQYgW08sCMEg6/gBgW+L75hhwW/4H0OlYyMLegd3/WKYbYQRH1dQdUBXj450T
         7KQ/lfAOs1TQGuc+IAQ8Le4spV54SfffV5j3/AQka90uHJ7oO2WTAs8IqD+GfIKr4C
         Ttcpoir6wTCsQ==
Date:   Fri, 25 Sep 2020 08:40:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Song Liu <songliubraving@fb.com>
Subject: linux-next: Signed-off-by missing for commits in the block tree
Message-ID: <20200925084053.7169dd01@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ykyyY4MtI8=kvaHeH9XZcum";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ykyyY4MtI8=kvaHeH9XZcum
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  caec515ad9ed ("md/raid5: reallocate page array after setting new stripe_s=
ize")
  6a4b2e201b37 ("md/raid5: resize stripe_head when reshape array")
  1df3ccb18cf4 ("md/raid5: let multiple devices of stripe_head share page")
  e56e7ebce809 ("md/raid6: let async recovery function support different pa=
ge offset")
  2b2059f32e20 ("md/raid6: let syndrome computor support different page off=
set")
  f849daa2c23c ("md/raid5: convert to new xor compution interface")
  4737539e07a3 ("md/raid5: add new xor function to support different page o=
ffset")
  a5a1925b9a1a ("md/raid5: make async_copy_data() to support different page=
 offset")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ykyyY4MtI8=kvaHeH9XZcum
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tIHYACgkQAVBC80lX
0Gz5sAf+J4YRdYQBn4YvqLhOkGKTEdKwlnvKc0SZvtFSpmNtxfzSdVx2qICiWEie
1yUpJ6sKsxImJjL9+0/Qj6K+KBtBSR5BGcBNQfbL5XrJCj+VbXU+uYU72n4m5IfB
V9JhHDSYzDk0ztN8Bc/Mf1zJmSAu3YXSnX2g1mfFekFCAqj4imF57UEb+V/5vMKj
jo3mIw/QY+MT4sAxvr2TTV4mkObElKGvGhmQaKKBf8WvXE7FyPP+KPyv1jnBUwDJ
IydDnDsMKBiSlBHMbHQIeFqQHm41GpA4hwzTjMW76Lcaol8kXSLy4y3ou7pXtOHf
e5S04XWjDgiRnWBMe9EvZmaHrcQqNg==
=mPkU
-----END PGP SIGNATURE-----

--Sig_/ykyyY4MtI8=kvaHeH9XZcum--
