Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD1E2B75EF
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 06:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgKRF3i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 00:29:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbgKRF3i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 00:29:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbWb33KHzz9sPB;
        Wed, 18 Nov 2020 16:29:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605677376;
        bh=IRXHFCf7GoOwvtL3B+jK14LcmD5LgdMsiZuOR9Hw+pU=;
        h=Date:From:To:Cc:Subject:From;
        b=Wu9xQlkuUrLiyCjk8PoLFIySzuRH9/aT1649xoH6EzqzGzHc4iGVHHf44iX7tlfuI
         l2ij4hbx8hX9r3rvh1x9t3KjqleBGP4M2jjtKMnbLuvXlnEnvIqNQIfgGmOROMuoBB
         0cXXQZL38Jnay2wefjY2JCdIxl9Ary8oB6U50TrXOj7w4Nw5ZOO73EZgEY0mActvaP
         nl5xlqwDrMINDmRDne8jeKe8FlTi503jmG3Hp9CXbGm6ZhTTWjuwFejD3FDu0FFADT
         yGmxpj718LoVYKhO/INk5pF6CEB7lSu9Y44tXzQgdNtBWxM9g1UztguRQ3p7CvwnLV
         W+ANXwpWprG5g==
Date:   Wed, 18 Nov 2020 16:29:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sean Young <sean@mess.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20201118162934.6a12b8f2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i+lOAh3qNf9e5yIgFAVWfar";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i+lOAh3qNf9e5yIgFAVWfar
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/output/lirc.h.rst:6: WARNING: undefined label: rc-proto-max (=
if the link has no caption the label must precede a section header)

Introduced by commit

  72e637fec558 ("media: rc: validate that "rc_proto" is reasonable")

--=20
Cheers,
Stephen Rothwell

--Sig_/i+lOAh3qNf9e5yIgFAVWfar
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0sT4ACgkQAVBC80lX
0GxCcwf/SCNsgE1RJNke9Ne6HXEfJycfxenBDFeBBhnLiCuAM3CKbyNo7/RmMONm
wtPN8Za8boDvtlbud2Xvop/N52xBKu/huGLDYRs+3rIJdd4xbsXVZ66LLSFwIjSa
PpWDbKGGmGpM+b4w3HBzrEeJULEQP3w690uR0lhM828nGnTBkbhELVNfwLFUta78
1rvdpF0CZcIMCrqRgvKCBAzA2SjInhEn/hLiAeBJr+i4zYco9aKvY4m9N+R8+Jgw
KVU4lEkLCWDoYOIY5e1kk1jYPqBXpjdNPWZFG+vdme4NeYxe/zUjG3KkGxQ/6WP1
JZNw7/bd1DIF2EFnouaztrdGY5XhOg==
=euWJ
-----END PGP SIGNATURE-----

--Sig_/i+lOAh3qNf9e5yIgFAVWfar--
