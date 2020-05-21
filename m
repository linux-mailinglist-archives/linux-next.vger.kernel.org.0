Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283901DC394
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 02:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgEUAaj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 20:30:39 -0400
Received: from ozlabs.org ([203.11.71.1]:53791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726844AbgEUAaj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 20:30:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49S9Wd14jvz9sTC;
        Thu, 21 May 2020 10:30:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590021037;
        bh=8K5SrG46YjcWNv5Y0lpux2/tuO5AiOFETUC/sMBDS40=;
        h=Date:From:To:Cc:Subject:From;
        b=S4+U4oIh+kdYV3+IdhacHQM/u3uYvZV824+GLG9PGouo7es5hiIpjcVpPY/yiRHUE
         B+9hYWm15Ea7X/cSblD2ul/Hc6XNdQvwSo/aYrtVooSFCrYgpjgzDMBjSTN4sLv80d
         wAB+YzaLLkOwwnVk/GZxxeLoTDV2OHOyBl4FKS11QA/2YoM6GUQlfRwhhpJFotNYW9
         m80NauCgnMwMDftqr/o0AzGc1AGn8LUnyXXDFKUOUSqrwTsUF20uKqwV1UVMEKt48J
         TUqnkftmN87nCH8R2XFRsBerKr60Sce0KDSig4Xka5JaTckpjwAKW901ovQjyvDbhM
         nCzawYnMVa01Q==
Date:   Thu, 21 May 2020 10:30:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the f2fs tree with the fscrypt tree
Message-ID: <20200521103034.49bba1e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g1KhqsO=+YVQMiPorwpCtFV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g1KhqsO=+YVQMiPorwpCtFV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/f2fs.h

between commit:

  ed318a6cc0b6 ("fscrypt: support test_dummy_encryption=3Dv2")

from the fscrypt tree and commit:

  1ae18f71cb52 ("f2fs: fix checkpoint=3Ddisable:%u%%")

from the f2fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/g1KhqsO=+YVQMiPorwpCtFV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Fy6oACgkQAVBC80lX
0GwJVQgAmIr5kgyC9EAr45ew/B7nvpugX4TNSzU7J2f9WPZe6bFLUEwsDFv9Jucl
8kalDDk4GXYhaWOmN7MkBG/3zTE3U+3c9iz+NBuMKM97KkBPD5xMgOB+3PdGQWg6
PborI0YU4WgBeMMZaQ58LsHXi8lWoa1ZN7k0Iuabek6K6oOhJH7w58ItNWomOcip
hiNwed1giTG094dP8xRtoSPpC24fs5LpNy5BJMxaGZMhjd1eFgO13V5MQwM2B3Sm
CHzEP4MOIsdtLyN2SfXsOd1RlG0/CfWtjwvOYp8o6YJaK9DoGMuMfGfTtRXqac8R
GSlscwYyX2GeMf/bT158/YvQPyBcrg==
=p1eK
-----END PGP SIGNATURE-----

--Sig_/g1KhqsO=+YVQMiPorwpCtFV--
