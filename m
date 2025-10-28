Return-Path: <linux-next+bounces-8732-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C09C12ACE
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 03:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EF384E7157
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 02:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA68F270540;
	Tue, 28 Oct 2025 02:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Fqvhhdzg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C75D26FA5B;
	Tue, 28 Oct 2025 02:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761619173; cv=none; b=YpEBo3AT5NfP3FS2H9EIJxji9Ha01QpIWl0i2lE99uinRflE7WZYyCwJRY2F1KXpnaYNOp4Y0Lwg8HX22fN0j7kVUslXzFcIJpkqsmGfwkG1AnxCz9WjdAjANiDhmPxwGTW5qeeEtLZu6d9UA0RgHJ716hOgIR26Mf1WTELfe4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761619173; c=relaxed/simple;
	bh=6RFPuw/um2gO1V/vHiV0L5KHtHrzaSDUu9we2fxQ/ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EqFJZbbqEvkjjJAwfqr0qIuZ4DTFH1l7X0xU2XLZMy6wsIXzHTvuR0bdSrsTeG5SiYDleaaFh7WkeYMuolMrf1c6FGWnaRowxnkxCgFI1PmevDuKzKJujjBTncstxilRjIrkALALEnh4wor06P08NqrHoLbivA8PFdwM87LbsyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Fqvhhdzg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761619165;
	bh=FnYuAFC6g3B2nihpPGhvWqLq+1yglWtuR7hjQzmHuI4=;
	h=Date:From:To:Cc:Subject:From;
	b=FqvhhdzgMuvSbF73tRc8+A6ui+uMGQPGidjvZ+Re/He9Hi6kNu3Qjcg4eXhBZBfoX
	 NmEAmGtpw8f4QltVuYOEnd+SBuMSqWVltXCrFnZIlHP7YFC8sV7ZvxNKNYmBpTA+Ut
	 VOyCRHcv2FrQe109tOvz4pmcjr6h5oR91CPKifFAEaoDsOpXwumEecSigRymhRqI8F
	 bnB+7c0A/6dzdXIFizJMlKk+rWcl4D4InM7+QNGtzhVY5lxjD2zPKcg7Ue/RzS4JNC
	 L25RpbzWtbr8Tkmv9GeTm7jza3+CzpfUQKeyTATwg6DLzF75NEdYtCxi1UO2afssaW
	 g8AwUZb22925g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwZMd1Jgkz4w2J;
	Tue, 28 Oct 2025 13:39:25 +1100 (AEDT)
Date: Tue, 28 Oct 2025 13:39:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the pwm tree
Message-ID: <20251028133924.30a058af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fx2i2t99IymUhSC0eLlCMk+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Fx2i2t99IymUhSC0eLlCMk+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pwm tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

WARNING: modpost: module pwm_th1520 uses symbol pwmchip_release from namesp=
ace PWM, but does not import it.
WARNING: modpost: module pwm_th1520 uses symbol __pwmchip_add from namespac=
e PWM, but does not import it.
WARNING: modpost: module pwm_th1520 uses symbol pwmchip_alloc from namespac=
e PWM, but does not import it.
WARNING: modpost: module pwm_th1520 uses symbol pwmchip_remove from namespa=
ce PWM, but does not import it.

Presumably introduced by commit

  fb3957af9ec6 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")

--=20
Cheers,
Stephen Rothwell

--Sig_/Fx2i2t99IymUhSC0eLlCMk+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkALNwACgkQAVBC80lX
0GzaIQgAhRZURCK0T0BcEZEP56KBg2I/e3dDEzqJVAeOQ/KrslQRtJRO62DOrH5+
j1VcCWp6nW0xypn7m7lJzdzcspANWPy1Vkut1vBaTlvFejI9I6MpCFkW6VS1oEkE
HUZ3KcTQwyyh/npNSJK+3MqDuxbfntDQMoDvX58OBg01onBMo2rDcQTW8J9sFGCw
D5bbcS2/SX2wYZVG2WtqPhV8VW3IwAPHGZl5f1K3YaBZGTMrprLs+4YVq4+17qYw
UYsLkIrY377QP14k/HFn891g9PRX/JjQDq8qeN3K8NYmNz+SQr1Q1q/Ofh+x51fH
0u9iaPE3xpaGiIJkabKmT5PQQBEh4Q==
=5Jzv
-----END PGP SIGNATURE-----

--Sig_/Fx2i2t99IymUhSC0eLlCMk+--

