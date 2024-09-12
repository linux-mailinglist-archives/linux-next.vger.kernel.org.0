Return-Path: <linux-next+bounces-3773-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8D2975ECC
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 04:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE0951C2166B
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 02:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596132AF10;
	Thu, 12 Sep 2024 02:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jHC1MUMV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518552EAE5;
	Thu, 12 Sep 2024 02:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726107387; cv=none; b=rIVEIJ8Awjn4pizgNnnsKeAOFqtobuf+hg5SyvMIGPhSrr9JJOPQGmUzXNmJBheQdd84tWVOuGzbDpe4qJUlMDDbc+UJG8gQhmNInw1s+7BtwNiDOpsR4Yn+5C2QcSEmbJUt3nMvgILIS4g+3YcUmhitno83UQzIo/n6U3VcIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726107387; c=relaxed/simple;
	bh=rPuy1Ff10KOvt7O5pU7bhBViYS+YgNCDPrhsJY9z/1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GDnImJmqOyA7P8wpIPMk09LOGY/QQj6BbzCrzpPcDmdG4ddP8BFEuOwdahUeFrDsftHL7DmSwaK2mswKzFXEbfsYoSR+dtLAmZXs6ebLlLy38fNrM9IEPeMQ0xWOg0DO+Qo1USFtFC32ZBee8vdi7BYCbJJKS84LN2juZTP116o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jHC1MUMV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726107382;
	bh=XvebqfpgRkKov2LFe+PC2QWLyi2MOqj3FjjMED5eDZ0=;
	h=Date:From:To:Cc:Subject:From;
	b=jHC1MUMV6SUuBKoq6JWCzoFLGpCedC31zpi+8CNx+PwPF3eyQgoNurLSGDmJcEVLG
	 vt/jj8ojtuJMovs9CVuKP/TU+Gk03c5UvPKFy30SzO7QvG4LI1lWBAb9mz2vFqah/B
	 LUCX5OedGbLMCCpr11sxUQQvafke6vo5O8jHEx5c40NurWNeGowe3dUtz06nmPw0W1
	 mY5B4niUCCeQW302Z1TFxA74jYpQIP5zomsLhw4pviZbuHmWQqhykTtVgN684zUqAY
	 p3tjsayDuYSvP1MZ1j510vhFxCzBu/gt/nLle0h9iBU26ymOWsHEl+ZL5gGIrEe2xi
	 ojyuBJ4/U05fg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X41Jk01Rxz4x0K;
	Thu, 12 Sep 2024 12:16:21 +1000 (AEST)
Date: Thu, 12 Sep 2024 12:16:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@google.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240912121621.5593aa8b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pylc+n2aTgKyRTc1JwelXnX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pylc+n2aTgKyRTc1JwelXnX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  net/hsr/hsr_device.c
  net/hsr/hsr_main.h

between commit:

  b3c9e65eb227 ("net: hsr: remove seqnr_lock")

from the net tree and commit:

  35e24f28c2e9 ("net: hsr: Remove interlink_sequence_nr.")

from the net-next tree.

I fixed it up (the former incorporated the latter) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/pylc+n2aTgKyRTc1JwelXnX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiTvUACgkQAVBC80lX
0Gw4Zwf9FgLRWoqb866dGySYBPJdnf/SPUpawp4Ue2xYHoeBcPdNKcPmdn1ZWHq6
1Q5WTsOmSQik10U6awjZn7oI+i1zA+xlb50TaINdm4/71D5qrQ1BFdoH4p49maU0
5mFwm1OoWra+ipJ0TgPfTYYhkMYEQQmJ7UO29DbcC2E3M6GYWyHue9eB6thmBFqh
f2xUqmx2FUcAEAIuw+ULzf3UVp4FtSKkSNvvwzL3SgVwoHOhPVhDmYCVq5Neg++S
S5b60egoku1690g/iuKsu0cNsjAiJHLk9+O4we/Q7sdArc1tzKstOYzMNpdjJACF
ZQaBNsYUoXNumtJSdnwwJXuc7CjZqA==
=Cpa0
-----END PGP SIGNATURE-----

--Sig_/pylc+n2aTgKyRTc1JwelXnX--

