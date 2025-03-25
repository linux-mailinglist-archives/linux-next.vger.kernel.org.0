Return-Path: <linux-next+bounces-6002-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C45A70C5E
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 22:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE86170873
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 21:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDB51DD0F6;
	Tue, 25 Mar 2025 21:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EgFswtrb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C10269816;
	Tue, 25 Mar 2025 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742939286; cv=none; b=Q/hHX6Y8X7UzmoPBcCqNSfpod+He0hu+xYto/yaW0djmfj3nahjASkDYI71vflMRr2LyIAarD3L+YZVmQhfkWJZhnTWbXwwhV9/9Z5Bsg6n4bm265B6X+YUOkEajmOSdAjztHlfxZ7gJ5S0NmzcQVb90vz9BeM6GLqhMzQVDqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742939286; c=relaxed/simple;
	bh=04IRWgg/HpQRshpMYk9gujXG5ORwtlf+6cMMWI85m4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iodD2iI9Lk5HZ6uS1uwP/8HFy2nSLBxa2zdbXCPxZukc30u50Js6kwJg4EEKP6magAAnPZxutndzaiyBjRkvPIlo8uJnZdVvuoG/KI7AYuiM13itllUp79ZORs22PVOLiwSRwELZ68Fs0sPB1trcqHTjoxmdNNwtzWnlRjspSBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EgFswtrb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742939279;
	bh=S/Lk7HTCz1mH7CxSdiTT8+k2unHQol0PXqqHmsW9bCs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EgFswtrbMJibtXncdinzuy8fhAR0s72uqBclF27D1ZKmu7HM6UoGvjA6jM4FUGt2e
	 0RQ1FvPwmGDANzlAAVzq9gcmZxXoXVwQqRzjrZo5zWaQbMMP6u+2i4fRuBkEdfBcn3
	 5LRXgpIXi5FdllJg7esXORgiwZUlQ7lbKPQvGFJjvLMwBnIk6ZA2gIT5x/dEjH24ks
	 WmzjcYaxQcwjtdkWuSRNiRCa5+x6dgUZoBvFO+MOHpnQHVVdUR+V5Ytln2/QpvAQ7g
	 HK9KlIrNngRMpTnWTJ33NGSoiZ0HbrLfLdBOHXogSIVSAD0OF5zFSWQQ8Wv0WmSCkG
	 bQEbaFQar3oWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMk721z93z4x21;
	Wed, 26 Mar 2025 08:47:57 +1100 (AEDT)
Date: Wed, 26 Mar 2025 08:47:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tip tree
Message-ID: <20250326084756.6554a6a0@canb.auug.org.au>
In-Reply-To: <20250311150847.5a63db36@canb.auug.org.au>
References: <20250311150847.5a63db36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t3Oy3LpV2mq0cUEnQ7sfoNo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t3Oy3LpV2mq0cUEnQ7sfoNo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 11 Mar 2025 15:08:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in the mm tree as different commits
> (but the same patches):
>=20
>   0b3bc3354eb9 ("arm64: vdso: Switch to generic storage implementation")
>   127b0e05c166 ("vdso: Rename included Makefile")
>   30533a55ec8e ("parisc: Remove unused symbol vdso_data")
>   31e9fa2ba9ad ("arm: vdso: Switch to generic storage implementation")
>   365841e1557a ("vdso: Add generic architecture-specific data storage")
>   3ef32d90cdaa ("x86/vdso: Fix latent bug in vclock_pages calculation")
>   46fe55b204bf ("riscv: vdso: Switch to generic storage implementation")
>   51d6ca373f45 ("vdso: Add generic random data storage")
>   5b47aba85810 ("vdso: Introduce vdso/align.h")
>   69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")
>   9729dceab17b ("x86/vdso/vdso2c: Remove page handling")
>   998a8a260819 ("vdso: Remove remnants of architecture-specific random st=
ate storage")
>   ac1a42f4e4e2 ("vdso: Remove remnants of architecture-specific time stor=
age")
>   d2862bb9d9ca ("LoongArch: vDSO: Switch to generic storage implementatio=
n")
>   dafde29605eb ("x86/vdso: Switch to generic storage implementation")
>   df7fcbefa710 ("vdso: Add generic time data storage")

Those patches are now in Linus' tree.

> These are causing the following conflicts:
>=20
> CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/compat_=
gettim
> ofday.h
> CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/vsyscal=
l.h
> CONFLICT (content): Merge conflict in arch/powerpc/include/asm/vdso/getti=
meofday.h
> CONFLICT (content): Merge conflict in arch/s390/kernel/time.c
> CONFLICT (content): Merge conflict in arch/x86/include/asm/vdso/gettimeof=
day.h
> CONFLICT (content): Merge conflict in include/asm-generic/vdso/vsyscall.h
> CONFLICT (content): Merge conflict in include/vdso/datapage.h
> CONFLICT (content): Merge conflict in include/vdso/helpers.h
> CONFLICT (content): Merge conflict in kernel/time/namespace.c
> CONFLICT (content): Merge conflict in kernel/time/vsyscall.c
> CONFLICT (add/add): Merge conflict in lib/vdso/datastore.c
> CONFLICT (content): Merge conflict in lib/vdso/gettimeofday.c

The duplicates in the mm-unstable branch of the mm tree are

  93b9079e691e ("vdso: remove remnants of architecture-specific time storag=
e")
  82d8b6446a79 ("vdso: remove remnants of architecture-specific random stat=
e storage")
  f37aec9ec784 ("x86/vdso/vdso2c: remove page handling")
  dd2e8659933d ("x86/vdso: switch to generic storage implementation")
  9ac741560b0b ("powerpc/vdso: switch to generic storage implementation")
  4ca30cfeffb7 ("MIPS: vdso: switch to generic storage implementation")
  b9e3ec578ed5 ("s390/vdso: switch to generic storage implementation")
  64ed071644a8 ("arm: vdso: switch to generic storage implementation")
  af0452ad92f5 ("LoongArch: vDSO: switch to generic storage implementation")
  f3f0b0bb602e ("riscv: vdso: switch to generic storage implementation")
  74100951337a ("arm64: vdso: switch to generic storage implementation")
  08652b7a1b59 ("vdso: add generic architecture-specific data storage")
  0ab86f7ece6f ("vdso: add generic random data storage")
  f3b11eb27436 ("vdso: add generic time data storage")
  4559a06ae7c1 ("vdso: rename included Makefile")
  0f187d7ac318 ("vdso: introduce vdso/align.h")
  2d1b4965384c ("parisc: remove unused symbol vdso_data")
  837f2f1a07ad ("x86/vdso: fix latent bug in vclock_pages calculation")

--=20
Cheers,
Stephen Rothwell

--Sig_/t3Oy3LpV2mq0cUEnQ7sfoNo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjJIwACgkQAVBC80lX
0Gzzhwf/d42uHL9S7Wgd6/niqTAoAfIupwk7fGPhcY5CpLjDYx/r+xjvdtSbykJl
aTXMU4xQgju4qEo6R8jjPxY/2v9P44vwH3bMOZfQ+Rja5vGSywnBl3LlSAUOoAx0
uvVoJ+sgs1szSJ2QWRs027UlL4dRbojO8Aanmb+zLxoBZIhdKMYufhfyASvS1rXm
h727+CHBk0IYUYXPAi0dglPb0BrBPQMaPSOn3XhbXaMgfdw22ROKMTCBfANnuqJH
CPEtvyT3/dHcY7pHW+1hs98WF8BwhcP0YWvGbrLwO28UYSv2LDK0zMMCjqr4SOuf
Uz7I84ppUpuYea0bbXHVnPCbfG19cQ==
=s6ZR
-----END PGP SIGNATURE-----

--Sig_/t3Oy3LpV2mq0cUEnQ7sfoNo--

