Return-Path: <linux-next+bounces-8927-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF5DC508DB
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 05:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC5624E9603
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 04:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7702D5936;
	Wed, 12 Nov 2025 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f+PIfh75"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D632822FE11;
	Wed, 12 Nov 2025 04:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762922530; cv=none; b=TKHb1PHlB3Ue2v6ltn7p7PzW6BH0ZTpDU8nDSHC+K4bwKgE1vSIQE6nEB63L3h1lzc+NSuDWp9QIVpw/89v6xM+qRSNsubUHcdgSd8S+svhDbFQ4ozll5M6sNvve0EoU4xEJVAfbdzzudlczkWN5gK0RyLVtEMNR5bpysYQ6z2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762922530; c=relaxed/simple;
	bh=GLYw3Wn04JyOqHVXMsQzxMfHvtDlm9PHNM4uI4txX8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DGjq7S47mHg75NYQyLxHL3BXsBGXqhcfgLx6HFjRpCVZmu2V9dCTUWrpshrA5QNR/cpdIHaiJX9JqpjSpVdRrnBLg+ZpPjESBSOUwX4qZ0G0EmzvPT4014kkaa2sEBl3PogxVLvd7QPt+9ZwSNykE5sh3/7uEl5/axmgelvm6+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f+PIfh75; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762922523;
	bh=QxgkfyzxdThS9YoDZeGsCiyzILKZluDzAbu4dUF9DuI=;
	h=Date:From:To:Cc:Subject:From;
	b=f+PIfh75SmJmA8OHnlWPNUov9pJ7M95Wuay7mBSueyC/JkmQ0D71n+8l4tnSgQN06
	 narFyknyefjUSLisdK3OlldQ5JZIk5otEtLU3q4IjSlHh8vD8jau4iRWqu4kIroTUK
	 3pPuGHVjtL/pWP7xXY8u32JjrUueUeXOmw/6QRFS35LXPpCrn6+Ob470wWCRl/zl0x
	 pz9kQ9wttis8ZrwENPGpTxved0pSmRayIBxc4N3vwhHi3HSzkndnQ2KtiM3Oaew5Ss
	 qxf5kVyoOkXT0/ZKLiSPRZZGyarUFZuHpKH3dIHeZ8aYJECme2z8Ox/c7sNI1A6VVZ
	 x7UdICuVSGxww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d5rN918M3z4w1j;
	Wed, 12 Nov 2025 15:42:01 +1100 (AEDT)
Date: Wed, 12 Nov 2025 15:42:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>, Kan Liang
 <kan.liang@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20251112154200.4d3671f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7iJbiTeduhtv795sD8uwsya";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7iJbiTeduhtv795sD8uwsya
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (i386 defconfig)
failed like this:

arch/x86/events/intel/ds.c: In function 'intel_pmu_drain_arch_pebs':
arch/x86/events/intel/ds.c:2983:24: error: cast from pointer to integer of =
different size [-Werror=3Dpointer-to-int-cast]
 2983 |         top =3D (void *)((u64)cpuc->pebs_vaddr +
      |                        ^
arch/x86/events/intel/ds.c:2983:15: error: cast to pointer from integer of =
different size [-Werror=3Dint-to-pointer-cast]
 2983 |         top =3D (void *)((u64)cpuc->pebs_vaddr +
      |               ^
cc1: all warnings being treated as errors

Caused by commit

  d21954c8a0ff ("perf/x86/intel: Process arch-PEBS records or record fragme=
nts")

I have reverted commits

  2093d8cf80fa ("perf/x86/intel: Optimize PEBS extended config")
  02da693f6658 ("perf/x86/intel: Check PEBS dyn_constraints")
  bd24f9beed59 ("perf/x86/intel: Add a check for dynamic constraints")
  bb5f13df3c45 ("perf/x86/intel: Add counter group support for arch-PEBS")
  52448a0a7390 ("perf/x86/intel: Setup PEBS data configuration and enable l=
egacy groups")
  e89c5d1f290e ("perf/x86/intel: Update dyn_constraint base on PEBS event p=
recise level")
  2721e8da2de7 ("perf/x86/intel: Allocate arch-PEBS buffer and initialize P=
EBS_BASE MSR")
  d21954c8a0ff ("perf/x86/intel: Process arch-PEBS records or record fragme=
nts")

for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/7iJbiTeduhtv795sD8uwsya
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkUEBgACgkQAVBC80lX
0GyFyAf9FuzOh/9HJ3qs/jBHirOuxBq6NOoIKk0bwZN35tF4SJWRSYYN4/I1evWr
DPuv9M/EtAkvENd9URR+mODHDggL4NI9fWD0jnbpu7ViRBa0Hl2pCFp78XUsjDuB
6Twt4mDr8efmFfrEse7sfxXyNX76c0HMTt4m7t3dtglREkMQNQ/J+fgT13D672Vq
rTgPcm2/TZ1E6jEyWSemR8DFM1GTpttDDYzSeIXkKYkSCt+NLjBfqZbyX+rI53ZU
0IMDXGBazKh+HrrUTVwf5+7bcNEHbw+KlkJonQXqHwYgesfAe7Zh3FFFNkIMGtZE
k5RxNhj1I9KocBVhzyHrH70LUyPNGg==
=mCiV
-----END PGP SIGNATURE-----

--Sig_/7iJbiTeduhtv795sD8uwsya--

