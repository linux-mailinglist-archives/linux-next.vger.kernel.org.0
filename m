Return-Path: <linux-next+bounces-7908-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB603B21B9F
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 05:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06481A2793C
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 03:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFB22D8365;
	Tue, 12 Aug 2025 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WDQwiN26"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99565240611;
	Tue, 12 Aug 2025 03:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754968906; cv=none; b=EnkAFBNkZHyvvkdr8MNjGDLoRhfvaMM7rolFXmP0kg5WMv6D0c+Yfi/nRR1Cxj1KN8Ly9ftD4SS9mvUzCdW0MO/nOZKsSf9y4VooSzIs+Aam1chcJb3RYBFf3/TeTClbv1u4xiR1gmxLzhQemP/hBfzpwDmXGUHg8XASvIwX5Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754968906; c=relaxed/simple;
	bh=Y951hGZfoesU2QrL9JWqCrWguO/lZIcA5b0xIPnv5Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HH2x4Fs+od4rgzXFj8jnlHvjkaQP6TU2SJd+iYs4kZUEu9s0BI5xWhrRsEGSxJjIYybWpY+YslIZKKGFS1ELZkPEdNlp4kTrWe4VOk27qLysegOgchLy3QuJTpcfR8Pnu8JJQybV72TOMPnCkUhiRjtmzCGw3hJk4kfTogF7o1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WDQwiN26; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754968900;
	bh=uduF2WEF7XSb7XuEoby5ZlSeBspLl0vgbpLHLGFxAIw=;
	h=Date:From:To:Cc:Subject:From;
	b=WDQwiN26X3sGwMTSchZKgKQLbWVECv4sqHMDhKkqIncIx2ihAhB9UQVhM/4KZP4LQ
	 cD7D6RVYh3dmXCQrCgh3zYettv7JFNxyV+hgkmbp3m87JmoLoadyfCOKSFOVTFLzdN
	 /630rERdzrE10DyWnpJ1/mgrDvEPt8IrtKnQ5CGBwRml/maTnzAeuUCIUskiosKSJL
	 f6axO0XGYBnByC4UwgpvWLT/mg0KHn6u0CqOvCZWQGmqFBpaDfKnlD5NVGwuBh1LMj
	 ttVgpA2PezWzuuhaTrMJQtQYuP0iqmtkBdvCdxIsZeicbvHbYNDOfVQB/g69UoeURr
	 oyee9TCcAv0Qg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1Gxw3GDyz4xcW;
	Tue, 12 Aug 2025 13:21:40 +1000 (AEST)
Date: Tue, 12 Aug 2025 13:21:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pwm tree
Message-ID: <20250812132139.7813c65f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ix/4GX8wN7q/w4D.0Wb0ne/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ix/4GX8wN7q/w4D.0Wb0ne/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pwm tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/pwm.h:357: warning: Function parameter or struct member 'gpio=
' not described in 'pwm_chip'

Introduced by commit

  1c84bb7fc0ad ("pwm: Provide a gpio device for waveform drivers")

--=20
Cheers,
Stephen Rothwell

--Sig_/ix/4GX8wN7q/w4D.0Wb0ne/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmias0MACgkQAVBC80lX
0Gwhnwf9GVofnwvxRE3H+8K8gLC8kI6VNpTISfN5587TBeij2NJBUaROFIm6pRXx
lEWZWzUZWF1HF03IkjTdsfHIDsNVD0Hg+E33XL4jpQH3REnc74Bk8BVG7weEIVyS
YW2r9gplUVuV6buSBx86zk+E4OfA3FqMdP16oVrj6rPTmG/ZxHXxQRcDH2x0KpX/
+S2aJXA7AkC5LBQSCCCj9cz3CBCVp/9qg5c+MrsQ3gvElsDhDyTWfUo9eJ1gsi9T
8u3ejh3rUBVln0VXtSDT5EUmZ2HLS+A0FjSija0budNhJYF+oeZdxJEMGBV+p4P6
IVByVL+ZSDLe3SF7f2oI1ydvEyd/wQ==
=ziD/
-----END PGP SIGNATURE-----

--Sig_/ix/4GX8wN7q/w4D.0Wb0ne/--

