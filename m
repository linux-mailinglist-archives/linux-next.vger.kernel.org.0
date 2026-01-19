Return-Path: <linux-next+bounces-9714-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D75EBD3B546
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9306A30010DF
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAF032D7FB;
	Mon, 19 Jan 2026 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbwCjtpS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B84C329376;
	Mon, 19 Jan 2026 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846429; cv=none; b=OCNjX5RRI+0Rwku95vjExzksYceaqzfQZv4Q9o4HuadpPpqeRw8B42UiJsAxmukBuRQ+FiO4tQJpd9cTg7ArDbu7VymT16Qu0uXT3xrvgbpkvijoM+OdnvR57wZAuM3Cr0eqUii61PzOcjWkRPj4jamRoveYFFpgRMRZ3nIbI8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846429; c=relaxed/simple;
	bh=DPjqcAB7aD16V2wcnpHyR804aSgUWPXOlEifFvCK7m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Db6l7qJJrGpABWpXAcUOpbu7tCQPVzspwZiVm9iBqHMCPgv0JH0CpBkG5Bus1T3lW/8HSFf48Oay7wYhWyLb+ONHfyDUcp71PzHLCIyXMx4e+ZBlcwRPJbEy0TRPe3wt4DEBVUyh5JjB5WdKDZC/W4WbKN1p7VRqKX8YR1wA/0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbwCjtpS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2234FC116C6;
	Mon, 19 Jan 2026 18:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768846429;
	bh=DPjqcAB7aD16V2wcnpHyR804aSgUWPXOlEifFvCK7m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MbwCjtpSJpJ+cwFfP8/JRA/trE0uCsO2J/IBYT5/wx+erQH7ytlYaJCZ4ls8nDO4z
	 e+mdxsbcqYxlcn1mfwHGz+orByBFDKokxxWvcte8rRvCl8G4yT74hVrR1BcPaUyIbP
	 A673SyaEjJMcNAlcVmdvW8Hz14Mbfhh6wADjyho/b5bLI+NIW0coruS4iFLHHrw3pK
	 NEs5m6hGlIncP8NvInnFIg9rjEzowlD8fIZwHh1Jo15fM4IvAQaHzuNgzF7b25LYMJ
	 ZCpBWgwp4mw5RED5isBBz7htFIlRT/3SVAKUiluBJyCpbAU98nUwocm69O1kxLtaDF
	 kySy6hUA9qzow==
Date: Mon, 19 Jan 2026 18:13:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Tamir Duberstein <tamird@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1lhmSA1PfL40k6Lq"
Content-Disposition: inline
In-Reply-To: <aW5xqLq7gatOy1DV@sirena.org.uk>
X-Cookie: Does not include installation.


--1lhmSA1PfL40k6Lq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 06:02:20PM +0000, Mark Brown wrote:

> Caused by commit

>   4cef2fcda3ada (rnull: replace `kernel::c_str!` with C-Strings)

> I have used the version from 20260116 instead.

Actually that's been there for a while so I'll just revert the commit
instead.

--1lhmSA1PfL40k6Lq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmludFgACgkQJNaLcl1U
h9DI2wf/bMxge9hADL7LBI13hyV7Ucsmco5BaGEVybZkcskCL5+xgB4JFmL61uMN
BFNVkF9teY+aDzozM7qiIsEcDnrVpy+BQ/Nm3sx9dCpy/xs5hmtxjekQrE9KztoD
z+umVZZtFq00EdTKHt+F8W/IzLmrAkmz5AnilTJVg3eo17i9dOhUF/TFnKgpX/jH
FggXOPBnYJ/RNcEFB0g+W5SvN3UFZokv25Ya8tKDQreAhlsLxa74raY/uXDaOLfY
4N9gcfuHwVeYhyza55+yW0kgynLF8Rf7QU0jnG2cs75P7AnXIC/7vr8Ie/DhdAuL
uzf1xtJoEUy4vR7ASir/heJJXItaug==
=0RHI
-----END PGP SIGNATURE-----

--1lhmSA1PfL40k6Lq--

