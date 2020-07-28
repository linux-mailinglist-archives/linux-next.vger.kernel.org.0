Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74B422FE6C
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 02:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgG1ASz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 20:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG1ASz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 20:18:55 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547FBC061794;
        Mon, 27 Jul 2020 17:18:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFy2f07z3z9sSt;
        Tue, 28 Jul 2020 10:18:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595895532;
        bh=8Elas+GZy4aG143LOZC08U5Il/Mlcion7Q0KOmbQfEg=;
        h=Date:From:To:Cc:Subject:From;
        b=DZjUvggIf+h98zuWFbPFq5NgD1p9bbyJrP9fztkIhumWsbaKV6D9po5/pozSSqZRS
         iaqw7OygVe7yKBUAlLuvJTi4ICP1OkvhqqNGpS4lzO56ASbsTMJBh36fgLaksFpP09
         GzCNZxy5iPNfLy/elGCEDCOnBMJLhqJl+KfP2ZmvA4nB3FqLR5t87K5uTqwsqRVXL0
         O4OV56G/+Q2UnOFBcZFdsJ/D7AjZwXK7goWMwzlo3WMsA/Qgv0iaSBeIeThoLs4j1e
         0Rgkf4Uq9iccZEEUykHVI1L8HpsmKAG0iaWY2dNHw15P+OpQvwAngTCwfeQODMDQtC
         CxewCn09BUpAQ==
Date:   Tue, 28 Jul 2020 10:18:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rich Felker <dalias@libc.org>, Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Subject: linux-next: manual merge of the sh tree with the csky tree
Message-ID: <20200728101846.73cf063c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R4JPgLYyfUn4NvlA+F+kfWi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R4JPgLYyfUn4NvlA+F+kfWi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sh tree got a conflict in:

  tools/testing/selftests/seccomp/seccomp_bpf.c

between commit:

  f4dd2edafba0 ("csky: add support for SECCOMP and SECCOMP_FILTER")

from the csky tree and commit:

  469023465e79 ("sh: Add SECCOMP_FILTER")

from the sh tree.

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
index 8d18a0ddafdd,6eb21685c88f..000000000000
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@@ -1703,8 -1699,7 +1709,8 @@@ void change_syscall(struct __test_metad
  	EXPECT_EQ(0, ret) {}
 =20
  #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
 -	defined(__s390__) || defined(__hppa__) || defined(__riscv) || defined(__=
sh__)
 +	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
- 	defined(__csky__)
++	defined(__csky__) || defined(__sh__)
  	{
  		regs.SYSCALL_NUM =3D syscall;
  	}

--Sig_/R4JPgLYyfUn4NvlA+F+kfWi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8fbuYACgkQAVBC80lX
0GyAHQf/dg9qwOF7ATm1BDj7lL98hYGbzbCkgID7JNK/dHx8iFn7rJMuajdOyX7d
JbwbdtA9DseCWnVq9JYm2QKxXctopnqDLPTP+ZrhnbN9je3fnH3F5p2Di9sY6ifE
u6x8MyskofVAWmGOM6lXCmrvytlmRnvJIqo56lOOMevefTfae1UifwqiVqc7XsAf
Id+LhtGtvbgs2mWjS0XZ7jvlS5vCMInvOfgvFh17Bn7GgiZbXmqMZfb+RwVUKn3f
63SuCdi1eQmvkLqiOn4tfR+SJK5Lkaae/t5C1Nfwa0vDQQlDsIikLvIdNSK/dGEc
BKz9VOhKDnvsdjo+HILwcsVpHVg2kw==
=hTCd
-----END PGP SIGNATURE-----

--Sig_/R4JPgLYyfUn4NvlA+F+kfWi--
