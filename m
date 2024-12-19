Return-Path: <linux-next+bounces-5002-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FC9F7A1A
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 12:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169B218917D7
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 11:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FFD223334;
	Thu, 19 Dec 2024 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUGMlcDh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B5223328;
	Thu, 19 Dec 2024 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606823; cv=none; b=shXWtpYfIv8bBBIJRhUX64QWz01P3+AEUx2+SzvNsti0Pm/FEo8rfzQZ6a7um91q27aXseUYsJBHrUyODbi0G9ViLG0aFcgCoidWqXoYvFg2Ft0pqGFQQtZb9PAGwEtNlfVvKYd25s4//Vsr8PcNbzl83gEO+GqKU34k4J0uwsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606823; c=relaxed/simple;
	bh=VXbsAi+uPVUKtyfzc2s1ejpendAmM7AtVnH0yCmPDgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkSANK16JpKTSm4a/J0w00bXzHb6kpXHTvBLgyw2tE5d4awHFKMqBQDC9/R6zvbolimc5IOau0NMeoqu+/2k9BvAX66K9XbHGLX6O1Zw9fKLC+eEiDHp4xG0vro65iq3b8xGVfE4WLWOZNekbGJVvbgOkSGOOQPa/XqSVIxqFfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUGMlcDh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4C3C4CED0;
	Thu, 19 Dec 2024 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734606822;
	bh=VXbsAi+uPVUKtyfzc2s1ejpendAmM7AtVnH0yCmPDgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUGMlcDhqEX/eG5FGyXDNjvPTIePbgOXoYaVsPFwvT85cONzh4Ci6KYiAAYBhQVXq
	 uSbYWNsfjXMe8NzwQVT2A+TBiZ6kqrGeL8NXid4F9QbMe3eXEE4fqkwtpFvFWKwVpv
	 7TpEG0lDdXvn5KQvYzURhQnhXCJDVXQBPyouBUpD0Kstm5ynIJltYAtiYodO3pVp5m
	 1FDMzN/v3QGFQS9H925FM+Zi1p8YG1iSmU+ZJY7rcGABn4DDXyOfKauUjmFwQw9QgR
	 5fzE6RsMsXfvAFcYDwjOaTEjDg2A1oN8EiYgCL26fSUAbTAxAum58bpDZretEUhD/j
	 puve1vxXi8M5Q==
Date: Thu, 19 Dec 2024 11:13:38 +0000
From: Mark Brown <broonie@kernel.org>
To: "S.J. Wang" <shengjiu.wang@nxp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <dcabf2f3-f764-41ae-9dfe-2a6261e542f3@sirena.org.uk>
References: <20241216130934.0d1ef471@canb.auug.org.au>
 <20241219173334.25970764@canb.auug.org.au>
 <AM0PR04MB7044110ACEF4D67F3C37AD4CE3062@AM0PR04MB7044.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9FQAnM0PR4+TpRTo"
Content-Disposition: inline
In-Reply-To: <AM0PR04MB7044110ACEF4D67F3C37AD4CE3062@AM0PR04MB7044.eurprd04.prod.outlook.com>
X-Cookie: You have taken yourself too seriously.


--9FQAnM0PR4+TpRTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 19, 2024 at 06:42:57AM +0000, S.J. Wang wrote:

> The fix has been sent.  Not sure if maintainer is taking vacation and if need some time to
> be applied.

Yes, Takashi is on holiday.

--9FQAnM0PR4+TpRTo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdj/+EACgkQJNaLcl1U
h9Bi+Af/YCVQkMFBNdA5yJ5uptJsCbsFyj/urN605+CsLzwqP4E0oYUVEJsbmUmC
/AiUBZ+kZUoaX4Fy021T2uatFcKaymOvZhGbS6l+G9pIHP1Dm/jhYQw/GYWds+na
oFEs3TOhG+wSH/oRacQMwbNKiAk7q0PO91mQlffKj9luA0bB+eLgQSD7l3yZeH6v
TeousvFh/DlM8E0vSQcUTjy0aqgLoS/x7ZeFs3Bkbxi2Bs/lLJSr1o0lKP978laO
NMJJc9h4XT1GaGYMfGazYdG/9YOkxImA4mOZTLSvgdJuvZ8usGwb5T1qGgmAIjwv
gTGezeDY9MXnuTAXriA7OETFOvXt3g==
=m/uN
-----END PGP SIGNATURE-----

--9FQAnM0PR4+TpRTo--

