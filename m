Return-Path: <linux-next+bounces-8483-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC01B9ED46
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 12:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379E31893E62
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 10:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB792EC0BA;
	Thu, 25 Sep 2025 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbYZ0G0G"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6345F2F5306;
	Thu, 25 Sep 2025 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797706; cv=none; b=IFocQK19ulS7KyEdZZg/sEFh1KFhHNoueUhymn+dNjgQWTm+lwg6SybqAjGytMhFLPjofilLqArB8GaB9eIB3angTcfw64rmilQ014o8yDYM7lIZHzX1D4xU9UV6/qrRTeQu4whf4zXHePOiNEBR9Z9SD0JvF1pm/F/gtpybTHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797706; c=relaxed/simple;
	bh=D8W3bQnf2XHInbGBCwq56KuARNHwa01r61Ta/ol8QxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KlFhoR0SSB2AOcS7qrhoZ+k0mC/s8SGrScxibIxhiOi1sLtjqzhWGQ1jbGieLdbyF3/yFURlMvVAYz0//FGhYz13su7z4MptHn6YhvOmSIXbKa/Yss9iqHbVORnOzVF5B9ucjmR02dsRQ213CQNwOOuN5Vfffj63KuJdda9RTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbYZ0G0G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35472C4CEF0;
	Thu, 25 Sep 2025 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758797706;
	bh=D8W3bQnf2XHInbGBCwq56KuARNHwa01r61Ta/ol8QxY=;
	h=Date:From:To:Cc:Subject:From;
	b=mbYZ0G0Gj5aVT2ZRtwWyrpEvE1/jfPebE6q0QvXrxZnQpDGsZLVryIObGmdsMtaTS
	 c1TAaCkXC4ZFgkMVZd1la0Y1yV5+hCRhcgdkTr1ZqTcN0K1wz5Jv0CqPgaUPXp6sGF
	 zS27QpuKHGqqGtd41VV9k9xcxM3aAPcVC+FQEgZ4T0ZFmU4vTJv+It0eqENpoLmwrl
	 aPsIbglVhw0Dc/GEu12Wav0KeT6zgrOcSOEkqn80Pqqa6K7H25CsvzwS3GlNUUwQmY
	 dj6uCu1+I4EdplP6jPYqVzoI2fPEsORlKrhBxeVPbSy0oUf6I189BAO5iPF2wV4QT0
	 KzImWRL/Wkfig==
Date: Thu, 25 Sep 2025 11:55:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve French <smfrench@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Missing signoff in the ksmbd tree
Message-ID: <392013e6-3012-46a1-a2b9-4ee932eca80f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3y/bAktTNFNT/rV"
Content-Disposition: inline
X-Cookie: Shipping not included.


--j3y/bAktTNFNT/rV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  d76f0acc84fa7 ("smb: server: make use of ib_alloc_cq_any() instead of ib_alloc_cq()")

is missing a Signed-off-by from its author.

--j3y/bAktTNFNT/rV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVH4UACgkQJNaLcl1U
h9CtaQf/bPWh9obEGBxo+sRw71sV56uylAfCiOkSdiDz7adIOOYsTbiVeoZhgn/y
unxTQv2TvaGutsjkOAMoidIk4+TNukPuRoH8Yk/sfMfsazW39e44AU1Wj38ljvOw
/7n+ibrmtSypHNBOskRMyNqw65fKHnN3lOo0UH43FVpI/JCEHGOxmnGXLjwR+1LQ
5fs0FtzyNT/Q+3GeL0y3ec3xmz/IVlrKLd8mYAYwvbVWo8Ui1FjfO3Wrsj9NAPHb
qaPqnXdKJgnHB/f8rBiQmMHeK9D+jiRBgmrA++zQXvfPxaG2RhLyx9bKUyoNZVhR
aFkYuEeOTvP+Q72DSBOKY5FdXbIypA==
=yXB4
-----END PGP SIGNATURE-----

--j3y/bAktTNFNT/rV--

