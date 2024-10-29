Return-Path: <linux-next+bounces-4529-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8D9B5709
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 00:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FEB91F23F32
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 23:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F09D20ADDC;
	Tue, 29 Oct 2024 23:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NxsiRMqJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8213B20BB5B;
	Tue, 29 Oct 2024 23:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730244931; cv=none; b=A1IOESGvNNpjJBdIhV3bC4AN6y+J31wKkqcdwYcHNU9EEJybpc0EBsjiFX/ekFB09+jNwtg/JjvtEMzUDA/SnPZEjJDzGu+nSBcVifm9HvbGYcUzLWb60vUrfovOdBueBQT6xp2fk67LyED/BkLjtRtrJsf2A5/GUq5iKe5ioA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730244931; c=relaxed/simple;
	bh=X9B8R1mXyOFlf0m+4IqucVvdQ8WsGhkhGSYthXWa4Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GYah1Xtod5huCe1shXy0hsN7M5VZ8++wjcH9I2HpW/J+Ivk+QxO3surGriRVazYFg42b3sUYvQUCCgHNrOKtecyekKf0RfAgKJlfvTerUwMOA/H2bVhdnZD5jZiw7OZj2027NNgAXv0S5S95sV3sacjNLtEW+TL+QCpTyMg5gUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NxsiRMqJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730244923;
	bh=3U4dsjqpfzkOxzDseIGNtUiy4KPO19XxKzMYLmMoI88=;
	h=Date:From:To:Cc:Subject:From;
	b=NxsiRMqJt1Q2gp4PmxJcHmkpnImDHvRDJX4neoXkbPjLY5IPC6HMWj1hvHp1O2XiE
	 OH88J2C6w2dO+m1JdW1A5uAChXBOK0UOkuTD4v9y95HNtN/qhiWrf4HucY2Ho+eOud
	 d2fx+Ggh1tJ7gZUGdciS7SukhQtHkYwVyuGz3TXfl61YMf7P+m0dRbQozDCW1/ec0+
	 qvwGGjqBv37KORlY9aoRKU+613iPs7iEikCKIVCW3xw4zxlxlfovzFVpx4LdmaKJa0
	 dJSCtDLaWmjNpZxdOYRpVapCQAoq79jVrWMIppMLfLPE2fQpMDEN+S8nmxvlIcAEjM
	 TObOCctIdvAHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdRSq2lWDz4xFb;
	Wed, 30 Oct 2024 10:35:22 +1100 (AEDT)
Date: Wed, 30 Oct 2024 10:35:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the arm64 tree with the arm64-fixes
 tree
Message-ID: <20241030103523.37fde558@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z4deXSSR9P8MDDolWUhtyMM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z4deXSSR9P8MDDolWUhtyMM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/kernel/signal.c

between commit:

  2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to avoid uaccess f=
ailures")

from the arm64-fixes tree and commit:

  eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signa=
l handlers")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/kernel/signal.c
index c7d311d8b92a,2eb2e97a934f..000000000000
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@@ -982,9 -1075,12 +1133,12 @@@ SYSCALL_DEFINE0(rt_sigreturn
  	if (!access_ok(frame, sizeof (*frame)))
  		goto badframe;
 =20
 -	if (restore_sigframe(regs, frame))
 +	if (restore_sigframe(regs, frame, &ua_state))
  		goto badframe;
 =20
+ 	if (gcs_restore_signal())
+ 		goto badframe;
+=20
  	if (restore_altstack(&frame->uc.uc_stack))
  		goto badframe;
 =20
@@@ -1297,8 -1447,11 +1507,8 @@@ static int setup_return(struct pt_regs=20
  		sme_smstop();
  	}
 =20
- 	if (ka->sa.sa_flags & SA_RESTORER)
- 		sigtramp =3D ka->sa.sa_restorer;
 -	if (system_supports_poe())
 -		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
 -
+ 	if (ksig->ka.sa.sa_flags & SA_RESTORER)
+ 		sigtramp =3D ksig->ka.sa.sa_restorer;
  	else
  		sigtramp =3D VDSO_SYMBOL(current->mm->context.vdso, sigtramp);
 =20
@@@ -1325,9 -1478,9 +1537,9 @@@ static int setup_rt_frame(int usig, str
  	__put_user_error(NULL, &frame->uc.uc_link, err);
 =20
  	err |=3D __save_altstack(&frame->uc.uc_stack, regs->sp);
 -	err |=3D setup_sigframe(&user, regs, set);
 +	err |=3D setup_sigframe(&user, regs, set, &ua_state);
  	if (err =3D=3D 0) {
- 		setup_return(regs, &ksig->ka, &user, usig);
+ 		err =3D setup_return(regs, ksig, &user, usig);
  		if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
  			err |=3D copy_siginfo_to_user(&frame->info, &ksig->info);
  			regs->regs[1] =3D (unsigned long)&frame->info;

--Sig_/Z4deXSSR9P8MDDolWUhtyMM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmchcTsACgkQAVBC80lX
0GzdgAf+Nj6KMz2bWxczAIrBNynqcMFLFo+iVSGRHzuq8dVmamjHApg3U8rxz/Kz
o5n2+pp7HLtyyq1TxwOkDtjk1/Yp536l8/TyhuxyGy6sfun8snHJPhcR27YI/xc9
yTnNQ1Wz3/XRR6NlTHE+IQzYg3YFlIilddBbw5bcISnSImqy5Qmwg2asGJP2tAM1
UOGjKYhENokP3ew2LRfIkEdHY6NzuzsQvWzvCw44FeC6+5ZqKsttK92SDiK49G8j
IhjtLpp7aeU6dOP+PM78J3kpcietByRTgZvQRTzhVRngArIy0AStbrsLoPCU0LBf
4E+ElE6xwQBY3F79q34KPz17ntseMg==
=ISUU
-----END PGP SIGNATURE-----

--Sig_/Z4deXSSR9P8MDDolWUhtyMM--

