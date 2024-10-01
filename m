Return-Path: <linux-next+bounces-4030-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C798B2D6
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 05:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C01F5B2193E
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 03:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52561AED56;
	Tue,  1 Oct 2024 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uCCf4Au2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA58C1A3AAA;
	Tue,  1 Oct 2024 03:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727754732; cv=none; b=JzfYrirLasyalxQnXz3W/v2e+Q0gzm8oPlEXwzjjmRDbqyFCVSRRsm+3KF4IMqCEpuU6MFoPLS5tSlR9OUsp5m0XdICqsG2Kp2lDNCtJv6dmyUs9fuYLzB3HvQ1acw8oBdHyRlzzW9waUvxlhK59vLMW8gB7euQ84YOm0muWUik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727754732; c=relaxed/simple;
	bh=DcRWrrGJAri6AdguceXpkKUq7hKaFxyUUekhAkDbs/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OdFYrFojvNTyz1W8UnzZuPNgGvD0txCeVivDH0hdUdsIN6X5d/p21DlOH+M3w5dxx8stOJkFp0ecOtjrBy1EpyrgzCkV+ER8vZ9UMuXuNi2fEbQmksrmvNgJQrZdb3lY/7MiUC0aHtFEaNKRbRtp+fzXSzfjjaYVATTh2bqiQ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uCCf4Au2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727754728;
	bh=ELGYu/Pky1aqsFUbAJ+ApNJBCboucc0mGj0XH8x9Kls=;
	h=Date:From:To:Cc:Subject:From;
	b=uCCf4Au2TsqFEVm1c84uRGaWc9YHb4odp2U64OzBSO243KV2gMwZfoyvXBiS3hbQI
	 Wwbc7fmXRGsrLtRx8FvrzfY36C/7qMrD+15r/MZaohj8iJbKjRbYJgTbRJ82LJwgqz
	 RJzw0lVWzPvtrLRP5MuLxNS+kN7x7OEFh1qEkYWLPGGZERrJ+NuyLyOBAxGDv74RKr
	 UCt/P7xMNYpa8NSsyw/AJzAbpkUzNgvY8PGAbKMB3aC8OVO+LoTlPR1vSUC/+p84Eq
	 xGrlxHqGjgUyyN0xR3zspXv0bhiOoOfYHVLBWSOX19ZaJs/9QPt2Lexi/zIEknnIRo
	 wHOT2uyGzwZSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHkXS0xTdz4wb5;
	Tue,  1 Oct 2024 13:52:08 +1000 (AEST)
Date: Tue, 1 Oct 2024 13:52:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the pwm tree
Message-ID: <20241001135207.125ca7af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7rQLoL7xvK49+Xr_dnS5=bY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7rQLoL7xvK49+Xr_dnS5=bY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pwm tree, today's linux-next build (htmldocs) produced
these warnings:

include/linux/pwm.h:302: warning: Function parameter or struct member 'size=
of_wfhw' not described in 'pwm_ops'
include/linux/pwm.h:302: warning: Function parameter or struct member 'roun=
d_waveform_tohw' not described in 'pwm_ops'
include/linux/pwm.h:302: warning: Function parameter or struct member 'roun=
d_waveform_fromhw' not described in 'pwm_ops'
include/linux/pwm.h:302: warning: Function parameter or struct member 'read=
_waveform' not described in 'pwm_ops'
include/linux/pwm.h:302: warning: Function parameter or struct member 'writ=
e_waveform' not described in 'pwm_ops'

Introduced by commit

  17e40c25158f ("pwm: New abstraction for PWM waveforms")

--=20
Cheers,
Stephen Rothwell

--Sig_/7rQLoL7xvK49+Xr_dnS5=bY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7cecACgkQAVBC80lX
0GyOGQgApAEBhW95BYszLZs0/IzJWN3PcyrDkW9XXpMn+FCucYKSQ4uTaMAUZIw1
xQyT7GhgkLcAdJyxf86nRW4WECNMQd+LQSh5AzZImaf8S5CX93Fef5cElzRooVw/
75v1O2Gfh2DbR3txZh28ETXMLVEg5a3LKh49+f6wbg543brbBaQYhRpi1hQbtA9S
gYpVrS1Eszb06Bz30WsdT0kKzPDnk/DAgTQEpqBb1kQAd3ob5Vt2odG+kB+CPC4k
NrIiy0RV9BlZHGP0YUEz0RYA/8phAZ3J1woQIkh82da7FcOwLSTgnwHTgJJjT35x
C6rAwxgxHR5oN8XZSYK9ig3CR9JqGQ==
=WznU
-----END PGP SIGNATURE-----

--Sig_/7rQLoL7xvK49+Xr_dnS5=bY--

