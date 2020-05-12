Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E861CF2CB
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 12:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgELKrK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 06:47:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52231 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbgELKrK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 06:47:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Lvd66LgGz9sRf;
        Tue, 12 May 2020 20:47:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589280427;
        bh=a59r5BxwtziJh8t/KuCtJ2Kz3/S9ORY64+a/Ze34qoo=;
        h=Date:From:To:Cc:Subject:From;
        b=mjIsdmplgAMgUyL9pzEC5e3YQHQCBGErxcOdq2HVU/zdaIr/WnmlmDL+7DiNVjGlr
         LPj5dSY0WhfswLBf60kAhJocktv9cqTs7DGkz8K28nAX57KS9wOD/tDwHvP8cNHw0a
         8MgcZ+1V77BWNXdoELxNq5yvb1H0XPTt5z/xPvwHexRf3KMwlbx3VBUx+KcwZuXZGN
         AvkRKsvVvHiQlqB3I21ZBd9FWelWhh0GvTVLwlJeO9/RBurp7QQDp/T1X3wy3ugVMK
         VU33MQ/vHW/gzsGx07nmf/+5Gc91gEuYFTsQJAdQHRlm+BJDGik3nu1qp31UAh+Af/
         lYCufhH6fYHWg==
Date:   Tue, 12 May 2020 20:47:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the fsinfo tree
Message-ID: <20200512204705.28cee8c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gcDJ8+uHruA8dE_dsAk/qP_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gcDJ8+uHruA8dE_dsAk/qP_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fsinfo tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from fs/fsinfo.c:7:
include/linux/syscalls.h:240:18: error: conflicting types for 'sys_fsinfo'
  240 |  asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
      |                  ^~~
include/linux/syscalls.h:226:2: note: in expansion of macro '__SYSCALL_DEFI=
NEx'
  226 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
      |  ^~~~~~~~~~~~~~~~~
include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFIN=
Ex'
  220 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA=
_ARGS__)
      |                                    ^~~~~~~~~~~~~~~
fs/fsinfo.c:655:1: note: in expansion of macro 'SYSCALL_DEFINE6'
  655 | SYSCALL_DEFINE6(fsinfo,
      | ^~~~~~~~~~~~~~~
In file included from fs/fsinfo.c:7:
include/linux/syscalls.h:1011:17: note: previous declaration of 'sys_fsinfo=
' was here
 1011 | asmlinkage long sys_fsinfo(int dfd, const char __user *pathname,
      |                 ^~~~~~~~~~

Caused by commit

  51d01aee410b ("fsinfo: Add fsinfo() syscall to query filesystem informati=
on")

I have added the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 May 2020 20:31:22 +1000
Subject: [PATCH] fix up sys_fsinfo decalaration

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/syscalls.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 76064c0807e5..fa1ecee891c9 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1009,8 +1009,9 @@ asmlinkage long sys_watch_mount(int dfd, const char _=
_user *path,
 asmlinkage long sys_watch_sb(int dfd, const char __user *path,
 			     unsigned int at_flags, int watch_fd, int watch_id);
 asmlinkage long sys_fsinfo(int dfd, const char __user *pathname,
-			   struct fsinfo_params __user *params, size_t params_size,
-			   void __user *result_buffer, size_t result_buf_size);
+			   const struct fsinfo_params __user *params,
+			   size_t params_size, void __user *result_buffer,
+			   size_t result_buf_size);
=20
 /*
  * Architecture-specific system calls
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/gcDJ8+uHruA8dE_dsAk/qP_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66fqkACgkQAVBC80lX
0Gw5QAf+MOZHoBUJtWxzm/Hza7fgk5LGBQWDTbKZRLcmyMwd83Y9VOTHt4b+REun
KhxAck9dzFnBdOSqllxoAGOIyVuTwdlwoXPqOkmBzjqYjuRH8fxYqBOg3xgVrXAV
jjoMvqizqMHViTPdvdOYPVrIEsRr+Xz6gRE7rN8rTJawc51G7diT2e83y8RD2ByJ
2hrl3anu/gk+7Ckkr7OMcDI5+wabFWlTrRTPNYA1f9FSP1PMmw/NO8+F1UqRCDwY
gh/rJuAPGuHD4gFgUrFhW93Kia5k4gHEMF1p0c+Tn18z/EwVHPKS4auboY7sZ9gJ
IZ5WIM3KEfFJe28rbDHSa570K5Zb6w==
=IfJa
-----END PGP SIGNATURE-----

--Sig_/gcDJ8+uHruA8dE_dsAk/qP_--
