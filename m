Return-Path: <linux-next+bounces-5964-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F5A6DC69
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 15:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FE1B7A4A8A
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB18F25F96A;
	Mon, 24 Mar 2025 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZ4v1FMV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12C425F7BD;
	Mon, 24 Mar 2025 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824804; cv=none; b=A84f/YD/dR3dAgWtQxdJj9DV6YndoBtnHl+CmXlF73DJWRGwU94zwYY+jUd6j0Befwn3DvkJfyj5sJmo1Zo/j6W/kjmbmEHSNz7ZHgGszx7t3ddKt19UFZzojrCiKqO5bqf8xb4C8Y9crXMUtzReGQ0mQ+Or8uF6U2KUEy/WkuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824804; c=relaxed/simple;
	bh=o5tQFBbIp1cor7VlYJRBaqjP/ajsy9BEPWfMarMtSvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dinpEq20bW3q6HpycdNO4SMS7CBG2HxiCsCkenUPCb3aVQV4/nT0WJ1yGcwJbVQwlGmsQT5urQBfeN0Z3KLROTopHPzELZ9mo6ZRlE1avDNZjPGWdlnncoptds6BsJqBqUjB8UB9jq+YHvohwvHCB4VIlvxCH41k+CFTNbc2da0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZ4v1FMV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4CEC4CEDD;
	Mon, 24 Mar 2025 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742824804;
	bh=o5tQFBbIp1cor7VlYJRBaqjP/ajsy9BEPWfMarMtSvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZ4v1FMVtzuotvAAJdWHFu/tEhQYgBGNX4nxYIpZyjcZt+s/XdWcnK+fUc9Tge8+m
	 XuMV+R8bSN0CKNsIkD8wvnbWJaFRYEzKnOJ1KLplmMJF/nkbLsiezt4iyMFZWN54qb
	 0bz9lyG2B2aAsGjTFp4e2DUdFG5VwjHzlDaqUBm/cNZOT5ibi8BoKKg8a462gJcgr4
	 YiuT6t+2+9NdW6HVm24zPlNa8S0C2FwtPvcnkChXWyDtGVQ1fl0IJ+PkXgt0VlMkDI
	 Q41RPj6BmduH/uIH5PHUQosOTXZY2wn1zpejWjde5SpiaOO5ReMi6YEYqcpGW1M83n
	 4oE751NAhXnyQ==
Date: Mon, 24 Mar 2025 14:00:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <Z-FlYC2Rg7eX1qxw@finisterre.sirena.org.uk>
References: <20250323212937.4f182bd3@canb.auug.org.au>
 <Z+EjXzXlocNTUQUz@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZCOGiEQ7HCq2p7me"
Content-Disposition: inline
In-Reply-To: <Z+EjXzXlocNTUQUz@opensource.cirrus.com>
X-Cookie: Well begun is half done.


--ZCOGiEQ7HCq2p7me
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 24, 2025 at 09:18:23AM +0000, Charles Keepax wrote:

> Bit weird, not sure if Mark is in the middle of re-ordering his
> tree or if a script has gone a bit off the rails there. Looks
> like it had the right SHA when I sent the patch up but it go
> changed as the patch was applied.

I don't rebase so it'd be very suprising if anything got changed in my
tree, I'd expect to remember if that had happened.

--ZCOGiEQ7HCq2p7me
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfhZWAACgkQJNaLcl1U
h9BnjQf/QVMoI0FpnlEAAdumDhj/T3L+WegLrr/s6yQaEVEt8xu+cd2/BEQMLLhr
2vXwRIgwfHX8N4pxfwvaemdJDQkOaBOQnKttTx0iH9qRB1ny/NuRJDtz6hKidFkp
85evG7hKzIvEY4xrUIfNx1MaXQnJ9sHwRA6S7Ur6/ZQ8xZO8uZ+fkFhNddhNb0ir
oDTZfUQ+Wl1+6ux1E2cap6t1t/6Pm9j4ZzzfpFLeSMRsB4qUeNLjDYY9soKxea4G
j9kf2p2j9LGAM8M8zy0arpRUYZHsIIKtq5kAJBuzcjkhUQQqWNTq4hLBHkV4+Agl
2KJ1jjuUhvCQcVHFlbY6oSylnqPcUw==
=3M8p
-----END PGP SIGNATURE-----

--ZCOGiEQ7HCq2p7me--

