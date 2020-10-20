Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DDC2943E7
	for <lists+linux-next@lfdr.de>; Tue, 20 Oct 2020 22:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438467AbgJTU21 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Oct 2020 16:28:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37929 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438468AbgJTU20 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Oct 2020 16:28:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CG4vX3h3lz9s0b;
        Wed, 21 Oct 2020 07:28:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603225704;
        bh=tNVlJUFOHwr3aC1tc2NAjXj72G5LieGth3FCcA8rD1Q=;
        h=Date:From:To:Cc:Subject:From;
        b=k8SQZUuMffHmSX+zpmFBU8f/t/BpPNVjxLSLzRVPdpjMbWT4vmzo9Jh1Lr9t9ysu7
         nfQ/rSKhigXH59xyMW28NQS+Pn1NKjauGzJWSCLxJ6BKjQfSS4OWibbtLdbrVY976K
         s2FspxeDZrh8rULE9rFk4SB69MaS6o10rOeq4GpcxAZsnEHQDySnps81mHKqTtJAJ9
         nxfVGACK3/P9xA43axCZy0Fbjg0cVv4iSYCuCpqH5iVs2Z6bPEtjV9XWjDkwuMCr6X
         nQPibmfIuhLmEmi7nnWSnznolbMAM973fVmY6gK2V+uBb8mWL27GV3aYqALlG2SvYy
         1YrP1itE+pmkA==
Date:   Wed, 21 Oct 2020 07:28:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Ritesh Harjani <riteshh@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ext4 tree
Message-ID: <20201021072813.524b9af2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jdLAbczzAawsPgqrrZNo56s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jdLAbczzAawsPgqrrZNo56s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0e6895ba00b7 ("ext4: implement swap_activate aops using iomap")

Fixes tag

  Fixes: ac58e4fb03f ("ext4: move ext4 bmap to use iomap infrastructure")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/jdLAbczzAawsPgqrrZNo56s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+PSF0ACgkQAVBC80lX
0GyZAgf+KMlmn14A3PUKub4EQ62HM7D5Imcx/9QUnUDFprJA/PucMHrU7tNHG3B+
PAlLDIBuw1PoyHYUboshGLcyAWoQqvXHY7cfIU9qHLvZdnF54n36IyTrJ6tZ2Gzd
vZ5zhmhy2NDLmj4vJDHZ2ORKFxiwJdFTAyp1v4SOxIDrqm0R6gmF2nVzcSarA71z
Psxzw90VCPewMO5Wp9JYmYAm7QWUgxcZNrQGgVAymoFt0tG8wdxhDtFtvB38D08F
DBncAUTD6xvmgf86B9/d2grstDCsrsS28S4itNaU/Gkv0y5qZXv6yLDrwCi2T+5f
4z4XmJVPoeMFT8llZgoUvkDnsQy0rw==
=elS8
-----END PGP SIGNATURE-----

--Sig_/jdLAbczzAawsPgqrrZNo56s--
