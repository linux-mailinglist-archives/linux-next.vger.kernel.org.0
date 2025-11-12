Return-Path: <linux-next+bounces-8935-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DF7C51BEC
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A9171891B57
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3852FFDF8;
	Wed, 12 Nov 2025 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nRHwYJA3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39472304989;
	Wed, 12 Nov 2025 10:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762944325; cv=none; b=gIgG9vK7OGKWvqn7599ecG7KDFumB92XaNmngpajaqnElGKpZoJFQ8X/0GbSG0QTkw5RGTlXbr6MAbi+ceYU6c2junttn0KntS/8o1CUY7IveSbv0QMPMoSUFxStFyxhAFPts3RfMQb1r3oHf3Jyd4fpDAY01jkA84x3cKTD+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762944325; c=relaxed/simple;
	bh=STgVMu+mpwcMCBynKQfjKtSKUzJW9GOQvgqloaDHCXs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gwq3ufMBgWMaw8eaGohyEQoFlHfnsPoaxKprBJFvreQieZiXq0dtz/O8mfDKAyAGwMTWzOhW/aZ6pDC6Uoo4S6YD3DGNvmPPGjEyhCdFQbITT16N14CGL7a/28zqJSLZ911oArrNmyi8So9yKS7l9S4gbuGy+jJ8nnsEb8iU4A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nRHwYJA3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762944318;
	bh=kJ4WQ6E6bqGENyl+arkcjlwilHWe2LPHv3F4q+pzq54=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nRHwYJA3UgsePAe2wOIRUJsjM0i4U22cFTfuLhlxBCHgQM2MYpa+pgQoMX6guuoIs
	 tPSH32HsB6eE7uDjljSZtjGD9u3ru/9S7liMkLEuNUH0JSep10C0BhTcQdkq1xGkpn
	 SOdUR0gwlPetcEc4sg2b3vRA3p1UHLvDlVva1hzRIKnccJ7Vck6qC52wD96it31p7/
	 SZT5TKiDyb8apX2DTd46EBi6KRe6uzQl61azxRJRgpod3T2+NaJ/u79HQdkoNpMVaB
	 srFDcjlrrtD6jxSoA9S6WAnutqQTI8Jo1kGE0b7sWKW+TLlI0f9a0sWEBM1TmU7WLl
	 Rl8ioczbYG7Hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d60RL0BWLz4w1j;
	Wed, 12 Nov 2025 21:45:16 +1100 (AEDT)
Date: Wed, 12 Nov 2025 21:45:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251112214515.41daf9cc@canb.auug.org.au>
In-Reply-To: <20251112093928.GD4067720@noisy.programming.kicks-ass.net>
References: <20251112154200.4d3671f9@canb.auug.org.au>
	<20251112093928.GD4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C5OQYv06GPX0raEnaSWWwzi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C5OQYv06GPX0raEnaSWWwzi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, 12 Nov 2025 10:39:28 +0100 Peter Zijlstra <peterz@infradead.org> wr=
ote:
>=20
> It appears you're way faster than the build robots :/

I was hoping people would put their code through the robots (or some
local unit testing) before publishing it in their linux-next included
branches ... ;-)

> I'll go fix. Thanks!

Thanks.  (there was a patch sent in case you missed it)

--=20
Cheers,
Stephen Rothwell

--Sig_/C5OQYv06GPX0raEnaSWWwzi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkUZTsACgkQAVBC80lX
0GyQjggAg8wi+TFra6XwD6x75tElHgddxWM8TPTSIQYrYwQkxqv0TpOcMuqvjRu8
oDbEWPrr4DDGguj36bs+UAunIJFbpcENH70RDW2VZ+XNoc26XR3v4wLZheGTlupb
offay8oiASc3vy3yUbl9RT+wktCLpMEdaxNZh2a4hSSYb/nf3yLUe8lE5pB7IRcM
0rDH8k44KANV2AgHkswRqQnAMH/mufknYYuexBMZrRQdTJSKIZRlvkvcBV+ZFlfm
BznoFAKXLymNKy4jzsaO7DbIdyIceyIB8IvNYehZRH/6aSBe8sb0nKeuPEar9kdq
+3/Fs2xzKPSqes7DtdslKZRjlUhtow==
=wiqT
-----END PGP SIGNATURE-----

--Sig_/C5OQYv06GPX0raEnaSWWwzi--

