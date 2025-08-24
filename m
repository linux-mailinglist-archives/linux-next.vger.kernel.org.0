Return-Path: <linux-next+bounces-8085-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E47B3310A
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 16:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBBA6204BAE
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 14:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974E1189BB0;
	Sun, 24 Aug 2025 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSKwTLyg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC002D543E;
	Sun, 24 Aug 2025 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756047420; cv=none; b=o6f7liARKmbkd4dfMvMq2upTUIwlSvWOIkiUOKXh1I8OxlmQ4rGK+PLZIhPMUxvtCZPIarmSNOn0zlLGZcwPJd3n12OsLcKUhDukuPGgFgEpw6kIaa0/ToEpSo0t8S+tbXZrWi9HFtC7KaPM/LPqORnQ/QSlBPAvuDBsGXiBxz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756047420; c=relaxed/simple;
	bh=+1jOLriLozrGM7yB2Hzza4VqOJeh+3Z6/w0hTsdPRZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/TE6qq6k92kebloG7CkvKf366UNwZVfQafVy2WbdApzIMmaUpfD+ccOXL39r3hwFjKOtBjdRMrw6z85rKeoPzqFT9Lr8sE2O8e+BYhhG4xAdX1zKsSPvS18ItxpBtHtsZnlaCTOI0+4C+tm/1Wl+H9a9jdYDiCxqZZ+lTlmJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSKwTLyg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA42DC4CEEB;
	Sun, 24 Aug 2025 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756047419;
	bh=+1jOLriLozrGM7yB2Hzza4VqOJeh+3Z6/w0hTsdPRZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSKwTLygEkqzxSulJaUucKa+QiFs8hhQLZvlVdRxt/S4SidV12pX1wbNX3fkNJxD7
	 Z5AiK7CfOoMfVH+lLq2Ht6HObqpDcEzjN7XqeTWHVQ6NoIP/OmCxHuZgbBFySn3bJz
	 aMG+Tmi2oYW9Fr5gUQdY/WbYpqVBSf4F/YY6dVJ93yqAy+LwZPv1pnPYZMoD9BmI4X
	 zu8WGW2Y4poTUnc0upqfwhrPjp9/Zi1zNtxqP0v/3XN4livypYvgg2pQMHuoM11oin
	 coSaXnwS4bt9aaGKUFyrhFTpytEmKMnczaWJenZgf6f8nQRM6yDMBnB2boLv7dMDLs
	 ht9UWdW/eW8GQ==
Date: Sun, 24 Aug 2025 07:56:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Drew Fustini <drew@pdp7.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the thead-dt tree
Message-ID: <aKsoOmVUsdaW2s99@x1>
References: <20250824184844.2994f896@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k4JGVHJrnLmV5t8L"
Content-Disposition: inline
In-Reply-To: <20250824184844.2994f896@canb.auug.org.au>


--k4JGVHJrnLmV5t8L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 06:48:44PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   0f78e44fb857 ("riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node")
>=20
> is missing a Signed-off-by from its committer.

Sorry about that. I need to setup a hook so I don't do that again.

I've pushed an update with the SoB:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=
=3Dthead-dt-for-next&id=3D5052d5cf1359e9057ec311788c12997406fdb2fc

Thanks,
Drew

--k4JGVHJrnLmV5t8L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaKsoOgAKCRDb7CzD2Six
DFZvAP0QMw/09l37X7J+HaYfza0X+/C/fVTE/aBeJqJXbQIqNAD7BqMJz8i5qG5k
JW369YAf4KI9yy2DgLQzBpbJFlFY7Aw=
=Q3UM
-----END PGP SIGNATURE-----

--k4JGVHJrnLmV5t8L--

