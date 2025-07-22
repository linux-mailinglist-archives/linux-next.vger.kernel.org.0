Return-Path: <linux-next+bounces-7694-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 677ADB0E69C
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 00:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E026618830E1
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 22:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17104288C96;
	Tue, 22 Jul 2025 22:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJRUwzeO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41F628467B;
	Tue, 22 Jul 2025 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753224245; cv=none; b=VdNECGa7vlRWRVetmSNItBT3GDZWZ46jRjZDIrDnEAd3nLFfujuB8jUc+lbZ+3KoX4CyY/5o8pzbhpH8L5kEd60OzUoejzpIXQrJw+kEt0S6m+qS1Uns11o7v/1/CrI/TvQfsmjw6LM3gqZXJ3/vSjU56ERzq2NBpp/YR35PS68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753224245; c=relaxed/simple;
	bh=fNgDb/eRxEv6gPVgAYt58XFg1H9GLBvy5A7KtZ/53aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KatANyaQ7xw0OVh9TimDJoVxHO6lal5JHfPh8D5v94bg6O27wunM7eBNF0RRM2eU4DM1csAra1vRSWsIT0B4CVLbp+V8XoAVERrdQ1zfnTxQx56yoNBd+oAPqTLQzqpSlfJb0KC9cUuMy9TxRImnE7VhagrqlSiNsi5ZZT0+iAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJRUwzeO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694D9C4CEEB;
	Tue, 22 Jul 2025 22:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753224244;
	bh=fNgDb/eRxEv6gPVgAYt58XFg1H9GLBvy5A7KtZ/53aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJRUwzeOfFxsg0bUh/UmHgu56oE6+3XEBqPZfJLLmj8vY+KoV6xTpmibBZKB0J7nw
	 AXZ9hBrosn4dBmRvud7HPjHWAU/gpVspaam81tk9dH4iPZWKL9qAyKMDphfciSKD5P
	 I79y1ZMcbwhG7GxS/wTCh+J6Wzf2osZY3I0LvdOt0V+wvmkhMnROyuTUzlD5gaGOYx
	 YKj1hK3RJlkqfUFfJlQ/qs8C3TrT0wFAG0HByknPHS2al60CPf9Ia6QccP52PBSgZ1
	 QvaDioaW/TduRsfMYI9tNe5iqc/4pG/IRY0D3SaUZc1EMd0KAl3aeRe1DTe0h7TWSH
	 t2+lr8Vk5TncA==
Date: Tue, 22 Jul 2025 15:44:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Drew Fustini <drew@pdp7.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the thead-clk
 tree
Message-ID: <aIAUMijDm7aX6bdv@x1>
References: <20250723083829.34ee8f91@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tJOUGb3vvMWd2K1J"
Content-Disposition: inline
In-Reply-To: <20250723083829.34ee8f91@canb.auug.org.au>


--tJOUGb3vvMWd2K1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 08:38:29AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   e468d81fbf5e ("clk: thead: th1520-ap: Describe mux clocks with clk_mux")
>=20
> is missing a Signed-off-by from its committer.

Sorry about that!

I've just pushed:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=
=3Dthead-clk-for-next&id=3D54edba916e2913b0893b0f6404b73155d48374ea

Thanks,
Drew

--tJOUGb3vvMWd2K1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaIAUMgAKCRDb7CzD2Six
DPHTAQCCvUPplExScdVKP8rTVAc5afO4KR9CHDmBvWA6kelXNQEAyE+rH7u+ThOE
6j1dyTCRU5NMBqjD+h4kClPkzxs18gE=
=a66R
-----END PGP SIGNATURE-----

--tJOUGb3vvMWd2K1J--

