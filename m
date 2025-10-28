Return-Path: <linux-next+bounces-8730-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A33C12A8C
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 03:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C3644240AB
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 02:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCA623AB87;
	Tue, 28 Oct 2025 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MnO0HyJQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C684621C9FD;
	Tue, 28 Oct 2025 02:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761618222; cv=none; b=eD8RMDvmDVsbgxg+KZqOyeApEcnqUJdYn8k7OBVxyfo8VuExetS3j+EsCRNOEqaLZ/zJrEu4gjghoY9O4SfYxYSEMtEHA3G42VSj+4IZiC2W32zmJJQ64oqv3TktM1DoEVyFiwQuLpxhqzHn2NngdCA2UEGQsM6dK3sGtaXqDrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761618222; c=relaxed/simple;
	bh=VeNePi/i+bHHq+p1c3CHSObE7pD3F7o+kpx8ZoDEVPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h5VaowSgypybN2XHwh7IgMLvfAEom2yiW04VQJ1l5BNSjmPLAtn7XP1L9Rean71rCe41VYFXKcaaQN7M6twUkwKekVrwRhF6acmI1lkEsNe+Qb8abmxk4di5PuGGfI4kqexucwr1v0IpBRPh2f/DTjLfG4Kldjiev+w+smL5MKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MnO0HyJQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761618217;
	bh=peefixLIQzr56ukIq53JtLaaVRy/njFpB7aeoSA84HM=;
	h=Date:From:To:Cc:Subject:From;
	b=MnO0HyJQlFVCFaPdSYxMIgaCb6fINP3T3xcNQgvKE4ExxIszyA8aiW+sQK2WQONaV
	 zI5rhNItRNujabQdp1Nm+h1oh1XRP7bwFu3Z3kV1HPRosSsJJ/+o5hsa+w5LifRFcf
	 PqlBpc77LCiAwBRRqkMDgaeoGx+uOxGK3v7t7K6ocWS69urqN0E7WXq4axQxA9bPQI
	 yXkxeagC63DZx9pnZe91VvSGukXF3DIjFUA9V1J+lbbfYKeBrmtMAhUcdE+nBTSNNj
	 uFArmB87X8neg1JFAmFojjc/3dE1391tHvGNz1BhuSTAu23bbvlpgQCx3bSUizpt3L
	 pF6ZuYVl6U0zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwZ1P1G3lz4w0J;
	Tue, 28 Oct 2025 13:23:36 +1100 (AEDT)
Date: Tue, 28 Oct 2025 13:23:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gary Yang <gary.yang@cixtech.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20251028132336.66819cca@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wehTsyD0wBGqfTmh.nDRqXS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wehTsyD0wBGqfTmh.nDRqXS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "pinctrl_provide_dummies" [drivers/pinctrl/cix/pinctrl-sky1=
-base.ko] undefined!

Caused by commit

  7a97fa0eeff6 ("pinctrl: cix: Add pin-controller support for sky1")

I have used the pinctrl tree from next-20251027 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/wehTsyD0wBGqfTmh.nDRqXS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkAKSgACgkQAVBC80lX
0GxDkwf/aIqo+48LoZtd7CEbaBsLGF2G64dS+3syKjENdEVDnbAO7BHAuUKk2cpB
rW1H5miKs7pawn0Td6gWUbh38hwdwxUvqQ8FPJrqLUr1nOhjd5D4Aq6jVN7fAyAa
H/KI3m+PvGSSvl+RxlEDGr1L6M5TtW4AkNA1gbybr+Pb4kCxqcXmwkmcbNySsYVi
VAn7sWhoujKqNqV7t3N5Fh658gx6WfwdB3gfmiSEE/sfXZEPJN4sns4SVO1JBMcC
nzzV/N/gknch/mq8eQiSYf1UggGKURVPpzz+7MM9sUdGcUgpVTRtzqSoRqWDntmC
2n6WRw8o9XycB6UZO21vx+mIGAVMqg==
=E0AK
-----END PGP SIGNATURE-----

--Sig_/wehTsyD0wBGqfTmh.nDRqXS--

