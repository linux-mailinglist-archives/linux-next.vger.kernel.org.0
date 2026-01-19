Return-Path: <linux-next+bounces-9709-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E18D3B46F
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 284F13013BE7
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 17:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282F42E7F32;
	Mon, 19 Jan 2026 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMSew4S3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312D2C15A2;
	Mon, 19 Jan 2026 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842163; cv=none; b=nQJ6V9XoIo36vqH2HM7VTRrD1hBOQxy00Slli6iuRtl7ddhElgA7Y0Z2Kjft5LPXyrp1Bc665f9Nm6UbO+uLsQNlaifPbExRd95yLXNLfL+XYaQV3xyU39Eb56zpzNEpz6BwsJuTKvOoBXeA5LrQNayI4iRfHOW/5X2sSKQtL/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842163; c=relaxed/simple;
	bh=mdZU1f+71IPODbaXGTn7f/7cptluf7k1TByE4YWL/44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nH6c/X1sllx5JA77xGjMl+ZPi8k/Tmb8cNbg+IWoM5gVdu69JJLM2NYt4hALHkuFy4F8nTfHXfOXXx1Eb6k+lJ1m+McDi54eaO9AtADt5O8s2amAMplZ/lOhuTd2+llhKxSp27THkYmBmK8ENsYTbeHCv7oSxo54tj/KojNOjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMSew4S3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2375EC116C6;
	Mon, 19 Jan 2026 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768842162;
	bh=mdZU1f+71IPODbaXGTn7f/7cptluf7k1TByE4YWL/44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMSew4S3yZLzfdaTPeAI9IqOBj3c5YOH3jysPXiioDQp+tEsa54TI6dg4wLYT4C8w
	 /6l12IK3uaKcosGfbRHs9cj5LaEt9PCkOpmYGJWAr+pavJ/4g56ogGWdKFrQMEWgUY
	 YIzAQAukcgGh5/uVY1XHggyF2MBfaeZ/ZLxyiZoi1YPoNjYpes7+RMtcXGzR7eQ9wC
	 dtKrtgs4Z2/CJZojSbygPXWpUHZEa1PH4W8VwwnVNJZzE7Y8YCXJBIR4Z9+wfx1ZPU
	 SPsLR3TWN7nOQJ4V1mcyuXhcmsSs+Dp0/Vl8kIhPz8sPLS5YFpNJZBtloX9rHPTJSo
	 r58hMGcnMZ1sg==
Date: Mon, 19 Jan 2026 17:02:38 +0000
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <6a8bd632-31ab-4458-8367-bbde59f8f1dd@sirena.org.uk>
References: <aW5XSAo88_LBPSYI@sirena.org.uk>
 <25abe5e2-463d-40b1-8f7a-09f845d042ef@linaro.org>
 <576e6cd1-7009-4823-83e2-bfc66fd786e1@sirena.org.uk>
 <f4c1f996-57b8-46a9-9014-10e818ad0832@linaro.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khHCeO2A5ZpkgOMp"
Content-Disposition: inline
In-Reply-To: <f4c1f996-57b8-46a9-9014-10e818ad0832@linaro.org>
X-Cookie: Does not include installation.


--khHCeO2A5ZpkgOMp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 04:55:31PM +0000, James Clark wrote:
> On 19/01/2026 4:43 pm, Mark Brown wrote:

> > No, all the -next builds are done incrementally so the working tree will
> > start with whatever the last commit that got built was.  This would also
> > break bisection cases...

> Oh I see, that's an out of source build path not actually in the repo.

Yeah, all the -next builds are out of tree builds (he says grumpily
looking at the kselftest coverage he just enabled :/) - the source tree
is kept clean.

> That is a problem then, will take a look. I'm not sure why those files are
> even copied out of the tree. It would make sense if they're generated, but
> those ones specifically are not.

> Seems like the build will need to be fixed to either handle deleted files or
> just not copy them in the first place.

Great, thanks.

--khHCeO2A5ZpkgOMp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluY60ACgkQJNaLcl1U
h9BYaQf+KxHBoDQNHlmh18vBzVTcWztU0h6WZS6whG5o4YwMZ0pQUd1rMZo/4Etu
QfLdH+VCFOv8T4IS6IypLFLsXm1L4RyqrQJwEcQvb9G2ZmzroVnTdvED7D5xo5ml
rP1+Z/xS4+FTR9KcywCRBvyS29t3r6dxuGuBJtGmKJaokmPAvwWV9OEqEGTgKfWr
g33onssa+HO4j5w62ybtzxr05kuMppHlfj2LCBjGgCZv8Wz6l0fWNMh4/UcoI4gq
iWJZUvU5KGQHnXL+Ga8f+FCimOVlmCa2DA0dYWoordH2pVfQipM//Xpizz07Ef8Y
o/Hk41JRBYD13dNMhFGVg6itj8sNpw==
=Kk+E
-----END PGP SIGNATURE-----

--khHCeO2A5ZpkgOMp--

