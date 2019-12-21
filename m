Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FC41286B2
	for <lists+linux-next@lfdr.de>; Sat, 21 Dec 2019 04:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfLUDKc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 22:10:32 -0500
Received: from ozlabs.org ([203.11.71.1]:45603 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbfLUDKc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Dec 2019 22:10:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47frGD6szlz9sPV;
        Sat, 21 Dec 2019 14:10:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576897829;
        bh=bIb/iLNeJrBgQtcc7XEvpTV4Uk42F9Zucml+Wj869GY=;
        h=Date:From:To:Cc:Subject:From;
        b=DWwSVYGtYQ4mzhAVFWQCEHKgcjkJ8lOcMhr1OgzSVUpn1jy4wUt11SaF+U+22Ymu+
         /oIggwdgVONGsvlZDVGhpe6UY+28WxmtO4QEJP2LANBigr3gywwrI1BqHA8pZdPwkM
         BrjZPkyTf95gfJxi4JFO6cyzBe6v2W0KcpeYR9U9dnTg2I3zFv5LPwBR5wjyP3bY2g
         2pBPSzPrVVp6m5n2wAF8smF9sObRDKxu3WUWecbOtJ6eg6omEurlx2SkF703UVMLrN
         GR41XLSRc4YDR8hJUYIaGvZXVznrarTgz2YJab7Opcl5n2GBlKmKLJLxYuHrwgQcsP
         29xJf5cgzHrmg==
Date:   Sat, 21 Dec 2019 14:10:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Adamson <andros@netapp.com>,
        Olga Kornievskaia <kolga@netapp.com>
Subject: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20191221141019.05f0f619@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/flwicFQfaG_QG6/j=T4e76X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/flwicFQfaG_QG6/j=T4e76X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  51100d2b87cb ("NFSD generalize nfsd4_compound_state flag names")

is missing a Signed-off-by from its author.

Commits

  ce0887ac96d3 ("NFSD add nfs4 inter ssc to nfsd4_copy")
  b9e8638e3d9e ("NFSD: allow inter server COPY to have a STALE source serve=
r fh")
  51100d2b87cb ("NFSD generalize nfsd4_compound_state flag names")
  b7342204253a ("NFSD check stateids against copy stateids")
  624322f1adc5 ("NFSD add COPY_NOTIFY operation")
  51911868fc62 ("NFSD COPY_NOTIFY xdr")
  84e1b21d5ec4 ("NFSD add ca_source_server<> to COPY")
  af76fc6c158d ("NFSD fill-in netloc4 structure")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/flwicFQfaG_QG6/j=T4e76X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl39jRsACgkQAVBC80lX
0GwwSgf/Yc43/i1yIQRAsDzsafHg44AkwO+VwQThcj0Ht0IDLoAJmCrDqGGDfboi
qUysNIWEG1jwq9K6Y0MeoatCEi5HFaaam0QahIQjP0xE6GtCrDNwwSihJtl6CSg6
EGXYV8bQCEFn5PSdyeid6+U3aywSU/0oY6f2HFvTzSRRlKfzY3Xc2JNZXcgu0FMO
hRlxf3HaDkYAfB07ZrSUyp8VdOHBsHErrDFdolUaH5mSfPB6lvQfnvKxoBaGIxG8
Xo9Zetkz4CdKq89tt4xWWrniOdhD3majAuRjGcU+p0pIo3pVotwvVXulAJhpauum
iXR5PKCBc0zuH9b/fmW6gRaCbYZilA==
=tEWG
-----END PGP SIGNATURE-----

--Sig_/flwicFQfaG_QG6/j=T4e76X--
