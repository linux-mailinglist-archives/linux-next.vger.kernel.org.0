Return-Path: <linux-next+bounces-8422-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E4B90721
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 13:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EB01189EAAC
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD2E27AC2E;
	Mon, 22 Sep 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHsVEUpf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31DB4A1E;
	Mon, 22 Sep 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758541239; cv=none; b=i82pnMZDg2JBvcXutfxvy7+akKla2ahRFzAsTblSHoRQSfxedvyreU6VQlhKhmxHMgUpJpurZKH6IEzXFwNIRaSX9Y4VX49ZYf1kn2w+qayZPkEXDCCGfz+YMPhfFgEsUov+hOVTTXts/D2au0Uw1nagNnv8/Wu1VkYq/A2lpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758541239; c=relaxed/simple;
	bh=1bTeVpeY1inxn5GaVFTAtddOZwZ/woNdgAjjVAaaFVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEYva0i4E0wMSOmBeFvH9V92c9MKJL/wyEZt7L/7N4441ueZjsnkdrMRnz/dpnIfpbmm1tXYpf4hk8st7MIk5Vs8xK07pQ5DQE7fvsPwZoj6eKh4MH6rfCP43oN+Imqo3bwjWNyBNDeW2I9r0YVZF9p3yTHvFoga9Yo0CiKN42A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHsVEUpf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE038C4CEF0;
	Mon, 22 Sep 2025 11:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758541239;
	bh=1bTeVpeY1inxn5GaVFTAtddOZwZ/woNdgAjjVAaaFVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHsVEUpfM+4B0JwzYOcX4dyEBnI5y4SeHnbNq6mm+9WUThqLuXBRAeQIQGXFqohnm
	 Fz0c3p/BooiR5h8nBhbT/jkv9Ebc2SskbAb2ZVKCy3JekI/JJk8AS/7SJQ9nM29Ftq
	 PZ/AYKEgarbKs5whtO058RE3574e+AdNXubu4clm+ynT3EIE0jEw6IIPyCswHAZePx
	 DodjiYLGiFoE0XuadOqrDjiLe7cO/wJsLag0e0uNGqfnl2zeRLB+2zhBDhfuIW2Dw7
	 3RXchZJlXY6Bnv56fNrSSIMtE+ICZPW42wSNmYgyVAi1O6c/BeFFesvgcfAcxC41ED
	 XHZfz5M9DvgEw==
Date: Mon, 22 Sep 2025 13:40:35 +0200
From: Mark Brown <broonie@kernel.org>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <aNE1s02dSgcJ4Uxq@finisterre.sirena.org.uk>
References: <aNEb7o3xrTDQ6JP4@finisterre.sirena.org.uk>
 <409d5703-ca0b-4b4b-a221-4e38ea92ae9a@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Lq+S22UPMbyBVKx"
Content-Disposition: inline
In-Reply-To: <409d5703-ca0b-4b4b-a221-4e38ea92ae9a@amd.com>
X-Cookie: Filmed before a live audience.


--8Lq+S22UPMbyBVKx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 04:57:39PM +0530, Aithal, Srikanth wrote:
> Hello,
>=20
> Todays linux-next build fails with below error on AMD x86:
>=20
> arch/x86/kvm/emulate.c:4091:9: error: implicit declaration of function =
=E2=80=98F=E2=80=99
> [-Werror=3Dimplicit-function-declaration]
>  4091 |         F(DstMem | SrcNone | Lock,              em_inc),
>       |         ^

That'll be me doing a mismerge I expect and should've taken the other
side of the merge for these, I'm quite surprised that the x86
allmodconfig builds didn't trip this up :(=20

--8Lq+S22UPMbyBVKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRNbAACgkQJNaLcl1U
h9DpuAf+Ou4ak/rJ+yT2QZPhF3D1I7FrVjChAza34qmc9dYKXC/knuyybSXogmEP
LANT43tfIQ6EH9wIC4DvGPQTaRDIVbaB/Tu1j4wAXmINCX86uGk/vk+tusovvYLZ
glP2h3qlwGqVjvfNEawfMwcmLXvwMkbCe5urNogEionPH2YwTUcWkJRtd0tJ4656
Tbru+ubqvY3tysTrCSjOHOYc43r0OlMy5Eio22cec9r1uz1mWXHNRzQqLKlmjvgS
viAmzam6Aac/zNbH80//xFGTiGKeS51VU5Ji+Qxw7GVDSHA0CK5a82WwUB3TQW1Y
VWWi+ckxmKTYA5nXOMnZWVz31ijT6A==
=ysGj
-----END PGP SIGNATURE-----

--8Lq+S22UPMbyBVKx--

