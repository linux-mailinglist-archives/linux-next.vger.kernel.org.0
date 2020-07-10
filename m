Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C33F21B076
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 09:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgGJHoH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 03:44:07 -0400
Received: from ozlabs.org ([203.11.71.1]:44501 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbgGJHoG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jul 2020 03:44:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B34mg5gnFz9sRN;
        Fri, 10 Jul 2020 17:44:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594367044;
        bh=Ofc7OFZZS89CLiSP2EAJ6EFzJWAIH5mL7JdJIQFHVYM=;
        h=Date:From:To:Cc:Subject:From;
        b=TDCLsuyW98TVwRM+JWeqR3WInQVNwJVA2UjUAUxV7sAPW0fZLR+wUSnUtVmn8Kv7W
         wi/9P1sclMegtVBW7c6Fcf5QC7aEccvuGDkRzynO1ZlQBHHCkNfjaY5o3fScBeYj9E
         0z7DuEvSRb6NYQiyuXQVjWljBaeUB3jDnD1AbdpeK02eN5afhho+S2t4AP+DSqSib3
         /VT1NKfZI2Bm9z+3NGdSPNHL+DB7D5zFLFoUMtsuAlaS9ww4gqyl3HdY7B/rF1/MnX
         znR7ya3OAH318Ypm3r+50ijSAVZhkIVQLv2aCUxBSy6UtunfnIlTIPS+dFIwJRX39V
         08IIdiJ8CtPAg==
Date:   Fri, 10 Jul 2020 17:44:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Message-ID: <20200710174314.451a29af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IcrC8uHRZCHQjY57=5CQ0Re";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IcrC8uHRZCHQjY57=5CQ0Re
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/Makefile

between commit:

  1a479f783857 ("lib: Add a generic version of devmem_is_allowed()")

from the risc-v tree and commit:

  d0bb028dd7f4 ("lib/test_bits.c: add tests of GENMASK")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/Makefile
index 7bdda9ea53ab,591d10906354..000000000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -342,5 -317,4 +341,6 @@@ obj-$(CONFIG_OBJAGG) +=3D objagg.
  # KUnit tests
  obj-$(CONFIG_LIST_KUNIT_TEST) +=3D list-test.o
  obj-$(CONFIG_LINEAR_RANGES_TEST) +=3D test_linear_ranges.o
+ obj-$(CONFIG_BITS_TEST) +=3D test_bits.o
 +
 +obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) +=3D devmem_is_allowed.o

--Sig_/IcrC8uHRZCHQjY57=5CQ0Re
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8IHEMACgkQAVBC80lX
0Gx0jwgAgh5HbgxSiiQQyWW1ctkaQrdhpTwDPwqcEXSdvG6axU/Ker4KZ6m3Bzbk
YqXVaeYzupzWdV43ZcaAsOMEEwSenFwjrLtI2sJUdhqdc4iRIGNDzPox89yGobNx
O6gJ1T73oKkVI2UaOyP0IDFRW9tptwtouJayYM0rOmSQkNKaCkB/qBNqQyM+YuEF
qvu2HVHm8W9dnUIifUseu26B5am3OXBYldMSxfOBX3xJH1J99e99inX3NH4BExbv
HkA4HZdNOBdE8VOS80I+HiqLn5l2+GWuThkNbeAEzZ7PAMYfjODg+UurT0UQyK6x
RGFp7xKpiVo8GEouoBdKmxqYNZGadg==
=wYHl
-----END PGP SIGNATURE-----

--Sig_/IcrC8uHRZCHQjY57=5CQ0Re--
