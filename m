Return-Path: <linux-next+bounces-2726-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66C91D4BE
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA8FBB20DA2
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 23:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666D93C092;
	Sun, 30 Jun 2024 23:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="go+9coui"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7D2C1BA;
	Sun, 30 Jun 2024 23:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719789639; cv=none; b=lAAsCH1UZ/doom61R8fCfC0ot/loyLERybFY9+AYc6V/Zur/+cl+IfITy/O+Se/XtbyP9DKFlQXK2DZfoUsAiEfn/6xg9P5IkMXQ81SVKj+liiFflemLUqIVn9vPRZnHfWTi7oL4gwQyM1okAuacjPhxnKmjuY/eFc7pu5xBOdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719789639; c=relaxed/simple;
	bh=S5baI+NPA9oRK3pbtGXWCH/p8vituJM8kbUrX9OrCPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=leVleA449+3l+T4A39I/fxPE0E5/gZLPRaYLrARawPmGhulIWKECoCC+VEYUi1WasC2ccMbp5gnBdpsS+7EU+80p8Y4Sd419mVDtv4P0R9fPsWacssQtD3xnWWOsjVwPXEwjnJ/g+KodFf8bX3ncIio5GxL8fuuDhw6hQVZneT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=go+9coui; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719789635;
	bh=5MRFvV6ReTyKSHBbNFr1y1BXHT6mpyDCq7FiR8sRJEQ=;
	h=Date:From:To:Cc:Subject:From;
	b=go+9couittxAyf8dLDcujnsFn+S8duZALl+6gBCuI6jIkc5IrnmHrorCyok5hv+8m
	 AJFuOjerYDfCywKwd2O4ie0JCFbR0I+1hX1U50NtScqxjLMnkwDPkEZfqYg3Fabzqa
	 dy9ViipkfuaKT03w09Ej9ZQl/MLNewoqeBQKf/hq5aw/Z1uhGvQE/4FfXK49zHVIP2
	 37xi51COCo8VzJhmORNqwGMvcwzFKMQ19Jck7dKDnf2yN8Lv3sU6p7dtdessuSLfMw
	 YCHAt8oTRYZwPVlCBCup8GnBteXfeXXnK71mPNlPLvsGnXUOOo/HenSGnUnPh73CUx
	 Fn5bTtEW7NTxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC4sZ4qbHz4wnr;
	Mon,  1 Jul 2024 09:20:34 +1000 (AEST)
Date: Mon, 1 Jul 2024 09:20:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20240701092033.26c70c15@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s=L8q7k1zyjJ91gjxn3fTuU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s=L8q7k1zyjJ91gjxn3fTuU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  4d593268f065 ("power: pwrseq: add a driver for the PMU module on the QCom=
 WCN chipsets")
  cb28daf2c4a2 ("power: sequencing: implement the pwrseq core")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/s=L8q7k1zyjJ91gjxn3fTuU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB6EEACgkQAVBC80lX
0Gycjgf9EvWLCjKQus0mQGyUeMba7PeDYisEbZEZLR36uCLvt8e4lGIpY7tCYCok
MB5KyRLA6FXwrFIJxJeZe08x+BYuCgZUoEU5BAJyvpQC+EN2H/z/pqjIwYG1xLr9
9cwoKvfjBzOMHi0S7X3rllyOzr0ng5gjlhLfPMJknMfbzFuF/efxX3isRMX5Cm5V
kRh4Qs2bzDrSLviZ/M9w9isTk5LciFIstRvZxvvcYECKq39KE35Twd8dRNq10fx1
6c/F/Vvr8ApuDxAGGpuYrLB8j/Kt1Gyto/EeRSylTEb175mxIh/DKikQYdnO1a1N
+nt+uhz3hX3qYzb8rGev2XsDOy4dHg==
=BHRH
-----END PGP SIGNATURE-----

--Sig_/s=L8q7k1zyjJ91gjxn3fTuU--

