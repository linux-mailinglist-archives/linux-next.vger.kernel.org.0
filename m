Return-Path: <linux-next+bounces-6431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AA1AA04E8
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 09:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DAF11891847
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 07:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE52278E47;
	Tue, 29 Apr 2025 07:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cv4j2OAi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E6D278E41;
	Tue, 29 Apr 2025 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912697; cv=none; b=b+ERQubKObTExw6Z23wN/V11rN2TqHhHbNmBr6ykpWGV3d/hLlYF9ZYzMFXMY/ZFfTaOuXQXJqPvdEeHmJ13Xy6E3LNdnoeHQYL5E+4oHwfWqSq0w5wuqok56dr9kSh/qiUh5P0Nppv7R1+rbHZQSCFEcj0GEevfxxrtm5KnAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912697; c=relaxed/simple;
	bh=Jnsn00uNhHBc7RhB/Fv+ydSFhkmqTFOKl7wAVZSHDcI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LnEKGruSN5E2KUHtwfISD9A/dkvdcMNiOCUvitAyLIzJlzIxyp5IZcCD3nKoMs7vwUAowitS0ou+e7+MpfEroAyEf35bYFKMmSK2/YdKBTMV2MGoEou+r4QPdr5S3Uz2wmS6B2+0qnjRclGb/k9XYxXHKJ9dTFf0WVFEakNsPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cv4j2OAi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745912692;
	bh=i4X9oYP5w2Y355tpCdld8pnMZ8xr8WEUhdSWp79vQDQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cv4j2OAiAHAqBeOsGHuG3mUDJcl+hMSEX8Vr7v3Uw4C609UE7IiIJJzgnVy/ZDPfi
	 iXf61eF4hzW7CBm64Voz4GxOyyCw8DHIjmOMD1DhaFyX/IcxcBfbsPxjC/nL1SO3pd
	 OKsGWscDNxjZapjOZ9Tz5DXt7jB1uBrCQRR16NH1TdSes2Ji6aMhdbyz4WPSYDCYTc
	 d991OEayiE1dUtQsNkwxlSm/btBAX5O2uY0rIumHjmfbvUDaQb0aeeZXqu0IfeLceT
	 5lTUYV75lkKQj2KCkPuY4J6cYoOKgmJPW73+w0JyOlQtSUSDxiITcVr/31cNgSGYff
	 u5Gqk0quHNh6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zmsm36Tqyz4xM4;
	Tue, 29 Apr 2025 17:44:51 +1000 (AEST)
Date: Tue, 29 Apr 2025 17:44:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250429174451.42a368af@canb.auug.org.au>
In-Reply-To: <877c344gmp.fsf@kernel.org>
References: <tAJ0jyptJ0jLaRp9siDw8y2iw3S7GeuC05Uncum-qihlIKfCfEVhQbGNuTengQ0kWpnNp7OoTITxbEdf6nDTCw==@protonmail.internalid>
	<20250428203943.51dd39d5@canb.auug.org.au>
	<877c344gmp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6oNFtKy05ZIgxfr64B5KfK6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6oNFtKy05ZIgxfr64B5KfK6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Mon, 28 Apr 2025 14:25:50 +0200 Andreas Hindborg <a.hindborg@kernel.org>=
 wrote:
>
> The diff below should solve the conflict.

I have applied that from today and it all builds fine.  Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/6oNFtKy05ZIgxfr64B5KfK6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQg3MACgkQAVBC80lX
0Gw/oggAgGpcdEFyHqJMH5NrDh8xL/ZCYTfjGf07Hxk2pB/H19g91SMC7174DgoN
PKxSJhQ+U7GEOvcHapJjCBsTsIa32udnbThAlWvliVmpUO6nn4lEaMjIizU4thxO
T8y3uv7YpTq179rFd4PL/OH2Gh9TKINeAonW76pVHZ2c5+aAjJr3+SFFTcYEkpE1
0T2XO6Xu7t2slJAqM0OXdh509InJliyFmrLaJdg143rIchSJ72Q/QO+i5B2iyY7y
QBOTngFPLmrBezWrvGsV1oyG6EKk7CMSCnqOspBndwmR7XAfVpwrakTMy8yUWIJJ
TyBtwlI0Q4nR6RKo6TtcX4bZ57YN2A==
=h4IB
-----END PGP SIGNATURE-----

--Sig_/6oNFtKy05ZIgxfr64B5KfK6--

