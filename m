Return-Path: <linux-next+bounces-1533-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920A875626
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 19:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E74D4287FB2
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 18:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE6812F5A5;
	Thu,  7 Mar 2024 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJb3VQHU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493725763;
	Thu,  7 Mar 2024 18:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709836448; cv=none; b=am/X3uMoVBetaEkYhPbM5ocv/rTgey2hmDDBFK7RnnSF85uOYDx3jtIiUUzGgX4/iq3UkyxCUCuqJVX7LlwgTnaUWM66sOVYIEdbKdyXIGGi5gnVJ9FnBKdX0Z/QrWSFLyY+lgkPoYmGYoNNwy9Wa/Loycj8cnlmTiMfjzzfsEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709836448; c=relaxed/simple;
	bh=+lK/F0XbMKqREwpvsr+3Km9spePaRTSr3KsnOH0vBmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phDgsufvzXyPYZNtJPCUT+YhFzEMyeCBIHIWkHUTRGXUVKohqKD+JVrIbHsdlUb8rrbPjqvmHP75U7XAb1HU2pHni1Sp95FfWquskHIjAiw8Rw7X6ZY82v/wEthZNlNYbOk42uqonB1E2YStwnopDBthAnS5rlGkQntpUnn0d0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJb3VQHU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76836C433F1;
	Thu,  7 Mar 2024 18:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709836447;
	bh=+lK/F0XbMKqREwpvsr+3Km9spePaRTSr3KsnOH0vBmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJb3VQHUgU/aaG83shdGPgIcWjq0buY/JZxBL1peZ9dXE/PSvrEsIFyopnq5lBeoN
	 dDH/smhwPpo9zoI3ZhzU94PhtVJJBM2SuDXsjvJZGC4L/fxr0M3rmLCtPT7/yRBNN0
	 ZiJtgiMMhgKgIYVV/bEgYCTwED04y6K3VTsi18ReqOFxmjKTJ2IuSNXHRi1scgRfTi
	 qLzp7Pr8IQ4lBtPsIzb9Y4ocZKpWzJQ+tVqjtXxKKI/o+Kf0sftUUZVMV9ydAdK4pO
	 fsFGf7h/gK2LLCP4vvucH9nKy8/9P+WpMk/t72uoiwBmJGe6kNSwf/Nxi341K8uROW
	 M17EsUjPSL4Xg==
Date: Thu, 7 Mar 2024 18:34:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Puranjay Mohan <puranjay12@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>,
	kernelci-results@groups.io, bot@kernelci.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: next/master bisection: baseline.login on
 qemu_arm64-virt-gicv3-uefi
Message-ID: <4ce67bde-3bd4-4a59-bce7-4a2764445783@sirena.org.uk>
References: <65e9e748.a70a0220.606f7.53c0@mx.google.com>
 <7e216c88-77ee-47b8-becc-a0f780868d3c@sirena.org.uk>
 <CAPhsuW7c+OgFcZ9qWF7nes3SbaQdf5GYZZA+jyHAOzJ5omuZ8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RHFExNBtP0kQZN/i"
Content-Disposition: inline
In-Reply-To: <CAPhsuW7c+OgFcZ9qWF7nes3SbaQdf5GYZZA+jyHAOzJ5omuZ8g@mail.gmail.com>
X-Cookie: Been Transferred Lately?


--RHFExNBtP0kQZN/i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 10:16:21AM -0800, Song Liu wrote:
> On Thu, Mar 7, 2024 at 8:36=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:

> > The KernelCI bisection bot found a boot regression n today's -next on
> > qemu arm64 UEFI platforms with 64K pages which was bisected to commit
> > 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management").
> > We OOM quite early in boot:

> IIUC, 64kB pages means 512MB PMD. I think that's indeed too big. We
> will need some logic to limit such cases.

These qemu instances are only configured with 1G of RAM so that's rather
large indeed.

--RHFExNBtP0kQZN/i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXqCJkACgkQJNaLcl1U
h9BiNQf/W8sMW+TR5iJXPtmx/iSXx9Vc3oIzw3d/05nquehFKCiPnQSBP3G6hBeE
xSYtWC/vpQRJGlkjb9wVVQIQ0fvHRILCWxRXLAr4eFIFFB2GXR34b8rfCooexQ2C
jpBO6FaMmlGpPZO73okfWeLM/uFF06Rk5O+3bbfElmuBUisrp3fnjrHojyPpbcuE
g0GDpiGkvqGZETacXOGVfmWZJ5IqeLmuN4TlVx3iw3Mi4fc7LvH+ikbQnJpn19IY
cYxM8F9T5hY60VsvDUEVeO8RH4m6UPZXmTk7eMhngtAlYK2+tCAp9B3MOUNXvFvq
mRRRaFOMa48N+El0WdtbP9+Uo0eqNQ==
=x/8f
-----END PGP SIGNATURE-----

--RHFExNBtP0kQZN/i--

