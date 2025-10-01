Return-Path: <linux-next+bounces-8529-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEBABB0034
	for <lists+linux-next@lfdr.de>; Wed, 01 Oct 2025 12:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B1827A51F4
	for <lists+linux-next@lfdr.de>; Wed,  1 Oct 2025 10:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C23D29B8C2;
	Wed,  1 Oct 2025 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xsc6m34g"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720AA26C3B6;
	Wed,  1 Oct 2025 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759314583; cv=none; b=YUTaRCIFIF2bZLEEBZkg1+fjJkUAP+6NI44bYhzrIJIREkW4Nq7pnt7jGGZFGlRMRi+2pE5ZmAuavngfxAcSdwD2UTCP8HDu+EQuA7zXRP43Q7uxcgn0NrGnX62/29otuzw6/9k/T7ltlmpL9aoIGsNbTRZbQHozaKjPihDSXGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759314583; c=relaxed/simple;
	bh=QaegR+NaVpDj/F5gZf1SJFYbd5bXMypqjBtx52lSKNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htpzDrjIJRA4saYc87rBkM185YCS6agxDL0iCHX6izPaQPQIUT+cPuGUlomAGYVtx5KUddHCIgVLvrc1Q+6HYRvgrnpu8azu06zmJpIgaxop57nf0T+06l+XrFp1n5p8lAzEP2CffjFQXls1dl1dKFd3KQW8Y2ePYgEN1lbedPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xsc6m34g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E35C116C6;
	Wed,  1 Oct 2025 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759314583;
	bh=QaegR+NaVpDj/F5gZf1SJFYbd5bXMypqjBtx52lSKNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xsc6m34gYzkfDyQaofMkbnhTI9ZkVDqgBfqeSgG6Rb0RYVx38BlP2beBabU592KrZ
	 kw5J+nr1OyiToajI2X3iZxtBkcYRfIOccymLf6c2ViM/DZlBsPv/98gHh0joXTAMHO
	 zOmwiOw18+fUc1brszXkLrHc6+QmTjScSHgTaOC6XVh0GB1qXXavLVhQHz+fu5zBEJ
	 D/z2q53m75o1fba1HT21wUBrrcVT6XsN8lfTfCcpGLmbxzzxvMNHoaBpf2/NdyL+rv
	 mcQJlZ0w1SKlNtZ7b8t8yQDKmbBw/h3gp4n16EA2oU7zQwcpXhXOit6LMVQqenToWS
	 IwUeR1oNTbTdQ==
Date: Wed, 1 Oct 2025 11:29:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <aN0CkwO7vxzpp30I@finisterre.sirena.org.uk>
References: <aMqxWGx0asGTWZ2V@sirena.org.uk>
 <20251001095108.GO8757@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="656n4ArRTZ6e+kCm"
Content-Disposition: inline
In-Reply-To: <20251001095108.GO8757@google.com>
X-Cookie: If in doubt, mumble.


--656n4ArRTZ6e+kCm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 01, 2025 at 10:51:08AM +0100, Lee Jones wrote:
> On Wed, 17 Sep 2025, Mark Brown wrote:

> > After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:

> > Caused by commit

> >    df6a44003953f ("mfd: stmpe: Allow building as module")

> > which needs commit

> >    03db20aaa3ba3 ("gpio: stmpe: Allow to compile as a module")

> > from the gpio tree.  I have used the version from yesterday instead.

> Isn't the later already in -next?

Your tree gets merged first so we get a build failure when your tree is
merged, it would get sorted out eventually when the gpio trees are added
but all the intermediate builds are broken.

--656n4ArRTZ6e+kCm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjdApIACgkQJNaLcl1U
h9CHhAf+P9oNBOPJH1BNFlLv8QOQIEJjXYwO6MfznYcAdd7NynIHhhE1bSB/sRoN
rnomFJoYpU1bNGr6d1qJcOLMfacbHCLKLeF5hHJXDT3DyvwV7uYV7ZGnJ8YGuKOE
lBe89toezxdeEyFQOAXhwVUTKukdxIkRYDaNJJgHVlbqjMXiEfMx85Y6wXYiRKUp
0FhsyIaeY4Tx41VvFr2OETRCx8ynuQnTwT0BBPflku38zKpZBwv0ho88BWt4v0Du
UxUQjlipU0TUQQxjPJBNO1x6wVtHTy016lC36burEIq0wznmZGMQ2kz8WqPmJR2f
nJABo7Yan4WR6FLc5alRRm2CB+Df1A==
=o7lu
-----END PGP SIGNATURE-----

--656n4ArRTZ6e+kCm--

