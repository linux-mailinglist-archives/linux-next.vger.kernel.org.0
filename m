Return-Path: <linux-next+bounces-7787-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F2B169E6
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 03:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 276D818C6D16
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 01:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B539772601;
	Thu, 31 Jul 2025 01:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XO+hygm7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F9E56A;
	Thu, 31 Jul 2025 01:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753924259; cv=none; b=qK3UTSnB0yDD+migYCSiRVy8asLo2JG+NQ9cT/Bwt1FCRMF0T2QdYeuNDNkXj6eUknlNa0s/u8vyP1vkaMwEU6rUwzmQwI+YFw9qGkM3Yy8d9cpu5LXNyzu4ZbfTF1GpplG8dFbAY/Ngxgf26BYCRA4O5c/DvcWpZxVR4U2Geuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753924259; c=relaxed/simple;
	bh=lhjtenkVoSEAp46zSgh5YiODgG+y+bhfKQ5QXYbrhTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UdYHoIiPqnE/YSkzJ87wp7RNxYEcg1vk8a+L29/g0qHHR1Y7HLggk02FotKFA+Kn38WzOYLbkoqIOrsQZDv4bH3vAWjDFSQiDlahi4kcabIdLuPhcMOzDqiCeQ8OU1WKVPs6Bplx3gCsmiVyvU5/yuC2NB98bYiX+5qZ7VAAYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XO+hygm7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753924033;
	bh=RByfFOm84gFCuH1C3dTZYF3rk3CT71WUz0pewD04lSU=;
	h=Date:From:To:Cc:Subject:From;
	b=XO+hygm7GL7hEfIsv/UeR34pXE+HKdCkQzaJDgXR8QZMeMAgFBnre8c5EGo4Cq1sR
	 Fa2mxEOoI22Dn/zVW9Jsb462/0eXdG84T1u+/2nRETf48egQO4vUmK/0bHIOLXRPZZ
	 o1B3nr6uht0Nxq/r/r/ZjxBV5sG/4DVpEcW/FpSu12babmgbK2H3omiRRXolmAtOub
	 k+finnSiqosj5uNonToRUNU1YyqDMaPwSBEMkZtjk0Gbe7GcvqryOurrf2XyaBf9nx
	 W2obYR2qpIpqf97ZcpBEyNQtX7Pjai4scc9nEjhH6TDxMmjuLLqQxxj6/+Jm7EMJ4p
	 gxcVFDIvuHWYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsrXK2228z4x3d;
	Thu, 31 Jul 2025 11:07:13 +1000 (AEST)
Date: Thu, 31 Jul 2025 11:10:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the broadcom tree
Message-ID: <20250731111054.4081a799@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0takSCvwvQxRyGogS.dqchZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0takSCvwvQxRyGogS.dqchZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc-fixes tree as different
commits (but the same patches):

  abb787a63fb9 ("clk: rp1: Implement remaining clock tree")
  36e97205b507 ("dt-bindings: clock: rp1: Add missing MIPI DSI defines")

These are commits

  add858eff8c5 ("clk: rp1: Implement remaining clock tree")
  d516f0002b79 ("dt-bindings: clock: rp1: Add missing MIPI DSI defines")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0takSCvwvQxRyGogS.dqchZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKwp4ACgkQAVBC80lX
0GwGTgf/dH7HqrcIeWudOYmXBLwGKtbmZW+NcBHoqVKZSzGaiHBGlmMjZuoLIWfE
slvoasaDI5tVm6hR93AvMW+b6wMZnMz+0oOmAss2SzQSixMmfDkOMeqyXh3nTdxu
Y1zifC2bpRSOjgHuwhii/wmHaNdxpBfrJ9V/2pA80Mufiz2ZP0ymkIthnDv1nqqn
Yh/2fYt0QiWyXCaq/M97DfAkFJWRHkQV4TA9RILdnxu20hsNb+9beeX/4MT5CARB
aNKeBWiQpKnnCVEkcsKiofE4h/zHfESHYS4ENyQPnOI37GfxUxEXqvd9GUWnaCG1
Affb5bBkUt2gOMpeWK421F8TmGKKsQ==
=IPlu
-----END PGP SIGNATURE-----

--Sig_/0takSCvwvQxRyGogS.dqchZ--

