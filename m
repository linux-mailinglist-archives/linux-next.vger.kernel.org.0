Return-Path: <linux-next+bounces-9297-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1AFC9A01F
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 05:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46CDF3A2BED
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 04:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859D52F5473;
	Tue,  2 Dec 2025 04:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cyWU77mr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0231F224B15;
	Tue,  2 Dec 2025 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764649656; cv=none; b=gDkCER3EfwQm6VRX6sGgwNsppC0FjsAs43OQ83s0pUpirhY1DgqBG6p+3mY4sDCKn0A0PueCRAC0J0TI0Gqe7Fktm4aGEqcIaDHbkjw/kUcoTrfTO5NgXhR6hf6W5Y6X14EEzzUCH5qelT1lyk9T5T19kOqEsfr1FYGxhzd2YAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764649656; c=relaxed/simple;
	bh=IjmPiMGnq5LmQ5AURpkHyZbSpEdzZLe7jgE98e49r50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a5yYG/QaJt3DfHik+FF4fF7yvqi4IX4T5Yb30fmrFJFEVV0wcthGK7qP1p/p+f4Cg1IUL1kwx0EDTz4cPXv8Xcz5njYW4mHa6v43pg9nmjJB3qURjupegsK1JbYmnQTQHdP3ZHK3DX0xyKVtITZvxxpH1tAvjUWQZkuzfIDFn9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cyWU77mr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764649651;
	bh=MMWt7miok/giHkVvbune4+HCnAvINyohx+Wpyzq3ICU=;
	h=Date:From:To:Cc:Subject:From;
	b=cyWU77mrKdGbSrdz0voJ9nox1Ey5b7c9WFl7Ea4Kxnq2x85HpMJUNok553AHWThCm
	 tvfHgFUtYCWVPjAUnjPIDOw5vopzstda7PjrYMIgxiBWpOz3yZbmjHu1hkEs0TH5L9
	 YHP3Ujathgo6BWIKmixsbPwU9SajMyO8ckX5ZOvhW2o5/0mFCu3cjfLAMRH768oOB8
	 nIMgrEb9iTk3lEGNHRCMUiNrf57WD687rhQLHhenb9GNAUZXUsaCNFe5PsGmNdB7Ry
	 PkgjtVMX8ADo3Lw/wTEwFXxarBsNmCZOdgBK4cFvrJErrMrNEozUn2bXWgst8Q33gM
	 YhlkPxl0+TZ3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dL76B6lzPz4w9r;
	Tue, 02 Dec 2025 15:27:30 +1100 (AEDT)
Date: Tue, 2 Dec 2025 15:27:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the i3c tree
Message-ID: <20251202152730.57d792c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EaxFFH6z66=u2J+RugHy1cf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EaxFFH6z66=u2J+RugHy1cf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the i3c tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: include/linux/i3c/master.h:497 struct member 'i3c_xfers' not descr=
ibed in 'i3c_master_controller_ops'

Introduced by commit

  256a21743d91 ("i3c: Add HDR API support")

--=20
Cheers,
Stephen Rothwell

--Sig_/EaxFFH6z66=u2J+RugHy1cf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkuarIACgkQAVBC80lX
0Gz0pwf9FJxwtxwIORdcCr5SP4qObdpwEhXWywVkGVkqLqsmLmx3iCJyP1ozyrZ1
a/i1Ncb8qSTzXytTsPd8IOPCM7Z0Muo9q8taGebMjSQA0ub0yfWwo9h8AKrWJLPA
RIb86vQU88cz/WZCGiDelgN23vK3FN6BVIGYWnp38XCQBfN4zjSiVPuhF9bpIIIb
sRWkedMjDiPAbS5eiYTijKc9KwI+R40a4NlPajkyqhCbRAO1PfskGnoNxz7IsG6x
RL0lQukNN3LomVSKl1TYzPiibm1ZYy0dYWib+ys9Cqy98C4n7IuHpugKDS1WoW4D
NXVbm821jO9hlb/7PzGHh74bXjeNvg==
=A1+y
-----END PGP SIGNATURE-----

--Sig_/EaxFFH6z66=u2J+RugHy1cf--

