Return-Path: <linux-next+bounces-4991-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 114E49F6877
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 15:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3316A171379
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 14:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A911C1F31;
	Wed, 18 Dec 2024 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTEzrPn+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B75173446;
	Wed, 18 Dec 2024 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532095; cv=none; b=uqFCb3DpH7aWEn6BYQZLAvrfGAO7psdgRo5QC/yHsL3XCnCAwHxJ7ijfnhbxvu4QJqD68dLYvuO8uIaa/wVEuaflAw3hBQom5wzucrdE6d0pmv7Wgd+6Ub6W5r9a0yOHIXc+TyfndSVS+q//CXNhXKQdTbF4nftD4VYWlxFLBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532095; c=relaxed/simple;
	bh=qjTlmSqJZAprc+GtjisIz159hgIBIEo8gecArEW9tWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYdVN3Q+edE59vO0NGmNmSBJlLDY/AMxszM05jFvdZakSfvxs11Piob4UE8zBz3rlMijQi9Pv6Kkslb3A6LUy3AFNHQFLdp2VEVc/oAVBKj9iuthDU4kQ6B1VTBUceyr0SNlj3OKgEd9KjEtiWrz1rmPXnugvTjaOeSlNn46ElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTEzrPn+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24808C4CECD;
	Wed, 18 Dec 2024 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734532095;
	bh=qjTlmSqJZAprc+GtjisIz159hgIBIEo8gecArEW9tWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTEzrPn+Ij4u/BWIUyibbLjcsqSXtBSjIFiGg/VPsTcpOjEu+PC0CMQHH5CPpnzzR
	 Ph1lWoELlYGirQLSMYzYT7YEN6aoh8QFqVNUrkmC1ENpX0kReolQ/sBS/iC02BKGd+
	 c0gBPApTQtDz+1Q5ywjZHNVXIlCnoYYnSxTDb3VQ/f7pPyEqcUQZlHdvFc6rCJDNlX
	 8TbnGa1mt+g3eza0Y0aI3A8jGnFgRdLSzZfnMMYxjqbLp5cSZOSyR8yDBX/ly99mIa
	 pPHXDHC59SM+pwW7D7xSO0QCGQOMogYvsxv3rviE7p7mRiE8/17fMV0rQ91HVr28AF
	 caxTR/0aJY4Iw==
Date: Wed, 18 Dec 2024 14:28:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Dec 18
Message-ID: <6242bac5-bf75-4cf2-8baf-62df8d159792@sirena.org.uk>
References: <20241218153228.695ee650@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nI1oaPS1SjmC7Ffl"
Content-Disposition: inline
In-Reply-To: <20241218153228.695ee650@canb.auug.org.au>
X-Cookie: The heart is wiser than the intellect.


--nI1oaPS1SjmC7Ffl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2024 at 03:32:28PM +1100, Stephen Rothwell wrote:

> News: there will be no linux-next releases after this week until
> January 6.

I'm taking similar holidays, it's possible I might do some runs but I'd
not count on it.

--nI1oaPS1SjmC7Ffl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdi2/oACgkQJNaLcl1U
h9AprAf8C6sc6gYUYGSYK0sixX55Z1A0okNMjWJhkzisjlh1Y2C4iJRV/5HdwoJ5
oG81m1KhIEbeoRmi+VinshYHByw2R6YlkE4qvxoArcMpz/8Y4kMQHz6tkEpchku5
hVmMPLOFQTf06+F4w7Wqhtl07Rn4MIwIzld/Gl+u6lN83K4Co7MtnjpJA+rPUvO5
kO5sBnb7LdUyK+bYMrMfEIM+nBStAnL7WEr7v4VRi7lHquVY5XlJwZKSMl2yfjaa
YQ41WUqy+nXW0RDbNP5FzJ6Ec1sAnPDbbTN6wyCgf7MyDnNtzMh3xq23BRa/c/Kx
CIusI2O0+dMijEJFyWXatYFcNmguyg==
=hplQ
-----END PGP SIGNATURE-----

--nI1oaPS1SjmC7Ffl--

