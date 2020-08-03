Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B849123A0F8
	for <lists+linux-next@lfdr.de>; Mon,  3 Aug 2020 10:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgHCIZ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 04:25:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58893 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbgHCIZ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Aug 2020 04:25:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKrYt2639z9sTY;
        Mon,  3 Aug 2020 18:25:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596443155;
        bh=YnMOzIpXq9jSIY1rYsGmRo9mgwR6qjcxTtHyHMUgcBs=;
        h=Date:From:To:Cc:Subject:From;
        b=qKouz3LMJNEtMomI301ijlYnZucEMX7IprHnmnN2FEddKkKWEbCt/gO0LOFP8jjDS
         lLHOfk2TKk7hsceYA9QDjAiVMMMiYnXYlm8HDCrU66kxVp+/2rC/SYJnBN0NvHPjpP
         +BSTybIdEker/8+7Y7EXPqTp+95lvovFmGNQ7xn/QoCHGIDrFV3dYrFmRwHi9A41qC
         WFYLqbgjup00CnJD4ZNiT4+Md1vj+BNsgBwQvkJCj0NXGnZ6KjRdwuK1lJZMRSc6eh
         LWJZIlNShu5IgQa2UVe2MlzfBPrfgS2FN7qG3UQW6Ny41ec/Y2rPIDwQI7Vwo5ZMFz
         pjACjyp4CDS5w==
Date:   Mon, 3 Aug 2020 18:25:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the csky tree
Message-ID: <20200803182550.4c7df8ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K5_Ix7sG1uomC5F7r_8XzSm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/K5_Ix7sG1uomC5F7r_8XzSm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  arch/csky/Kconfig

between commits:

  e95a4f8cb985 ("csky: Add SECCOMP_FILTER supported")
  953131e5b5a5 ("csky: Use top-down mmap layout")
  bdcd93ef9afb ("csky: Add context tracking support")

from the csky tree and commit:

  140c8180eb7c ("arch: remove HAVE_COPY_THREAD_TLS")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/csky/Kconfig
index af238739811e,902f1142d550..000000000000
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@@ -39,11 -38,6 +39,10 @@@ config CSK
  	select GX6605S_TIMER if CPU_CK610
  	select HAVE_ARCH_TRACEHOOK
  	select HAVE_ARCH_AUDITSYSCALL
 +	select HAVE_ARCH_MMAP_RND_BITS
 +	select HAVE_ARCH_SECCOMP_FILTER
- 	select HAVE_COPY_THREAD_TLS
 +	select HAVE_CONTEXT_TRACKING
 +	select HAVE_VIRT_CPU_ACCOUNTING_GEN
  	select HAVE_DEBUG_BUGVERBOSE
  	select HAVE_DYNAMIC_FTRACE
  	select HAVE_DYNAMIC_FTRACE_WITH_REGS

--Sig_/K5_Ix7sG1uomC5F7r_8XzSm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8nyg4ACgkQAVBC80lX
0GxJbgf/QUrWTfBukHTFPeLkKQgGDtyxMTSdIHwNoMa32DScnBsUGfjUI6G2qJO7
VvNETdDCfqrKz1+ls/0uEoNwa+lJbyjFP+PTRquXv2h+XmHBHAYLnADg38h7lRUZ
6eij3YO3LmbAA9MxN9RByiMnnKN83k87iGucxRf46ZPmlGVMoJvdr+3ApiId2IKR
W8+GxrNOEpuRgOuAnZynRNeCG5MIHoEwgj/s5zZ4Praj9vkZZ4zYe+E61HNrnzKy
2eBeTW4O5Pn90ya7Wa26g6sjUH0oF9P7w9cziqV5Xg8WGRy9+NCs9Vr3VaceTUxn
Bh0H/vD/5Fq+I2cgnxBU6bu4sZxqig==
=KH3P
-----END PGP SIGNATURE-----

--Sig_/K5_Ix7sG1uomC5F7r_8XzSm--
