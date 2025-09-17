Return-Path: <linux-next+bounces-8365-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63726B81E7C
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 23:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F4F72A8299
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 21:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E91F302CB9;
	Wed, 17 Sep 2025 21:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iFCNvO50"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7B2F25E8
	for <linux-next@vger.kernel.org>; Wed, 17 Sep 2025 21:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143692; cv=none; b=LdX0zlN4xhDIYnBpgYcTXYjMZ8RNHa5C3uJZjXO1PHLsXjQ7Y/5Dkockw5KVfl19Yo+whTS7ojiIs+q58YE+JbNszecmox41ZxJ4FRarQB4Dkc1lDmjpqIH5kASUK3H0zkEq/FMUCJGxKbjxe2d7cBTIJIbM/GH/2JoIRSRyGXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143692; c=relaxed/simple;
	bh=RaoWOKKibBSIhwB6Z65REC0tLSVTkdLqW+U8o9V09GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhwC1MV0RRxKWS5LNDjGS+j9T1M0cRuxx3GT21qKm+QGH8Fsvv3KmokxVYLgmY+nc4whrdsmREazuq+8JI3o24OdcQ6B9kMF8MKq8WIcEnNB6LIBREmXWqFY7bzCX00KlgvPrX+OeuKODjIAowdZ3R3FDD+YrUjSjuoy5EyRR3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iFCNvO50; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DeyO
	YVVOwSXryyIFNeXOryw2bfBU2D+56jiC7Iy2kog=; b=iFCNvO50Pk698z75Xqzb
	RQEgrXpls3brlFzGT/+q2qjf6Wad3ZQbAExpRAVauTYyidWvtnX1EEnU4TLoNCqc
	MpkJgUeR9fGF36gcL9G1RTbosNx7AdPI+4P8UznZw0OujgfaS9gb+4xDxxUOSTPA
	wvpWsCbiQIMj150VsaSbDKkyezo1HgXBh79NIxb0LvGNRy6/4YhfMMshJbtxrpPs
	OW1j7E+fRS5yW/KXvctTNRpTS8uXBTipxKEUge1BgN2bbLNNCOZwIA0Rinraw1Gc
	6dUKw7aoNZWLq8l3GW+2mbp7hv1VpxxJ5usHbKOPf/Ig+eYEqKSsQRb+DV/FKPG5
	ng==
Received: (qmail 3268779 invoked from network); 17 Sep 2025 23:14:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2025 23:14:45 +0200
X-UD-Smtp-Session: l3s3148p1@tDjXuQU/Yt4ujnvK
Date: Wed, 17 Sep 2025 23:14:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Reding <treding@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Akhil R <akhilrajeev@nvidia.com>,
	Kartik Rajput <kkartik@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the i2c tree with the arm-soc tree
Message-ID: <aMskxYrDxyzXPsBy@shikoro>
References: <aMhR9TJm5V5EqaoC@sirena.org.uk>
 <aMh_eKWqkuLODo2r@shikoro>
 <e70f4454-d0f5-4b3e-9751-730781f056f9@sirena.org.uk>
 <ofp27qiwsw7jj5ne3y7kp2lpycwg37bvhswidwe6jfazs2czzp@76gzsofmliyc>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7g2/ck/gjKfI7m2"
Content-Disposition: inline
In-Reply-To: <ofp27qiwsw7jj5ne3y7kp2lpycwg37bvhswidwe6jfazs2czzp@76gzsofmliyc>


--O7g2/ck/gjKfI7m2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thierry,

> Note also that I only applied the DT bindings patch from the v6 series
> because it was already acked by device tree maintainers and there have
> not been any objections to the DT bits, nor are they relevant to the
> driver changes still being reviewed.

May I suggest then to send the DT bindings patch seperately next time?
We can apply it earlier then, so you can continue your work. I prefer to
take binding patches via the I2C tree so I can chime in if necessary and
also to keep the merge conflicts low.

Happy hacking,

   Wolfram


--O7g2/ck/gjKfI7m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjLJMEACgkQFA3kzBSg
KbZpthAAgnSxLZP3isLW2SCv5iNDOaaNvNXliyrZm4yvMmiVR0NicKcz8BMdVAhV
ueGg6/8DeMlx6A+9IQSwPh59F66jN78XU9QUbzMCxKKb+bA0360j/ad8uD5fsaE3
qK845cokxDu7k0CjaViNTNmlzoPF0zve8I+APsFpF2qtp+GNefwibvl1boepmp7t
jQ+yE75v/KSH4v+bIBzvx60zBTJghIBELe1T89trtPWn+XY5/xUjCOu6aMH31sX8
Ts1fmlNIK4y98FhmmOEN4a50s3DqTZHQI7iTMV4pwIRauS0Fl9naSLNfJ+KLOgQQ
3sddwL06Bxb4S6kJy3oc+z3aDBUqKjXldGxhXdXTdjxe8/47UXGwVGjBJzex9LvA
egEYhzy83/UhcyE1WCm+kxsz9qMVclfB/mXx77iKvE8v5pWAbNhIbLpMCqgJCw6g
FdWL7j2covNgSSWDMnA4/Dxl8GDdtzUI1PGrWemzwQYuChMH+q5qYcfkuXWawJy6
rGTzzm3UgSloxSbkG6MdPAkl4uJyUIk869gp2H8M/rLNqpz4ItGXNNYDHIlmajkJ
gXYWZm5L2IouJGiuKH1DR7xNb72jSLbyF+a6UTQXb8/IwCsbBVvgR1P+2dO4QTuV
hzr+fnBDIlbWfX7eoGKmby6rbZZo2wPscA3h10eZ+Vz50dOClP8=
=5aB1
-----END PGP SIGNATURE-----

--O7g2/ck/gjKfI7m2--

