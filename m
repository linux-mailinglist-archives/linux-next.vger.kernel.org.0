Return-Path: <linux-next+bounces-7803-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADC7B17C1F
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 06:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E33DB3AF400
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 04:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DE31DDA15;
	Fri,  1 Aug 2025 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mR1lf9V7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B91D61B7;
	Fri,  1 Aug 2025 04:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754023086; cv=none; b=dAM14/yJbitObBQSitshNzwyC1zYIDgSIfiaEk37RdbEihAA5i8u7KX1hOmmNiq/bup3aBxEROQ/pQR2ahCosvMdvpNaPgOHiLiedN1xMkDQWwQlsGXO+9spQmVHw0ZDoCJZJ55tRljLaTU5q20QjlJUVDzWE5RFwSyFwevcUXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754023086; c=relaxed/simple;
	bh=MtqPTRM4k8o3IifUwM5G2CjT79WB7MAhmNKpgP3WjPc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GriTtdbcD3m+uatNB4gqF+6YEY3kM05JOUhnerqMhjoJIpCEDU9++U96rLvDjT0tV6SEn5keUI6ewYftvsnRBXGAP7Kf56WPhwgqqzdhbJ6bya9O+Q5TS5ewtzoQZr4BwRGupcwdmQp44e76zg3e8CwH6SB/aXr6FqKJ7Q/D/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mR1lf9V7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754022851;
	bh=Lbr/T0DeigOTlICxW7voT+eDmcnRwIEv3+WHgFimIOk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mR1lf9V7PyryUpwDaL20G8aQUg617gyrSgVNKCt+J5GLHFyIhIcewHMqmh6+yGP0h
	 tcfBDQVubeS7Awj1Xlc6GpKSJle9fiT/Qm0AW7QTk8SbquTQPmROdtNvNAdpymzUv4
	 WD3/pWyxmhxZ2H8lBh6AbOAvJdisCk7f5i1WtqFt3zUCd+DMtfvjatBI5JP4kTWqto
	 nBQBIBDFifY3MIAtltEfskFlMhMQJYrltg1zoa4sOxDMIhPcEYYYRv8LlTk+VlitYY
	 LB2hhAgSK9B6QQpu9w/8uBC5neAwpnGj3vunGFRLBm/mJOKh/hjYgbSwd5uIOhq6nC
	 XuWfQhDgdJGJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btY4g04wpz4xPd;
	Fri,  1 Aug 2025 14:34:10 +1000 (AEST)
Date: Fri, 1 Aug 2025 14:38:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20250801143800.029e7dc8@canb.auug.org.au>
In-Reply-To: <20250617151205.617697ff@canb.auug.org.au>
References: <20250617151205.617697ff@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/63lmO_GYpHRZiVSPMiSR5yi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/63lmO_GYpHRZiVSPMiSR5yi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 17 Jun 2025 15:12:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> include/linux/fs.h:3280: warning: Function parameter or struct member 'na=
me' not described in 'name_contains_dotdot'
>=20
> Introduced by commit
>=20
>   0da3e3822cfa ("fs: move name_contains_dotdot() to header")

I am still seeing that warning.  That commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/63lmO_GYpHRZiVSPMiSR5yi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMRKgACgkQAVBC80lX
0GwklQgAib/iicmbTzCuXUg5gBSmxVdEedl0qZGBeCndtuVdqGHpzzB1COZOXvQQ
wFOieLr9OOtEWBjteaMEGUOYkYVJPIWidWheSkxM+T7D2wmJj1uMs2Ukk5imcTuN
itRK4y1aiAsUAI1tlPy0w5JnDZqWX0L5yjTApw/iPgZY1lcKY4mwVpPeyOCm4kDo
uAPDj5m2eXE2K1tJvDLd+oEDWnmqATuqovynL9dHX8akoEev5Ql8Gr1xs64OrZKv
XpWRsJD/40x/Q0KMOb3/sFhRW15snKKNN83JjGatpYSnx4P0Xse3DzNflCjezLM/
NFUO5v9DTbHoNtR3Xzn1TkVimzXmnw==
=GNly
-----END PGP SIGNATURE-----

--Sig_/63lmO_GYpHRZiVSPMiSR5yi--

