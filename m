Return-Path: <linux-next+bounces-2395-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A94578D1128
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 02:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 649EF281E9C
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 00:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC481D53B;
	Tue, 28 May 2024 00:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SrXXUt1A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1302D515;
	Tue, 28 May 2024 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716857552; cv=none; b=nvicFtaC30S6trWuFT/Li3f+49bDX97TA2G9aoYys81o1dzdZClDdk/fdgBjUVsyUsvxrfTLTGghh6KqAA2zWas4LYP8PDJ4Ca3q4JZLio12TwhzwVX+mDSWC+p/AJs/TZs7flZcz9ql2sCJEplKTlS8OtbagiNp+YrRkEuXlMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716857552; c=relaxed/simple;
	bh=L+VGQ6NWofYTWLNAe93oPBfriTky8plktD2yHWKTgEM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDLGI0AcZRLM+lCJGXi2BesD7CRK0j9DYqSRkGkZmQyLlhz0U3MUc3htGZNLAJjd4Qdx976DVLUilsTctX1RVzFz9DtUXNMhe9TkqaaJ+cbVpoJx2W02s3sz7iFwGYgNM+wvmKQUfHCaiYc6+T4piIJWcazVv1C9IHFYF8Ux3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SrXXUt1A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716857548;
	bh=L+VGQ6NWofYTWLNAe93oPBfriTky8plktD2yHWKTgEM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SrXXUt1A2R6yPA/vIcGMlmCoB+BLvGCxLJOwTjlaIs0Dg1MFLIcMWJBZUfrh9ArwE
	 SEYCdcDxBOSFU7GtJUWSJjzKWL5engnEzWfagnYnkjVdYurZQrXb9p+P22YZkZbNFq
	 iNM36wCK0UV3ZlY5CX/YvrpNVOevPHDi3UFBAot2AXb29moEYZNIOStOcUQHh1o1u3
	 N33f6/MdxVocuiyxB3w2f8IAdjORXPbuG7pERWTx4CMkVHvd1ysWgPlyJqeC1U4YNH
	 /v2cZbKrm+PjZr2PTPfKmvaRuBRZ3zufLqG8JkM+RlJenmrOVlKJ8eZjGnzgtD7TR5
	 QExVts/WSS9yQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpDWJ3KThz4wyw;
	Tue, 28 May 2024 10:52:28 +1000 (AEST)
Date: Tue, 28 May 2024 10:52:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, Likun Gao
 <Likun.Gao@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the i2c-host tree
Message-ID: <20240528105227.003df9eb@canb.auug.org.au>
In-Reply-To: <c0cd58d3-f01a-4852-bf8b-fee4c865e4e2@gmail.com>
References: <20240522104128.37c646af@canb.auug.org.au>
	<c0cd58d3-f01a-4852-bf8b-fee4c865e4e2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m.CJ=+/i/Y1Ul7Ro9H8fH8d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m.CJ=+/i/Y1Ul7Ro9H8fH8d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Heiner,

On Wed, 22 May 2024 07:33:03 +0200 Heiner Kallweit <hkallweit1@gmail.com> w=
rote:
>
> This conflict has been resolved by:
> e22e0e483b2c ("drm/amd/pm: remove deprecated I2C_CLASS_SPD support from n=
ewly added SMU_14_0_2")

Sure, but that patch is not in the i2c-host tree (or a branch that the
i2c-host tree includes), so I am still getting this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/m.CJ=+/i/Y1Ul7Ro9H8fH8d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZVKssACgkQAVBC80lX
0Gy7ZAf+O54iSP4naE2104t3+/M2DJrDGYF0gxTI+kAX/h4as7OjsByj+sMsS8Or
I9QOaEHL9RwdZQ4mqE3AYhUlVlRueKfg0go26qrRU23x0ZxGck03CTxb6rfMSi+8
ojIR+J/x+1HMqyQvU9YanQlmAmp8E0I1rccblRqK+q/KqkglhMeNDk7wZwvbvv8L
IQVifQ2G4Ooa0T69GMehrtEmhZo4725ZF9i7G9gxXJLfBTh10/udP7cl/cE490HQ
WD+6gx9MzwgZYG+U+Han0E0ccdIkZUUN605BWL3EMWAAb7P46UX98BhEw7TfHJcv
MTl9P4RoeVJW4/sJ8g/PY4HExWpbxw==
=R/Wj
-----END PGP SIGNATURE-----

--Sig_/m.CJ=+/i/Y1Ul7Ro9H8fH8d--

