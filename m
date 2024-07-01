Return-Path: <linux-next+bounces-2752-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2333D91DA50
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4981F22313
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 08:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F427E0F0;
	Mon,  1 Jul 2024 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AkGe7GgG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1783CBA;
	Mon,  1 Jul 2024 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823567; cv=none; b=cj5eu5CymMUsBk1lffywDXBxlNK5veEWRlgJIs54/DTFajPgA/0upOGNyCjuI7ruqYeyjqIxIibUviBWfkyxfEv9/Shx9EHEFNRLWWWK1f4rypNalwCJeKHXHowvey2DjShj4LSYdJQ3suiT7iHPGXKv9rdlRZACrK5aNZSj2Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823567; c=relaxed/simple;
	bh=0owJ4mYL83yIHcS3fThwulaqC57FYjq1Ha3hc1gk5PU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GGXIxfXyl6leWdRt+Ag/UAMB9Yk0nB+NASUJ9IUf3Tl0XXBCTOtq1s9G4oJly1fLPSgqSGrsvPWlDlMgM4eN2jNanAWaj9hw+ix1OztGRYJJ488X7ZKdwdCihW7jTxMEQR/rrYMzBNcEBmAEAOSsCWlhRk25yKJZ3J/1c0n/dJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AkGe7GgG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719823559;
	bh=ru4B+mKxOdMd8dxnc1XknkwRx1sv4owseDY9oUvluWU=;
	h=Date:From:To:Cc:Subject:From;
	b=AkGe7GgGtsSiW/Ru4Nrnac9h8Mn8LWwzKLSQpUI1RF/AW7+7OF701aTqHFxux4mnq
	 PzhMjOUBhkyUC7Dz8b/ol+t4U12UEYqQuea8q5PkhQQSrBsXinmP3pAlj4sXCbGmOe
	 tVqCUZRDUvyUao6MF6Qd+k3iraon77ZQo8ke6p/4w2VhvxjW4D3+H582dmjUGlQK+/
	 WrQXgzvYHXS4CHQfRMV9zanzD2zH13dKGz1RSrYSrWYWMPbwmmsWx2RL1GM9Uo6Oka
	 dhfp9ozEwaXh2SzqeErx3Q495PcanWRoaMgADsyhOAmHV8sLlVl/rG/qhmHjsjU3Hu
	 B4D/JupD0IyLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCKPy3cxvz4wxs;
	Mon,  1 Jul 2024 18:45:58 +1000 (AEST)
Date: Mon, 1 Jul 2024 18:45:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Tom Lendacky
 <thomas.lendacky@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20240701184557.4735ca3d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W=HfpQZmujiZ_SJAsljHQTW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W=HfpQZmujiZ_SJAsljHQTW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/ABI/testing/configfs-tsm:97: ERROR: Unexpected indentation.

Introduced by commit

  627dc671518b ("x86/sev: Extend the config-fs attestation support for an S=
VSM")

--=20
Cheers,
Stephen Rothwell

--Sig_/W=HfpQZmujiZ_SJAsljHQTW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCbMUACgkQAVBC80lX
0Gw+kwf/Q8UBeB3pzJhBDkNG10/8qdrjy9nNr5JbUltigQ3gU1Fa7YPCvdE+SWqH
TCFo68ulx0ztunKQsVJpC0HOnwWgzL8Z1qnO+lfYnqzCkeaRT1sbGTEyyUtYv9aF
fJ8EixLun+B73rOk+HxBaQ1bMliwbAJKrNH3JK4tj7G3lzBBlVMt5s8jUJ0JaJo+
F7d/us20CX5Dqem5UMIwty0oLkhWceKAMm3D8wBJEgJ9KpzIesuyJUSfmDZTNiGZ
q951VgYQOiXg23qxEqCsFNj+vLvceKTs28H9eoPVx2qFi7CB9tS9ekuXyKFtLanE
B/kDVfMhd3VdxnenBeqtg4tNSs8Muw==
=bkMG
-----END PGP SIGNATURE-----

--Sig_/W=HfpQZmujiZ_SJAsljHQTW--

