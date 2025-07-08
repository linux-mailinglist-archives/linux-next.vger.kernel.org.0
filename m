Return-Path: <linux-next+bounces-7396-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA8AFC255
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 08:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A133BF762
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 06:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB44C1A5BB7;
	Tue,  8 Jul 2025 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IyjudGFd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B5143ABC;
	Tue,  8 Jul 2025 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751954445; cv=none; b=hIO6O9wTlQ5GUh6mNHx33nIITYZ4J1ex0+SCR8E6uZsSq/ppLQSfJhfcM/nS6l3WCiTPFNGB3PipVcbAHMox1QH/H7oYdEWPuHRLA1GTuV6OTG2V1Zrxkwyr33p8bHX/Eem3QcGdLr76aAEShpTvEK7JYl66pJFG2iK5THl46sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751954445; c=relaxed/simple;
	bh=bWZ33B8LsS2f++eeuRVmCOmlo7lrX4+3k6UPVbNEXQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ICDvwWNx+s6d5Q8RcYuCYVOdUqu8CTFvE/bIQN2rmXUzTRne/73aJyyDKMvKmb/jqlevE00Rzx0tVpuQehbOzLZ2mTnehOikOSQfBrdN+AlHS0T5ttELmBNREDtTMP+IZUKM26xGiQoIo12ZG2BQGUr33EbZO7i9j9pBsEhB59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IyjudGFd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751954381;
	bh=2Gog5nkNzN6nRFZlf9pvYtpU0uO2+cN8ZyU2FU3tFj8=;
	h=Date:From:To:Cc:Subject:From;
	b=IyjudGFdCpl+MN01DXXZMjjoxcCS6JVIkvVrDzYHXRK8nTWYox2nNw3Qbt5N9VdC2
	 t04W/HFXdXTwYUJrn9yK7qhjnhH3BX7GkqrrXZN2K6GXAsosUHHmY12dds/jYHO+li
	 2SlellFOED20SoY648ZnipOiQHwLmFvFC4p3TPHtEv+OcKClkMiyABg/aEOWTU++JR
	 9P3fk9DH1+HuyStuFBFKete+8P/RNwKfOuVK8oo0AgPCaxt9RnIJ/MHRY2xSZP7cBn
	 09CY9pyFHL5pgm/FNtk9zlF4muWpGHDNACp/FG1Ol/iJsEWWhysEPSD922DebWc+Ea
	 JAkttTT5vXcVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbr6N3KBYz4wxh;
	Tue,  8 Jul 2025 15:59:40 +1000 (AEST)
Date: Tue, 8 Jul 2025 16:00:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20250708160037.2ac0b55e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sIMCVMsMHHi.4aCSbyBCCex";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sIMCVMsMHHi.4aCSbyBCCex
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  f339770f60d9 ("Revert "sched/numa: add statistics of numa balance task"")

This is commit

  63afea878dc4 ("Revert "sched/numa: add statistics of numa balance task"")

in the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sIMCVMsMHHi.4aCSbyBCCex
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhstAUACgkQAVBC80lX
0GxNSQgAj+PKp0rKF1oNaIZKUOs3lq25Ujc9bjRN735yI9v+ENVRKeRu3J6LRIBp
waxCOf/bdFUcp94KYGCdvYL+4NXi/QwG6TWwLVlM58xsoByYQDIYZx2Bcl9nUB+W
5YmexFEpJOe+NV/nXqCo6ADzsew87KjmQ9uYyfTsvTmbmMVLPEci+aKPOGCzizko
2JLCyXVE8T5l0HwAXbKHlwGQ/h3nYIRWeHO2EYNy1OK1/UDjFBCYA1ERjCU5awjf
p9SYj3QNFTYrk/3Wf18AE+kSSLIFy13P2vHOtIzxxDOVpaA03FGNWGJ4Pzm7qa73
vGAs6BeaiozfSzfbaL1uTa3Ne+atew==
=8WTF
-----END PGP SIGNATURE-----

--Sig_/sIMCVMsMHHi.4aCSbyBCCex--

