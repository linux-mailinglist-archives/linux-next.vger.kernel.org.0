Return-Path: <linux-next+bounces-8862-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45511C38B66
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 02:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 542FE1A232A2
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 01:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9E522D4E9;
	Thu,  6 Nov 2025 01:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z+zXYC00"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584C7224AF1;
	Thu,  6 Nov 2025 01:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762392802; cv=none; b=SehuYO6imvr4IqNHb3SCF4hZWURy5vWa5ICxjdFes7BSB892g+X8j5jxqCUfMkWm79tdCmg3eaQFnVU0k0xm/KE0+YSidRyc313KpbBjArhrUJToopv07FrHjHCU0/XU1YNau297vc2Ea6e0co2RFCQgenhUMx/ryeE+5dJgsx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762392802; c=relaxed/simple;
	bh=hOeeMMQnSY1TRUb9AbPyuMKDJ340K1TFecVzGoYu8Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IlnEbAvVLHwYlKUXrd7b0PQ/iGKulRRvX5heuSgFrriSgaLUPw7WQ7wjVtKF9oy+WxGNJhpLZE/a2JgvY2VsM8nIEluSakxTk3mstXwRc5jZU6BAwkAfr8OcHy6LTxvxTAXFfrcFJTK+WdvyvsMMKDOcBDtYN2AapCm2TGM/riA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z+zXYC00; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762392798;
	bh=zIHFEbBSTU71Tzqy5Ri6CENZ4QsX1bQ/9gXGOKX5dTQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Z+zXYC00OxN3fLPcmh+s9jy9x6YFayATjzdkdfqm1atbAKUIbcvqOI5YlhJq5cV8I
	 vPgqCdqQlDDt/1jsO9iQ/rNVzGhF4olnYnSCUH9Np6zFLv8wnd2K8+CUyQ++wEQut9
	 kDFE7fqSNAtxu2sdQEbS6IuIQmsq3/x3gaZmC28P8VLxsk7LZGqPlbaYAMjvwV+nX0
	 H9gUN9SG5y0YbUDQQUXFHzjhhwGD8dM0BRz7RqAS8mVXCF04yV4davrYzNJigADFw/
	 GqtO+HAC1GSA0NA8x6NaFh+2ordjEaOsSw9+1htIUkInl5OYsblAXbxSbTE0ZTsd4Z
	 IVc/mHZDzpV+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d24TB3ww3z4w2R;
	Thu, 06 Nov 2025 12:33:18 +1100 (AEDT)
Date: Thu, 6 Nov 2025 12:33:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ftrace tree
Message-ID: <20251106123317.217e24ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TPVkpSNhhyy5ug_y90eI/7D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TPVkpSNhhyy5ug_y90eI/7D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

kernel/trace/trace_syscalls.c: In function 'print_syscall_enter':
kernel/trace/trace_syscalls.c:267:48: error: 'TRACE_ITER_VERBOSE' undeclare=
d (first use in this function); did you mean 'TRACE_ITER_VERBOSE_BIT'?
  267 |                 if (!tr || !(tr->trace_flags & TRACE_ITER_VERBOSE))
      |                                                ^~~~~~~~~~~~~~~~~~
      |                                                TRACE_ITER_VERBOSE_B=
IT
kernel/trace/trace_syscalls.c:267:48: note: each undeclared identifier is r=
eported only once for each function it appears in

Caused by commit

  64b627c8da9a ("tracing: Add parsing of flags to the sys_enter_openat trac=
e event")

interacting with commit

  bbec8e28cac5 ("tracing: Allow tracer to add more than 32 options")

which should have been fixed up in commit

  2021eabbdb41 ("Merge probes/for-next")

I have used the ftrace tree from next-20251105 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/TPVkpSNhhyy5ug_y90eI/7D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkL+t4ACgkQAVBC80lX
0GzKtAgAo0Axxu8vyacg+bA+P6STIZ0Ciy75ucEMxR4BzwA9or6pjfmqdbLDLG6J
hI5aIK+MXE9ZGQs74P4js6Q6b1P62phYXFqP8YG7AOBmSqAiHa6Wuq+B2VPlyhEy
Cfp3Znz08wj089m1kiURHJTZ+8xHPx2xN6TYxzAoI3GrRZb9TrXeXmARHrTpZkv6
bgTousmlfQ6Oyc92GSrSo6gcYX3aggbvW9iKqyhSEHeBNviI+ziOULizXa2QmBoH
xXpv0BGCjyVckzzwuL5H1x+cLkWC45+DQufIz37UfVvydWhNe/m1y+laQdpMt5Wo
5M7Ghshul5q2b/cEu9tlclOkibPo7w==
=PhlP
-----END PGP SIGNATURE-----

--Sig_/TPVkpSNhhyy5ug_y90eI/7D--

