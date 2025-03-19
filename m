Return-Path: <linux-next+bounces-5874-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC54A68453
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 05:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C6FC7A7B6E
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 04:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DC821129D;
	Wed, 19 Mar 2025 04:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iuCNM6vZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82D18E25;
	Wed, 19 Mar 2025 04:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742360061; cv=none; b=PRtvJ8TMi291Xi3ucQpEGR1s6iJiGuv3gx6m/jfAKY3rs9+7vEC4FJQEciJdZgAMSpelaGjVxkwyvv/R+cC+wxtfk2QR7Iw0bczgK56ktCGUeDSKtwzZNdVLnHuslGrTqt82cn4XRQMgVmMfNDPXHcPckqs/0knMJ5BADiDwdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742360061; c=relaxed/simple;
	bh=nDPqVNWuEpP15jeJkcfCDdZNiBEKo6cakeFIyV0WAn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tHWgPdBuvSIK7exO8c8OL+Vxtp14TNyMymcEXUDZzqUHIsWweWLslBB+abuX04Erkv7MCGBEt4b399Au/1WGGSEJOZWO6ATIkDtoCuBGjqTbkItUTOq67mU/fkXT1T6SCsNDarERdjPMKWP9SMq1buz3qy8XajbFzIeN92iqfks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iuCNM6vZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742360053;
	bh=pyd+uszB89QOxX+OqB4yQC/q52KUHHq7yzw81U5QTmo=;
	h=Date:From:To:Cc:Subject:From;
	b=iuCNM6vZ41n4MIFZI0aJw2iyyZHoc49n/a+zDbW/j8T4FgMPeG+G9jOhXpzXUAuBj
	 2B+O5ELNBrs/OACqIX4xz9WWd1zx3BKRx21y0INEszwmWyAxwBBmujdNrvIS8/Epzu
	 C3YrcGIZcUItOfzUOTWrRLsp6txFE2PyNBzi6wQNLxfCzUW6fyY4BAAdfzdPI0t3gW
	 VqGmZRNEXulJcr24GUGXf9coeCx8wmsZBFQyRmTQSoh+/LA+tEQEdgSqNb2FmM5DKc
	 DrakkTCk90AMFrElSXrDvdmMW5tX1F3zEAVOgIjKvCGgzRmg/hcCnMaBVjqcw7OJ21
	 HAp6NtOnSiLyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZHbw36qjwz4wyw;
	Wed, 19 Mar 2025 15:54:11 +1100 (AEDT)
Date: Wed, 19 Mar 2025 15:54:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Joel Granados
 <joel.granados@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the s390 tree
Message-ID: <20250319155410.3cdf01cb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IVW=m27FPl46hskqBSah/6x";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IVW=m27FPl46hskqBSah/6x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/sysctl.c

between commit:

  20de8f8d3178 ("s390: Move s390 sysctls into their own file under arch/s39=
0")

from the s390 tree and commit:

  c305a4e98378 ("x86: Move sysctls into arch/x86")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/sysctl.c
index 6c70fb3b2376,4ebe6136b08d..000000000000
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@@ -1888,15 -1843,15 +1834,6 @@@ static const struct ctl_table kern_tabl
  		.proc_handler	=3D proc_dointvec,
  	},
  #endif
- #if	defined(CONFIG_ACPI_SLEEP) && defined(CONFIG_X86)
 -#if defined(CONFIG_S390) && defined(CONFIG_SMP)
--	{
- 		.procname	=3D "acpi_video_flags",
- 		.data		=3D &acpi_realmode_flags,
- 		.maxlen		=3D sizeof (unsigned long),
 -		.procname	=3D "spin_retry",
 -		.data		=3D &spin_retry,
 -		.maxlen		=3D sizeof (int),
--		.mode		=3D 0644,
- 		.proc_handler	=3D proc_doulongvec_minmax,
 -		.proc_handler	=3D proc_dointvec,
--	},
--#endif
  #ifdef CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN
  	{
  		.procname	=3D "ignore-unaligned-usertrap",

--Sig_/IVW=m27FPl46hskqBSah/6x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfaTfIACgkQAVBC80lX
0Gx7PQf+Ont/6n6LalNjpHqMyfwRw67KArZLMJlIdFcUl6UsVJ/vrokickRVCyuI
UFoDVfZZDuJFiibxNfjnBnZFikIcRzwis5Su5qDQiFRnMM159rSELxJ2TwLQCb/r
9kQKlKFlt2VwCEMhAdvUVBbrwxR5pFfLXWAm5UycMG7EV1lQBkJidGCOEHpJu9Zm
G4IOJBGrM6EGAw6kR9w9kfizOI2jrLy9A44zekOLo/S4E6hEbogtm1pdrVuLAu8/
nQVKVJpqPY3T0LekI9iokUJtKb9pmhCqtIXGVdoCNBnv2EYauC7wSDaw12vzCvor
0Qvt6tRembN6F30tkQ8PPKKSRq+1mQ==
=QlHW
-----END PGP SIGNATURE-----

--Sig_/IVW=m27FPl46hskqBSah/6x--

