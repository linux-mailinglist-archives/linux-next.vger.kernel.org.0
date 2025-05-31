Return-Path: <linux-next+bounces-7002-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFBEAC9AC4
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 14:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49C503BFFDE
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 12:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0907239E9F;
	Sat, 31 May 2025 12:05:16 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECFF7260A;
	Sat, 31 May 2025 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748693116; cv=none; b=MSsuPzyLd+DLWVPyjwAn6dpp0qz0MNyO2UJ1SGYnHyPVMazYe0Q4jf4QQcaT4KbM4GTl8bXaQWVOzfrQOecXGBVN37gzTmiiXG1NURtbYQxzTsqQDJQuEHogKWaALE9PaKwiT+C7dFeAJ6QV41QVk/Vw6p08ezDqfho1rSlDsDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748693116; c=relaxed/simple;
	bh=sp0NAPl4tOGpghuTGmrIS1hVWJ1MkV58/R+uN30n1As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKIrq2MG+xx2OqnH6zQfSudD4WLvd0YGhNE3edt81h4cse5zYLFUwiw14zYPMzCwQGN97+gHZ538cpGUGYs6z8lAEioAAh0YazM3Ul3Aq/fwQPxLlE0a50ZI0AIKHIP7uPCdL0H/tK5mHLXP3jm8t5d7G1mu2cvExtRryn4QWiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (ip-109-40-241-5.web.vodafone.de [109.40.241.5])
	by pokefinder.org (Postfix) with UTF8SMTPSA id A2566A426EA;
	Sat, 31 May 2025 14:05:04 +0200 (CEST)
Date: Sat, 31 May 2025 14:05:03 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the i2c tree
Message-ID: <aDrwb1YvwFKQB8x1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250428104905.2b54643f@canb.auug.org.au>
 <20250428113052.38cf10da@canb.auug.org.au>
 <20250529124929.5217c6d9@canb.auug.org.au>
 <3352024.aeNJFYEL58@fw-rgant>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q4AK4MLirR2Yt7dW"
Content-Disposition: inline
In-Reply-To: <3352024.aeNJFYEL58@fw-rgant>


--q4AK4MLirR2Yt7dW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Below is the resolution I came up with.

Linus solved it differently [1]. I think he is right, but those
interested please double check.

[1] https://lore.kernel.org/all/CAHk-=wiKW=BPcDvBAsVDemdWBR0uh09A_WMOCoceqj3w3doGJg@mail.gmail.com/


--q4AK4MLirR2Yt7dW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg68G8ACgkQFA3kzBSg
KbYY7w//RO5HdBP/QG6c7Y4jqcd1B1qyf0c3ysfo87auEWurE1B/lUzDZPsO+kkF
EyV8RljR9G/7D5cSkTSzRD2orm2mvnN748rsHiul3loxDyDCk+WDUUMNWdGhIok2
UGyXPIuw47JUAA1eyiYtcYtuIuQr+zMOVy4IgJkUZXQXGkaK/15ozTZ5WZ91rBo2
YQHEKJO6a0hJgPdN+3f6vwXm4T+T2N7PLYVBH6vf3gf25rseNr40SYYbwwWJaVVs
k3vXO/5Cj12zefqOyXAv1zFUKt7mJIBILB5M5pGWzdinWLhoEWfnxaf1fLSEjjhx
cBVNrCvSquaS3/V5jpaNN27E+3zVWSBnEANOn2/X6+wdMkpa8+QnsE0t3ANlF2LF
/HDffmy7QW/wVZuJZ6LPyomRBm2//HQKfVg/T6gDzcmq092Np/BotkIPgS+P/INd
jwZz/yHTIHuJ/OWQAhzeGmH5iIaDJxf3VlvKUkDxaSkm676ODOEEu6cpERRfXjFj
Mv+Vd1OHMFTFGPF2einWr7M1n4HcDSrOSPadL1TIvUSEAcXPrpuq+58WicWzf45N
n0vNr3y+3pozUgRG0Ij4vkA3xPBw+bv8e/C8cWruNrCpKIuM2Qx/kxQWDfycjJVT
6GykzT82aWStTP05uKZ4zpzB2jJODe2OKwEjd81XPZSn1ZLcnpY=
=15f7
-----END PGP SIGNATURE-----

--q4AK4MLirR2Yt7dW--

