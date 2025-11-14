Return-Path: <linux-next+bounces-8986-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 606DDC5B738
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 07:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81CE44EB21E
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 06:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8832DAFA5;
	Fri, 14 Nov 2025 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="scE/fio/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D5823C50F;
	Fri, 14 Nov 2025 06:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763100092; cv=none; b=uxtcLMoj5KH13T+U/+r+kYctU+mGqvhQdzeTSB50wKIavk1AG0in12CX/z/2FB/Q5bDWo5onIUf+EEw5wT4ttsJ+ultaXXnTJ5kaAvNbUgAyD3tbReIABg8Io9WErbjR5KPSPN80z5M9gRvmkgPiGKOjB0+PpUEhzsLreptTXec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763100092; c=relaxed/simple;
	bh=lyubtxI8+4bJPsKzGvX9nD+ayU9bGXVPFeRyTUZvgK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PKx2JGihyJsDVZGNLb3/PA8BsXSUNf9z7rYo0Nckl/UPQjLDpgqiasNu4ycCo2O86yi/B94M2O7HhKvdX9nED7pqHz3TQvMu2m8xvVHCVCl0PK0vS6RbX5Gltl+qFKocHfEIqBYh6WbO5k33o4UCs64YcdPQeHnoeUxXF1un12Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=scE/fio/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763100086;
	bh=02zD+C5bf8IO8qYYIlyTznEjet4Zj/yvpGlaFcxWns8=;
	h=Date:From:To:Cc:Subject:From;
	b=scE/fio/X4xOy/4giPIEiyGgVl21YFY9rVQfJSuGXe2Gq5GcBpiJlVrlHNv9cFkRi
	 eK+DYsTGU2o9cHbnho0/AWzkrd+gzJH5k2T3ri2KK4XDdGQNKxa9JiGfPhCqu4iTsV
	 mVGWdxJsDWjAaH5ydbuT2PxbmpDLFGCUcxDA/MXwfDWxad+74Xn+hGeRrfayrSSxdd
	 nVUMGXC0YoIgR9WcmzVuNNrrfL9lbH6r5R5HfpUXwhHS194R434oouviLsEWAowkyJ
	 rm6Y/5JyzoaKfZQxmiGdeSJYqrgBoYY0f8RIgvcMB7C46V9G9cUF7TINeyIRcxTJ7R
	 mszj2Aozds14g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d762t2NxFz4w9R;
	Fri, 14 Nov 2025 17:01:26 +1100 (AEDT)
Date: Fri, 14 Nov 2025 17:01:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20251114170125.2a8f6f3c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PtVPfeIkZrPAhbXrI6o5v1K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PtVPfeIkZrPAhbXrI6o5v1K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1a0eea58d21d ("Revert "arm64: dts: qcom: sc7280: Increase config size to =
256MB for ECAM feature"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/PtVPfeIkZrPAhbXrI6o5v1K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWxbUACgkQAVBC80lX
0Gw+bAf+NBU70LyVDghkrzDkm1g2UQvRj8GJ8OYasv7/m6bZF1uKiUeiryN4Pn5F
JhkHW2ffCcWhBx/RbclTPBLtLDHUV14iynvumoqO8j0HSdkmPNaDXejacuz8L9rw
L/K78Ha+ZMeFT+uJd0cOkND1hfV16NxEWpa5AZmr9VR732OUww0ogJwekix9+9Dp
yXavjtb+XJZ2wUCXznaZQdvYBD3wCTM7rtaMCgawnNmlP6xgxsdfKbOoJWOAoOcY
oH9QSrojZd5D4+edxR3d++TDsz1OtBaIXJp03jkaj1HRN8axgS8YIYE/c81P+V5p
jREXvWvk53ic0netsCZpR/Zwfwzcag==
=pYIC
-----END PGP SIGNATURE-----

--Sig_/PtVPfeIkZrPAhbXrI6o5v1K--

