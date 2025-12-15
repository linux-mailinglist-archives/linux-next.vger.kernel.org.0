Return-Path: <linux-next+bounces-9403-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2279CBF5D4
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 19:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF53C3021690
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 18:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589C6339B5E;
	Mon, 15 Dec 2025 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJl6+rTK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309C7339B51;
	Mon, 15 Dec 2025 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765822197; cv=none; b=Gxhs/GYAHGExKVzysHPiGCn0jogqCpVWPis/7I5mDoeHkvHy4zyj5T/9/Fcc75MGYpc0pV31ARd1LPsQORFWXqYRi4DSNXmk0fl6zdEYvluNiaWrIO1/Tfksvdzzm4x5yHUJImryeK+jOtv+3byGifeJidtSCY1oB3MtRumzlTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765822197; c=relaxed/simple;
	bh=zWOcwmGSpBrPXazH8nH15x/i+MYtvKgdlSQAp9J3FoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJw1dqRdb6u3KXjhFg8ciLyM6T1/Ez+9Ig5IDcJwOlC0LadQDIG0ex+Fz4dP8q5bTG8DE67068M2yGdBK3tWXiuq/DAJqjOfJO6QyBQTmak5Ri7ddcALie6pr129IffyU6ZIFLzWYEBFRh0p1DFl24Q4dHOe2SqAZyeqA5aRkFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJl6+rTK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D83C4CEF5;
	Mon, 15 Dec 2025 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765822196;
	bh=zWOcwmGSpBrPXazH8nH15x/i+MYtvKgdlSQAp9J3FoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJl6+rTKH4xsWoEXZgmlxIcY2z3WvZ956Aj6FQKBo9nkCYYmZhCtSkwCKJXwJPygS
	 1FOSLbQdc3qItZM9K7slu7UHZjBzzmZN1js/I7SlmAiCLFrnHPD9jcBboU8Jo+nsJo
	 eHEm4ZBSbxPI0e/x5ONoaY1aekpviUL5mBKa0r2hrM/ncC9p8ehYwtNTrddAnZhNZe
	 WZYIh8LOBN1nixrcqkVdSb0hxWdIy8q+cgpfnZDUDEnqGZa0Iybq+6qpPcbGoEIVZ4
	 hlfnPKr6pAfWGaucYu/tfCcH3Btj0XxbnH2sED8RcHfo38Ef9GaK+mBvKBvyzYB0aJ
	 9hWgkicpHqaLg==
Date: Mon, 15 Dec 2025 19:09:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thorsten Scherer <t.scherer@eckelmann.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: linux-next: trees being removed
Message-ID: <cl2urhxfwrfi4fhkntz33bpwdecjnxf3c53ngybllcqws4zydb@vrj57ee3itct>
References: <20251215184126.39dae2c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdtxp3tm5dcix3z4"
Content-Disposition: inline
In-Reply-To: <20251215184126.39dae2c7@canb.auug.org.au>


--sdtxp3tm5dcix3z4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: linux-next: trees being removed
MIME-Version: 1.0

Hello Stephen,

[trimmed Cc and added Thorsten and the Pengutronix Kernel Team]

On Mon, Dec 15, 2025 at 06:41:26PM +1100, Stephen Rothwell wrote:
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.
> [...]
> siox			2024-03-08 22:01:10 +0100
>   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#siox/for-next

this is fine. The last patches to drivers/siox went in through Greg and
I'm not involved in siox development any more. (Otherwise I would have
opposed 53d2bf583c6b6326d751d0f0dceba76109dfb0f9 :-)

Best regards
Uwe

--sdtxp3tm5dcix3z4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlATu8ACgkQj4D7WH0S
/k51/gf9HyvEuY6/vMAy+kfp0BA0TystPjFrwhox943Z80DwPmio+uLKBtJdEPBW
/hMWMFxJvU4VabUt3t+pu1mPnZFlN4J/Ju+dWpFs8/ncSBPcnQ3HORiNebxMW4dl
SrGEa4uUE5y0mh6eeSQs9+CJaINH4t2mbtjn+jSUXKoq2i25smms+wqaGF7/nNGF
MWgiqvnkmTgGOWwaT4MLViuCOBMcxaSDHjzN39ww4l3lw8K4DThEWL6ob1927xO8
pYh6Smo7YjTRdf4NuiCK/Bqdw+y8HpW5d+/qMfmqGGzkNDXTnZRb3iI1jfVyqu1n
fVzA43V6/UAEpn6UuiEXtpWHodcM3w==
=+GT0
-----END PGP SIGNATURE-----

--sdtxp3tm5dcix3z4--

