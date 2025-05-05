Return-Path: <linux-next+bounces-6513-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E437FAA8B5E
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 05:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C8CA171498
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 03:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C18E55B;
	Mon,  5 May 2025 03:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CohAnNTo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE7F29B0;
	Mon,  5 May 2025 03:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746417429; cv=none; b=Ge5JqNmYAYgSxROqjHQRUP7F6ak+Iygg/m2sl2SJ5gPBBshdjkJdXHbErSVaLdDQ6LDp3ILiP6pD2leYVbH3ES+s4kryqQrxSM2nD1HtJQeHeqCC595YNRLGeJxYzHlJ+NaPdvZufwsWJ9ks57N+rvYD5pc842tN4QLhOyojQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746417429; c=relaxed/simple;
	bh=nI8SdfJMgfl/bA4c24Lfkjf7p31ZnaxNiYdfeX7R9QY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n2HoDf9N8yq1WWTsFeOt2NZRLOLKcyNLrdV8DScMl9P1jp/y8qC5arijE5KAYMPYcZfHEf5pk/aMp06URGZmAhf3pCbtBLcX6KRiD2UU5/OzChhxcZkrMqIw5Otvy5CkoOM4fwNoqK1XmaL/Xbnx0eEo5q2AD6tffdFyKil99WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CohAnNTo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746417423;
	bh=qcQOZLOvfy3bUBGaS+hBBQoeSH2J2iRN8vC1MNsRWSk=;
	h=Date:From:To:Cc:Subject:From;
	b=CohAnNToextQ4nYBDyxOY8o4UsMtlz9pxvVJpotsZgSNSrArKrBUqIWgESM8hDZDE
	 ONG1DS8lJIcgNR5U95hbllonHcclArk8FVXMhJRMqG6B0Pk4IFIrIDOXy3WdMSHoHb
	 FCupfoRgmWshsAWYSaxRBofhwNEFzxYVDUn85BHnqKjoiIlFIyk4a62Y1qtGAFidPd
	 bxI/SLjkBtlaAX2HiNXJD/X68pSPwCUrlMAfime2d7sikHTda9gNirsBFRL6PkZRHz
	 GqSlf0sDDzP6putBYkEy9HUUsefOsdZuHnTmVDBcCxpjLnwu8MaOUvkDFTvXfInqoQ
	 icWP7s1TFAp0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrSQM1QWhz4x3p;
	Mon,  5 May 2025 13:56:59 +1000 (AEST)
Date: Mon, 5 May 2025 13:56:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Huacai Chen <chenhuacai@loongson.cn>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Huacai Chen
 <chenhuacai@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Youling Tang <tangyouling@kylinos.cn>
Subject: linux-next: manual merge of the tip tree with the loongarch tree
Message-ID: <20250505135658.65332342@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FecqIuZuEVZV/4ys3/p4gOL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FecqIuZuEVZV/4ys3/p4gOL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/loongarch/kernel/entry.S

between commit:

  d62879a8b16c ("LoongArch: Enable HAVE_ARCH_STACKLEAK")

from the loongarch tree and commit:

  7ace1602abf2 ("LoongArch: entry: Migrate ret_from_fork() to C")

from the tip tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/loongarch/kernel/entry.S
index 77f6fb9146a2,2abc29e57381..000000000000
--- a/arch/loongarch/kernel/entry.S
+++ b/arch/loongarch/kernel/entry.S
@@@ -78,25 -77,21 +78,23 @@@ SYM_CODE_START(handle_syscall
  SYM_CODE_END(handle_syscall)
  _ASM_NOKPROBE(handle_syscall)
 =20
- SYM_CODE_START(ret_from_fork)
+ SYM_CODE_START(ret_from_fork_asm)
  	UNWIND_HINT_REGS
- 	bl		schedule_tail		# a0 =3D struct task_struct *prev
- 	move		a0, sp
- 	bl 		syscall_exit_to_user_mode
+ 	move		a1, sp
+ 	bl 		ret_from_fork
 +	STACKLEAK_ERASE
  	RESTORE_STATIC
  	RESTORE_SOME
  	RESTORE_SP_AND_RET
- SYM_CODE_END(ret_from_fork)
+ SYM_CODE_END(ret_from_fork_asm)
 =20
- SYM_CODE_START(ret_from_kernel_thread)
+ SYM_CODE_START(ret_from_kernel_thread_asm)
  	UNWIND_HINT_REGS
- 	bl		schedule_tail		# a0 =3D struct task_struct *prev
- 	move		a0, s1
- 	jirl		ra, s0, 0
- 	move		a0, sp
- 	bl		syscall_exit_to_user_mode
+ 	move		a1, sp
+ 	move		a2, s0
+ 	move		a3, s1
+ 	bl		ret_from_kernel_thread
 +	STACKLEAK_ERASE
  	RESTORE_STATIC
  	RESTORE_SOME
  	RESTORE_SP_AND_RET

--Sig_/FecqIuZuEVZV/4ys3/p4gOL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgYNwoACgkQAVBC80lX
0GyP1wf/c5T3B4zrwq/CFzmrsLm/Dc3Ee5ye3/ipssJJed/WnORU5xOotNPbgRkp
dY3uwj3GYWym7jeUcRkoo8fatS5aAxTUGKpN4RBfPJUB/x/txUsTNbMLN+MUWipB
bDeKfg1nj8GbubCgcEW4JKFR0GF4qAJZWDoegpCbcMey1/C6rSwBLAtr0/pWqv9f
hdYo0//Y5+EOZN/No6e/6F46Ny/AECxiK7DB3l+EfySEyXXA6CJhgfiMtxHeXtP3
3thWnpVYpsUaSHHbf74nX9N5hCnA7VqxbMe5tYEvQ6jiv37oN9WucY7cOfvNwFEW
iplHNwIKXCUPfnA7KJk/Nqusd8K9fA==
=fPIO
-----END PGP SIGNATURE-----

--Sig_/FecqIuZuEVZV/4ys3/p4gOL--

