Return-Path: <linux-next+bounces-5819-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18649A64B26
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 11:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C86A171807
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 10:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDAA230BF2;
	Mon, 17 Mar 2025 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YJ3VZLY9"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7158121A436;
	Mon, 17 Mar 2025 10:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209028; cv=none; b=SQ5J1nJwjXe/GXOBWNvmUjwH4IwsuLBIRSbqmbzY4bcq5NK/RWrLPUxN17A+Sa6NGcEDLwGX4c1v2egbwbXWZmY2WceR29XjEQAjAJnvJd1ngdJNsrMzOQONQu+MsZM5JCcJypW5Jmb4lE1ZIsyMrKZaj/Brjnd65u3ia/wFn68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209028; c=relaxed/simple;
	bh=5g+1++KluGaTovLm2uuILeKfVAJlHZL1qjltDHLhcZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHxFPs+TAk9bH23h+lUs1gzB1Tfp7LLsZAIpj6PiPkILbQFbtmOhRk8pyQxLaLWiQVvWQC6L79BPhF0aSKCOklNzbIi40LH+l/58A5SpRtStTusKbUfKWA3sdxGwSpxtJbcsZ8+S+BndPaUSweqgUdvM507wnONXiMprs+g84gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YJ3VZLY9; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IJ+u4xPyPr9EInZP5Wm5al8gZifxMNVa5ZDxXud7jHs=; b=YJ3VZLY9625tMN1tlRbs+Az85j
	kGJzVmw7U+TZgT1ijLt94X9Zl8QcdFa8l5g1BWp668KuJCq8XVluye9RTLdkxr6pDKuhfVtV1XxV2
	TMRd7N2UTDbxn6i1MvAv1OvwvSmPNhNrSNK3ITE4pJddXNneNL4EZpNWZW/V4YtFSJJUUpliqEHz8
	wtzpQRzPvtFNjgJPAB4gbxCxKnBpF1+vLSVm5CG7pmoGnbYQ0u5y3zKtPDVokEcmUJm7vFAgRzjkH
	Xg2QHE8WmUvD+y3+rFqzXmSK8lbJGq+CKSwLSqV1yhjHCQk8N1pl+mu4IT5lAQNrpneP4dGCwsDMY
	OAFIeprQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tu89W-00000003QZN-3Wlf;
	Mon, 17 Mar 2025 10:57:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 44435300783; Mon, 17 Mar 2025 11:57:02 +0100 (CET)
Date: Mon, 17 Mar 2025 11:57:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, jirislaby@kernel.org,
	ubizjak@gmail.com, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250317105702.GD34541@noisy.programming.kicks-ass.net>
References: <20250304162402.475eb3bc@canb.auug.org.au>
 <20250317093856.GA34541@noisy.programming.kicks-ass.net>
 <20250317215207.2d4fe178@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v7jmWhOgLUrg1dXd"
Content-Disposition: inline
In-Reply-To: <20250317215207.2d4fe178@canb.auug.org.au>


--v7jmWhOgLUrg1dXd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 09:52:07PM +1100, Stephen Rothwell wrote:
> Hi Peter,
>=20
> On Mon, 17 Mar 2025 10:38:56 +0100 Peter Zijlstra <peterz@infradead.org> =
wrote:
> >
> > Right. Sorry for not noticing before, and thanks Jiri for poking me.
> >=20
> > So the below resolution make it go for me. The problem appears to be
> > that due to:
> >=20
> >   bcecd5a529c1 ("percpu: repurpose __percpu tag as a named address spac=
e qualifier")
> >=20
> > this makes that this_cpu_ptr() wants a '__percpu *', instead we feed it
> > '__percpu**' which confuses things.
> >=20
> > What would be the best way around to getting this resolved, should I
> > stick the below in a fixup patch in tip/perf/core, or do we carry this
> > in a merge resolution somewhere?
>=20
> Its a conflict between the mm tree and the tip tree, so I will carry it
> as a resolution in -next and you all should let Linus know when the
> pull requests get sent.
>=20
> I will use your resolution from tomorrow.

I pushed it out as a fix in tip/perf/core, figured it wouldn't hurt and
it wont get lost.

--v7jmWhOgLUrg1dXd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmfX//MACgkQdkfhpEvA
5LrTGQ/+JGdSq2Fx4gMsb8dS+h7p58SWQ7NzI3bxKpjiU+USKfx/VgfG5p0hdw7E
weZewC9ItxCT8JFD6ftTYqmWZW9p5egNTIv5XrY8nYxp9Thk+c67k1Pydwz2Lood
07NHqrqP2QVLyKvIb6x1SCDOEUZYt3zKi2T7zu0OcjM32grbf8F60yCvfodhgYXN
LyMHLjWI64Y/cZ0TsmMxE3BVVDPEMYkBGFeT+sJ5zVG6WTXXMlOZ61+W3aN4/tPS
Vi4YT/8CZfgh1eTJvZPEcXADlsQ4OCEMpM6em1a90Gg5rW+g7IiPEL44GGqzEHVZ
Y6oekLQJvyKJ881pnyxcHXxm46om5GP1CnvcTJDWj8R882pkjN7pYltNDcRMZ9GJ
ebHw5PxCtVBTXyrMbpvNgYHQ12I67nkXgZIRxudR++HSe9OFRq5PNeG0XUC/GoBc
rceM6Jac0rLyf9p2KV/7EDVZa/Hl5qEO1k6ZInjfG2grGvVB7NlsiDKN2rqV8x4Z
seLeutGdGaI3WlxVPKbeA93H3R+bM6MGsOkYMZL2foNXlALWBST7vmmvh5qv9njo
Dy/dJiTCTKV/6NLs3RVzYdmzzcDTX3LqWDOBAfVrxdTTw3HjU7PObq9eyolO6MTW
Yf7HngwgPwmL984qmTcc1JsujPygTisgdYeUnCC/VG4/IZDag1k=
=+3rx
-----END PGP SIGNATURE-----

--v7jmWhOgLUrg1dXd--

