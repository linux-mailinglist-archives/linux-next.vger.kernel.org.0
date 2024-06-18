Return-Path: <linux-next+bounces-2584-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5690CACD
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 14:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 946761C237D6
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 12:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EE313AD38;
	Tue, 18 Jun 2024 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBZwbDD6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2DE13A877;
	Tue, 18 Jun 2024 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711473; cv=none; b=hQhrXdi+U6/nSdpdXCdSyeKhB8GLRqjxPEwb5EgULsZ5csvFJDG0WG0FlsSae5/ycZPrtV0KuvBVaSreeB7Ki9gqynw0IcTQsMGumlnZs1qBgg446m5QraU6fxFllElx5VlMdn80GQ8Hnp6BxKsabWF/fiYePRZAlQj1o1kKjZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711473; c=relaxed/simple;
	bh=itnLaYU73scIBSDS2g3n+5LVak3YlcHt72uWNFY4DjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgLptlAelP05sdRY0hJ+aQrn3bToV0TCXiTLG8qfnNhwxFwmH0wVlMe/rcPb65hUCv/D907PZD1JFydkNer5pp5Qk4eqqWXtE3jtN2GaIDMVD8X56MzBGy36BARwPHrwgwe0ra/JwZYHZi9lR2i4haPjJh8P1q8DKu3YFm7pzmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBZwbDD6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFB9C4AF50;
	Tue, 18 Jun 2024 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718711473;
	bh=itnLaYU73scIBSDS2g3n+5LVak3YlcHt72uWNFY4DjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBZwbDD6sYQU7aQZTWb9SY0CLy/8qhIuWGTnwgEqitFRPMyEv/kECh3uYZPuJ/f1Q
	 H5Dmm26e6Wtbnl8cLBAxJP9FjaU3/FcD4XxQdFtCSb8YE8q7aczJ7oXzyR7WFaDFbn
	 QPHi/0X5zRE4k0YJHieQZYraFeUd7TMKiWjwppzpOvcDRHte+2ZRfznSuxONQDvxK8
	 D00URor2c7FfEkEFTcNEeqCUJYIhGFYCR4oFIB2KxS5/x/DifjqfJSEsb+H99Gd/Jm
	 wDu/yo7UVTYQeX4AtXyic/yLff/ZbITnm6CBiTHS1yxE1WchY8C4MPoroegtbXG/S9
	 giyG5s01suKBg==
Date: Tue, 18 Jun 2024 12:51:07 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Julien Panis <jpanis@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>
Subject: Re: linux-next: build failure after merge of the mediatek tree
Message-ID: <b376b01d-45e0-40dd-be10-81ac154ead7c@sirena.org.uk>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
 <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
 <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qVqD02ii6DMmnPdV"
Content-Disposition: inline
In-Reply-To: <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
X-Cookie: If you can read this, you're too close.


--qVqD02ii6DMmnPdV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 12:03:44PM +0200, AngeloGioacchino Del Regno wrote:
> Il 18/06/24 09:49, Julien Panis ha scritto:

> > For some reason, the 2 first commits of the series were not applied
> > with the dts. These commits are needed because they contain some
> > definitions used by the dts.

> I'm not sure how should I proceed here.

> Only the mediatek tree is broken, linux-next is ok... should I pick the
> commits from next or should I remove the dts commits from the mediatek trees?

> First time happening.... :-)

linux-next is only OK because I am merging an old version of the
mediatek tree rather than your current one.  The mediatek tree should be
fixed somehow so that it builds, either mechanism should be fine.

--qVqD02ii6DMmnPdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxdKoACgkQJNaLcl1U
h9D3fAf/eh2z/5WZx5xJ+uk5O84ROaOiosRiUwVl+JhlIZ8Ihgv00i32eoTM3De9
rsllAKch1KgVdqT5s//fnKFOilTixOznoej1Brfwcd8kiZsGrxfaleqSvhSPxBkz
fc9YfKPQs0wEK2dmohJRFf3we7gy7BOEHr15DYZNtovF0xrOq9jOtZka0hHXODA+
qqHRMvWyBVSk5/xts5lAaomSbN1rYrQ+sxsRlYcDdKQE9fxZ2/HQHkPOYYO+RM17
nSPD82K1sf+f2LmBdKv8e/YDYiO4FpM5YsahNm2FrJV9ycxYdGcZHnNdeGw+cRcf
VD8gOBBa8ei6wkMYKPmLOXAcWfIKbA==
=rTMi
-----END PGP SIGNATURE-----

--qVqD02ii6DMmnPdV--

