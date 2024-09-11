Return-Path: <linux-next+bounces-3743-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D889749E2
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 07:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4341F264B2
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 05:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5458243144;
	Wed, 11 Sep 2024 05:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I3IPjg24"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2348BE7;
	Wed, 11 Sep 2024 05:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726033141; cv=none; b=DtkVT9Hji+giEw4B5D2+p4SoTNKScede/+6Q2GIqdHTQTDgvyxGzHAVjHd2lFrcwYP4scCGnqQu0Jjd3/N5wPu62cjHdZT4VHszmV+vSM8O92ZL/tNdTI8jDKaW+NQipdpAgDxfXEH+DL8mwAiGl8PgCHpLS8f68J+dz2pYKIR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726033141; c=relaxed/simple;
	bh=oWy7dnTErHdkjCMpolVdjKZtASVcmj3V/nUMUK4gC54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uB7C9qQ+PeZO5A5FT9Yjriv8gKozB+R1TIfhTuj15DZ5DBmQhOcHqSwokVrB8rgLI6nRNgiov4l5hwjGe1KxEV7/t6KFOBypBaEW7JrX8zXKtzEXKEHDm3d5xf0wovUPupiBKHfVwIbF2NiunN6IZg/3Fzz5/Se+FYjL0xpzxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I3IPjg24; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726033135;
	bh=bNKFBYRKthMcE1KMHYOCGYnighp0cSpmM3og7t3pQm8=;
	h=Date:From:To:Cc:Subject:From;
	b=I3IPjg24ijXyt7LkmdspQEvBLXflFmYDJhM78/yGEThfXS7PIlJrrFTD834tNjjrt
	 h3BxQYzrjGLirDmpqIienSFZB83C+r1rExa+EMeCkmgPuDxRH7uOnzReCk5JCPm76Z
	 gzYvAatGIVPgk6Lpn9/lHXxNmbra0taAjQnKud0IGVnDbPlUB6IRyc5+9Kc6vrkKuq
	 SIz7buUL+yviTOVEO7kpWm1lTKppLULHLafFWscuFdW5ZbQvC+iHcgVEZY5TxGnJfk
	 /UL8dZJZ75RFvqSVPqcHSYKpXWcTDJlEwuufFXMWF62xk4lNzrTiIzWyjGOQvwRluD
	 CT2LDeCpjGjZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3Trv1Z19z4wc2;
	Wed, 11 Sep 2024 15:38:55 +1000 (AEST)
Date: Wed, 11 Sep 2024 15:38:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Kan Liang <kan.liang@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20240911153854.240bbc1f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZM1smGWOcG5lVQI9UGZ17_z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZM1smGWOcG5lVQI9UGZ17_z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

kernel/events/core.c: In function 'perf_event_setup_cpumask':
kernel/events/core.c:14012:13: warning: the comparison will always evaluate=
 as 'true' for the address of 'thread_sibling' will never be NULL [-Waddres=
s]
14012 |         if (!topology_sibling_cpumask(cpu)) {
      |             ^
In file included from include/linux/topology.h:30,
                 from include/linux/gfp.h:8,
                 from include/linux/xarray.h:16,
                 from include/linux/list_lru.h:14,
                 from include/linux/fs.h:13,
                 from kernel/events/core.c:11:
include/linux/arch_topology.h:78:19: note: 'thread_sibling' declared here
   78 |         cpumask_t thread_sibling;
      |                   ^~~~~~~~~~~~~~

Introduced by commit

  4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZM1smGWOcG5lVQI9UGZ17_z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhLO4ACgkQAVBC80lX
0GxxPwgAmxgZb+NTT6il2xK+O5Rriyz4/j/yeVJmDoeJ9knWtGXhjkRl1v6Cr5oh
niLgFiezbdpXtK6R972nSqg7N8c8LUgbyGQC47k1of6XTE0fCFf2Tm/JNvfYdd9K
jKAIA990O6LMfNKY97T11gJe83Ni39/cRPS7OtZIztXI2/ueCOsoMpnrDcrjIN8Q
RjMiZ2DjC0HYrkuVBxhXdEKdhM0CMMkT6ZkIrUBndJBh9rgJo3LDcFUqgr7xDoC1
fLxRtdI/k8XNDMnV5SgwiZ/8ANwjhL3m7LBgahEEcFlOLbXNh+SabVj+nge/gwMD
dMGuuCHSI3Eh3yrDE8RWPbcMNfR7Ug==
=6iL4
-----END PGP SIGNATURE-----

--Sig_/ZM1smGWOcG5lVQI9UGZ17_z--

