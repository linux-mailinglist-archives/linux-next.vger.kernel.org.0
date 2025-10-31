Return-Path: <linux-next+bounces-8767-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE113C22D61
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 02:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 482CB4E402C
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 01:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF791D6188;
	Fri, 31 Oct 2025 01:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QXkx2rja"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7DB7261B;
	Fri, 31 Oct 2025 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761872572; cv=none; b=Cb1hgXwt0WKIv1lGt0Hn29XThsxhFks48FWIKi0FCibLjmIo8F5t84Pl1R8TZ4G4pU3UFlRwCBCqy3TkH6lWdrzfK36p/5ftgEj70vjIEHFBw3Ymk1qsq+Eh0UPuwxvMhtThEVok3JkDIiMSkX60sqCV6NHVdCN1xdUbToh5/P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761872572; c=relaxed/simple;
	bh=EaYGUuCrSTMZmYoLx79I7S+/tp36oNKqy/fQx7wgpu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P/c7jfRiRLGFSB8Z9aNi02mm6b/rTpGMMdW94+9xOg69fRHkAYyxpvLpUQy9PlMZTt9JPFaXskc61dBZzwA88w5TnIQxumsxoJs4LqaG4+MKLJKPit928TVnmdq+Tmvkv/AUbku6SxVo8CtLVWcgPTu/oBNDsWrMdk6zwDqjSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QXkx2rja; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761872565;
	bh=P6cBC3miHiRhrWN0nClOrPmei8K9laNqw58pRuAvIQ8=;
	h=Date:From:To:Cc:Subject:From;
	b=QXkx2rja/fOX2tf14hrOqrmOr8QlPTfcUwNgVs9GbqxhVYYDJjCROow03vvTrn5cL
	 BsV38B9f4cwK+9JOV3ewhXRIrYDtc8cC8et9BZcCgtAvy1842b9preC2qNGU8bGTva
	 cOJ55ENySvnJMPk7KP9ub4pEg5JClIs5P7KehPAWHvhIBHNMMBsmA7mWuXUOEVqa3k
	 XheGjlPDIA3RYsR2/XIwHFxgfcGqN24GJaBkMxz2lXofvGGyeGwV2yVYIRtdubbDjU
	 ep5fNMovwktWIjm6r4qVoUy+/BgdUy5HBENmEIHwAPTew3ei48d7PrbIJhq+ziiAdX
	 EzLCR0lteaxSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cyN4h3HQkz4wM9;
	Fri, 31 Oct 2025 12:02:44 +1100 (AEDT)
Date: Fri, 31 Oct 2025 12:02:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20251031120243.4394e6a8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lf.HXFi9Zfz3kbPC6eoQVfE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Lf.HXFi9Zfz3kbPC6eoQVfE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm64 defconfig)
failed like this:

arch/arm64/kernel/entry-common.c: In function 'arm64_exit_to_user_mode':
arch/arm64/kernel/entry-common.c:103:9: error: implicit declaration of func=
tion 'exit_to_user_mode_prepare'; did you mean 'arch_exit_to_user_mode_prep=
are'? [-Wimplicit-function-declaration]
  103 |         exit_to_user_mode_prepare(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
      |         arch_exit_to_user_mode_prepare
In file included from arch/arm64/include/asm/current.h:5,
                 from include/linux/sched.h:12,
                 from include/linux/context_tracking.h:5,
                 from include/linux/irq-entry-common.h:5,
                 from kernel/entry/common.c:3:
kernel/entry/common.c: In function 'exit_to_user_mode_loop':
kernel/entry/common.c:77:29: error: implicit declaration of function 'rseq_=
exit_to_user_mode_restart'; did you mean 'arch_exit_to_user_mode_prepare'? =
[-Wimplicit-function-declaration]
   77 |                 if (likely(!rseq_exit_to_user_mode_restart(regs, ti=
_work)))
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/compiler.h:76:45: note: in definition of macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^

Caused by commit

  d58930640310 ("entry: Split up exit_to_user_mode_prepare()")

and maybe following ones.

I have reverted these commits for today:

  69c8e3d16105 ("rseq: Switch to TIF_RSEQ if supported")
  1b3dd1c538a8 ("rseq: Split up rseq_exit_to_user_mode()")
  d58930640310 ("entry: Split up exit_to_user_mode_prepare()")

--=20
Cheers,
Stephen Rothwell

--Sig_/Lf.HXFi9Zfz3kbPC6eoQVfE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkECrMACgkQAVBC80lX
0Gwwowf9G+TYFuh8UaO6aiMJW/SD95CEcVRWtw714ILsgy9L9JjLfrkiA77/ueMP
mnDu8fMPazGhYT20HdVgt8jia61x9AkSq10+Ej5HTA75wrUdSOpKaIYGII5sfQyE
2cAizM37SbW0sh58PBAB9Q+57LNocW3xrH4eyDTnfu3hRUuSu8IYNikSPVsW6csq
MTGLY/ogiuymcO2B3tskd4ogeFB6dZNVYj/3iIqagOMSW2wUinMz6TA/SQf3+sZQ
7fIl6XVXBKnqx5UqmwavO0oBkU6je9Nlz0sVa46Pr6EO7MF7Pad4vbClGRZGcbEX
dwL2eFM+7Qv7s+L/l+gmtGgfY+nqSg==
=E7QS
-----END PGP SIGNATURE-----

--Sig_/Lf.HXFi9Zfz3kbPC6eoQVfE--

