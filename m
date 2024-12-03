Return-Path: <linux-next+bounces-4870-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15B9E2CB0
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 21:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAB3628A59E
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 20:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76B2209F49;
	Tue,  3 Dec 2024 20:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qloih+gC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3CC209F46;
	Tue,  3 Dec 2024 20:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733256149; cv=none; b=sioqyX2wSWpTfWhLP7pIyWvPsFx1ymvrjPN0QvXBH7AtGibwHDcRP/oS/tYXoIQdwL3sm6BT9UyPRv51XmeSQ3FP0G5Vhcbm9hUhTXoiazg9y8Yw8cY7N1ZzLJDjI9KMekvG7G4RCWoi435lsQOOzr/nwst/yuLaEJQipvVDAnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733256149; c=relaxed/simple;
	bh=YgO+22E9CP1aoJ8xQyShLmWzJS1FxWDyHERFzMsZ6TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCYUl8pAf/eP0+Vx7ZrnJ+IAJXDR131FIWfAjtST41wknbLLthAs90aeHl6sC/HGMm4Jz2TS7qf4ph3A3Rj1qd40PVTbVjfn/zp2mBi7/+U8e5Cgi73CoO0fjLE3geZd8267JTy7O0PvvWWT6AkHSVBC5w3X2LuJ7opqWNXee4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qloih+gC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CE0C4CECF;
	Tue,  3 Dec 2024 20:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733256149;
	bh=YgO+22E9CP1aoJ8xQyShLmWzJS1FxWDyHERFzMsZ6TQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qloih+gC69E9I09sLS7Zww5CUtFyohiFZfGU0qpUsTatiBzwDEGnSUWiYUHE6weJW
	 VOSva0dbERQdn5xJ+GFEe5QcLZNXHH5FEc4+JJvQe+vR+ydvClB9388gUmGN+VMsaY
	 mc/4HegJE4xLCG6OB/8wl3/OONV7fISKalkHhqHY20uzhNfaJ+HDx0I7FMgwVvX44A
	 1nBP7MYrpriGEZ/wrUzWQj40SrJ1xuOLmsBAVBxL7hkXKPWBrhA3VuSCQQQAWj/t9I
	 F6Rw5ZlGf1xOipQnwCPq2fzaCo36Br2J+HL7Xj3DTM3Tbu1yOEGnmdVR0+E7M/Oa61
	 Z3rrDDBd3AqGw==
Date: Tue, 3 Dec 2024 20:02:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
Message-ID: <da18d79a-542d-49b4-a0d2-da7b483af158@sirena.org.uk>
References: <Z09c_U2l8SqLQG-n@sirena.org.uk>
 <cba440fc-88c6-444c-af57-046ebedd60c2@sirena.org.uk>
 <d57e049a-9d1b-4229-84ba-0933cc0315d4@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SjqtM/eYBztvk2cQ"
Content-Disposition: inline
In-Reply-To: <d57e049a-9d1b-4229-84ba-0933cc0315d4@roeck-us.net>
X-Cookie: Alimony is the high cost of leaving.


--SjqtM/eYBztvk2cQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 11:53:58AM -0800, Guenter Roeck wrote:
> On 12/3/24 11:40, Mark Brown wrote:
> > On Tue, Dec 03, 2024 at 07:33:22PM +0000, Mark Brown wrote:
> > > Hi all,
> > >=20
> > > After merging the hwmon-staging tree, today's linux-next build
> > > (x86 allmodconfig) failed like this:
> >=20
> > Sorry, this was the i2c-host tree rather than the hwmon-staging tree.
> >=20
>=20
> I think it is (or should be) the hwmon-next tree.

It is the hwmon-staging tree (which is the hwmon-next branch in
linux-staging.git) - came here to say that, I'd forgotten how to drive
the scripts and got confused about the I2C tree sorry for the noise
there.

--SjqtM/eYBztvk2cQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPY9AACgkQJNaLcl1U
h9ClPgf/Tv0h6f/799XpSl+6KmdSMzRdA+YDIE+roPcarkj63TP7MijE3T7KgHMY
eQiQX6iFYvjQgK7deLFPP1hIUZGFkOUr+EYB5JTRiUQpSTXi8EXV1SZfcOVsLsKB
VEdvElvPFs+NcOdFyZaQNbAmAIklpnaZGTN0VLYVy1eqL2BFGZJh60xpzErVMP6u
Di3obsPai0BUCLsO0Kf7QcZfA0EX6XmIE8e+FiEHGycX5TWZ4Zi+jPLF74NMyNf5
dkrvPPp47d8ZBkdA82VpOuPg4FYAIE9lLBtxnY0y2yozUE8hluhPdP21e/q9K6cL
9fGt8ZgxLjAfa2XZJjDMBB0VHa3M3Q==
=615t
-----END PGP SIGNATURE-----

--SjqtM/eYBztvk2cQ--

