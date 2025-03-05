Return-Path: <linux-next+bounces-5654-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39236A4FB3B
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 11:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F04F5188C0A2
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA446205AD4;
	Wed,  5 Mar 2025 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ielBeghp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853CF207A01;
	Wed,  5 Mar 2025 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169228; cv=none; b=qMpkHpu8Ajm0i8X2gZjhjOSizKypJdG9klBNLnm6u2I6223uiHGkLSZbpIaEg5/dK6NJDt88wOE8nh22pXqmRx3WK4tHgZ5w/y/gJOAibQmv2AXWbEHlEPJMrFEN/8O2lJ+KKk8ipuRGwlO8QOsx3I5ZVFe08ZRJYWoM8qa21Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169228; c=relaxed/simple;
	bh=/GuWZRjhFx/rcwP5xAm+nwZf2AxMSh/mD+HjqnbNxek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oiZMpEcZNR688tCLDMZT4AMdb73JzZTmfa9L7uqEuzbCUj8jqDlp2bq2XOhHgPT1O8WdDM3LlLffOh58t8V1XL/45fYc5rOCR+cZG+/ZeP5ytGJFvt6xr/uadPtoUz9Qwy+SpE+vhrx+EjyoeVbPUn65GH2nbQzlX+MWw4E8gOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ielBeghp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741169223;
	bh=rEdP5RhtPEUcP8CX5xzWks/MTd7uPEwiA9kyX2hHkPo=;
	h=Date:From:To:Cc:Subject:From;
	b=ielBeghpcv6CTYQJyRbBMVQ/f7c6od43bLA0DDj59gMMvBeUVcLcKjvr2QJjyvsK3
	 l3wRhTNyYBB6zVMqI16G5LxE03vwgW1DqiasXjUgC/h9MfT2zjAi26iH2XFDnIHeQL
	 O9hi/x2uxr6TNteso4ex3f4vCtRLIOV8jz6rU21AS+hgTMhfH+4zrDB/3uOCTtw2W7
	 CqKpPpNbOTA5J0OEJAxReKIEYdV2KtmMc45SWZS9WQR7liB9AmmadJz+rKwo0m1TZx
	 2xo914xeoXsQRYkZjYhqgSncngn0umwtkEzO08k36udZs9P/x3F0PQkwng/KT2PkOC
	 l+I/v6DLDFCwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z77WW1bFwz4x3d;
	Wed,  5 Mar 2025 21:07:03 +1100 (AEDT)
Date: Wed, 5 Mar 2025 21:07:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Disseldorp <ddiss@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20250305210702.66402528@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2+88nLbfru_PG+K/3GWIlAF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2+88nLbfru_PG+K/3GWIlAF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
allyesconfig) produced these warnings:

WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_ca=
ses+0x0 (section: .data) -> initramfs_test_extract (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_ca=
ses+0x30 (section: .data) -> initramfs_test_fname_overrun (section: .init.t=
ext)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_ca=
ses+0x60 (section: .data) -> initramfs_test_data (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_ca=
ses+0x90 (section: .data) -> initramfs_test_csum (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_ca=
ses+0xc0 (section: .data) -> initramfs_test_hardlink (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_ca=
ses+0xf0 (section: .data) -> initramfs_test_many (section: .init.text)

Introduced by commit

  b6736cfccb58 ("initramfs_test: kunit tests for initramfs unpacking")

Can __refdata (or __refconst) be used on initramfs_test_cases?

--=20
Cheers,
Stephen Rothwell

--Sig_/2+88nLbfru_PG+K/3GWIlAF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfIIkYACgkQAVBC80lX
0GydDAf9EuLeS01BTIlEam5CnrhxzvHbm+GRtyEqLmY2cOfHGB6Rret7hCbxcTRw
cCHdQcgtgolCFQTBFu1QPldcCZJ4bukP83za5uK9SLgzovcYyi6oSw8ZM3VXKOV3
f/t6Q55FZRb3M1rpvTOwdAqsHv6zT36SBBj5tqQuzxmQ5veq2L1+mjiR+JJHr/Me
qWwpQe04RoDLh3M/hKzflpjwymmOUAyZbh4vu/oJnJZ1PriV8E4sTRjNSHJGGc7e
lpB3YJvwUlmBkZZfsXuTuoC57EfGdFOru85GFDeWtVd5eatr+tUQdYwex6QIqqxG
62HSLFxu2sVP4zp0rBWRop1TSMKG0w==
=DYnq
-----END PGP SIGNATURE-----

--Sig_/2+88nLbfru_PG+K/3GWIlAF--

