Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F2D3F93B6
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 06:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhH0Edc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 00:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhH0Edb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Aug 2021 00:33:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C607C061757;
        Thu, 26 Aug 2021 21:32:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwmzB6mNVz9sPf;
        Fri, 27 Aug 2021 14:32:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630038760;
        bh=p3Io9lZ0A+zmKVTnDdz6extacUz9gpSB9RZ8DFV1QKw=;
        h=Date:From:To:Cc:Subject:From;
        b=Exr45FnE2A1lFEAuHMl4H6HCfAaIuOvKVenIP6JeX/audK6qQCjPX3GbHRypAHIXE
         MAl68YT+XNvfRrqN3fJIuOQOagXJyuOodUdZmwUlxA62fxShRrGGuaYnMCN2YADecQ
         MivoYmNjF9LbWFIm4e16coHlTVAHnc21kwBnADK6IJRQ2lct0QLcpGjY1LYcImjfcp
         f+16Vo4iy66MjnefdUk1E/OTPLxwg9df9MECj9vBgT7d+xXe0vOuT+d/bMIFJL2Ujn
         ThIGAGhfVm3XIZ5vjGvI7rLrrECxokszIvstA4gytSRBAI2Gr7Wdc0EKjtT/fWJ7eJ
         MvcYJaIxEAGGQ==
Date:   Fri, 27 Aug 2021 14:32:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Richard Weinberger <richard@nod.at>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the uml tree
Message-ID: <20210827143237.6fd127fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qfb8naojhFeqQtitkKC4flk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qfb8naojhFeqQtitkKC4flk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  arch/um/Kconfig

between commit:

  043f5d3ffaf6 ("um: Remove set_fs")

from the uml tree and commit:

  4aae683f1327 ("tracing: Refactor TRACE_IRQFLAGS_SUPPORT in Kconfig")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/um/Kconfig
index a855436d8646,0a699440c4c5..000000000000
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@@ -21,8 -19,9 +21,9 @@@ config UM
  	select GENERIC_IRQ_SHOW
  	select GENERIC_CPU_DEVICES
  	select HAVE_GCC_PLUGINS
 -	select SET_FS
+ 	select TRACE_IRQFLAGS_SUPPORT
  	select TTY # Needed for line.c
 +	select HAVE_ARCH_VMAP_STACK
 =20
  config MMU
  	bool

--Sig_/qfb8naojhFeqQtitkKC4flk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEoauUACgkQAVBC80lX
0GxrnAf+JMTXDrE/bPpKmezNXMxuulYunOIEyDVcWou1/ch+yDqO7MLcCm4Hkn0x
/iNlIpPpe6/e54DFnvPxXF9/KDFWC81SQp++9sswg5RNNdLVihn3gCfy4IYW3K3N
cUoVmRHWA9dofcsi7sasdObzOfBEud/7OPAbt2hXESHiKwD3qkH1f1g11C5cDbnq
BGUHfAQ9Oca74HweiZHmjRDXjkHSk7OQx3G9XFMgXKihL/hH5UI+x89utGbnpBDi
4757AgGAlICqtY1ygT/S3elx3kb+j3xxjvTjICH190Z0VbbDm38vOl8O18/LKh9K
AGZYs0jnin6OZbHSKrFoWV23Jec3Tg==
=uPdK
-----END PGP SIGNATURE-----

--Sig_/qfb8naojhFeqQtitkKC4flk--
