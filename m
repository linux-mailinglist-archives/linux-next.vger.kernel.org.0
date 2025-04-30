Return-Path: <linux-next+bounces-6462-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF78AA4916
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 12:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9965E4E126B
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DFC21A43D;
	Wed, 30 Apr 2025 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cRkAuUPJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B17621D3D0;
	Wed, 30 Apr 2025 10:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009923; cv=none; b=rkfvivmuS67bpefqfpVhUc2ztNOfvl+dnoqwCjJHS9TohNQwiPQYSHVJfLahktJrxneq7r9DXoKnVtg21vGIsGY5BWwDkoNRxfNCTlu1kiyiibpcuQzM0C91ujVTrVCfm5G3oZf8q5v9+fhLwaDQNRU0pHAYeDssLJHUNWnmbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009923; c=relaxed/simple;
	bh=8OLuWRSy4/PY/DRTZ8WRErmy4qt/pM83nsGPSxonVNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Kfa+q4onHLP66fxxyE0JSCK/Rje/YTZpvVL3WH2oTaekziCPdTeWnRf93x1syaESkXltzk11Eg9lTdSM1gvsZ6mGbHwTZ3QuiIM51U6L4akZ1dFikYlIh9meplR7Y6zxyfD4yb3zc1yDZeE/B7DGEfGTeOV4Qehq5361IlLJK6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cRkAuUPJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746009919;
	bh=YHreHHoD4cA2NAzGs9gOI7Gl8l1sktqjrl1VmOZkRnw=;
	h=Date:From:To:Cc:Subject:From;
	b=cRkAuUPJUG+z2SdQk3K2ElRUmJmcU9kVzWbHe9WshXzvr66NXRvEpX2jIR9sbtHto
	 A1ZMe2+DU05z31p+3NgGbklaLCYqJuqmD99JDgqg0Crb2ec1V2NW2JkTfA3GwtlWal
	 EK0riqwcdQ+lzDKca4eqyovzDJExbEDrdOoSbrH84i+vWLSE941WLVZ5SoY2+GCvUB
	 GIGJnk8+1EDMBuNiN2KCXZOEGvF0yc3ZkrINaniH2tLgziD82ZLfYrctfV4S1/Vspf
	 Ug7MBb01Ij5WKQhI4wRlBSapsfaJn2lXwLNTsmIe7b/1VG0TjoY9E3fjf+G46gC3cF
	 /IEAVd2FpfVow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnYjp2BGmz4xQ2;
	Wed, 30 Apr 2025 20:45:18 +1000 (AEST)
Date: Wed, 30 Apr 2025 20:45:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Message-ID: <20250430204517.75d88615@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HYyz6.e/+VjElx0doG9KQWk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HYyz6.e/+VjElx0doG9KQWk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to no=
nexisting document 'hwmon/oxpec' [toc.not_readable]

Introduced by commit

  fe812896e55d ("platform/x86: oxpec: Move hwmon/oxp-sensors to platform/x8=
6")

--=20
Cheers,
Stephen Rothwell

--Sig_/HYyz6.e/+VjElx0doG9KQWk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgR/z0ACgkQAVBC80lX
0GyVXAf4pRA67S9AVVDx9ZtXeVA2FqnHCKbJLUK7650EURP2a5cq3s65FsRb3iry
9/qQ4ZP9+MGtUYTDR28gejaC27jq4qMtZDNX7BkkdPQJqTEW37girojEqO7Dz86z
FuDcq2UQWZpsTZs5s7pVy90ILwLaLgS60sKWylSnepW/FCXtkO7wULyNZlGf5tWa
ddP2LY86TGCsBzc5+t4C6o51AJbD+ClURcejP2Fvk/y3oH62kTxJuP2Cpr+cSm1C
TXLHYXC64071vDB7hLrughIiWaEBCKueSoB5bkBt4CoqrQfkmZEesBtKwzUX70q9
5CrTWMS6XRK865QI//Be+OCekldi
=88xu
-----END PGP SIGNATURE-----

--Sig_/HYyz6.e/+VjElx0doG9KQWk--

