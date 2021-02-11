Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4C43196C4
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 00:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhBKXi6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 18:38:58 -0500
Received: from ozlabs.org ([203.11.71.1]:36373 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229742AbhBKXi4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 18:38:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DcCjx4nykz9sBJ;
        Fri, 12 Feb 2021 10:38:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613086694;
        bh=wfiP/uy1qHv/ayrF8P9eKHzB6FIdOy2YLI3SgWhi5hA=;
        h=Date:From:To:Cc:Subject:From;
        b=hnp0ER2qikKOUr3aLwjnbEVmRGcb6VisBH6EpxCxq7r+YTvcdoIBCY4MuRlVGWVZv
         8wWcy+vIKGHKRlz1n66mJ74Wibw8R1edZj7STePwKoA8CO8/aEk/v/AbB2G0Rk9ufe
         PlF1lTFgAI7yWVBiFEWc3tot/IwKs8WIqWORSIRgrVvqTXi3wJyIa2u0+b7L31tWXK
         kywlBpSIv+eXKK6H7XpnKhgzWJG7toeib/ppjNp069466b8w0iLTssDenc1qB7BPTJ
         8MuEH7GI9sNotxmJ+voXf++MtGLRAyWf3f/afQZ/4JaqZ4TirsUT6+S82TEj2volaq
         jHewFZH9jrLxA==
Date:   Fri, 12 Feb 2021 10:38:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>
Cc:     David Sterba <dsterba@suse.com>, Ira Weiny <ira.weiny@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs tree with the fscache tree
Message-ID: <20210212103810.170b93e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Sl9RCN.B0FAd1HbN=/XHgv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1Sl9RCN.B0FAd1HbN=/XHgv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  lib/iov_iter.c

between commit:

  11432a3cc061 ("iov_iter: Add ITER_XARRAY")

from the fscache tree and commit:

  325a835476e3 ("iov_iter: Remove memzero_page() in favor of zero_user()")

from the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/iov_iter.c
index 24413884b5ca,aa0d03b33a1e..000000000000
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@@ -1048,9 -961,8 +1028,9 @@@ size_t iov_iter_zero(size_t bytes, stru
  		return pipe_zero(bytes, i);
  	iterate_and_advance(i, bytes, v,
  		clear_user(v.iov_base, v.iov_len),
- 		memzero_page(v.bv_page, v.bv_offset, v.bv_len),
+ 		zero_user(v.bv_page, v.bv_offset, v.bv_len),
 -		memset(v.iov_base, 0, v.iov_len)
 +		memset(v.iov_base, 0, v.iov_len),
- 		memzero_page(v.bv_page, v.bv_offset, v.bv_len)
++		zero_user(v.bv_page, v.bv_offset, v.bv_len)
  	)
 =20
  	return bytes;

--Sig_/1Sl9RCN.B0FAd1HbN=/XHgv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAlv+IACgkQAVBC80lX
0Gwbwgf+Lw3uRQsaf2tqcI/JmSjSRPpAVKUbb9w52fT5GU6SpKA384D/z9mS0HBE
LxWtPCQOIMJU9nvfNdpGLPrFW9hsRL6OwSchiaZvO+EVLNuiZuLOtsbk5WZCZQvV
GAA22GwjY44umWOxKIbDc6+Dr2c049eLu7assumVni917pVrKdCRzccWhW6vHDzR
/7wLvZk4qHJZ8VMibqxgmirv7IXL0Dkn05sH0mDtgmkLawH+U1S4EVKc7GCTixAy
f24Y28JYwDnVEBLIQULvI8l7SPNbSlgHtqRLBf+dLyCH+6/c1PoG0oyKnO0FqG9s
TI1WO/Ky6sU/AsFpTqdUbQDf8/1RNw==
=auiZ
-----END PGP SIGNATURE-----

--Sig_/1Sl9RCN.B0FAd1HbN=/XHgv--
