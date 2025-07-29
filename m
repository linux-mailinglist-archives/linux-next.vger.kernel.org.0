Return-Path: <linux-next+bounces-7738-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD702B1472D
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 06:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2069754339F
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 04:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDE0230981;
	Tue, 29 Jul 2025 04:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="crOwAMm1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA47622D9E3;
	Tue, 29 Jul 2025 04:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753762948; cv=none; b=rz/VetBp2IFDVnAleV5A8RFKGmwQiorIEdVBwRmmjfyCpJ/A6IoR5HRhDIc9Vm6+wt6iio4jr0S4bFUL0ilrKIFOW9SBIaWZaLUM8dU5bLe4kwaMJnU9YlNPL3ggk35hSx3SyJ/ac5R+E1QJlHFwzaCSFPox5x0ty+qOTbF1h9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753762948; c=relaxed/simple;
	bh=ol1UriP10WVoMhKOoE2Ub9lirBxAK6LDSTDvbvhG+K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u69WXUw+fnvkqc6Ze1a6Ng7tigIsYzyQxR0yDWamhI88+5c24ilwy+FlMLdF5AyGObgt3a/KtIHSpY2ChVb/YA35fdCH6amKft2+yg0ayY/MWd34UT1ynMmRgnSCKzyLUfiIAUliWyx0EILB8lUm3X/315pbYU3G1xVIScPQBRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=crOwAMm1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753762732;
	bh=b1pgfzOeL6zW7c/f+GSXABLpurJPDHjEPmQJcVaOv/Q=;
	h=Date:From:To:Cc:Subject:From;
	b=crOwAMm1WSUpvXwkSdRAhZb6WOAni3HJqe07kTD6CRMhwMvPdlaEnUbhcoA5v4frL
	 MPoc2cONvA/mUGf1lbeEmV7owccLx6TPN80VPXBA4i0GgA/BaOmX+hmF4J6g9AfjwX
	 +4VNxl+jdikwZpUvAdt/qhYIsDUXUQ1F/x1LzZt2stHVVUD3SG9xvDZh+lkWLONNsy
	 FI3mIzhMMI0gpJ35NmotYzB8LQ+odakwuPLYvIl0aaW1v+lScSvDI8+FohjJaURyTm
	 K7NUlf2OETgCok5GS+v8ETzWuK8y4C1KuiDGHBSOK7i3R5VNk2sZw5rbFjnkMqyPeM
	 hDIlml249LeKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brhtM4Wm0z4x43;
	Tue, 29 Jul 2025 14:18:51 +1000 (AEST)
Date: Tue, 29 Jul 2025 14:22:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <20250729142217.0d4e64cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KprrsJ8NBy9QldrZb_cea=W";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KprrsJ8NBy9QldrZb_cea=W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-arm tree, today's linux-next build (htmldocs)
failed like this:

Using /home/sfr/kernels/next/next/scripts/kernel-doc.pl

Sphinx parallel build error:
docutils.utils.SystemMessage: Documentation/virt/kvm/devices/arm-vgic-v3.rs=
t:128: (SEVERE/4) Unexpected section title or transition.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Caused by commit

  eed9b1420907 ("Documentation: KVM: arm64: Describe VGICv3 registers writa=
ble pre-init")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/KprrsJ8NBy9QldrZb_cea=W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiITHkACgkQAVBC80lX
0Gw8CggAjByaNZy0QUPZymea4xAijNsebWi4eYv7myXTyyXOOZXqYpj/R+0wKe/b
Lde99dbXB41aVXhK2yznNdF32REp45LOZboUtquWI98OwOaY+SJI/fVKQFbYB8g1
Qwnna55JRn3FMhJD/d+EI+iy5tuuq9grsMx+mItUf6h0q2VYRc7o5NW+1cNs6O9B
nlcfRqpuMGZJ3DbbBFD2BXypusivsBddk1cITSwsuzYN3mS4RxSiHZV9fKS69sfk
AQ5G/2DOae4fv7Ktduq9fevzfzr91Hy7+nn+bpsYfrLZZ7iAIz+UlEnSjHvzV6mx
mQi6MSc7N08KDHmkKwYdMZG3YZFOlw==
=aG6k
-----END PGP SIGNATURE-----

--Sig_/KprrsJ8NBy9QldrZb_cea=W--

