Return-Path: <linux-next+bounces-4506-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC689B4078
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 03:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5E57B22184
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 02:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02421D7E4E;
	Tue, 29 Oct 2024 02:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bLXURqFJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E468A1DFE3D;
	Tue, 29 Oct 2024 02:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730169256; cv=none; b=HOEBmSPH7RvFt96ztRponn+YZbfgHOQo2gIF4YiVCH6T62yfKr8iTMI6UvUTS3IF4LG0wd3tB0HuLtkD6LiXGm8OetetNxqj7WVyGJLOmHyjciPEEMujgLIdd3zHj60d4Lz9XwvHXQ2iuPREF9k3ncVz7R6BYYwVsIOXAbDh0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730169256; c=relaxed/simple;
	bh=jrCEZJyNnz67FPor+bctsCnMx79gAQTJeO8eQWLFfxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nVqU1Tfx/XV5eGFbTrd0fFEhKfodrHhYp+2+3K+BHwXNUsOQDHA72moPeWXISYXNqGsB2vN6bPFAWAaUScBQV8gsW83r4mWQ3Ol0nqZzAow8qWbRJ3ePR6qknVj6iRg9i963qzx/UU+G8gCx5WAedzOaFRI7qXXRcnSoY3AWjxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bLXURqFJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730169248;
	bh=SI4KFlfZYRpPpIJN+apIJHvyqV5JasT5sT5ejtLYHqc=;
	h=Date:From:To:Cc:Subject:From;
	b=bLXURqFJhg4aYbSMZtpjCWSiNOu1QwV9duhIHays7IcH6sb91xWGN1m+1AtchD5KX
	 70INHk0ZJykLzAemX9m0TDQaeOjMMXdPhoqx9C2qxjm9chIMihRjqOya0WfsouGBQ3
	 zihUJ5DdgP9v976XJknE0j7li1dxmDwXBMSGSrGHPygnZU8maD3Rlzu9dJVZ7pJZue
	 x1JHZbgvVn/bX1Tq5qa961cPanoDB9JegFfl7IBfLJ9bMm24MhK0aOC0PBttwgEeTj
	 ZP2n4GLyrzMRJmtVKXkR6g++8n8sZz511d0N75UHCUK6cXG4DrWFhBr8II2dx956xj
	 PY+q+kZWadnRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcvTW3c08z4x8T;
	Tue, 29 Oct 2024 13:34:07 +1100 (AEDT)
Date: Tue, 29 Oct 2024 13:34:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20241029133407.3580be1a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a0sJtPG5tYev0nydDxV5Qil";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a0sJtPG5tYev0nydDxV5Qil
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  9c70b2a33cd2 ("sched/numa: Fix the potential null pointer dereference in =
task_numa_work()")

This is commit

  82c4d6b6dace ("sched/numa: fix the potential null pointer dereference in =
task_numa_work()")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/a0sJtPG5tYev0nydDxV5Qil
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcgSZ8ACgkQAVBC80lX
0GzQkAf+JS/XWMvie1x8dimu5M8GVmwrLbc07v06a3g7zKn/baJlCa2J+aon7dCW
NZA5I25HoZjvLqCqxXrvnbPLNz88F61ReylFWKDHu7MITkNjyUGo1T7ssaOdPxd0
peCI+a3jD465KXKDTaz0mxrr1zzQ2gVGLVQOBhLWhNQ2OMtT2r0xLCCNGQNAYcV7
BLm4HwOG9yjVzCLzFk4T/NcKv7myUM9R+6z8FscA2dwN34IOaoZn2NTBfFCY35Lc
8eTnL5hs36BlKTi5RU7034hZrz2iBUyR5cG9bJLeJce88XcsUAZTRxsEuL/ymnY1
CkIItenbwb//GEN7AC4yIfqWhcifNg==
=/GsS
-----END PGP SIGNATURE-----

--Sig_/a0sJtPG5tYev0nydDxV5Qil--

