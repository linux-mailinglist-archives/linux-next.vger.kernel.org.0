Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050AB228D2E
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 02:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731138AbgGVAoG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 20:44:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726468AbgGVAoF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 20:44:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBGtW10frz9sR4;
        Wed, 22 Jul 2020 10:44:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595378643;
        bh=HWIIhnG4c5m+8etDE8Vn31V6Al/spuQpJSoHGrnNFOA=;
        h=Date:From:To:Cc:Subject:From;
        b=dPVC1J92D4brCD7Vt1/F2txmldkjFMejL9zEkv7JznOtRCOUp14nZicBHzdbzyZIN
         mfNMrdDCbSeOMkN5m5vD3wZd9mGwSEAK6B1DGW4AkEzxuE/kOCs2RC+JhyBu1Fopy2
         WDMhpErApi1zxWYETMN3LHI8jGsQ5p14fpKnMeZ7mgEWmTLQJQhsv1Y511z53Vx7Y1
         XrbyJq6wQa/XP92acKhlER+fshogiweN9S0baC/NOzd69Qz3X/IxYtYRJX+XgJrH2s
         23lZWl2Qun0AF7fnq6p47ZZkLT1mn+SF693PzN73FseLHjgQqr+2AU2zbkmnH5DaaU
         xicUsBYjOmFnA==
Date:   Wed, 22 Jul 2020 10:44:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the xtensa tree with the csky tree
Message-ID: <20200722104402.5f95bcc1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/29F/PfU2JgwE1THz1oU0DyX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/29F/PfU2JgwE1THz1oU0DyX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xtensa tree got a conflict in:

  tools/testing/selftests/seccomp/seccomp_bpf.c

between commit:

  f4dd2edafba0 ("csky: add support for SECCOMP and SECCOMP_FILTER")

from the csky tree and commit:

  deccfc9ce639 ("selftests/seccomp: add xtensa support")

from the xtensa tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/seccomp/seccomp_bpf.c
index 8d18a0ddafdd,1b445c2e7fbe..000000000000
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@@ -1704,7 -1704,7 +1714,7 @@@ void change_syscall(struct __test_metad
 =20
  #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
  	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
- 	defined(__csky__)
 -	defined(__xtensa__)
++	defined(__csky__) || defined(__xtensa__)
  	{
  		regs.SYSCALL_NUM =3D syscall;
  	}

--Sig_/29F/PfU2JgwE1THz1oU0DyX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Xi9IACgkQAVBC80lX
0GzPpQf+IFV67SA3EFrfTacozaVBNTPDo/ZIBE0366Xu7i7j5jlXgU0GSX1OcIGx
U/voFs7l1OuwpfCHuHycxTqsfYlnSLO/HUpbzjaSPePaFSspTAHZ8EKwgQbSgZs6
2hucAjKtWx8AEsO6dVkkzIS/hAlckkajx5Iucz0WZQgEnlE6t+V7cGsm/YmtrDfI
kwFah4ie5g1VDRS1pPJ+eb5WvtNVZDE4VlN9gjO/41UW5neCOi25fPFYADtBjnFV
ArT/8reLSHxF05Nrqy//CyLwanjtgA87KLzgoOC/RTXMtGdxxyPmp750/0o6bMjL
35HQ6WE1u4gp/XJ5UfSsNM9jbP5VvA==
=Tqz2
-----END PGP SIGNATURE-----

--Sig_/29F/PfU2JgwE1THz1oU0DyX--
