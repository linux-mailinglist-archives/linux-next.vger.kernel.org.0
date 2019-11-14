Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66349FC06B
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 08:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfKNHAj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 02:00:39 -0500
Received: from ozlabs.org ([203.11.71.1]:42553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbfKNHAi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 02:00:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DC6q4xrdz9s7T;
        Thu, 14 Nov 2019 18:00:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573714836;
        bh=euj/0s9yXpcFqoYhD71j8Eq1U9uEbXtJxC0RlGaVYMc=;
        h=Date:From:To:Cc:Subject:From;
        b=Wp40cQwCzSQ/omfkQmgP4QnhTq3IlIENNc3QZJ9Z+6ELKQC+MsLMyDsuujd8GmIfK
         35nq9zWBFCeCwL+g3XFB3ZvPSVd8PCN9+dPuxT2/PJyjzPNLLfsZaX9n2EMXYC+3C5
         hFSqJXfb8jVOqhcvqJJouCUYaqrCgZeC2+unp9clzn4AnLK5LKIvU5rlD74lay+Rru
         rbKK4e/3TA8VMmY0wd9EVfsj/aoDJg5A61gn3+AiDfT2XDlFzEEpPeXwtvzhbbdNbt
         IkiCJVMiY6Amiil61V92+11+bX0x3ROrbpBrsj7UJWMnzR6Jf5e1/3eD6TEjY5C9YW
         d/9Nce/AkapXw==
Date:   Thu, 14 Nov 2019 18:00:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mohammad Nasirifar <far.nasiri.m@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the y2038
 tree
Message-ID: <20191114180021.1a41c73b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/odvzAu7STO0W1ww9f_42E9f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/odvzAu7STO0W1ww9f_42E9f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/syscalls.h

between commit:

  4ced3933226d ("y2038: syscalls: change remaining timeval to __kernel_old_=
timeval")

from the y2038 tree and commit:

  01606a699584 ("syscalls: fix references to filenames containing syscall d=
efs")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/syscalls.h
index f90f1c8705fc,1dbefa5e00e5..000000000000
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@@ -731,10 -731,10 +731,10 @@@ asmlinkage long sys_prctl(int option, u
  			unsigned long arg4, unsigned long arg5);
  asmlinkage long sys_getcpu(unsigned __user *cpu, unsigned __user *node, s=
truct getcpu_cache __user *cache);
 =20
- /* kernel/time.c */
+ /* kernel/time/time.c */
 -asmlinkage long sys_gettimeofday(struct timeval __user *tv,
 +asmlinkage long sys_gettimeofday(struct __kernel_old_timeval __user *tv,
  				struct timezone __user *tz);
 -asmlinkage long sys_settimeofday(struct timeval __user *tv,
 +asmlinkage long sys_settimeofday(struct __kernel_old_timeval __user *tv,
  				struct timezone __user *tz);
  asmlinkage long sys_adjtimex(struct __kernel_timex __user *txc_p);
  asmlinkage long sys_adjtimex_time32(struct old_timex32 __user *txc_p);

--Sig_/odvzAu7STO0W1ww9f_42E9f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3M+4UACgkQAVBC80lX
0Gz/2ggApPIv/8CUtjx2tFvfYNiKFGiaQa0IGThYq1JElMYSrtiAyOEVR6Yi8HHj
+CfRsavd4jRtWBCjkKNmVSCU7wy0ChCe4hk8I/4p48oq9luv+x0hbD0/rWbXxir9
iDsQVnKlx5oSDm/WXq01DBQnLoKoArdMuqW6Vv7xFOIU4GrYxMutICoZq7oiXET1
MQnDUe7/AU/SuYQy+sRO3Sq48l52e/4tOuda2yGwf3QyWXQZlQGyBhyuUaZ6MACf
DApU8sfJJCbXaroNF2Ovl80Z/R4tLTjwM+jojGnA8OyoyHJ4OXTPeM2PwHtbwNjY
et2bPwBNBNJFxqj79jy6aBMlZT1U6w==
=jp/n
-----END PGP SIGNATURE-----

--Sig_/odvzAu7STO0W1ww9f_42E9f--
