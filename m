Return-Path: <linux-next+bounces-8503-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D743BA3BFC
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 15:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC2E0382C57
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C602DCF57;
	Fri, 26 Sep 2025 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CU4d8sAM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D42750F3;
	Fri, 26 Sep 2025 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891809; cv=none; b=XyRT2B9cuX4NzzK/X5Qav8SV4iU+d4F3689FMVbM382fim0AZRdhVUOJCjJf8S5935EHG0MxekvQtxCgTVMjTWZY3HdMpS89vDjt64JDZEVQM91qmWpex5+uOwlZgx8dhcIRAk9AAmlyOdG9gP+pYK6gSDBnAraciCXpMoqXtR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891809; c=relaxed/simple;
	bh=EcC1TqJdAPf4+0zm1K1JWRSiIjRzN1jQRUVqHufx5l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLfx1v8aoZZsNI+1r0nOUzk+B/yr9JaP90yN262VLHpwsmiAbihS5/CyCuOa7VNm9x66XAcRK9GNy893vdkJLszUFqLxnWb8dKRfXAllJ1Fwnpbiu8sz71viToAH3JsBNmNghLqYLxNLdU+0sQDCUKMGArE+8j7WDtgjr1ptbeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CU4d8sAM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C5AC4CEF4;
	Fri, 26 Sep 2025 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758891809;
	bh=EcC1TqJdAPf4+0zm1K1JWRSiIjRzN1jQRUVqHufx5l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CU4d8sAMV4F7OuOQdjCs4tYDXVfrM1/4/2yL9lzh6OMOmrQl6hj8vqdJ9TuhXE2Wo
	 T6G3a2X5xUWsDbwFJJxFFKZfoaaXCUY86gHRW5z0vqYsAHOz6MnpIa1TuHwvD4I8KF
	 //FAkMizYeQ3mqSUgz0dyBKGi69ovNvePPeJc6OwdyqOkkcDkvOUSYVbflCgLZXK8o
	 W4Qa70SGRFPsRxngUy6VBitMAMRZ00H1Vv3D69VEWMoBD0dQGFEMqmpvaP3Daws+6r
	 PiiHJQbhKwdpIBmHHbTR/TgMpPSreZgP+vTP1219jLc3BcSrloxT4nh03x0vNBj7I3
	 4FsiM1VyoZAwA==
Date: Fri, 26 Sep 2025 14:03:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <8c54836a-5cda-4734-b933-31c8b16f3fff@sirena.org.uk>
References: <aMqxWGx0asGTWZ2V@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uTqezygsQVLLGKIS"
Content-Disposition: inline
In-Reply-To: <aMqxWGx0asGTWZ2V@sirena.org.uk>
X-Cookie: Your canceled check is your receipt.


--uTqezygsQVLLGKIS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 02:02:16PM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
> gpio-stmpe.c:(.text+0x213ed29): undefined reference to `stmpe_reg_read'

This is still present in today's -next.

--uTqezygsQVLLGKIS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWjxsACgkQJNaLcl1U
h9Ae0wf+IPzEULqrPp7wI1vAYM5NJaXsbyj6roVp6eJKRzrMJDq+8y4tGJnecxxK
+aHQ7RnIvcmNXlTYkUB6H1zZcpgxTiInPBlr45QnncDb6c5ornZZNXQdkny6ACaK
Ku2zVeMumu6m0h8FHmdaCh1WLu0Iu/uZ93rRXwcbivfXqVrCGdcJ3RYIBZPl5Xxp
R4N/cBRuInPJ/AzNawhqqbj54vpWZVw+kTRA1AjeaIyeryYnvrGSQfpPjk+Za5zb
IfMBO22DQ07QDQoJRfjFnoz3McnztRDJ0Ftk5M85HQ/0QHqMumrx4Q5ggA9Sz8Jy
KWhF0vnZkraXP2t3TYbrgHY/D1mF0Q==
=RBEE
-----END PGP SIGNATURE-----

--uTqezygsQVLLGKIS--

