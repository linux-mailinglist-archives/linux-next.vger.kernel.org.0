Return-Path: <linux-next+bounces-6671-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3897AAB2BAA
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 23:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1B318920DE
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 21:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F45261576;
	Sun, 11 May 2025 21:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f2P5ZL8x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0F825C70A;
	Sun, 11 May 2025 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746999766; cv=none; b=QFFqvTXuGjxvz8493mpObjLNJawsCCkfgPfctexX67W51Q4boZIG8fYjVrUG5AYKxB8AgyPh1FCpomV1/TnEVoLusiC3+ip1D0X1uVo9XoOZSvTi2h5njg5UsbvHqj5Sl9p0Wx0oqdOdtqlyh3vaLiKkASVcj4Vs7Vtx9VqA2lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746999766; c=relaxed/simple;
	bh=L/lDF9XcO/AKcBn+DW2W9A5Fj3KSW728ejIa5Ys1Ko4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b0HsEoAXZyf3HoD4+6VC9kd4uA4g5yWkI8I6PKBo/M2DruYPNGhdf86ETIkKgrL4sv5p094Hczfgcu1OiMWdxH5z4FGll9kHyN5M88TdvD3Uf8T92oQ2HCoxbLkPun9cHdVkl55JWXXcGgsOmW7CempmhJMSJH3dM9kd7pgfPvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f2P5ZL8x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746999760;
	bh=/m4poCglLhklMvQ7q10UpOJWYlII6eAFnD3+mM2VGeA=;
	h=Date:From:To:Cc:Subject:From;
	b=f2P5ZL8xFAU0an4OTylMPPizs2k+a8zRfBk85EP1vQYvQYY6OpSbl+AMRCqlUWB+j
	 Y1gB44Pizkf5KnNE47W5QtC8OPm1KazTd8EpnHYuwIcr8ziG+aT5IYcDBL3XekWnPf
	 d9drR2wWvD4b/onvFhyRwMSua0+hMwT1M71HQkOuSq1uezTpkcxSQEYyQ/h4Aa0XRo
	 AQOtXxs5Lz+0F9X3SVu+CtPI3vP3vNeqS7BgY+KUhWnw0Ez0EBg7sYj251HsTifJhK
	 vVdBoAp9qhiBOumoMdOnhSNTI+hKue4dApOgKeK2EHnzclRIUcQLRXv6WatuVylHqu
	 8Vbwhsb4oeMsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwbnD168Xz4x1V;
	Mon, 12 May 2025 07:42:39 +1000 (AEST)
Date: Mon, 12 May 2025 07:42:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kvm-arm tree
Message-ID: <20250512074239.24279712@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O=NTMzlozE0A=__Eg=eUk4e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/O=NTMzlozE0A=__Eg=eUk4e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  bae247ccade0 ("KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mod=
e")

This is commit

  859c60276e12 ("KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mod=
e")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/O=NTMzlozE0A=__Eg=eUk4e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghGc8ACgkQAVBC80lX
0GzUcAf/Ub/p/g1ECJ0BSCFGo+uhMbRhoyBKy7vmb2N7ZdDhFK0ImXVKW+zhT1aN
e+8zqWvxJ8hD6OU2OlJy8NBgc1vcdnXGy43ckRmDhRbt/rN51ksajQKwKJi7Obd3
Y0mYVCXOcHEVz6AcbDTHc4qVmqDg/ckEB+fASbh2pPykWye0ceY14zOv8l57/hDu
lMFUyW7o8ThfhqTdvNl+uSZIS11rc2zl/z3v6duq8tijKuLj7u7QNe1xelkMxD7G
bx227VsBJX0hUiEE64/6uQX6b1q/TH+f5SNQiEPECKmn81vZOD98dMMj9BTqt9qy
NWqgWsZo6dDIDp4eoz38zP7d377MkQ==
=43IJ
-----END PGP SIGNATURE-----

--Sig_/O=NTMzlozE0A=__Eg=eUk4e--

