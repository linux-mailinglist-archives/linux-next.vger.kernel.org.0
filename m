Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756D12EB6BE
	for <lists+linux-next@lfdr.de>; Wed,  6 Jan 2021 01:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbhAFAQZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Jan 2021 19:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbhAFAQZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2021 19:16:25 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CD8C061574;
        Tue,  5 Jan 2021 16:15:44 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D9VJ746Htz9sSs;
        Wed,  6 Jan 2021 11:15:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609892140;
        bh=Xeith/GbphSI/y69kvrU6ZQVrZBR9wECG2nC+2oVh6Q=;
        h=Date:From:To:Cc:Subject:From;
        b=i3hd4zj52WK8UIyTOwRW0AfXlfH8h2x4/c+0YVee8hUjDUkrykja5qSvgr5ZIeQrW
         xudE39eaTqKNQFe3+RiSJBq4ec+6sv7nC6ghDKIjVONEfP9kgyHs2i0i+JOKWQgz+E
         ApEewxjWylMzHG/SpSIF3W5INGIx9P56xP6yMsvQ1knp2dGZIukYpHWvrKOPWhFm7I
         GdXXgJWp2LtFeYmzSw41txfHqPs7rt0Z/UCZqK92YSyonU7BprzOibYTWzAnioRIp8
         oLFLwazq5U2X/eUpWqH5D4OPPid8lTRqBwueK3B+PjveOiL1FOV/i0M06n9R0xxIBp
         GvJshqp9cPfXg==
Date:   Wed, 6 Jan 2021 11:15:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Borislav Petkov <bp@suse.de>, Brian Gerst <brgerst@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the vfs tree
Message-ID: <20210106111533.2036c1d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mSaYDH0vimlI=N9DbSV88HV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mSaYDH0vimlI=N9DbSV88HV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/Kconfig

between commit:

  139d7deeea00 ("[elfcore-compat][amd64] clean PRSTATUS_SIZE/SET_PR_FPVALID=
 up properly")

from the vfs tree and commit:

  2ca408d9c749 ("fanotify: Fix sys_fanotify_mark() on native x86-32")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/Kconfig
index a17ced73b23c,24862d15f3a3..000000000000
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@@ -1105,9 -1105,12 +1105,15 @@@ config HAVE_ARCH_PFN_VALI
  config ARCH_SUPPORTS_DEBUG_PAGEALLOC
  	bool
 =20
 +config ARCH_HAS_ELFCORE_COMPAT
 +	bool
 +
+ config ARCH_SPLIT_ARG64
+ 	bool
+ 	help
+ 	   If a 32-bit architecture requires 64-bit arguments to be split into
+ 	   pairs of 32-bit arguments, select this option.
+=20
  source "kernel/gcov/Kconfig"
 =20
  source "scripts/gcc-plugins/Kconfig"

--Sig_/mSaYDH0vimlI=N9DbSV88HV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/1ASUACgkQAVBC80lX
0GyhMQf+IEcKZt/4eUIFnTyZoPAxx9a82c9hA1IzyFOKamMiQIpU376wacld/RR5
t6D86hcEIaLicu7Le3n9u+asthI+ohrsqDCjkwZnxeqNr9MCszdbNRP0GKWdN/o+
MbzlOJvBHM5oVodFpnx5NUF36DooKeYPkwHioHxMj2PR4AaCUwdNo7WoE29FlyFJ
hH3/EvweCJG83V3cuoyNirYveOg4+VJqmCuJA/NDCID8+XVIahanmFz18xtAHGim
MQxGhKoKCEj4NKQdmdQFglGT9+yVnzLBVXye8eqDqTPZUwkg8cVO8XOD7LA2url7
umFHFlNkLJG5uJ8C/ESarCOnMga47w==
=yEpQ
-----END PGP SIGNATURE-----

--Sig_/mSaYDH0vimlI=N9DbSV88HV--
