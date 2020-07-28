Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E633B22FE74
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 02:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgG1AXd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 20:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgG1AXd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 20:23:33 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633D9C061794;
        Mon, 27 Jul 2020 17:23:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFy834bPSz9sSt;
        Tue, 28 Jul 2020 10:23:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595895811;
        bh=WqnSbOQINj+e0BRk5+oeyscKwd6L/NeTckH2w8CCGeg=;
        h=Date:From:To:Cc:Subject:From;
        b=fPxBa1jtqAqJ3CXkLtvsr9qtgOwrT2vqnGZEr6zmucydXDgE+2TFzTHokPbyI3c87
         Sqv6h/OZxSm6W+fQzLX0o9zbfiQQE0ZUBJLy/DjU0Y9XpZ2M2gBRjtWh3qvt13bYCY
         eRtBkTXvhxcV87D4lbln83mHub4T6I0L5T7K0YBhAtu4byw+3f+nHNjC08WpfOKqpj
         tJe1oB3xrMpTMWrfmbQnoMuR0SkBlZm5fcrmw655O/hVW5OSFodAypVPaVaHOugDYl
         I37q/rg/SqWhhA/TQatHpVV3zV67R7eNwcWyrEH7AcG+HDzdyPndLVHXSWc3SgBVgy
         +U4o1Gg3kUOMg==
Date:   Tue, 28 Jul 2020 10:23:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Subject: linux-next: manual merge of the xtensa tree with the sh tree
Message-ID: <20200728102330.11f78570@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2rZamO_m.SKFKPxCa2a44eO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2rZamO_m.SKFKPxCa2a44eO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xtensa tree got a conflict in:

  tools/testing/selftests/seccomp/seccomp_bpf.c

between commit:

  469023465e79 ("sh: Add SECCOMP_FILTER")

from the sh tree and commit:

  deccfc9ce639 ("selftests/seccomp: add xtensa support")

from the xtensa tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/seccomp/seccomp_bpf.c
index 06d994a34997,1b445c2e7fbe..000000000000
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@@ -124,8 -122,8 +124,10 @@@ struct seccomp_data=20
  #  define __NR_seccomp 358
  # elif defined(__s390__)
  #  define __NR_seccomp 348
 +# elif defined(__sh__)
 +#  define __NR_seccomp 372
+ # elif defined(__xtensa__)
+ #  define __NR_seccomp 337
  # else
  #  warning "seccomp syscall number unknown for this architecture"
  #  define __NR_seccomp 0xffff
@@@ -1634,10 -1624,14 +1636,18 @@@ TEST_F(TRACE_poke, getpid_runs_normally
  # define SYSCALL_SYSCALL_NUM regs[4]
  # define SYSCALL_RET	regs[2]
  # define SYSCALL_NUM_RET_SHARE_REG
 +#elif defined(__sh__)
 +# define ARCH_REGS	struct pt_regs
 +# define SYSCALL_NUM	gpr[3]
 +# define SYSCALL_RET	gpr[0]
+ #elif defined(__xtensa__)
+ # define ARCH_REGS	struct user_pt_regs
+ # define SYSCALL_NUM	syscall
+ /*
+  * On xtensa syscall return value is in the register
+  * a2 of the current window which is not fixed.
+  */
+ #define SYSCALL_RET(reg) a[(reg).windowbase * 4 + 2]
  #else
  # error "Do not know how to find your architecture's registers and syscal=
ls"
  #endif
@@@ -1710,7 -1704,7 +1720,7 @@@ void change_syscall(struct __test_metad
 =20
  #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
  	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
- 	defined(__csky__) || defined(__sh__)
 -	defined(__xtensa__)
++	defined(__csky__) || defined(__sh__) || defined(__xtensa__)
  	{
  		regs.SYSCALL_NUM =3D syscall;
  	}

--Sig_/2rZamO_m.SKFKPxCa2a44eO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8fcAIACgkQAVBC80lX
0GzT1wgAiYfhrIdWA0g6eDyB7M3eGJ2EobrVRNCQ3+w3pBRLo2v9zbTYCuyb3DDL
ice+2TvDXFFJYcCY8938L+kaj9faS68xkoLsBzLiC6+MGlSwogIeggRm9jo5LlnV
uYvrj9mJR+OjBTmNaPnIXGjpQWYwcL2GvIPHDNWWmEr9iyqdWLKGrAnLFiuoF/fd
uQFwjAc/gRlnS+WjMF7oz5750tN6p0nww5WSRhreTXGceINCH0q/y44xj0hChnhz
96zVFse+QemtgvErPbAyZ8KFXs/4sCAHkZnteB8+nASoPLQ0gO2rx+ATigMvBTPZ
iToIQgjuFwfngGzUvCgbhLyLbBw/WA==
=XJm1
-----END PGP SIGNATURE-----

--Sig_/2rZamO_m.SKFKPxCa2a44eO--
