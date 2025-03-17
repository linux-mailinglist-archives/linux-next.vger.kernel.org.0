Return-Path: <linux-next+bounces-5838-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FABA6606F
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 22:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80998189858A
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 21:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF64200120;
	Mon, 17 Mar 2025 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rifmXJMN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1101F583E;
	Mon, 17 Mar 2025 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742246588; cv=none; b=dFv+c/sXnAmqP98baly3EF44o5CGPZ1tiqlyPTzwbKSdhv7/4TVKzALLHTskNa526hl4soBDD2Zyeku6a1R3dCmvDgoLwNyJqzdPgkgGHVF5zUbQ4uJSb+Bj8TSgF+BMvSdudg62NjnQ4eK9MIYkGUJVMQhA8+OLSQ6p4jH2wto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742246588; c=relaxed/simple;
	bh=kgh6O/TfLNyHQ5pXxu5bV3DORrDqASdZvDetRMLney8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RjHYq+kkZyhYcfo+FWlElzFneidyghecfZOZqszst778uNQhpnkYL7OzYuj/0NttLPYybyx89o1i0r6+L6UnxBC3xRVktr1G37jRirbvzuq5hH+TjgWLDPnUI2cDEXaQqYsjbikhdGmyEw95rcM+jHFMgdqE4TNVwDEHRM10g34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rifmXJMN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742246584;
	bh=kgh6O/TfLNyHQ5pXxu5bV3DORrDqASdZvDetRMLney8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rifmXJMNHj9agkxQPlnoJ98j0sTKjVTTipWhgDGDMnsYxgGLK6eh/phsgYVYt2DPb
	 KHW307Fl/dHMxc0Alhks0WIEODLGrYJRRhUjJ7VNraan9nnxomxiRV2crb7YsGTE6s
	 DYALIHKfyzg8K0M1k7VncqS1h9zfWQBWZFrIVdGN7BCYmRL6/+WsBv9oFvSl2snqMy
	 pbnu46WVMnl2X/UGH5IL16T93AMvu99GXadZRI+N0wiWMof4Z0QDacVYi0aWc7MAKV
	 8CMw7YSTo/1Z5GmdsSDQSUlF2RNTh69W+ATv4iNhJUNyKdVj4DzdqdEb8qckmIA0ET
	 tIRox6ye1Thsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGny01Htdz4x8h;
	Tue, 18 Mar 2025 08:23:04 +1100 (AEDT)
Date: Tue, 18 Mar 2025 08:23:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the arm-perf tree
Message-ID: <20250318082303.3065e21d@canb.auug.org.au>
In-Reply-To: <20250317151306.GA12227@willie-the-truck>
References: <20250317112146.762e2a26@canb.auug.org.au>
	<20250317151306.GA12227@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//goXwL=cgQ.+pH7iq5CV29_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//goXwL=cgQ.+pH7iq5CV29_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Mon, 17 Mar 2025 15:13:07 +0000 Will Deacon <will@kernel.org> wrote:
>
> Thanks, Stephen. Robin's fixed this now, so you should be able to use
> the latest arm-perf tree again.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_//goXwL=cgQ.+pH7iq5CV29_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYkrcACgkQAVBC80lX
0GwAWgf/TooWUaoQqOlz3EdT99dWzFhdBQ7FaeR8BvUeU3RvOjIA5Cy/N7+skAHQ
ZdZYnsj62ZRPdMHNgjKT505Foq38RgXQ3yWXk+R5hO3PgxJePoEN67jLhGDHb8FK
Y1lKdcRV69DxWqTDJeB/fPaQif3wEfZF8LWZbZmbym+dsd5zulV7koYzNxYaAfJM
ivzOkfXIdGzUmEmPF54ZzDKAT259Sf3rXH5UCILLxpGwg6KYHQ2WUljoHLH2sDwS
P4Z6Z/frS/DIb+Y5hqo6LkHFd2CsCJSmq1QaV1kP1I8eTsKg8H2hYeKXiABKx8oI
wdWI16ucu1cSkg/Wt6ofvaVfNccvxQ==
=ZlEs
-----END PGP SIGNATURE-----

--Sig_//goXwL=cgQ.+pH7iq5CV29_--

