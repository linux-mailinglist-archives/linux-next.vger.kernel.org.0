Return-Path: <linux-next+bounces-9035-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B9C624AA
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 05:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6127C4E13C1
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 04:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0FA26ED4A;
	Mon, 17 Nov 2025 04:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HNp9QL8M"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07CF2264C7;
	Mon, 17 Nov 2025 04:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763352839; cv=none; b=XFqG6gWjaA2FEsVfcs3htQrGmKH0EaM4pSMVhw/YD5PwuJDhnMYt5sn9dkHsbuPa0Gxp2a5Wnh1/5DaMB3fs1ZN3g/WR6V+Pn4Iq+tvulzK8YWvrbF6aoENUk9juSJukrsF9uoonhdlDCvOfM32Kl8gFUU9jGVJVg3bKZr38ECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763352839; c=relaxed/simple;
	bh=5tnrMDegO/GBQotzgYoW6CRbu0Z/KdPnMp00Bju7/CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aWW02vPY5/LEl3/yQLDIehWoQ4OifeipyZVJwJm3J56sVXceOkd9vjW3ZfyA8yYHb2gyNhOiGh1/kMox9cqL+T716jfx7wMJjpeflKfHUK1ummoVcPwJFFcEryaVx4pv+e5UH95nMnzYZs8UbtBxbHyH5fkdOChTVYWxbn7fM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HNp9QL8M; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763352834;
	bh=evpX3JGMrauLIOdxSdQp6uhddC0sazC02KWbNhVY1vs=;
	h=Date:From:To:Cc:Subject:From;
	b=HNp9QL8M17/mjBy/fSP7aQMPCAhOx1dgJu7hiTYyd8NPae87X88cKItCGnbiNhrGp
	 R/hlKElz++j0291ZKGao3wXl+OJEFkoLEOU7FcughbHkZArNRkL4ElxL4sJsO82oZA
	 c77IONZi9Gixll1vkTPg4xie0Z9Fmj7minl5G2HDMwWKvjrhZb7Vw2+zYZytugWxkP
	 9592nsTacqqAcmg54x97hyQScORda75Qf99FbkzRLfJz9HBNBtrP7cx7IwXSchMv9i
	 xhyLS0oYZ4xKtsv1palZ/WlFTnUPr21VgFksSrLMJdUoJ6mWL3zcXs+mQyCjYkxRrM
	 T3Mcyc2nb69Sw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8vWQ0Dp9z58bS;
	Mon, 17 Nov 2025 15:13:54 +1100 (AEDT)
Date: Mon, 17 Nov 2025 15:13:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the devicetree tree
Message-ID: <20251117151353.76f7bde7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8WyKebMeAik1R7ZmQXkD9c5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8WyKebMeAik1R7ZmQXkD9c5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

scripts/Makefile.dtbs:4: *** Recursive variable 'dtb-' references itself (e=
ventually).  Stop.

Presumably caused by commit

  e0f5d8e3fe94 ("kbuild: Ensure .dtbo targets are applied to a base .dtb")

I have used the devicetree tree from next-20251114.

--=20
Cheers,
Stephen Rothwell

--Sig_/8WyKebMeAik1R7ZmQXkD9c5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaoQEACgkQAVBC80lX
0GyyLAgAoixS05AxekrF8JbUlu0Te+vJuRgC15AFjCXbvBgVPYpm5u2FiMONAwEv
SnfTVRwspfpNks+q/rKSf4qd+bbuYVcBQaqN9O7PQDILEy6Fmxlp0kamN3fV5q2f
7pk7IrIrpNL738CqpgFcblrQzBbtNr0jiZc5P5QpotCD1YDbgw8UBEhR+31usM3+
zrmfgi7BK+cctXA8Obxlw8dMa0rfk88EYQpotxK7cmIK/Pbe7LEE0UxtbPCim4bs
P/GhQmVTjcerkghg6itIY+KHFsg5tUH/1rTEt0oVPU1lNLRkqWwreklzuDjBNuzC
FenCrW7QyGOm1QU539jNpcmEaqDwtg==
=PRGY
-----END PGP SIGNATURE-----

--Sig_/8WyKebMeAik1R7ZmQXkD9c5--

