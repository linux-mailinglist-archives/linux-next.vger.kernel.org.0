Return-Path: <linux-next+bounces-7164-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82FADDE38
	for <lists+linux-next@lfdr.de>; Tue, 17 Jun 2025 23:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2E2517E7F2
	for <lists+linux-next@lfdr.de>; Tue, 17 Jun 2025 21:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CC5255F31;
	Tue, 17 Jun 2025 21:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N/+RE1FO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717792F5302;
	Tue, 17 Jun 2025 21:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197095; cv=none; b=dJNCEaRwtSWCc4RphtXN3N7kzOgw08lDevD8IpV4jXivUCP9qy3cPgnbtpN02G2klXPUuEtsgUj+8nTqiwV3apCk2ndu7yt0zpNQpo5dF/c5wkOrlVSQe7Chd8L26QE4Hc0n0S/tGLCGDlet7VL3vHA2QU4vZELa/xLbIsWSqzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197095; c=relaxed/simple;
	bh=7rtHWg82JqPoc/R1c0Z4yTbnEX2uP7bi9HFESJVgt6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KsJ1DWS0rbqQxGscoDFlQTrm38gKeil0JK5SvRPsFrch4OJHEzKwMAlxa0xERTRimbpstXXjOvslEYllI6cKHRidCJVhlrxW37tpWd8Rs4rlfwhXtsm45RVcVK6sWRVOeMQF2bnJHRHQZ6SQs+6wZhrVYyNd93ZxyYRF822LEUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=N/+RE1FO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750197089;
	bh=vljL/WIvTBMPII0zAoYA4dc4BqDldv47RGEnHEigWqY=;
	h=Date:From:To:Cc:Subject:From;
	b=N/+RE1FOF5GpcKtXgKGdLe64BigiblLSGn5VdjRBoci0jpDGcKTGPMmr6zA6tiupA
	 hheDxXkCUnUKBuBVpm8tQR/CqjAdJRfZ4pdVp9ZC/vUvVaHM6wdklsHtO+qe60JMfk
	 +Y8hPt8e56+Hyu8Anm387yNvQ+59FezddY9IAkggfCr4rhSLv8dqQ0OvX6lIVepwoU
	 ZOye2IPPmh4fDjSGG9PE0liBe/uIgYpsL/IXtWd1w5JIuXfhngTFywRpqhA8Q7FkH6
	 POo47QCgmQMJd1iYYTb2A6v3ZkyuuTC4+83kjixEIvLSFuHyh/G+pQU430NrTsoi9X
	 YLp9CzEnvuOdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMLDK2s5Mz4wc3;
	Wed, 18 Jun 2025 07:51:28 +1000 (AEST)
Date: Wed, 18 Jun 2025 07:51:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the landlock tree
Message-ID: <20250618075128.2a8e9fcd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8BvRhMsJ1EgJSmM.q9TvfTG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8BvRhMsJ1EgJSmM.q9TvfTG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4213018f5f77 ("selftests/landlock: Fix readlink check")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/8BvRhMsJ1EgJSmM.q9TvfTG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhR42AACgkQAVBC80lX
0GyJewf/YzwFd2tFxw7B/4+oqCEavklj+Uu3aqCAgIYGKdnBgGUBTk+uIX0Wr9Ly
ZpLVCwoxkWPXnUOROWwV3JlHu5P+Z8uFaM/rjsC9w3Jy3LKLucqMDEPWLeRAViGA
lThqVfGQ76JmtNvMBfAF0z70f3x/i1HTNh4joFUqYJiuefw/p+E3L1IXb+C2op+j
3SyesmkBImY7qg+hR0rX86htyi06WA7EbNsv1CbVQ7xOqUdLp89wZhoMs8hORz2C
g22CaU7Se0f27tbP3wsaefXZuKNA+M9SnpsPQIMj9+ZvDAxqABGjLgUiDv7ObUs5
V19uZvZU41k3yJwb15Ohhj1D+ETVjg==
=AlKj
-----END PGP SIGNATURE-----

--Sig_/8BvRhMsJ1EgJSmM.q9TvfTG--

