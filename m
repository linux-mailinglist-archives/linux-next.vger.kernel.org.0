Return-Path: <linux-next+bounces-6890-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 174EEABFF11
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 23:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AA3D1BA39D0
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 21:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676362343BE;
	Wed, 21 May 2025 21:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="l45H/Hdk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C911239E86;
	Wed, 21 May 2025 21:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863910; cv=none; b=ERVf0q2ahyL+EuQBVUuPOKqp81TmGH7y5DLsUuov8gpc0J/ioHg/g5fj/f0LOvmNH5W6WxHvhuUD3uOdNfGDGorSZSlracyvAEqifd7AwmMW4wEY16fjA2my+bzOzBHhAz+RZnsg1bdMDRw5DdxrhiHVGn40iBwyu1WltrKUMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863910; c=relaxed/simple;
	bh=YVDmLx9vj7F++sG4B9KupCmsslwElufZWwG0ao12FOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SbexW4H+JJt97Vtjmwnq0tA8vBnVnGpFknVLXnKsELSHmKC9svCOUg02pdMkmrfnjOeMeuKyb/FmaSoX1RjdaXUY4TMw3nPehfhrFyEKIWm8nyTyPPZ57+WCLyUPTn99pjRwhWU7EElmK/zXl6gRpJq1tZTK/wsJkCDcfe/Ybho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=l45H/Hdk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747863901;
	bh=Mdb8Rmk8xcuGjdoywcAIQPmOTys5LdSBg1bNKgqALrc=;
	h=Date:From:To:Cc:Subject:From;
	b=l45H/Hdkzf7n5DHXy82SD9bsn4D5RDExg3y4Z80dfge6AR1WePuPyhnVxAVJBXvTg
	 gcnFVgExGJ8plmioFr7LfrGH1Stpog1NtfPQHZoLEd4N+HyQbXrwmmguGSlI3p3xaf
	 Oak6OjYNUKwwVtqy0iz4NrXH3XBHUcrmFC/e/qwIX75G4Je6ywOuqpdjnnrroAAw5w
	 U2I4i+b9MoJnI7zbxhzWtwjzFObYAfRvXHOCg7l8yiWTcGYlRuOPC/KyjK7fO6QEGK
	 1bxAREyJ1l71ddeehg4ywHRn9O+lpWIxEvBQFPMa6RPK7lbZHAsbKo9Li7Gsz6bASR
	 NY9NEkSXj+HSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2lMK1w03z4x8Z;
	Thu, 22 May 2025 07:45:01 +1000 (AEST)
Date: Thu, 22 May 2025 07:44:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20250522074459.769185bf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o1HPX4j8TjdViW==7c6zhFH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o1HPX4j8TjdViW==7c6zhFH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  24822c4b476c ("dt-bindings: clock: socfpga: convert to yaml")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/o1HPX4j8TjdViW==7c6zhFH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmguSVsACgkQAVBC80lX
0GxIdwf8CRHNFasknr+m8xh/thBjOffMpzQiMYd6RxXSRt7iUf9BmIbuMkjU9eZc
S1Xp+LDadU+4y5fhrDQdhbWqqqTWWSQde+ZA8L3p03drMqEyofPlYZGh0DxPybiH
KbW4vn9wdJqkseXBtdCg6lttfTf2swCUWetoXUK1geKCrOn2Uz5KcAM5RVCcz0Hi
U0sButMVh0n6bhuG9/EbtTP4Nltchumm8XJ01KH89BIMtaMkYamnj91PYd/tKjpQ
2IVDlj+47BuDv2PzUjNeBDFJHH4MAiosyjy56c+SjRk3i/I2hzFy4qa89kaoZ9NP
lHtdzsfCwyqMPIN+5ExJbuvEgsjL/A==
=a3ni
-----END PGP SIGNATURE-----

--Sig_/o1HPX4j8TjdViW==7c6zhFH--

