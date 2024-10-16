Return-Path: <linux-next+bounces-4305-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672739A086E
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 13:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 918B71C22565
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 11:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C134020607F;
	Wed, 16 Oct 2024 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKKTl3Mw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E51D63E1;
	Wed, 16 Oct 2024 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729078423; cv=none; b=nx2vKk6XL/Rz75ySmgISOdGof2B7vlZUDYIDFkBtE6jYlW9Hyo9ZDNu2Grhf7C0kZphnrRPpixk5OLd6bM81QY/a3WRFb+K9Rfa3yfvwrjAMoY21cF0UXl22Wo9Y4TfjaNBarlcXo4HXjr/D+5gvW+KCd2MeMFyqsp1LAsYGDwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729078423; c=relaxed/simple;
	bh=9ScozBNebsgvalEmePITX1ws62/I3yp/zbZR7NP4zOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWGVEGP8APvyike3ZGOuwAWjBg6+0pQnwVpZA0Lm3znwBNOGMRqLr9yhWtrnCZmjt80BiSOnHy3aAuS4QDIVdUTN/4PK8W1cGDLaoSOwh6dSusgN0bjN3f90ldR1DGdwBUIrSu0DVfZlC/y90pg05Xd4en4pKEadi+fu037Ts40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKKTl3Mw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33340C4CEC5;
	Wed, 16 Oct 2024 11:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729078423;
	bh=9ScozBNebsgvalEmePITX1ws62/I3yp/zbZR7NP4zOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKKTl3MwO5DNxmgTMZJ9RTe3/xZcBbmDfoIFARlcgAdlRIb6c7gZpm1+7xnwyEQJi
	 LDLDPLLTLVmZZVYhuu54/6V8lUBIWLDCyiW6gb+ZLdDUsmOq2xpIabQW5vr3S0lu/I
	 4i43pVbotUKWNJTMBZbkPj+mgDv1J0GJU5H6Zk7EnFL7X/004dXqSRn51gE9V8gIwL
	 x+SMH7NLTp4IikC/WA5gnXmHbJfalDtzbSRhA2ZsO5XLrwdkXFcbhHG/fijaTyWPqv
	 OJkG8XC/8EO5j5d+scuRDhYnYnncoU5vMKo9A7yX9G6tP53FrsVuXiJNqQ+2f2QY9j
	 n2YFunartvzsQ==
Date: Wed, 16 Oct 2024 12:33:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the regulator tree
Message-ID: <4bb56093-5358-4d3b-aba8-f8815d2347a6@sirena.org.uk>
References: <20241016135943.24e1fab0@canb.auug.org.au>
 <20241016075510.GL8348@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4pbWwzK1roPK/fv4"
Content-Disposition: inline
In-Reply-To: <20241016075510.GL8348@google.com>
X-Cookie: Snow Day -- stay home.


--4pbWwzK1roPK/fv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2024 at 08:55:10AM +0100, Lee Jones wrote:
> On Wed, 16 Oct 2024, Stephen Rothwell wrote:

> > The following commits are also in the mfd tree as different commits
> > (but the same patches):

> >   d7a5f27342a8 ("mfd: sec-core: add s2dos05 support")
> >   ef9690c04f3b ("dt-bindings: mfd: add samsung,s2dos05")

> And these ones do not follow the style expected by the subsystem.

> Mark can you please remove these without reverting and further dirtying
> MFD's history please?  One little rebase isn't going to hurt in the long
> run. :)

There's additional stuff on top of them now and I'm not clear that the
regulator patch would build without the MFD.  I don't understand why you
said to apply the patches after I'd reviewed the regulator patch,
usually you insist on waiting until all other subsystems have reviewed
before applying the MFD cores :(

--4pbWwzK1roPK/fv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcPpJIACgkQJNaLcl1U
h9BjEAgAg00TLK85W088ESGSXAQwk+RAG/RGXaGLfYeNESBwkXhqMTzUleLM5YxK
4nCKSmui4gQl1GDrXplqdnJeyj46WyMMLc7EkBFs1fXzPsidMLrCfpLvLtNiu+7N
2rAQsxpxSaYVWc2yfmZcPD9MX7v+diFErHf/lAzeh5eEOCH2bSSAJsymqVT0m/RN
b8aa0yxAstjbBtPz3xZSnke4MwM70eDa/epQAC/L8ITuC4OOK/FZiisJ5JAHbyay
k0aMMSmNjeiI/GVbp7rafA5TCWYJZmSPqnPRK2tK4E60qfQ2Y8wZyd5NJma7waQT
w0i46HheZFf0ebWPBiEvWqm6onN8ow==
=Nn6J
-----END PGP SIGNATURE-----

--4pbWwzK1roPK/fv4--

