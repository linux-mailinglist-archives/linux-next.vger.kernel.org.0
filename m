Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F602165AB
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 06:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgGGE5Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 00:57:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44161 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726805AbgGGE5Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jul 2020 00:57:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B19Cl1Lg2z9sRR;
        Tue,  7 Jul 2020 14:57:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594097843;
        bh=PXZrWRQu7Fx5r6jH4Gwab58PRQth89ogsPlFJ+RCfow=;
        h=Date:From:To:Cc:Subject:From;
        b=RJ1jFO4BrS8/RQgKmRkbBZKB7TSH8vLS5ttfoOW+u1wzbcKleMtoNSFOaULMvm/uu
         gamlCp4pjcugioyaWKtXu4HvVAnGmrlrdI1BjdXjXXcgBarnt6J+Wtp71ZEAYK3lr2
         2/1zYKkSJ+RwZvOD+nlnOokIcXI33s+YRvs8uph3iwAvvgo8zcIyYgYgWUVhuERIfY
         fyF5nDxy0IDeOIBT8KC+pWSGFwMUtImznsIqgrK1HFzapln7QJZmyZK9P/imjB132T
         Y6Y7j/VJQU6ERgAULhfomECViI6OnSa1C5CirYaMXEGm7p38aGjUa1B0g3PgC6Fl4B
         NrpgPH3jCRIlQ==
Date:   Tue, 7 Jul 2020 14:57:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>
Subject: linux-next: manual merge of the seccomp tree with the kselftest
 tree
Message-ID: <20200707145720.02636577@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N43/7_g7q.lVuaPL70W8sHL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/N43/7_g7q.lVuaPL70W8sHL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the seccomp tree got a conflict in:

  tools/testing/selftests/seccomp/seccomp_bpf.c

between commit:

  9847d24af95c ("selftests/harness: Refactor XFAIL into SKIP")

from the kselftest tree and commits:

  aae7d264d68b ("selftests/seccomp: Check for EPOLLHUP for user_notif")
  11b4beaa0d31 ("selftests/seccomp: Make kcmp() less required")
  ef332c970dfa ("selftests/seccomp: Rename user_trap_syscall() to user_noti=
f_syscall()")

from the seccomp tree.

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
index b878e8379966,b854a6c5bf49..000000000000
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@@ -3079,10 -3043,8 +3055,10 @@@ TEST(get_metadata
  	long ret;
 =20
  	/* Only real root can get metadata. */
 -	if (geteuid())
 -		XFAIL(return, "get_metadata test requires real root");
 +	if (geteuid()) {
- 		SKIP(return, "get_metadata requires real root");
++		SKIP(return, "get_metadata test requires real root");
 +		return;
 +	}
 =20
  	ASSERT_EQ(0, pipe(pipefd));
 =20

--Sig_/N43/7_g7q.lVuaPL70W8sHL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8EALAACgkQAVBC80lX
0GxLNQf/d0sTQ86x4GF6X2S0U23owvOkEk9Z+c20iHAOVoup9kwAzz9c3duC/YtL
E4i/YFJA9cRMqdvJuhgmOCs0pfM+fAPMB++QCChPFs6LCaNBWC+7io5Xq6R2sbxo
Mz81mQRhRPdKVmD0z0j6FupNBYV0iJMPeCFlbQgN6G0b4JmaP7d7rD3zEgemty1V
xO8rFuXKcGfN2SscJZIdsgEt6FMN7kAGfGfa38/pNvDzviy0KYEBsLECZPLbCz94
dZ8GaYT/iIldV1ebLfdmWGD/Xp4sqFx/9r/vWJrYeeMGwBNp5RMdgV9HFj1Vd4gz
VAJwp/IRcm7YsDVsSAwftErywC75Ng==
=Ih0n
-----END PGP SIGNATURE-----

--Sig_/N43/7_g7q.lVuaPL70W8sHL--
