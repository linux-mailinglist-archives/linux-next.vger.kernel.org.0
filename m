Return-Path: <linux-next+bounces-5811-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6805A6463D
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 09:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFC7D16829F
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 08:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06961B412B;
	Mon, 17 Mar 2025 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPqOLVeN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB838B
	for <linux-next@vger.kernel.org>; Mon, 17 Mar 2025 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201486; cv=none; b=BkmqwdWXX5Ls3C44U0YRTeGgW4wKXH0iYdkHu8Et01vWR3Za5RjJvl0+X6vKj1xXXaU30w2pNRECvhYBaBmVXy72hTEM+yGRyBlJOc5kQYGuemVozQfHaCuTbtOLkaJks9M2I+gTipNE9fsfdYHuv3zKk3i5PCvzhkR/X8xQbMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201486; c=relaxed/simple;
	bh=YdpNjgpsWfiA+3YU5HMfVyLuB8fkFSSgiLN33pnGq5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvxxFLWcw8H0NqPUlPuc+mokRlICdCPBkl08jRSK8UhVewkOMlBlpyKheRPMb/tooTneaxnS4sC42pTMMYYwEQ/EHQYYOh4oNpQPEz/vk/zlhY6tk4vMWbdtI6KtJDAvDkmrf4UBM3193S+xdAVt/FCZtOGyRw7y7VP1Zs0sTyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPqOLVeN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF3DC4CEEC;
	Mon, 17 Mar 2025 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742201486;
	bh=YdpNjgpsWfiA+3YU5HMfVyLuB8fkFSSgiLN33pnGq5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPqOLVeNAwsnumG9YoSEG60RI3QF4+VL9rKV/Qfw5bACpakQma2TPsq9VqJU4eiep
	 VRQegI4X4ZR+NHbdS2ZpcT+Vjc5z5mvdYFbvMijAxpBKnNlCYoZ80xR/K1S4133SdE
	 g5BzFxeoHNYh7mJYP93e7j20ct5iT59jnFiiM2ZKsFn+A8AaewlZ7csuBJGshN/32u
	 Ao9KwdxF+y8I/a+UDN+nVh2mjineGGp4iLEVllEmV+q/wPQMUgYFq+g4FKKmW2bn32
	 2giLMc8GNAVZd05aE51M5u6w54DCwRotgkPYsjWHL+Uj00WcanLfIpvKOVaxaLjHdl
	 YuYHEfFdTsfLg==
Date: Mon, 17 Mar 2025 08:51:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Kalle Niemi <kaleposti@gmail.com>
Cc: linux-next@vger.kernel.org
Subject: Re: linux-next: BeagleBone Black won't boot
Message-ID: <91c2ff0d-a341-49ac-aa71-703d96c8ef64@sirena.org.uk>
References: <fb5a1e5b-8182-46f3-9996-2faed39c1082@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gafaw4pH7VAv2N3o"
Content-Disposition: inline
In-Reply-To: <fb5a1e5b-8182-46f3-9996-2faed39c1082@gmail.com>
X-Cookie: Did I SELL OUT yet??


--gafaw4pH7VAv2N3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 10:13:37AM +0200, Kalle Niemi wrote:

> The linux-next tree have contained a bug for a couple of days, where
> BeagleBone Black booting process jamms early.
>=20
> With "earlycon" and "debug" this is where the prints stop:

Reported here:

   https://lore.kernel.org/r/cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.or=
g.uk

It should hopefully be fixed in today's -next when it appears.

--gafaw4pH7VAv2N3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfX4ooACgkQJNaLcl1U
h9B1HAf+KZaPNFtV/jtJWaGWmq+JzEv1Newz95wenJJuMrQR/WolBVsM/zCqRGTz
kdNrxESdWYfyMdVD0FJIngUd9Sotdfz8tLCMDhIMwow7YqYH8IErUuKWsQ8U9Rgw
+x/CkH+ZyJJZGv0BbPeEoArDBKAOGeRC2zHqGP+hdYa/IoTylY5YzJJRTTtHhFM6
BipIK4jnufHTl4OnGWLpnI114FDdMSVf6zQuOPHOE/JBfSDstnVZPEf7V88o4yaZ
rN0eE/kPAi7Lk+S2BWwZ4R52Qg9f2E3JnshmzA+Kqs/0vgMTE8A2QPCy4EvG3uVB
LPf692r6/Wa93p//PrEevAFbBv+glg==
=MzMT
-----END PGP SIGNATURE-----

--gafaw4pH7VAv2N3o--

