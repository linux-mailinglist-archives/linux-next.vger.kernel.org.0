Return-Path: <linux-next+bounces-2964-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC5692F5DE
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 09:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 436F21F25BC9
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 07:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9892213D510;
	Fri, 12 Jul 2024 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OS3ctP59"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A35381AD
	for <linux-next@vger.kernel.org>; Fri, 12 Jul 2024 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720767749; cv=none; b=kG3VfLkwSYA0pfmp+wfwHdTxTmzZdoZRMfCkqGVD1YVAx8JP9uJ3WWwuAvKOpSACM4iJybLwMIUoNNe+XkvyykD8OXgJD69C4ODKBi+E2zc1IbTfVJk880eO+MtmqliqVJurpCfE+80xKg3HfWZYKgt9fT7hnmkyu3L/TVZ8bgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720767749; c=relaxed/simple;
	bh=p77ibPwpyIMTmhZbJlwlqhdF37Ko/rEYdXmXnHYHdx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIDX1NwybDbALruSOzISu8zamnutWr8uQB22bczevzhA7RlnUHOC3oiS5dLVt/eZITogq1yVInMaF8WRT/GoyxedppFzakuoew7VwrxA0Fy2zBfGEnU7krxRlC4Tgs+nJSDk2I5fE7eU7yGg3RK2K93EnvCDJeO2vCdi8uOeS2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OS3ctP59; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=p77i
	bPwpyIMTmhZbJlwlqhdF37Ko/rEYdXmXnHYHdx0=; b=OS3ctP59cjdol/g9eDix
	OVpHJ6Yv0vRWv28cvxz6nyCj4Ie2B3UNP21pMWnQF+NVg2+CugZ3MCA50d21cHns
	K+l5hL0jJWP+NSlGdblc2eJzgHpDB4aUgG9giQveicneX5jomzRbNMn6OwpVnfFx
	cd+m6lOqP3+3jNle/R0fWO9wiQOUJuqryy2RezL1r1mVyY0FYsJvKu1hWhjCJrsD
	VNQtIaHD5MT4nY2bZh6CPzXroyCY0PwwU7WYO0NgZh87G7NPjeZDYpTYtV5yXMQw
	9N2KhSDu3035SY7U8v4RSpvGpGnrm0Tjzkr9ij2L7FNKK0C1xn8DUNDG7/zL/S+N
	BQ==
Received: (qmail 1063451 invoked from network); 12 Jul 2024 09:02:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 09:02:25 +0200
X-UD-Smtp-Session: l3s3148p1@E8AwdgcdOsAgAwDPXwmZAIsFIv4n+Dpm
Date: Fri, 12 Jul 2024 09:02:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the i2c-host tree
Message-ID: <ZpDVAG2p_v5DsZgY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240712165527.75e4ddc9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HnOP2kN/Va0gg94H"
Content-Disposition: inline
In-Reply-To: <20240712165527.75e4ddc9@canb.auug.org.au>


--HnOP2kN/Va0gg94H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> include/linux/i2c.h:583: warning: Function parameter or struct member 'xfer' not described in 'i2c_algorithm'
> include/linux/i2c.h:583: warning: Function parameter or struct member 'xfer_atomic' not described in 'i2c_algorithm'
> include/linux/i2c.h:583: warning: Function parameter or struct member 'reg_target' not described in 'i2c_algorithm'
> include/linux/i2c.h:583: warning: Function parameter or struct member 'unreg_target' not described in 'i2c_algorithm'

Ouch, yes. I will fix this! Thanks. Seems like regular buildbot builds
do not build docs when they were changed?


--HnOP2kN/Va0gg94H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaQ1QAACgkQFA3kzBSg
KbaJMA/+LwN95UFuDwKlOp9xiKIJ+Z30pKsUJAh87qfQ9t8kq9KMMZBnKZwTerr/
pyNVl40Qvd+B/Ni9n5pd99KuqMNOtN0hUrtDu6oMEusd1qdzAwWiiyBuXwepwru9
gUK/bETcVsOGjk8/3WneM6pyW8w/XxmjRmtyFnh9gtp1xj2aM+QsLILTVLBZmZiU
cwGH9/1wXbOZ0bUVZ4yWxrZqPn1OGzJNjGo7CakCSrJdrxdnDnD3z1rin93Hab7L
g/RtlHdCqY32glXmcxz5kcOa4LUP1lfp3bRWdHeSxeh7GkpAzggBcI3nnpbzX1iQ
iEVAdO6Q7nBY/rbHMUYpADF9taVaFYf0IWAlBVKF5NrbbuaWdxxFvYeSI3Wt+/gY
WA6XOBbMpTTkdFV9pIcvopbAN+SvxxPNgAnko7aFC1/AxLOzQ48XZWJtjS71tQZy
WJh50++lwSREhkRu703iW/9vMdCZu1EPWs8IHdaS+qqVOPkOaRAen9uQ+2i+Pgts
Sh6R/K05e8PW9L/sH57XCvpvuN9KmRKzcg13TVaRDrTLmVKQm3itkNoaMuyN8bGV
2b7ihzSP6/cr/Rp4pz3GgEf5ADRBtDpXJhLUsgf1xf0Ek8x+7H4w3A+0l9qvx0RT
IoU8mJrKEOKDIH6hLwLs/sgEVGfeqb6eVD8bIr8gj2rPAYwhLKk=
=VMDB
-----END PGP SIGNATURE-----

--HnOP2kN/Va0gg94H--

