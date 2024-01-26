Return-Path: <linux-next+bounces-876-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D683DE8E
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 17:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FBBA282922
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 16:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E65A1DA2F;
	Fri, 26 Jan 2024 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIu/oBYa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5B31DA30
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706286140; cv=none; b=syWZuI3LQ02gyov+o2a3h3IPvkYa7pXbeau5FrW14Kv+cJb1xc056hMI0J6t8RhHVw9XmJudkArlle82Z+eLshgz44HDYqT5bDOE+SAVsoi1zdQfHvhws2fbBafZTj5IRQGZgmmx1PPW7LV/T/fWn/mUSwgxK4jZWqhD8/PYLss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706286140; c=relaxed/simple;
	bh=EMq0wZM3PsziaakZzbuMCB/JRJD+mhi8J4qFWr9WEM4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fp3MV13aBTjBowObbs67+fKN6HBtmubFJpszN9T2y7tWelIHgAfXnvyoQ77ym4VUEqVjwH/z5erxZNwTcSNKtjZLxtwkkCeoi7bqyZf+1Yf3RySN/B94/FVHwj1hj/rR2dQDIFk9nBllW1RRhfVhRIqtgk51a8UYMsgPoEwwvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIu/oBYa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E979C433B1;
	Fri, 26 Jan 2024 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706286139;
	bh=EMq0wZM3PsziaakZzbuMCB/JRJD+mhi8J4qFWr9WEM4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=nIu/oBYaqLzUXOhypIdmKPm8olIuFJaOJJ9YFxrKg6KWCtlWjAKGAT3O+4ypJ/LQ7
	 Vp5TTJySWbTcJMd9UtQ2ohjTGUo/FZ77W9Tp7G/gBs7qMj4Nctkn8j9DNgPRwvnGvD
	 vlR/Oh2utvTTnTZldyh8IIf4PpMC34w9LEBOdQDPJeKbJVq9s9up416L2LwJK8/g0q
	 cLYghmsuRgrWLAJsxeTG+K7zghd/SJ2aE6yAMsJH0RRItdGB+HXJCmdHqX8n8UMzUx
	 8agVqT4hak2786oD8h9DQyT0/BKpRq3t92BxPDMrcTLsu3zYiYIOKvI2X/iDm+nikk
	 VPgqt9rovThWw==
Date: Fri, 26 Jan 2024 16:22:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <2c5d2cdb-445d-4721-a9b9-001a75efd2c2@sirena.org.uk>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240126115011.55da6838@canb.auug.org.au>
 <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>
 <qztustevwvwnfjrcour5hpxvik7ryhbyhxn5nzyosdvjdpdife@2a5orr4yo5db>
 <ZbO0nuqboURn-hy0@ninjato>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4K+/9LHHuXCCsWLW"
Content-Disposition: inline
In-Reply-To: <ZbO0nuqboURn-hy0@ninjato>
X-Cookie: Excellent day to have a rotten day.


--4K+/9LHHuXCCsWLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 26, 2024 at 02:33:18PM +0100, Wolfram Sang wrote:

> > whichever you prefer. There you will see the two branches. I am
> > trying to copy Wolfram's way of doing things.

> If you copy my style, then only for-next goes to linux-next.

> I have branches for-mergewindow and for-current which I let Linus pull.
> I merge both branches into for-next for Stephen.

It might be worth having -next pull in the fixes branch separately (even
if you also merge it into your for-next) - as well as the main tree
-next also publishes a pending-fixes branch carrying only the things
targeted as fixes.  Some of the CI systems test that independently, the
goal is to catch issues with fixes having unexpected dependencies on
other things in -next (we had a few incidents with that at one point).

--4K+/9LHHuXCCsWLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWz3DYACgkQJNaLcl1U
h9CXKQf/c9goKvelRC5djgFIBCfxzqvF6ff/+kf8ndUKPco2xH/rHYmUS0DLYExX
u2o9CxgX74EqkGJrrRf08BrwrTH5wlnjlnl9tMlC6M8RRmK07a1zCiY7qXw5uP3S
L/AqIvQg4rbCsq6Rw1f1jJKSPESfitdA30llBJ2cI2FBNa+5RBj4rh1RiF9vClzQ
Zxvnw2jIF0xtBAEN8RTACJPeBR+lWGUFMJsxrLmmB6HGS2IJEZacmcIJgMEobwwu
C76rHJ1Xswews4wsIvfcUa6voYL2XNIYrXPT1KYLCIvf3VSpebAhqip5P4nAnMJ2
gfxoVanhcKP424dIGYMLswKdS0Gt+g==
=AdcI
-----END PGP SIGNATURE-----

--4K+/9LHHuXCCsWLW--

