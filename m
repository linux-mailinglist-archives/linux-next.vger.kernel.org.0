Return-Path: <linux-next+bounces-9178-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A5278C80E6B
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 569FE4E23CD
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3891A2A1BF;
	Mon, 24 Nov 2025 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qe62YAOz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D936E30B514;
	Mon, 24 Nov 2025 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763993039; cv=none; b=RiUBZOCvNa6kOzgJEiNPxfh+33JrJYY8t9v5kur7fnAWoMwJv9dDSBAwH2OI/nppp5CRee+b6RSRVL+ZlnIMo7HpjL3r387QbydtngM0RDb3S59QQa1IUdMhym6W9Vm2bsB924yphpLFenD4Wp7yDnYaJBYVUk+GrPy1GjXlvGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763993039; c=relaxed/simple;
	bh=a1OsDks43IqS2NxVDVi0C2IJI0FhDcxtxoySi1Mii/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gOIydnk9YQL8F7r7Z2iZLVG1Z0IE/+Y923mniUshGzWY8Uu/c6OSVWekrYJHXlThz7++mP6XrYXuPcdcKt9k5EdpK2mpc/2OFcFAnxJ3N22TZU6OLSAyX9PNgTcyIfiS0dgjA4tlHIfUYQSU4z90+uqmTm0exrtsS6jrRzCNe9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qe62YAOz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763993032;
	bh=er7uLNk4WMVhNQA/LpunhUN4/C2NSMdTp5oDGdIY9pM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qe62YAOzO9RaCCn267Db9iegw1NHynzDmAc6HvhRaSVzY1NiUFKOkFSgN65+1l0Rr
	 a7rMGzW4iCYVEamysgdRxFdnsCle1LGzRAUywL3NOH6kn9OG3s2uegM6KFgZA0txgu
	 0lMZCk7GaNKltwb7T0Lj8vbsddG2sluOi+ZivIjygDB7YGDv9d909OG4p0r6O5SCcG
	 rWTL0p5sGaWKzbo13OnYNE4NRidOxshWtI4iUJZfrsYi11FSVeJoLFS2XBYyr15IR5
	 d7+fKivL7qO0h1mTVK8o5V/tSkRiRV9TY8UO6BcVFvcCgz9cGe/1eIrRPBbozsOWYG
	 /CJCExovSzJ3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFSGw07Wxz4w0Q;
	Tue, 25 Nov 2025 01:03:51 +1100 (AEDT)
Date: Tue, 25 Nov 2025 01:03:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, ojeda@kernel.org, boqun.feng@gmail.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251125010351.05b0b2d7@canb.auug.org.au>
In-Reply-To: <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
	<20251124123249.GP4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R+49YQr2h5s0cRUruv9UrtS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R+49YQr2h5s0cRUruv9UrtS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 24 Nov 2025 13:32:49 +0100 Peter Zijlstra <peterz@infradead.org> wr=
ote:
>
> Rust :/
>=20
> So I have:
>=20
> $ make O=3Dtmp-build LLVM=3D-22 allmodconfig
> $ make O=3Dtmp-build LLVM=3D-22 rustavailable
> Rust is available!
> $ grep -e CONFIG_RUST=3D -e CONFIG_NOVA=3D tmp-build/.config
> $
>=20
> Help ?!?

Have you read Documentation/rust/quick-start.rst?  I am using Debian
Stable and have the necessary stuff installed and a "make allmodconfig"
is sufficient.  Fedora 42 or 43 should also be fine.

$ grep -e CONFIG_RUST=3D -e CONFIG_NOVA=3D .config
CONFIG_RUST=3Dy
$ grep -e CONFIG_RUST=3D -e CONFIG_NOVA_CORE=3D .config
CONFIG_RUST=3Dy
CONFIG_NOVA_CORE=3Dm
$ grep -e CONFIG_RUST .configCONFIG_RUSTC_VERSION=3D108500
CONFIG_RUST_IS_AVAILABLE=3Dy
CONFIG_RUSTC_LLVM_VERSION=3D190107
CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED=3Dy
CONFIG_RUSTC_HAS_COERCE_POINTEE=3Dy
CONFIG_RUST=3Dy
CONFIG_RUSTC_VERSION_TEXT=3D"rustc 1.85.0 (4d91de4e4 2025-02-17) (built fro=
m a source tarball)"
CONFIG_RUST_FW_LOADER_ABSTRACTIONS=3Dy
CONFIG_RUST_PWM_ABSTRACTIONS=3Dy
CONFIG_RUST_BITMAP_HARDENED=3Dy
CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
CONFIG_RUST_OVERFLOW_CHECKS=3Dy
CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy

--=20
Cheers,
Stephen Rothwell

--Sig_/R+49YQr2h5s0cRUruv9UrtS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkkZccACgkQAVBC80lX
0GzLMAf+KCEuheGXiiKGLfkK4sCpHOwaGhdjUn27I155teZSmLa8T67ZKlSQtIt6
mQHIMdOKFmkh3LwKyHSVhaGfik1Gx1KnPe236K6bLo4inUU27reUl0//gJZUT1Ev
apDSIHDV95cEtv4LY2SwB96ROAs08WSDhZgt6wjI4WEqsENZFCQQ/rFNQ4E5tzjV
3ym5R4K3U3DkEao/Iiw34vBY8DOWX0VBESXwMz0t7Llsp+arwpPZ9bc9Jt3TqoZr
MZgf2BTlnjO8F33SKCd3jQu8LGDlJlueWcosiO9s0/M55ZPNnpAs/tklHTT1eUFU
ZOe6g/w0YUcZLTVax+rIbw0oPaWHLw==
=z58D
-----END PGP SIGNATURE-----

--Sig_/R+49YQr2h5s0cRUruv9UrtS--

