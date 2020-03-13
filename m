Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91EBA184456
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 11:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgCMKHV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 06:07:21 -0400
Received: from ozlabs.org ([203.11.71.1]:47175 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbgCMKHU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 06:07:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48f1Zr68Z0z9sRN;
        Fri, 13 Mar 2020 21:07:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584094038;
        bh=/sEKxbcT5lnGQL4r+GDLC4N74lGxdhDSGCse08jF/xQ=;
        h=Date:From:To:Cc:Subject:From;
        b=BhmOQUtTYdefDvoveJax/C06mClRnKWqDNv4Qftm0NS82vMku33hAniu4DdOeiefM
         i48UIDcLt/avWkK4wqHlicAbXHcQi6O9wUzIJxwIpqzpxkszeEnPUPljE4iB1bo/WY
         9vrjEXLc794A4BnOKvMNcjAfqN4q36Flcnj2PlMKjo8+6JDQYoamt1XsXBwUjw+0UA
         JLuulzpOklZEmCzFF9XXLR/oUegrOTTRUlpr0xrLt9fDOATnVOPd7XnBCd6No07y/s
         +VC3wg73KxbWS6hbxqy5XxQI5M9HSFMbLxaVIyI4wDp/KFk5s4nAOWoi32ISSGc/RS
         xhLyT+YEHXF3w==
Date:   Fri, 13 Mar 2020 21:07:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Nayna Jain <nayna@linux.ibm.com>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the
 integrity tree
Message-ID: <20200313210714.58ff3d99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/06=QScVg0ZQ2p=FUuQumt.C";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/06=QScVg0ZQ2p=FUuQumt.C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/Kconfig

between commits:

  9e2b4be377f0 ("ima: add a new CONFIG for loading arch-specific policies")

from the integrity tree and commit:

  faaa52178603 ("userfaultfd: wp: add WP pagetable tracking to x86")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Note that I put the selects in their correct alphabetical position as
asked by the comment higher up in the file.  If that had been done in
the patches, then there would have been no conflicts ...

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/Kconfig
index 4e4f6f4200b8,ca6f12f34d92..000000000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -137,6 -138,6 +137,7 @@@ config X8
  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
  	select HAVE_ARCH_KASAN			if X86_64
  	select HAVE_ARCH_KASAN_VMALLOC		if X86_64
++	select HAVE_ARCH_KCSAN			if X86_64
  	select HAVE_ARCH_KGDB
  	select HAVE_ARCH_MMAP_RND_BITS		if MMU
  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if MMU && COMPAT
@@@ -148,6 -149,6 +149,7 @@@
  	select HAVE_ARCH_TRACEHOOK
  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD if X86_64
++	select HAVE_ARCH_USERFAULTFD_WP		if USERFAULTFD
  	select HAVE_ARCH_VMAP_STACK		if X86_64
  	select HAVE_ARCH_WITHIN_STACK_FRAMES
  	select HAVE_ASM_MODVERSIONS
@@@ -229,8 -230,7 +231,7 @@@
  	select VIRT_TO_BUS
  	select X86_FEATURE_NAMES		if PROC_FS
  	select PROC_PID_ARCH_STATUS		if PROC_FS
- 	select HAVE_ARCH_KCSAN			if X86_64
 -	select HAVE_ARCH_USERFAULTFD_WP		if USERFAULTFD
 +	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
 =20
  config INSTRUCTION_DECODER
  	def_bool y

--Sig_/06=QScVg0ZQ2p=FUuQumt.C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5rW1IACgkQAVBC80lX
0GytQQgAjpXDGh8BYaqZA7jwIzQSkzfdlPOa2cEaedqsJbpCQv2Hm3YuGWzPsLCj
PiDDJdyktZpi124Salhip35C26dKApgRiGoJOvJ+r7Z0pT9j17hm4G47fh8vf1gR
deCwWr9LUNA6iwG5rqLsr69av6V9EPjbAkwUkJN8B64KbwpsWLiylqYBb2Y9jWnP
/qopYPtpQ7Fo20hmE9GLaqJU/PzsohW5VYmQi7NST/XX0v0la5HJOf2gD17NXalc
U1H3SryxGlzaGQtu1S9xFireG03qr5eyNfQu7kFjE8U1ikCd130yYPHvgkttJ9mz
BOzwH77gZChHDhqz6JyA8cTN27CaZA==
=bEcg
-----END PGP SIGNATURE-----

--Sig_/06=QScVg0ZQ2p=FUuQumt.C--
