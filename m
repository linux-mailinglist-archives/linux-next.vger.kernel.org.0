Return-Path: <linux-next+bounces-6322-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F2A966BB
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 13:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C06517E0AB
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 11:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBC120F09B;
	Tue, 22 Apr 2025 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GAhXH7w2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332242135D0;
	Tue, 22 Apr 2025 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319466; cv=none; b=iaYVNfrICv+C3msnCZeKIEtQTlOK0/3D4gStMe3yhLS9GRMFIEgTNmzP8h4v24aZtDsgmWO/9wfO3ElYehg+JPGAXVShA8SJ9bV03LLMKAykA/kUj1FrQDf52deJdQaV+E7BHW+rDk0sGcT4VezybLjMbyQ4PZoz07I+u3cXOec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319466; c=relaxed/simple;
	bh=pkey72S6LxLbQmsVcJQXoixHfPvIXxQjpbFroe4aiXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tBgRZCFgjYnmanaoo4fbtbEDXjPHZo9kv6ptpzJW+e3e026zC0yH773BnfU8SJP7HoJaqCTogQhWCWxIx8A6NbWQKhU6RphdZnwMMKSmLISNE/q+mivAeaWwTJHHpJY2TYR217Ld2DD8JKMGrbGV2XSS5kvW1hH62bK+WhRq/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GAhXH7w2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745319461;
	bh=Hp36aANInThIuelQVLYGP3EHPnLeTP+8JV3krFIx1pk=;
	h=Date:From:To:Cc:Subject:From;
	b=GAhXH7w2OC0APZJyNlQwel11+BUjMdV0XhUfjihot8lNEjf93ViDwDIWfsoT/dIiE
	 7ljtr0jVEvgDLGKvAjpD5HKbbdXCVGLIXqktPKOUMDfETII1yNYODfxO9dfVYbCwJM
	 EvvNrpn8WGMq/Q5Ka60BbMAz6oXEPUJ271C/65In62aXu5H9DJQt1+WdRQdlvo/sXP
	 lteTYSNpsbAOxdmmqWIEYz8tGpMHAmFTSry0TOaN7y180cCmmbjeMxnxcu057fcDg8
	 X4PjCTRuQJv1t11T2wL+iIVBke8Lh4zQVWPfQrzQMIDW2K2Laazet9hb4VH4NnGhse
	 XX1imbKDjprcQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhfMn39vpz4wbr;
	Tue, 22 Apr 2025 20:57:41 +1000 (AEST)
Date: Tue, 22 Apr 2025 20:57:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Libo Chen <libo.chen@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: runtime warning after merge of the mm-unstable tree
Message-ID: <20250422205740.02c4893a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WxSkMf8qhQfFTFM/KrqR+ej";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WxSkMf8qhQfFTFM/KrqR+ej
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build
(powerpcmpseries_le_defconfig) produced this warning:

[    0.000000][    T0] ------------[ cut here ]------------
[    0.000000][    T0] WARNING: CPU: 0 PID: 0 at kernel/trace/trace_events.=
c:596 trace_event_raw_init+0x1b0/0x6d0
[    0.000000][    T0] Modules linked in:
[    0.000000][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.1=
5.0-rc3-05418-g16441530e08c #1 VOLUNTARY=20
[    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu) POWER1=
0 (architected) 0x801200 0xf000006 of:SLOF,HEAD pSeries
[    0.000000][    T0] NIP:  c0000000003efd30 LR: c0000000003f0140 CTR: 000=
0000000000000
[    0.000000][    T0] REGS: c0000000028f7940 TRAP: 0700   Not tainted  (6.=
15.0-rc3-05418-g16441530e08c)
[    0.000000][    T0] MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: =
44000288  XER: 00000000
[    0.000000][    T0] CFAR: c0000000003f0144 IRQMASK: 3=20
[    0.000000][    T0] GPR00: c0000000003f0140 c0000000028f7be0 c0000000018=
11100 0000000000000000=20
[    0.000000][    T0] GPR04: 000000000000005b c000000001617716 00000000000=
00006 c0000000003efc7c=20
[    0.000000][    T0] GPR08: c0000000014dd6a8 ffffffffffffffff 00000000000=
0005b 0000000000000000=20
[    0.000000][    T0] GPR12: c0000000003efb80 c000000002aa8000 00000000000=
00000 00000000019e40b8=20
[    0.000000][    T0] GPR16: 000000007e68eef8 0000000000000001 0000000002d=
500d0 00000000019e3f38=20
[    0.000000][    T0] GPR20: 0000000000000093 c000000002654c03 00000000000=
00000 0000000000000093=20
[    0.000000][    T0] GPR24: 0000000000000005 0000000000000000 00000000000=
00000 0000000000000020=20
[    0.000000][    T0] GPR28: 0000000000000000 c000000002656c68 c0000000026=
54b70 00000000000000bb=20
[    0.000000][    T0] NIP [c0000000003efd30] trace_event_raw_init+0x1b0/0x=
6d0
[    0.000000][    T0] LR [c0000000003f0140] trace_event_raw_init+0x5c0/0x6=
d0
[    0.000000][    T0] Call Trace:
[    0.000000][    T0] [c0000000028f7be0] [c0000000003f0140] trace_event_ra=
w_init+0x5c0/0x6d0 (unreliable)
[    0.000000][    T0] [c0000000028f7ca0] [c0000000003f2768] event_init+0x6=
8/0x100
[    0.000000][    T0] [c0000000028f7d10] [c00000000203e62c] trace_event_in=
it+0xfc/0x4ac
[    0.000000][    T0] [c0000000028f7e00] [c00000000203d4e0] trace_init+0x6=
c/0x680
[    0.000000][    T0] [c0000000028f7f30] [c0000000020042f8] start_kernel+0=
x664/0x964
[    0.000000][    T0] [c0000000028f7fe0] [c00000000000e99c] start_here_com=
mon+0x1c/0x20
[    0.000000][    T0] Code: 72d60001 7c8407b4 7c7e1a14 41820430 4bfffca9 2=
c230000 41820010 3920fffe 7929c010 7f7b4838 2c3b0000 41820064 <0fe00000> 73=
690001 3be00001 40820014=20
[    0.000000][    T0] ---[ end trace 0000000000000000 ]---
[    0.000000][    T0] event sched_skip_cpuset_numa has unsafe dereference =
of argument 6
[    0.000000][    T0] print_fmt: "comm=3D%s pid=3D%d tgid=3D%d ngid=3D%d m=
em_nodes_allowed=3D%*pbl", REC->comm, REC->pid, REC->tgid, REC->ngid, __nod=
emask_pr_numnodes(REC->mem_allowed_ptr), __nodemask_pr_bits(REC->mem_allowe=
d_ptr)

Introduced by commit

  516be5b3418e ("sched/numa: add tracepoint that tracks the skipping of num=
a balancing due to cpuset memory pinning")

--=20
Cheers,
Stephen Rothwell

--Sig_/WxSkMf8qhQfFTFM/KrqR+ej
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHdiQACgkQAVBC80lX
0GyoEwf/ZbK2ZhSxYNfKmcorobHtIUEXEqQCdJ0ZS/IPO4nfArIro+FDfumijs1g
7iwDhI6S63sKieYKaQpIRnIvWXlCHtYisvaLjBg1Hs+yv8W1yionOmJbycvRbNwV
sxZf5+cNYtroMa5HMv5dfDSnyul9uU/btw3KXyWGRVwA0GQvkvEtz5ixztM+Bmfq
k+cfhbXO3FZNdrMTU4s2ZvHSqtAhzfaG1ty1Jnsj2kNgL0lzqSwBm7U337LvEsc8
4AO6dcdAfqsofTxMIE0QVs1Hnd+wRmTVl0SBA3qylc4MgbjQdhDeOCTm1viizUrQ
vSfMQ4O2aPzkPXBvpdpLxAvUhnQKsg==
=LGgu
-----END PGP SIGNATURE-----

--Sig_/WxSkMf8qhQfFTFM/KrqR+ej--

