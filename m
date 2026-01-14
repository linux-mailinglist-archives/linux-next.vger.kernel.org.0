Return-Path: <linux-next+bounces-9651-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 540DCD1BF79
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 02:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEDD33012A67
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 01:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49C11B6527;
	Wed, 14 Jan 2026 01:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WF9Bk+xa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24CB2D46A1;
	Wed, 14 Jan 2026 01:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354857; cv=none; b=KtHajlK22DpiD3Kju2km63Jns3vZQcsHK7o+Xf7xb8LxF+SY3gM2g30E0Vrn/rzBBvcIZo6oI+3c545HnYryoMdNDiRNHpqDDWhdMRA3PEiJhkOh978IaKCVOMLGilGbRtVdXe3eX49CJF/4D4i5rNvndh7vlStPNMYj1tPJfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354857; c=relaxed/simple;
	bh=ieEVsARXL1ckT9OeVYqXm4Q12th7feMvLo1p5nOSUNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f0qcZB0YjYu6kiJqdSFhKhx34jEAam8rEVe/LD2zcMiuyYG14UpAk5iothzF6MtCKV8v3LN0WOWU0mo2lvIQ6SAqec9IEEmak2qiFy+OTsudtpT0nyPbQRYGhZ9LIF5yOwkYNCdWdnpNTJwV82o8QI9O7eq5XU2VkdNLDk0Eqno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WF9Bk+xa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768354854;
	bh=zCZndZ4nCTz5Ek72VpMc0nE8OZNy92mK2Tk+I9olkB0=;
	h=Date:From:To:Cc:Subject:From;
	b=WF9Bk+xatH3LodAUfyIURcxPOIYInGI8VF8ZWZUrJk76WgtpqLKxvmKUJGJTMbDJg
	 nlkY2E/RS/sbuPPTUlJYSd9giTMqKrScx8sNTYG8ahUd/zyIjqrQpAVK/eJrq6/4lO
	 sM9ysI+nAfTQguC4lGeezPIPU4IrM1Mv8qLFHwvce+zTxUyMforCaluwdTjvCjfeFV
	 PhkgudlczgPr0+f2BxBsrEi72KRSOJt1Ij75bnloDRADoN9OSr/uBa7Gii+3IaqMMz
	 39bGYy5weGGUQtkvBpMsZkHrMb6uhHjWS60Dk++QQx312uHNVKAL6PvDhAiWzztKyX
	 BJxNXRzQetvVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drTN56qT0z4w2R;
	Wed, 14 Jan 2026 12:40:53 +1100 (AEDT)
Date: Wed, 14 Jan 2026 12:40:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wolfram Sang <wsa@kernel.org>, Alexandre Torgue
 <alexandre.torgue@st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the i2c tree
Message-ID: <20260114124053.4769697c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A/NHAIPOPxAXnnROuP=kQ6n";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A/NHAIPOPxAXnnROuP=kQ6n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the stm32 tree as a different commit
(but the same patch):

  3068b9fa6570 ("dt-bindings: i2c: st,stm32-i2c: add 'power-domains' proper=
ty")

This is commit

  4f3af6d5ade7 ("dt-bindings: i2c: st,stm32-i2c: add 'power-domains' proper=
ty")

in the stm32 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/A/NHAIPOPxAXnnROuP=kQ6n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlm9CUACgkQAVBC80lX
0GztUAgApmIWWe7WdY/6xU7KdQ+1HpGGQiXzbOwpu6uwdCpjA5AZPKKY8Wb2m1at
3GcK8qMTWT28F46ZodL92DdDbkpPIqUTg5MsRi1Gd+QKHi1bLJ6jp8KloUVYQwQS
XHMhylS/etv+koCtQ8hoLRj+bfJxFfUL9h5XUVstrG4vVNy+t/3Z/JOGoOz30q1A
eT8VLkOVgzUp+5//Az4/XLi/N/dXlDRI1PbHDtusz0+v4xrTE3296LwC0Iw69xH2
kVyqmkMVfV+huWvCZ08N5vXV1ZvjOZ2N83ORcsVjvlIdEYaM6Gnzo1jXWSHz98lL
uOEl6LQ7JcDhdG+Q6Q2L+vR1hP5wwQ==
=ywKX
-----END PGP SIGNATURE-----

--Sig_/A/NHAIPOPxAXnnROuP=kQ6n--

