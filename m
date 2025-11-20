Return-Path: <linux-next+bounces-9109-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A09DFC73519
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 10:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0691B34E34C
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 09:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FD230F7EB;
	Thu, 20 Nov 2025 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Meitvwv5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3430E846;
	Thu, 20 Nov 2025 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632024; cv=none; b=WcDMyFxmqEKIqT4B0TpmOB4bSk27ME5dr4qxGAXUZ5gmJ2AqrhqQfwwxSbuDU0rpU5A8qJdhjOlBfFDnaNNkxS4jPKDsu29Rab9ki50w72UbkMP2ELbxyVmhHF+qiIxwj8yF2ZDYOifste3OAvJ/k/xupe5rh1dLVSBx9JnlJ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632024; c=relaxed/simple;
	bh=ol7CoBqus+ZbI1DSl6tS6nrJqW+3YzYEaI5Tm+c00Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obrUJ1QqbvnNr6RUarrbwpcsAxAtd6XgudhAwNMSn3MpjDkr3COi/yKrPFmlPGZPTIShethTKUhzxGosbO6xw9ZWKjK1KLBVBZJrGr2WTmsLQt21dKuyY0dUGjA2noDHQ7vuI35mPCrLz4hb983NQIC0lBrf4+cLRZ14mAs1LHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Meitvwv5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FCCC4CEF1;
	Thu, 20 Nov 2025 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763632023;
	bh=ol7CoBqus+ZbI1DSl6tS6nrJqW+3YzYEaI5Tm+c00Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Meitvwv5wefxxEvcmFJCsqw8dEV6rtYusdfK+xfEfUGVp7h11yzykb5z2lPc1lFOF
	 466ZYxUzFYjp+nZqe0JzMNC8N3LnpJ+DlkiEThw8r0HxJCS+QaM6u9sG7J5r2sbvk4
	 h+EFz8RlqRBXuuTN7DgXPeoRK2ct3VOT0hmZo96QL1FnoXf2IwwPjCcNdM2oC5G8NR
	 VOWezBjxBahD5lubkRaY27O4936emEr478tF41tzj8HXgyON3PXrKo/CGnDmiSxQig
	 nBMec1BfSVfqYq25BpqPca9FI0MJLLEU04yIJsl4o9upjCI1L767jI/QONRnKxexvu
	 iQsTGWXFm4hwA==
Date: Thu, 20 Nov 2025 09:46:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: linux-next: manual merge of the riscv-soc tree with the risc-v
 tree
Message-ID: <20251120-entertain-enchilada-9cd85691584b@spud>
References: <20251120103737.5349662e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OBpVC4vR8QGZ8yL2"
Content-Disposition: inline
In-Reply-To: <20251120103737.5349662e@canb.auug.org.au>


--OBpVC4vR8QGZ8yL2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 10:37:37AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the riscv-soc tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   5ffe60d26107 ("drivers: firmware: add riscv SSE support")
>=20
> from the risc-v tree and commits:
>=20
>   66c6ceb41ed3 ("MAINTAINERS: rename Microchip RISC-V entry")
>   12cbb612fa1e ("MAINTAINERS: Setup support for Anlogic DR1V90 SoC tree")
>=20
> from the riscv-soc tree.
>=20
> Please keep the MAINTAINERS entries sorted ...

Whoops, I'll get that fixed up..

--OBpVC4vR8QGZ8yL2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR7jkwAKCRB4tDGHoIJi
0nTiAQCMFpVLGz4XIx+JOu1uyY+1gax3Q6sNcFPY8AfD6ABvMwEAgNYgCM35MfN7
qHNiedwa6VaF9MCY1B849HxiQ3uG5Aw=
=Nm3t
-----END PGP SIGNATURE-----

--OBpVC4vR8QGZ8yL2--

