Return-Path: <linux-next+bounces-5533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C4A411E8
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2025 22:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E9913B094B
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2025 21:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D8223A9BC;
	Sun, 23 Feb 2025 21:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eV7f3SUp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D91E868;
	Sun, 23 Feb 2025 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740345844; cv=none; b=qNNpdwHaaeX+WpEjoW/6a1swcRYd4tgasuLITFr5Kb/jxhDUU370TUzrBL7kMhOjWO8nZcMbQD6CXaxVAm54oEwUrA6frla1VONM0Kg8OCLnz+cur2dskigD+P+rNhzBgP9tuL0eLlJNsBT5TWs+5UdsMvxr8H07ZeSDRE9HsrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740345844; c=relaxed/simple;
	bh=RyXTgCMHhAPtmnpxzabRSY1se+g8Vct1Vnsa1vl01xM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VY0w7lqMyZAHEO5PZxfjeH8APQsckD2bq99rE2hPJBpjVn8opaXQPQvRvuH6SL9qTCyRhEiYUG67sJnkgbG2vOd4P5Wu2OWpbDiOTz0woSc35kUNPJJ/nXJvFnGaxP//5OggY01dUgeNnRrdAZc9q5vwxjRnT1xHm2n2UKac6no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eV7f3SUp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740345831;
	bh=3VSf9QUqjBcJCEaeR3x6UJzruM1MQMs8aYbTAevaJDw=;
	h=Date:From:To:Cc:Subject:From;
	b=eV7f3SUpybRNAvXI20c76mnOuS9ELHMHOqDONLcdx2axa9XRE44CQ4iSaTg6UqWMI
	 E1OuVIgy7PIxJMsEbOOOyrO+627kiCxdooWBpGaIeT3xO5/H2u7DNk4jmLeNtp9hTR
	 WdS+DTpV+bruZ9cXs780x1tXsQaep9xkTfch2BgSkWr4lhJKiusgWd2TY4VInIygfO
	 g216qmLY7eOWCjvVr1k3iNWYJs1Zzr8SQaPgGaykCMTdw1rPsPsnuikdO/jnUprL75
	 Fx5aM2giif4caOwrGdxTPNPaPM4xDOfii2H7Qu6hjjmt7ChT8kr/7dpR5wPG822Seu
	 rGc6rKavrFXfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1H132sS2z4wcj;
	Mon, 24 Feb 2025 08:23:51 +1100 (AEDT)
Date: Mon, 24 Feb 2025 08:23:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal =?UTF-8?B?S291dG7DvQ==?= <mkoutny@suse.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mm tree
Message-ID: <20250224082332.3a45e550@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4aCirJAqwvnm3Ki8HHbfF=U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4aCirJAqwvnm3Ki8HHbfF=U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6799f20bc8b2 ("pid: optional first-fit pid allocation")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/4aCirJAqwvnm3Ki8HHbfF=U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme7kdQACgkQAVBC80lX
0GwO8Af+J9wr6Fre0ybKu8jqk+c53NA7Mankb2H5vKqTJX9XAf++4WSBx7Fj2Fyy
tphk1dR6FvEbS1iAB6YJLFzaJvP35Mgy/T3Zg7gf6L8SeM2OLMpVptwrE16060QG
aLDP8yxJXq4FrJ9zBMPGfftK+xAXP22uENFB6mbvmOkFbxQyWtbdtrGRylzqSN2y
d/xdKNj3wOcDOg+VIFLB15I7JPXsmhPDAtJnm/8eCzgELitbxN+/lyZOF++xt5bc
ogOGBPepd+q7F7kKI0lfkFCu/ETMddZRN86bnKyJDUD9eCDSdHmu984KEs9x2sVi
XDOcLM72xjN397YPz+hU+DrEtgmfCg==
=OIDg
-----END PGP SIGNATURE-----

--Sig_/4aCirJAqwvnm3Ki8HHbfF=U--

