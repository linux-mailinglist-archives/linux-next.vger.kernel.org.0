Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9DE3262D6A
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 12:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgIIKuE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 06:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgIIKuA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 06:50:00 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF48C061573;
        Wed,  9 Sep 2020 03:49:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bmf0w5BfQz9sTN;
        Wed,  9 Sep 2020 20:49:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599648593;
        bh=EvMjLLWYG8ye+Nkj1kVAl8lm1kSDGW8sok9j5nmLSXk=;
        h=Date:From:To:Cc:Subject:From;
        b=G2BRIMl+xcnrQ7PGQJb2uxdherMo+z+DbZWTx5sXyv1DI4uxVEI/8hv0d0hFOwKVX
         DJ61SIZU7Xh9s3iDiC0xjxosQ44ic9u2MtsSdPRIHbT6Rx+6I8JjrCcMtIS7PXQu5+
         oys4KdUM2fCCIY61hR+Sw/yDJAdL2B+pljrAcGb/tirzgrHPFGWOGdA7LuSESIWDcW
         C8nGofv2OZkTnWhoEZrq8iGuuXxNwoakPsOod5xRQBNas/1Eqd69CL90xgYjIWhk1a
         e1UPIgte5yIdb2OjrYKiFUzQJ66o7z8jYH+K5FoogexmQ0YPcHQK/SXzaGlkDyEMzc
         FsrHnbMITSZ4A==
Date:   Wed, 9 Sep 2020 20:49:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Wunderlich <frank-w@public-files.de>
Subject: linux-next: Fixes tag needs some work in the mediatek tree
Message-ID: <20200909204951.5d3196d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T0nlLIBYi1r0k9carTJ=B3u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T0nlLIBYi1r0k9carTJ=B3u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  845d404207f1 ("arm: dts: mt7623: move display nodes to separate mt7623n.d=
tsi")

Fixes tag

  Fixes: 1f6ed224594 ("arm: dts: mt7623: add Mali-450 device node")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/T0nlLIBYi1r0k9carTJ=B3u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9Ys1AACgkQAVBC80lX
0Gz0vQf9HGqlDZ4guJsaWjozr8yoEvYivDX3R38A2SAm3r6SrfRxWSet/T4ZyCGW
6cwAkd17sIF3+qwe8Vgj6DcnmOEw28Jv/u6aZgRYsdDvCGxPdRRJ/7maha405MXu
o6Czhocxu9mQfTAf85dPqSkAc7+WEfpeolxcSq5AHxV3ylclVlyAzFhFzHAiX5VW
PUrMNXSjwdY9y009AuIIhYAtc0L8dVpjId1u4aWlQP57PykfTn8raDq0WmsSRZL4
wJzuq2P7F9QRzQBvfNEF1l67hsgGSIMGoWWl5C1CFdHng7djL9RYWcJhTxKKwkhf
JBRlzY4qWhqNHF5cZIFMzLD4rA3vuA==
=JWjY
-----END PGP SIGNATURE-----

--Sig_/T0nlLIBYi1r0k9carTJ=B3u--
