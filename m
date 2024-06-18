Return-Path: <linux-next+bounces-2591-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45990DAD6
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 19:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94DD7281CD1
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 17:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA72A13FD72;
	Tue, 18 Jun 2024 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCPcAH+n"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE88413F003;
	Tue, 18 Jun 2024 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718732575; cv=none; b=nidb8q3fVe6vKwb45bxi6opwSsYwkb/BgVombTGea8ZMIMVf3UWEziiT+tv3Zkw1LORugmIR6aFK4NfcdefKgKj9B8vraXNIpnfg2qk0aI0JYUkB/HdsDD/CNzN7bPBs2QnQrNPAp8H4QA51/OhO4mi4gvd+wy1OLUMU+hNq860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718732575; c=relaxed/simple;
	bh=pwQMbzhT26v1TF6URh03vj8DPFrg8YyUIdbkxDw6c9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwJoFQtyDggaDV98CnE7OuCVbSo4TY77lKkKc9A2tf5d1VXipUyhHdxZfUzHekkgWvMB5S4EdfKJFsBZvucUTVT9HQ4jy+Z3RfbzxoWFSPJm75f7+UmcbiZUKO7X0rLDoq65dwNlxcP/eGznAEmhSFERE+1txS7Kg3y6B8Lqkmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCPcAH+n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DDBC3277B;
	Tue, 18 Jun 2024 17:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718732575;
	bh=pwQMbzhT26v1TF6URh03vj8DPFrg8YyUIdbkxDw6c9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCPcAH+n1V/T8nOes7pnnL4JCDLjHyCvE4fSrmnmrvPNztFDThz7s3WnepsakDD7q
	 gA2f4SHXchqoCJOLX+9RORBlbzTOblRmC/sWPl2loAwAamoHiB8Af/uo6QCQrQ7Xuf
	 k/jMjXFRT7s/y/zLTH1pkyssLGbWME/KDcoiIeZFUO8MhytSU2BKKfh0WbyZOMQUlL
	 M+xtkZtrkHpzu57GRksA8pC2ORtRQNQhJV5/H+3X2DKrad22CZRMdfTCtwdAlakpaw
	 8jYM6d4mky0YOLLphuZQ4YFiJ6y4RnxWYBEczPzrv591QAalr0TjwTMbEnx4vEhI8/
	 4eiVMD5jixI3w==
Date: Tue, 18 Jun 2024 18:42:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Julien Panis <jpanis@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>
Subject: Re: linux-next: build failure after merge of the mediatek tree
Message-ID: <c5b5e30b-9f9c-44af-9598-3f878ba01d23@sirena.org.uk>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
 <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
 <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
 <be5a8b12-b042-48cc-9508-759a2a285a8b@kernel.org>
 <99b7f55f-2909-450f-88ce-8cbe8f41c7f8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ehAi141rs/yKQH6q"
Content-Disposition: inline
In-Reply-To: <99b7f55f-2909-450f-88ce-8cbe8f41c7f8@baylibre.com>
X-Cookie: If you can read this, you're too close.


--ehAi141rs/yKQH6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 06:45:17PM +0200, Julien Panis wrote:

> Just for my information: Should we just wait for another maintainer
> to pick the 2 missing patches ? Who is in charge of doing it ?

In general this is something the relevant maintainers should coordinate
between themselves.  Generally things tend to work better if everything
goes through the same tree so you don't get bisection issues.

--ehAi141rs/yKQH6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxxxoACgkQJNaLcl1U
h9BzmQf9GZwzdzVOBLRA9g+SCfWx2s0wB8h0W94qlg7LkM0/XE7pql88yMpBsndx
3vhp/Zn0w4NNCRHX3TR1+rybFl2G/7FJ3lCAmjWap1dLJhw7dVeFxCa1BXltbcky
I1C8+uwDZA31F6nIP+ZD7Dgag+Ld8r0V86rwkpLI03FMVDjjiIbAYDaKxMov3m4g
oJDqi/HtqIUtzVfWq1GmvkwqIevTmVRAM7nZcqIkgCZ/epe27NYqkNjV/bKAwlg3
9O1htZT4GRqgYYL6xjxi47PaSERrrKeKPILwh+ur/p5IcSrLt6tFlj3zvWUTqm37
NDLS923wLoslKbTMk3C93KcAh36hOA==
=A1jE
-----END PGP SIGNATURE-----

--ehAi141rs/yKQH6q--

