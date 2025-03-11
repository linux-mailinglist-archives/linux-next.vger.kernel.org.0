Return-Path: <linux-next+bounces-5718-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D88FEA5B7B9
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 05:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E22D188E16E
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 04:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5284A1E9B09;
	Tue, 11 Mar 2025 04:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tWSDOW+s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5C1DEFC6;
	Tue, 11 Mar 2025 04:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741666135; cv=none; b=OV8tU6+vPfe/e+BNfOxfQc5YC4G4OC4zeJYGwPXtIbXq9eCeK9wpyVOpwkwbetF/iqtCgatbvEaVTNfHll6x5gyqar0xEYuhwNkyH8aZbCVIhCUqDcEClf4RTuTAN+B1xcWXw3+mSG0aGkoSE40M+xggskf7bM5Ol9k3WuLNKoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741666135; c=relaxed/simple;
	bh=Qja134C/wJaCaQVYpuecIUYuehH+ojbX9undd3UV3w4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n1m/kIUbVFNeh/wHnDKVpcPg2vHLrxWf8ZwZb6s9XAUArSbaV09Fsn7CqME5m9ou7+HI/AEsOendT+Rr2KPhYcLgB6Sfixtf7IUWhzdTKec1IgXm9Ryg9m0BnsggY/d00NXagvA90Z4Sjjk+CbZjovLzJElDpRwFIl88dIY0tTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tWSDOW+s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741666129;
	bh=G9LZex+ScjyCa4n4xpxmhtKckQVblnzbw8xzpeAVBcs=;
	h=Date:From:To:Cc:Subject:From;
	b=tWSDOW+sgBIAyUOZIOCnVnb4NF6wpjiCeJ6+pccKYFHOuOfuxDVs4qQn5pA7DE5J9
	 pJnIMu1Y0UBUKbsgPMIS88yHPAPHNmvCYuJruhv3w9lvQAvfKIrlVNw1B23cQaL+/T
	 qG4z2AfvE+Nunzsqtkcn5VBaYjb5yIYuXsdunQ1pWNfScZ6tueiUz3kYDkzUG/ARSO
	 wfsyjZzojlxrKi+YbjVpQPvrhmt1asVFFUBHkYIzneVOKBQmOint8cDCW5M5XzwwuA
	 2THWlUMzRt9XTuc7o13bzu/6300qYVqiWsxE/GdMc41FTJg/O/cOvd/DeCWK8iAnIY
	 QZPR6zlmlh6Dw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBgHN3WjYz4x3J;
	Tue, 11 Mar 2025 15:08:48 +1100 (AEDT)
Date: Tue, 11 Mar 2025 15:08:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the tip tree
Message-ID: <20250311150847.5a63db36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J7lZN/VrH1F73ucDQL7skho";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/J7lZN/VrH1F73ucDQL7skho
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm tree as different commits
(but the same patches):

  0b3bc3354eb9 ("arm64: vdso: Switch to generic storage implementation")
  127b0e05c166 ("vdso: Rename included Makefile")
  30533a55ec8e ("parisc: Remove unused symbol vdso_data")
  31e9fa2ba9ad ("arm: vdso: Switch to generic storage implementation")
  365841e1557a ("vdso: Add generic architecture-specific data storage")
  3ef32d90cdaa ("x86/vdso: Fix latent bug in vclock_pages calculation")
  46fe55b204bf ("riscv: vdso: Switch to generic storage implementation")
  51d6ca373f45 ("vdso: Add generic random data storage")
  5b47aba85810 ("vdso: Introduce vdso/align.h")
  69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")
  9729dceab17b ("x86/vdso/vdso2c: Remove page handling")
  998a8a260819 ("vdso: Remove remnants of architecture-specific random stat=
e storage")
  ac1a42f4e4e2 ("vdso: Remove remnants of architecture-specific time storag=
e")
  d2862bb9d9ca ("LoongArch: vDSO: Switch to generic storage implementation")
  dafde29605eb ("x86/vdso: Switch to generic storage implementation")
  df7fcbefa710 ("vdso: Add generic time data storage")

These are causing the following conflicts:

CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/compat_ge=
ttim
ofday.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/vsyscall.h
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/vdso/gettime=
ofday.h
CONFLICT (content): Merge conflict in arch/s390/kernel/time.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/vdso/gettimeofda=
y.h
CONFLICT (content): Merge conflict in include/asm-generic/vdso/vsyscall.h
CONFLICT (content): Merge conflict in include/vdso/datapage.h
CONFLICT (content): Merge conflict in include/vdso/helpers.h
CONFLICT (content): Merge conflict in kernel/time/namespace.c
CONFLICT (content): Merge conflict in kernel/time/vsyscall.c
CONFLICT (add/add): Merge conflict in lib/vdso/datastore.c
CONFLICT (content): Merge conflict in lib/vdso/gettimeofday.c

--=20
Cheers,
Stephen Rothwell

--Sig_/J7lZN/VrH1F73ucDQL7skho
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPt08ACgkQAVBC80lX
0GzfgAgAmvrAVvzQ2WRGG+crhNP+sNzrx6ggNxtH67ERhqXktto89uk0ydSbxW0b
sbDFwTYfXl232Zwz52KlVmtrqatWOHjnizqXHNPXkEAikEBxyGgEbur1p7G9AZoS
OsBoWkLT+nDv5KmMofVxQIr0gqt4Iyq14keQsIw44VNmfYt9qId9W1lVvlH3PnLX
fqVc2LBXL9ffIwPdCiQIcBSRjuJV1bTaIhumuY/30CdIF/9Kj42IBn0GoE5Q82Le
kpbrxv6GpMb/K5jfz66V/Z4CIRgBw75eYnp55znFNMGHGpuouVU8Pg2vfhSW0vCe
I0Zy28lzWhznxUQ0I0PpeEBrhRedBA==
=cYsq
-----END PGP SIGNATURE-----

--Sig_/J7lZN/VrH1F73ucDQL7skho--

