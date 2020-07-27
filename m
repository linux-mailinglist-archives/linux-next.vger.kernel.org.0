Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949B322EBB5
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 14:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgG0MG4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 08:06:56 -0400
Received: from ozlabs.org ([203.11.71.1]:35395 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgG0MGz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 08:06:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFdp55Ty9z9sPf;
        Mon, 27 Jul 2020 22:06:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595851614;
        bh=6x2B4jt9+T+gEuV521o9lcOuHxfXIf5goQ2QNuOkOkc=;
        h=Date:From:To:Cc:Subject:From;
        b=fqfb2dQMmjYjez4RgFIcH9r5DmoALebBJTX3LoxHFx9kw6ZOdl+nQ6xx9KlSJJMlt
         WNyP0DUtum0iWous/v2zHOZKO0GgsO4TmIKJuFtUL+8KqJ6iFEbUJOZZsNsDdqB1qe
         upjvN7LWGMypeiehCoLOivFYNJGFV/jucdtOCJ9n+60suWtVn/mJ0miZvmT7Mk8Ac3
         UT8sDc347jXt0GHdc0WSVG2mDK35MinJNpl0xE83lloWQoBp6y1G6EniehgxQlL5wd
         diAJkwJCXznUXMoKgrPEy814JxXNHZJIt3laGkuhuaB8qMo8K++eTuPH7ni3QqHqjD
         CAY+EJaMCfc7Q==
Date:   Mon, 27 Jul 2020 22:06:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <20200727220652.2a1ec36b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EOMCACGCRreFYMV6f=gabN+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EOMCACGCRreFYMV6f=gabN+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (sparc defconfig)
failed like this:

arch/sparc/kernel/ptrace_32.c: In function 'setregs_set':
arch/sparc/kernel/ptrace_32.c:271:2: error: 'ret' undeclared (first use in =
this function); did you mean 'net'?
  ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf,
  ^~~
  net


Caused by commit

  cf921bf15c62 ("sparc32: get rid of odd callers of copy_regset_from_user()=
")

I added this patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 27 Jul 2020 21:59:23 +1000
Subject: [PATCH] sparc32: declare ret

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/kernel/ptrace_32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sparc/kernel/ptrace_32.c b/arch/sparc/kernel/ptrace_32.c
index caeb99cbc1fa..f2c581d36d6c 100644
--- a/arch/sparc/kernel/ptrace_32.c
+++ b/arch/sparc/kernel/ptrace_32.c
@@ -264,6 +264,7 @@ static int setregs_set(struct task_struct *target,
 {
 	struct pt_regs *regs =3D target->thread.kregs;
 	u32 v[4];
+	int ret;
=20
 	if (target =3D=3D current)
 		flush_user_windows();
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/EOMCACGCRreFYMV6f=gabN+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ew1wACgkQAVBC80lX
0GxHgAgAnYo0PB6RAKchA2URp3527vamRm4VIk1XsoBGuYes0dtgNetcaHbuID+i
YnkS/4bVe9owMEfzLSJOvmyVIW5Oh934xyn5TECbblHSPKlNzl3rRNMQFumEGZzR
D7JAMTBAe28s7xlAhfP+72vpnIPxPoEvL2dfsx8/yAB+tqSGkzySRrF2I2alxH9J
XCovivn4nC6i5W+ENTcwOqUPMAvjJbrCK2wFNCBAC6BHgMylsKHooKfUYrbzNd0D
uzZQAD163rg3bIXzK+KlWtS6PmwLQRxXz5EKBBM7tqRLYtEhTqECfBdWwBxQDvS9
xbS+Kpm0OlGjH+rOfBCjYBLhbCeOZA==
=FM29
-----END PGP SIGNATURE-----

--Sig_/EOMCACGCRreFYMV6f=gabN+--
