Return-Path: <linux-next+bounces-5910-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E83A6A490
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 12:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5BC319C0790
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 11:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4134021CA1D;
	Thu, 20 Mar 2025 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdZZksW+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163D221CA16;
	Thu, 20 Mar 2025 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742469223; cv=none; b=pP9VysvAVdr7XwwblhXyIhhVm5GDX4Ge+u3X9LVI7+ql/2lE1FSToYlRPSHkMDqf17b8S51T5Nct2tV78fCkR1yRmPOSaE5Lmx6WuEtTEPH1g83XgdAQI5PELvBc6HnD3S91zk7cUYrj+zr3kdvp80NjoTXIZVBQtOYL9rrfNXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742469223; c=relaxed/simple;
	bh=O2z0npzN9UJqqUiE4QePeNQ1qVjw1xYdUvMfUZMQVAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggTDcnqTJFQ+9qrNT33hQ0vhMxe5Dg7NXhP/uWMApKKbs8UxRzhi6no3xCzkIUcrbuqa7TJKPhYRpvoW0t/9WRDbt+5uiDjAFZXwi8Z6n47Yrpfk/FxFopOCtlSI/jtaV/HFwFlZBJm7VZuVMfacFXkNAegVPRq/G5G76VcKBDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdZZksW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBC2C4CEDD;
	Thu, 20 Mar 2025 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742469222;
	bh=O2z0npzN9UJqqUiE4QePeNQ1qVjw1xYdUvMfUZMQVAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdZZksW+KWOtThlHG/zyCjFZJ9tYfnzNMSYQng03fYVlGhjG6+Fm2KoYzD/WcVQ4G
	 hxnv9PltZEYfqiFcv7Ry0rk1wagCYHI+Yk6GHIenZDGWgKpLr4wEuQFhBjz6JmAwez
	 C19tVa0bgaX45sG7rieA0QokzIfZeqcOBCBxLgClwn4KwrPvdhOyebmpstTTNesjCn
	 5ItiMkaIXwDw6YK+SI+JjsUpRsuBxOyffJSQNCB9bO6K2ibIf2zk2PbTmfowdekdKH
	 yE1UJojznH7XLPcMXQedNMUlVzVKQFOA6GayncR9ru2Yyamrz0hM5x9Jp/wz/lYEKu
	 3CMLCIocbixGQ==
Date: Thu, 20 Mar 2025 11:13:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tip tree
Message-ID: <8f9822a8-59cf-4cba-b44e-dc65939221e5@sirena.org.uk>
References: <20250320204617.0eb018d7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sKkocEAb7oa7Ygk7"
Content-Disposition: inline
In-Reply-To: <20250320204617.0eb018d7@canb.auug.org.au>
X-Cookie: Do not fold, spindle or mutilate.


--sKkocEAb7oa7Ygk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 08:46:17PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commits are also in the sound-asoc tree as different commits
> (but the same patches):
>=20
>   4476e7f81467 ("x86/amd_node: Add a smn_read_register() helper")
>   9c19cc1f5f57 ("x86/amd_node: Add support for debugfs access to SMN regi=
sters")
>   83518453074d ("x86/amd_node: Add SMN offsets to exclusive region access=
")
>   8a3dc0f7c4cc ("x86/amd_node, platform/x86/amd/hsmp: Have HSMP use SMN t=
hrough AMD_NODE")
>   ad5a3a8f41aa ("x86/mtrr: Use str_enabled_disabled() helper in print_mtr=
r_state()")
>   d55f31e29047 ("x86/entry: Add __init to ia32_emulation_override_cmdline=
()")
>=20
> These are commits
>=20
>   c893ee3f95f1 ("x86/amd_node: Add a smn_read_register() helper")
>   6b06755af667 ("x86/amd_node: Add support for debugfs access to SMN regi=
sters")
>   bebe0afb7451 ("x86/amd_node: Add SMN offsets to exclusive region access=
")
>   735049b801cf ("x86/amd_node, platform/x86/amd/hsmp: Have HSMP use SMN t=
hrough AMD_NODE")
>   e3cd85963a20 ("x86/mtrr: Use str_enabled_disabled() helper in print_mtr=
r_state()")
>   b2f10aa2eb18 ("x86/entry: Add __init to ia32_emulation_override_cmdline=
()")
>=20
> in the sound-asoc tree.

This was a branch I was given by the AMD people to base some work that
uses SMNs on - looks like it's been rebased?

--sKkocEAb7oa7Ygk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfb+GEACgkQJNaLcl1U
h9DCqgf/WmDnR/fv8jCGBWSD85ubKMZY/STlHd52SbjEYRhiroqXhVDTPUA8zuPj
UL4GxQ6vRObXzwNYW/DTkbrDZ4piaqq4uj/AXd1M+kb9Io5ksINdJJrvRaS2Ylrb
KUb5DXGgucEFCStP7Td0fqwBgxgF8D3aTLGlOgIjT8Nxn4WwYuF+CCu4/7lfrM4b
S3tpMHWwnRL6dPrEKkE2sCpG5yUw2in7uZKJnS2bokR0kmWXLKtongIuIlOlSWsJ
g2/nkXI7EtuywGIWTRyMV0jIcX/Qls8PMccuJE1KW+FG5UbnnlnYc63n6uO/m+Xy
cRFeOhVVdglU5NqYZkW4xnOElMxRhw==
=i1BG
-----END PGP SIGNATURE-----

--sKkocEAb7oa7Ygk7--

