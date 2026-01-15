Return-Path: <linux-next+bounces-9677-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F41D9D25426
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 16:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28DB230169B9
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 15:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B3B3B5307;
	Thu, 15 Jan 2026 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyRILgI6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB6B3AEF23;
	Thu, 15 Jan 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490442; cv=none; b=sjW7ot93phcZS27JCso51OWZBWjeFPdHbmbEvKy1gaQkR9qpAwCAA2d7U9VJWJlftturpqfmZPvk7wJPP4mYy3+AhQzwr6K394NhhxsEKEut0cm9aywkdrGw1E8cPZ7GRuP5Qw+cKRt4pbehTTFDDO/OnUDTQabJQ4qz+FH7jIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490442; c=relaxed/simple;
	bh=nVBHBsPKKT/2c9bNjjK8KHT/WbL818spViJbLwzDHzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggSyKNOpBBsLnRGJU8VfMLWNAyjgZCXplBehhIob+wrEBxVtFFkCpg9308XVInOIxhbZetLE1+3iLtrrSLGdZwiOYIMbHJO/H6mzhqsR0gMBIngx/0Ouu6NnPzc1jZbl3Rlc3ACAMGTDaAEHxqV7xkJS8wxqKJJzAcNEy6gsCLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyRILgI6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0777C116D0;
	Thu, 15 Jan 2026 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768490441;
	bh=nVBHBsPKKT/2c9bNjjK8KHT/WbL818spViJbLwzDHzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyRILgI6GUEb+VU+SKDN3icZ+o0QevAGaQzRrn5ioP5JhARkXWVI+85DW+jUn6/MQ
	 L02L1kMV8pzs7kGbSFMMamr4SjCuN8/xt47gTSswbCONrcPG23WexWnZFdK8BUk2DR
	 Uv5Cou+duIqhKyqL7GroFG4GkCIXBwVdK+W88xqE32FJvR9vzxHXGsHhXpAcx/fFFa
	 SbBbGQooQ3NZyn5u94/a0FqNwg6fo26S5pd0JDFKtVee67qNz9Avqzz0ivPL0ez7sb
	 b31lmPNsA/oBIcYAqkvtY1wlAjVrcnBcJyOvIZoR2PRK8Hn3yHeiE0XCMWT82vtMOb
	 9x8z15D3zks9A==
Date: Thu, 15 Jan 2026 15:20:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the riscv-dt tree
Message-ID: <20260115-finally-thinness-771557fd8822@spud>
References: <20260114120537.0b55d4ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HN20Qtfg32gMrT6c"
Content-Disposition: inline
In-Reply-To: <20260114120537.0b55d4ef@canb.auug.org.au>


--HN20Qtfg32gMrT6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 12:05:37PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commits are also in the riscv-dt-fixes tree as different
> commits (but the same patches):
>=20
>   a36b2aaae742 ("dt-bindings: riscv: extensions: Drop unnecessary select =
schema")
>   fff010c776f7 ("dt-bindings: riscv: update ratified version of h, svinva=
l, svnapot, svpbmt")
>=20
> These are commits
>=20
>   eb766d282af7 ("dt-bindings: riscv: extensions: Drop unnecessary select =
schema")
>   6f5d8490ca03 ("dt-bindings: riscv: update ratified version of h, svinva=
l, svnapot, svpbmt")
>=20
> in the riscv-dt-fixes tree.

I think this may have been bad timing, I moved these from one tree to
the other around about when you work on -next.

--HN20Qtfg32gMrT6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWkFxgAKCRB4tDGHoIJi
0gv1AQCPLiwuOM3MHGYMaeGvSomDxhcRsqpFeJmD/8WbKlJbNwEA4Fof4arG073i
VtTYH8w4d7x07gw0xeOEa4RHRht91Qc=
=9DI4
-----END PGP SIGNATURE-----

--HN20Qtfg32gMrT6c--

