Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E9A284AA9
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 13:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJFLHP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 07:07:15 -0400
Received: from ozlabs.org ([203.11.71.1]:42601 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJFLHP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Oct 2020 07:07:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5F6S31xxz9sS8;
        Tue,  6 Oct 2020 22:07:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601982433;
        bh=8ImrifGUmi7VURj7TBNSZenjHM+KYL36+UEt7USuaN8=;
        h=Date:From:To:Cc:Subject:From;
        b=ek/by9Lw/qKmsqoivyzZ4a9Vqzieubwoga5h64AUALTk04sOxk5tVDu22VpqELFWh
         qYBxA6AxdtA0FaIdku/5qWr1t5Gw4ExDML/il3bKndO9bEpS5ZAWC4vu+7U81IuG/b
         RHu1PmgIlBqsWLfYadG9f90vGyRQvRIVGJWupNF468yzzzd5pinvJLU6cYsi0j24b/
         vhJ+cF/HJzwm6+52so904Sbl73NPSXeMyeA2CFK/Fm/HytMug0N6RR4lh5K/QBYdCJ
         7Exxbsfh2mFEiystQ5VQmZV9OyV1tVkZyMJXoQw4FfK1i9TkMnzbWWBVJCku5mfuU5
         El5QePvSjREYg==
Date:   Tue, 6 Oct 2020 22:07:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>
Cc:     Joe Perches <joe@perches.com>, John Hubbard <jhubbard@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm tree with the kselftest-fixes
 tree
Message-ID: <20201006220711.0ec49da3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jy/9B02r2lXeGj4L1pUyxT3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jy/9B02r2lXeGj4L1pUyxT3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  tools/testing/selftests/vm/gup_test.c

between commit:

  aa803771a80a ("tools: Avoid comma separated statements")

from the kselftest-fixes tree and commit:

  5c64830675a6 ("mm/gup_benchmark: rename to mm/gup_test")

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/vm/gup_test.c
index 1d4359341e44,e930135727a2..000000000000
--- a/tools/testing/selftests/vm/gup_test.c
+++ b/tools/testing/selftests/vm/gup_test.c
@@@ -104,17 -104,13 +104,17 @@@ int main(int argc, char **argv
  	if (write)
  		gup.flags |=3D FOLL_WRITE;
 =20
- 	fd =3D open("/sys/kernel/debug/gup_benchmark", O_RDWR);
+ 	fd =3D open("/sys/kernel/debug/gup_test", O_RDWR);
 -	if (fd =3D=3D -1)
 -		perror("open"), exit(1);
 +	if (fd =3D=3D -1) {
 +		perror("open");
 +		exit(1);
 +	}
 =20
  	p =3D mmap(NULL, size, PROT_READ | PROT_WRITE, flags, filed, 0);
 -	if (p =3D=3D MAP_FAILED)
 -		perror("mmap"), exit(1);
 +	if (p =3D=3D MAP_FAILED) {
 +		perror("mmap");
 +		exit(1);
 +	}
  	gup.addr =3D (unsigned long)p;
 =20
  	if (thp =3D=3D 1)

--Sig_/jy/9B02r2lXeGj4L1pUyxT3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98T98ACgkQAVBC80lX
0GyVGwf/cFeXKZjjCj3Z3CXP9NWmDJknD0xDuBBiXJlIxPsNHP+476/ZnsWlrX8x
N89SmZO+VIyWdHTjv4SYLnDaF9vw0v4/qbhVbt8DB8kweGQizZ+9b76MA8B49e3I
Yi/14S6TAJuaTMR2H06AF4jZuDO/6Mu3yVx9YJ6hev/4h/AbNUmHkM+LE2R2Aevu
VN58RDLWjfBg+prQtgTqZ3UW6REVTF3QcCoTaeyzfxUe6j0Ojln1wwTm5BirgUiC
/oXPH9LGSAskZT66DY4Pz6yDYka2vdir46i/ByC+bGTaJBcvPqBW6TfpOxMPa6QX
QSM95IwBgTZkqRdRTv4dLQ/qUUy0Cg==
=Tlm6
-----END PGP SIGNATURE-----

--Sig_/jy/9B02r2lXeGj4L1pUyxT3--
