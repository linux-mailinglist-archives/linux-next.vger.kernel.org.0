Return-Path: <linux-next+bounces-6324-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78009A9673E
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 13:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3463A1E17
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 11:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EED277035;
	Tue, 22 Apr 2025 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fluzS+bs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DC51E9B12;
	Tue, 22 Apr 2025 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321054; cv=none; b=j+mNWQIyutvMp9v/cphTQ748aU0HgLxRUIgDSkvIfsIEsG5m4O5BpKjg7NJBQeHR8EjDcuPj3i3Wu6b+JwKbQPIeMe0NvKKb1YNFmHXONxjEmlqEyAtENDMcrSsXQhKN0hEMhA52H7f3ULgCDQLQkKE/Wy/vno7odVCWSnNZbnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321054; c=relaxed/simple;
	bh=exlBx8C2yZJCxdBiUB6FPqbyX4zGAsb/OX/GvrfcB0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ChGMFI7KgWSx32X/4BmpzAgzFA6Fiu4jWCUs97a1ux30MV8h8V8FaoBe2/XCEKC2E1Nwspti9kRPU1m4AccB7InK39GF5eBPIFPqkpu7pPK1YHMXxxLElfg2Ri0VpvfSV3KrySMqhdivz39YGxezWCJhFsED5yyJjSrihqoVE/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fluzS+bs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745321048;
	bh=b3mFFTyWgFTApsOunk1RkiHUcmLVyOwm9+U1FJw23/k=;
	h=Date:From:To:Cc:Subject:From;
	b=fluzS+bsQ1utfObF3a52My/W4AwoaaQs9e/x0C5OWZYyCUObPLQXflo8RvUI+g+DO
	 S00P8tq0ypGJCw4OqST9m4iX4Mt5/BsUZbpATHqnmHOHerWX+7gpwiiNrdRlDX41NT
	 hs9qAZ7Bt56HvH/7J5am6FgqT+wknl7DwirRIZQGpRyMPFbhQd2cZ0znnAzF3GR+Ev
	 m2wHUwPNVgEvjXzJoyohQmiNdtYYGSF0G8znG7N7kRfZ2gvo1QG8mgpzndATXoGcyt
	 8uOQxffU8CzhRnGPOlMUWpcV7JitKoeq9MWPxMp2mltxgMmSc8wQpj1dxXG+yGMSfh
	 E/axur1JYl6Mw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhfyH6Z2Lz4x04;
	Tue, 22 Apr 2025 21:24:07 +1000 (AEST)
Date: Tue, 22 Apr 2025 21:24:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amlogic tree
Message-ID: <20250422212406.39ac44f8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vkPqfkGnU_/0jBMa8fTmCYP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vkPqfkGnU_/0jBMa8fTmCYP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  0d057d35f371 ("arm64: dts: amlogic: S4: Add clk-measure controller node")
  72e295292d3d ("arm64: dts: amlogic: C3: Add clk-measure controller node")
  bc93a99ba90b ("soc: amlogic: clk-measure: Add support for S4")
  67c618a5852d ("soc: amlogic: clk-measure: Add support for C3")
  97533fc48892 ("dt-bindings: soc: amlogic: S4 supports clk-measure")
  e5635febb4f0 ("dt-bindings: soc: amlogic: C3 supports clk-measure")
  ac2edb9b7bcc ("soc: amlogic: clk-measure: Define MSR_CLK's register offse=
t separately")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/vkPqfkGnU_/0jBMa8fTmCYP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHfFYACgkQAVBC80lX
0Gyrawf/T8fC9D1KSxh3Z8Y0DUw8w4VPNT1EJkdnxsKBEeSgUnldtYVgBIVcJoSX
VGB+2xPY4QAvHwIaijdgFVzU0jt5aNIc2vpNsukWwqeKoEhwgtNfo376Xfm/CqI8
3aXLBpi6pbguUjC1Wf/qL5vFsZk38UPH6lorTZ/Y10dVkMd0FF3K7Or/lK5fn0Kp
BSfP4399CfPIwKfsDu1Bht4KC7qYSaCFH4ZyZeV61ouqPlTQqOJJ6rUn/QtQ9Nqg
Oy/zNCJURLN6mZxREn/cm9UpSxIb625J+Te6T7gjQRpsEUZMM+SKekhw5PA6i+Lf
1ue4N0FuocxSMbwYdlj5TaqtsCMdNw==
=i/sk
-----END PGP SIGNATURE-----

--Sig_/vkPqfkGnU_/0jBMa8fTmCYP--

