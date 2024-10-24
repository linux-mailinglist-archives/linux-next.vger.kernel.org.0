Return-Path: <linux-next+bounces-4427-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7479AF59A
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 00:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7319F282719
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 22:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1456D21791A;
	Thu, 24 Oct 2024 22:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv7mqhVJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5142170C5;
	Thu, 24 Oct 2024 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810350; cv=none; b=o07Ckp1I6MmzXs8tQ3hX/+YBSsCmYB+cSMYIN6xtNHZiw20dYZAZHTNCLq9RlIfdfUEbJtnrIKU2o7R4hmbr20+sT0NuQGvX6XouFNBFXmpn/24dKPJhFYs07Xs5h9Dh6ZTWMqekNoV1cBfhSy+mKRMqXOwt8rfcJacWNyNOKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810350; c=relaxed/simple;
	bh=umCeUZZLaMCvRPh8tFWCZwys65bRXOPtPWMR7MF+zH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJjxaBC6FOj0F4JFChSBglvYa9DKiHRf4gT36tZDw2VclE0NUM/dj6tSASrVp2Z90TE9YS2UYXcWKNr5hQfAULDnv2QVyIBQDlnm0JzDe0HD1+SzaOn2WemV7LzX9DEMC1WIE1j6Pz+0/UDIpz/8eTna0/dWNTcEN9i6kvTMpw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv7mqhVJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DA2C4CEC7;
	Thu, 24 Oct 2024 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729810349;
	bh=umCeUZZLaMCvRPh8tFWCZwys65bRXOPtPWMR7MF+zH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kv7mqhVJvkYsj5v9++OkIwZ1+0+pRhSxX++nBH/8v6HL1oS8An2yi+bqiFsWOmZHr
	 OjNn9wrXCFeSap7V92KaUJLFAjbLk1UyoVH/5XSjCj4ipndz98xkhU3gSebHQBGuym
	 KTDqGbAtfy8Fi8XFi7UFbPQSzSafYE7rg8boFZKIpYkF6flu3pDAbFio/Y1wdGLoyP
	 wCX5Amt/qq22FHssyr9h9/BeArht4yQoLKLilxrt+MAfxv7blCCHvPUaMQmhr04Yia
	 9i80ddf/b3QiC6sBrubuZaTKsB8jPykfhArpNS7IEBG3vmfSRlXyK1tfX0WWtZIiZ6
	 VXPJ0SOWsI2AQ==
Date: Thu, 24 Oct 2024 23:52:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the riscv-soc-fixes tree
Message-ID: <20241024-pleading-grub-e50a759dc9c5@spud>
References: <20241025094819.5e01ddc5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/I56q7nvnU0k7Y/f"
Content-Disposition: inline
In-Reply-To: <20241025094819.5e01ddc5@canb.auug.org.au>


--/I56q7nvnU0k7Y/f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 09:48:19AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commit is also in the riscv-dt-fixes tree as a different
> commit (but the same patch):
>=20
>   384f2024e1a1 ("MAINTAINERS: invert Misc RISC-V SoC Support's pattern")
>=20
> This is commit
>=20
>   7d9d88890f04 ("MAINTAINERS: invert Misc RISC-V SoC Support's pattern")
>=20
> in the riscv-dt-fixes tree.

Ye, harmless. I found out the other day that this patch had not been
sent as a for v6.11-rcX. I'll drop it from one of the branches, thanks.

--/I56q7nvnU0k7Y/f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxrPqgAKCRB4tDGHoIJi
0puHAP9YhE4VFbpalERztM4rtM7/B3Ui+bVFUQedgdGYjXy9xwD+JVVKnnSCXMoA
0iZUZZdTgKD6sj8YE/LX/VtLt/LN5wU=
=gEhc
-----END PGP SIGNATURE-----

--/I56q7nvnU0k7Y/f--

