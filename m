Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C28438E11
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 06:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhJYEXB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 00:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhJYEXA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 00:23:00 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27ACC061745;
        Sun, 24 Oct 2021 21:20:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd1w40BBxz4xbr;
        Mon, 25 Oct 2021 15:20:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635135637;
        bh=S3HjBwvAVmieJ+oCfj9Rn9VsmQauFDmjC9cGFpwHILM=;
        h=Date:From:To:Cc:Subject:From;
        b=A/txUgTmPr8QYPiPTbORjFTnHSjbLiuojbkAOhzTqoSidtzP9+WBxQOj7cRbQ5f5u
         GJfiEAk2LGpuAGE4r7Nl8yF/pURw6mXge8X7uuh46hCP+k9y/y3PRdAanZj4RIZk7g
         P1Au5RVgA9AwBvBewZmj6WUaRsvQVnP2vCSsu7eB+RE1Pd9XM4rLjkpmw34tKbT41l
         lTNtvI0RRR845nUvXvLmqEEc7S1+DbBf6H4fNLJGu/SQCpDEP7cGOea8tA64NkKQVK
         ImvFHYNReOT1IJerrikbPkC+dVuS2kB0a//KFgwKESdpa3/tOgs3ID4gkkFshWa5UW
         noV2HI2bcMiZA==
Date:   Mon, 25 Oct 2021 15:20:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>, Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Weizhao Ouyang <o451686892@gmail.com>
Subject: linux-next: manual merge of the ftrace tree with the parisc-hd tree
Message-ID: <20211025152034.69923d51@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AcWt2FJ9ZWEiRfvKA4EFfND";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AcWt2FJ9ZWEiRfvKA4EFfND
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  arch/parisc/kernel/ftrace.c

between commit:

  e1e134bf1eb6 ("parisc/ftrace: set function trace function")

from the parisc-hd tree and commit:

  6644c654ea70 ("ftrace: Cleanup ftrace_dyn_arch_init()")

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

diff --cc arch/parisc/kernel/ftrace.c
index 8b9b8ce95d8d,01581f715737..000000000000
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@@ -92,15 -94,8 +92,9 @@@ int ftrace_disable_ftrace_graph_caller(
  #endif
 =20
  #ifdef CONFIG_DYNAMIC_FTRACE
-=20
- int __init ftrace_dyn_arch_init(void)
- {
- 	return 0;
- }
-=20
  int ftrace_update_ftrace_func(ftrace_func_t func)
  {
 +	ftrace_func =3D func;
  	return 0;
  }
 =20

--Sig_/AcWt2FJ9ZWEiRfvKA4EFfND
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2MJIACgkQAVBC80lX
0Gxw9Qf7Bn8kAYGDCWW+viYnYQd8pKRwMuYEMYbztRBsJbDRwZaGlI3kT0c8wckT
BUhrASduFkU0DMj6+9Q3HyEUmkSSPZJV/Qevz9P5IKOFFEVYtPv1wPArC4oOUxtq
nCV7J8YKDWhtMkq72vtnGnHKfnumBqV1IdMpNc5rkKnJY3/bK8mEwoNYAMmOSAem
YhYk3H8+AoI7I/zIYVG0Di1BHsCOZIN6ca6Wh8m1ggsjbCSX/5POiAZalRNHrJsf
cpQh0VlqqZUPIqjQpNlcgMsmOMmptdWer4iFrlR+HkDSbr6QDFsUa7u4d8Pto9T2
bKFTTJMICDP48pGWu8BNhSfe946I8A==
=p1um
-----END PGP SIGNATURE-----

--Sig_/AcWt2FJ9ZWEiRfvKA4EFfND--
