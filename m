Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6299704E
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 05:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbfHUD2C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 23:28:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42657 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfHUD2B (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 23:28:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CtQk3R1Gz9s4Y;
        Wed, 21 Aug 2019 13:27:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566358078;
        bh=33J2ZYDpWb8pnhaCfRFBJpUbWUIkHSUveXcCUDYwWvU=;
        h=Date:From:To:Cc:Subject:From;
        b=td6wTzQq9nhrxW5X+TT0fpv1mps/E3PzTHQRO3XtNMUK1r2eISGDa0LJd8sV63VYW
         nFSVAwQheqgMSfjUnLS5lA6PhqvavjfVlXkRJf5uJ7yJ4CCKFxNx2bm+nmIOOaTfnW
         HrcB7HNYopjBWPf+1LTsVtV3+RbSQp68qtbeOpc7SH4DhclmCcHpuHn9lFh/LeJoNj
         73bw2jc2AXCKBV11pj0Vk+LYQiCmTQC19l24EHrfK0U4fvQ7nTkwk0dVf7QdGxGk9j
         gJ9tMiygaa8IS2gaXW/IgxFDFY8pjCM4x6QBNcA3E7R9pS2w6XC96ZFJcupdLd3YdX
         M8puAE9T8lS8g==
Date:   Wed, 21 Aug 2019 13:27:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Bohac <jbohac@suse.cz>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: linux-next: manual merge of the integrity tree with the security
 tree
Message-ID: <20190821132757.4a12dada@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ld73mL_pKbcSjayK+pT8GbB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ld73mL_pKbcSjayK+pT8GbB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the integrity tree got a conflict in:

  arch/s390/kernel/machine_kexec_file.c

between commit:

  99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG and KEXE=
C_SIG_FORCE")

from the security tree and commit:

  c8424e776b09 ("MODSIGN: Export module signature definitions")

from the integrity tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/kernel/machine_kexec_file.c
index c0f33ba49a9a,1ac9fbc6e01e..000000000000
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@@ -22,29 -22,7 +22,7 @@@ const struct kexec_file_ops * const kex
  	NULL,
  };
 =20
 -#ifdef CONFIG_KEXEC_VERIFY_SIG
 +#ifdef CONFIG_KEXEC_SIG
- /*
-  * Module signature information block.
-  *
-  * The constituents of the signature section are, in order:
-  *
-  *	- Signer's name
-  *	- Key identifier
-  *	- Signature data
-  *	- Information block
-  */
- struct module_signature {
- 	u8	algo;		/* Public-key crypto algorithm [0] */
- 	u8	hash;		/* Digest algorithm [0] */
- 	u8	id_type;	/* Key identifier type [PKEY_ID_PKCS7] */
- 	u8	signer_len;	/* Length of signer's name [0] */
- 	u8	key_id_len;	/* Length of key identifier [0] */
- 	u8	__pad[3];
- 	__be32	sig_len;	/* Length of signature data */
- };
-=20
- #define PKEY_ID_PKCS7 2
-=20
  int s390_verify_sig(const char *kernel, unsigned long kernel_len)
  {
  	const unsigned long marker_len =3D sizeof(MODULE_SIG_STRING) - 1;

--Sig_/Ld73mL_pKbcSjayK+pT8GbB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1cuj0ACgkQAVBC80lX
0GzOlggAgNYypzYn0+ZyFYKHGM8XZaRNKbqrH4picUjwrELX/2lB5WIPsbD4Ftjf
JdXBy2qGX0Eky0Fm67XBis9lpcb5ltw4C5kGhVs8lo0RZeImqxt2ZfXHSmNx61zD
kZWyk6qzzpijNAB6AHQmo37drqtp61SfpjLg5gnKCycyk6wh/vnDuvfBOtVlaUiS
mY2nNl6n2TtLcHlSnBqvCdnCNvG+yS9NTW4fGaC0RNxEQd6bpmT57jv5irIJF9Sh
Oh649H+DwTUxEHiDYxLP/nwaiadgga/vqe+grX5eNryzYgcDBWOxfPM4GcaWcZUL
0brA440bTD8CZ48/kSDLysYoo0WGoQ==
=SJXe
-----END PGP SIGNATURE-----

--Sig_/Ld73mL_pKbcSjayK+pT8GbB--
