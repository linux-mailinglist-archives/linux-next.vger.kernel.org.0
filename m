Return-Path: <linux-next+bounces-9093-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E74ACC71781
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 00:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6C96929826
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 23:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F86E30CD88;
	Wed, 19 Nov 2025 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofi6PAvF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658832FF66B;
	Wed, 19 Nov 2025 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763596473; cv=none; b=GnPnUBy3cB6wrxrzjg+oNolY5iWdUNQ+mtCniwYFYP499R6ntttZ4qxYjC1LR+3USVJ+Z8hw05Uia3NidIooFX6XeJ4RacaAoGRok8X/oJT52XkLLy0LWGhGMvDPqjKbqUXRSM5EmG5eeMAuLWKv8UaOoIJh0m33P9AYlg8MHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763596473; c=relaxed/simple;
	bh=glopRIxhFvs1C5Gwoz0NsdQFCbUEjMJ/gzaW4Xyet6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgquqFh0f1UIKzqj+baC5JGZZj32GeHxAHELfVgWFN2WCo+7m8S3VOxNKQfaryhXMC5TrBRyOcp34Zxn83U7UxlSw0o5piCnSGnz7dcSPhtgVtLAz4i+un+yR9gjFI6FI6Pr4DiWQsW67djPsNkKN7JYPpTtxYKIROtfSDTmrf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofi6PAvF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF8AC4CEF5;
	Wed, 19 Nov 2025 23:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763596473;
	bh=glopRIxhFvs1C5Gwoz0NsdQFCbUEjMJ/gzaW4Xyet6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofi6PAvFCXbF6so0h1O51AmzQHsjAcZgU2QNrvcO2i/dQGAb0+XKsXTszws8Q+Hgu
	 7wlI4mIjnG16CFAcDCIU5Q0NtO1kvfdaXr5GSgw+Raw4yVm2SkjeJrnqZ5vUivlqYU
	 9depToi+a54loCkgU1jIdsFgtcbd8o67chSZ4qf17X6vCm2L7h2PpvgDtSvZAVBIkp
	 jCeC3R9CcIZ0XFFfWtroy/uzpUaJkQ5FZ6ngdyylNjnYuID1lK4/OXnWAqarAS13KZ
	 V02nrijT8R1j8XjpFH4BF0rtopIuTcMO2AchaJYeKbBdMUAW9mm/AC1/xpcIqD+CCm
	 thc+a10T0NfsQ==
Date: Wed, 19 Nov 2025 15:54:31 -0800
From: Drew Fustini <fustini@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
	Joel Stanley <joel@jms.id.au>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: linux-next: manual merge of the risc-v tree with the
 tenstorrent-dt tree
Message-ID: <aR5Yt2x2JRx7gK/r@x1>
References: <20251120102925.57ab2fe7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U0gUBaz4YRthsKQe"
Content-Disposition: inline
In-Reply-To: <20251120102925.57ab2fe7@canb.auug.org.au>


--U0gUBaz4YRthsKQe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 10:29:25AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the risc-v tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commits:
>=20
>   4de28f1edcfb ("dt-bindings: riscv: Add Tenstorrent Blackhole compatible=
")
>   8e88602e99a7 ("riscv: dts: Add Tenstorrent Blackhole SoC PCIe cards")
>=20
> from the tenstorrent-dt tree and commit:
>=20
>   5ffe60d26107 ("drivers: firmware: add riscv SSE support")
>=20
> from the risc-v tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you for fixing it up. The resolution looks correct to me. The
Tenstorrent MAINTAINERS patch is in the tag tenstorrent-dt-for-v6.19 [1]
that I used for the 6.19 pull request [2].

Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/tag/?=
h=3Dtenstorrent-dt-for-v6.19
[2] https://lore.kernel.org/all/aPUemXdOFZEdkayE@x1/

--U0gUBaz4YRthsKQe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaR5YsgAKCRDb7CzD2Six
DNQ7AQCVz9RjfUOW0yaz4OZyzr3R5T89AB+v9IDPWXk4el5kxwD+OUhs6bdj5a8C
cphsXr7tQuu+SPcdBtwbOf4DK83N6QE=
=VQEk
-----END PGP SIGNATURE-----

--U0gUBaz4YRthsKQe--

