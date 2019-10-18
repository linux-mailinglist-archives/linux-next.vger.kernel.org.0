Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD75DBD4A
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 07:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404182AbfJRFzp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Oct 2019 01:55:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33079 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727328AbfJRFzp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Oct 2019 01:55:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vWf14WFZz9sPT;
        Fri, 18 Oct 2019 14:26:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571369177;
        bh=LSaUNMP7pnfYM7NL4rX9VS3spsS5UxsGD+1eIpJRbAU=;
        h=Date:From:To:Cc:Subject:From;
        b=Fiuq6pmJNDPw70DmQfmh2lS5IqNMTYsUJ7tiSNsomOhJ9EteaZB+05I0NCIw4kc4Q
         A9eaT5Cd8JaGnkmZ7UnE1kwcx/fYnDKZUvntXq6/e3x9dU1GnBcxYbVt9vaG3k6B7B
         /NQeBJogCcJ8vIvcDzazH2alliQmHqZsKw28tagAxb33q0/HEkJmY2rGRiHQhN8Cn7
         uI+/q/u78q9lSVs4YDe7uS3WFXZxIwWD2ABGiJMsWRBrbS5oCF69EO+f157mResYbV
         /bLwSq4IKnLfz2/vdtqnxbA27NRK5paoCJ4Zj4z0MV8DwsbGHyTAfRctsYYJKZloNI
         aLFsoYTmi6v7A==
Date:   Fri, 18 Oct 2019 14:26:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jann Horn <jannh@google.com>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <20191018142616.7d6a7594@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//fNTAc+56kkJlp6+Fz8MD7g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//fNTAc+56kkJlp6+Fz8MD7g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/android/binder.c

between commit:

  45d02f79b539 ("binder: Don't modify VMA bounds in ->mmap handler")

from the char-misc.current tree and commit:

  990be7476485 ("binder: Use common definition of SZ_1K")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/android/binder.c
index 265d9dd46a5e,bef788058bc3..000000000000
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@@ -92,11 -93,10 +93,6 @@@ static atomic_t binder_last_id
  static int proc_show(struct seq_file *m, void *unused);
  DEFINE_SHOW_ATTRIBUTE(proc);
 =20
- /* This is only defined in include/asm-arm/sizes.h */
- #ifndef SZ_1K
- #define SZ_1K                               0x400
 -#ifndef SZ_4M
 -#define SZ_4M                               0x400000
--#endif
--
  #define FORBIDDEN_MMAP_FLAGS                (VM_WRITE)
 =20
  enum {

--Sig_//fNTAc+56kkJlp6+Fz8MD7g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2pMNgACgkQAVBC80lX
0Gzb1gf+NKRFba6srcE9XRTMBMWZnLV7d7kB0oHL70Yrkqxb2HSgyRdIQt9dOAtg
6p6JPdW2V9SCVBIPQZ5JdYd4+qs5xzUsxk2jDv+Y8ia10L90RKS5OG2W7zk0OUan
Cs86YjFMt1npqRHqlSsX8h9Zs/uOyoi3oSI1wFCUCrnNIDP5p64nz1t8lwovtBVk
i6HTWhRZt7QNPKXdUJmYbHP4fypZ13nfgy6UqJRw5yRD2rDQWCkQSWKBvd3L0hce
54LYkHr+UJ0U3OMkZp+1UflFr3za1JULhMw8gO5DOqsnm4p91cr8yYxlO1HLLoaO
SI+1a8tvooBrIsvFEzfggwRODpSwUw==
=Hofj
-----END PGP SIGNATURE-----

--Sig_//fNTAc+56kkJlp6+Fz8MD7g--
