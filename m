Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C77696FFD
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 05:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfHUDFQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 23:05:16 -0400
Received: from ozlabs.org ([203.11.71.1]:33053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfHUDFP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 23:05:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CswT5BWNz9sBp;
        Wed, 21 Aug 2019 13:05:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566356713;
        bh=XXZbox/wA6/OK8GRkvZ5ULx8Cm0MOoQ4bG2fVsChO1k=;
        h=Date:From:To:Cc:Subject:From;
        b=m9uCBSoLhnN4DqezomzI8RmVFoo7h9j4k8V08OxGGXmWgdQcV8VIBxPpwcICpmGT0
         u9aKlwlsolJHUxydu5u21Ymb3soI2AeiVY/PYx3J4UsfejpWofHdBBeiHI9R1V0jPn
         3PtVvx/1pHIelkYmgZilog4O60Z+hXvDE1XBjAZQP8eSVneJXNb4qhA5qiEHx0IgaG
         7NAnZSIt/pwPN8tLfYVMobZ1CqCU8bcdNzV4+i+wSq1N4C4Od3HvZVq/P6b85fk1sE
         NKH+19VOPc6F2tVnwtFCaBmEAyTTwVhQX7w66gblvI+1oL36rzHteOcsPjiz84iX/w
         44FR34jkfpfrA==
Date:   Wed, 21 Aug 2019 13:05:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Bohac <jbohac@suse.cz>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>,
        Nayna Jain <nayna@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>
Subject: linux-next: manual merge of the security tree with Linus' tree
Message-ID: <20190821130513.0038df28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8vqIU6bFe5hyDfgeHgWgIbj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8vqIU6bFe5hyDfgeHgWgIbj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  security/integrity/ima/Kconfig

between commit:

  9e1e5d4372d6 ("x86/ima: fix the Kconfig dependency for IMA_ARCH_POLICY")

from Linus' tree and commit:

  99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG and KEXE=
C_SIG_FORCE")

from the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/integrity/ima/Kconfig
index 2ced99dde694,32cd25fa44a5..000000000000
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@@ -160,8 -160,7 +160,8 @@@ config IMA_APPRAIS
 =20
  config IMA_ARCH_POLICY
          bool "Enable loading an IMA architecture specific policy"
-         depends on (KEXEC_VERIFY_SIG && IMA) || IMA_APPRAISE \
 -        depends on KEXEC_SIG || IMA_APPRAISE && INTEGRITY_ASYMMETRIC_KEYS
++        depends on (KEXEC_SIG && IMA) || IMA_APPRAISE \
 +		   && INTEGRITY_ASYMMETRIC_KEYS
          default n
          help
            This option enables loading an IMA architecture specific policy

--Sig_/8vqIU6bFe5hyDfgeHgWgIbj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ctOkACgkQAVBC80lX
0GxCIQf+KDzl3HckVnuSfbDdjRbNSARwWqEmHxCbdvvqD9ePhO6mbws0Yi9TZMC4
nhwiBKRlh+DHnAKDLg2HYg4KfFAJUPferZB6etd/UG7UFdA7NQTMylbYmS3ACk5V
z76mqu6jvmuiKZBty5I3mH8887Nq02PzyKCg1uUEPpR48PtWs7UeKgbzY3ibPGkC
H4i5SCx3IPVWHR47dMrv9fdRd+Khd9POX+8eU1E0LcN1V+BivwjNZZB970m5Qtl8
FrA395d60uXwUwMDORI2jdHvlug8J7CDlQL+Gs1IjZqMFS9nR1VIa2x67IQ/ccHU
YzZmenm30hvuBic+TQ9aLnbB1ig4zA==
=thOM
-----END PGP SIGNATURE-----

--Sig_/8vqIU6bFe5hyDfgeHgWgIbj--
