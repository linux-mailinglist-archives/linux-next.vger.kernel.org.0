Return-Path: <linux-next+bounces-6691-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88058AB327D
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 10:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E3217AC4D
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 08:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0213225B1DE;
	Mon, 12 May 2025 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dnREQvu/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED79258CEF;
	Mon, 12 May 2025 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040206; cv=none; b=SHREMo+YzEKrI9QRuKExMyjaQLSFkzvvxwJeAYGDC1N7+Vb4OpsAY4aeKI/XFG/fgC2K9NmZuMDM/ARM7w2Ozp2por2Smz30ARsV1nL4ox3ys0CuqFdLFmWZEXtqDeMPNRQYq8X3ZQ5F9TpBK/fgPhpwwPbyKz1D6rXmLPotrmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040206; c=relaxed/simple;
	bh=CJBjSPGvbIb27uy7XsT6idTI18HZkGio14LfEtwFx3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ujxDKqB9Yd6iIpFMC332158U0XR4q530ukKYMu8hetmmllMD8qyjs/YysgyvM4/R9c8f704OllOI54qiHvEGtSLTxNmfptWRnqqN9EoFwArgrEQmfxQ/qpJphnzcE4ZzyY50DK+WgEod+SKcG/+Wjni2buePBb3rOSgs5JxEYm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dnREQvu/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747040202;
	bh=oiuLWHpwfiImEcyGOQl7gHZNWAsNEzAGOtjG7wCJm0Q=;
	h=Date:From:To:Cc:Subject:From;
	b=dnREQvu/Lq4HES3n/rtlRBhX/ruQoGLcDIg0Bu32jCUUCj4mw9Qgmyo2GbN8Sd6Di
	 AWBSBkTdf3ssZwdReiOdxcOA9cElb9HZpHaJ7/GDFSFjzjt+a2ikNfLoG+1bSyboEt
	 zDBN1Yfv4cObjYaoiftfl7jHkPmfSoao0kie0WnlU5tWUslZTnxSxZWuPE/vhzyDgt
	 8hLMGGFpCw0RI2LLj37jz5fQFDo5JFTvLrS5XDRdGEc2TMueTaIQv3BQwyJfSWnZkF
	 FtSqpAXNOb15KVNbHkl7de1A1f13dpBsLFkUSanuoMYI+d1ApS4bYuMdAz3oImypgx
	 ghX7tqwG9CByw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwtky3vzbz4x07;
	Mon, 12 May 2025 18:56:42 +1000 (AEST)
Date: Mon, 12 May 2025 18:56:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20250512185641.0450a99b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ax_l1zH4ZoJT.fBDWuOuJKK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ax_l1zH4ZoJT.fBDWuOuJKK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: kernel/futex/waitwake.c:593 function parameter 'task' not describe=
d in 'futex_wait_setup'

Introduced by commit

  93f1b6d79a73 ("futex: Move futex_queue() into futex_wait_setup()")

--=20
Cheers,
Stephen Rothwell

--Sig_/ax_l1zH4ZoJT.fBDWuOuJKK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmght8oACgkQAVBC80lX
0GyGsAf/TjZ66fBTbEaewtOHzari41QcznqXK+QxKEm5aP+XXuF3cNcHdOUfiNRR
e6upsmxiZO/TjMRkrUQahqDAyxh0BkgikjcRnSqsEugyIVbhfILdzxhK8RBX25oK
lUO+gDxw7GjlL7FxU8fMLOltG8d7K7LEHUGfgOaRZ7m1D2QWlbUyhy9+SA+Q/HZR
rIZt6VxZ4FzY/Ph6mGdoiw3glqOMz2bgb54GTWOaclhItKuzRIHn+0cIaTsTksBR
pwZ+2enyp2h7fwdq4l9tq+hM8qsNDg/Atcx3MWYWRvGkpARXp1+ZHNxTECb6PzSJ
Ilh0AIUGe0e+MDps33t5GdlkL8UnuQ==
=01Zw
-----END PGP SIGNATURE-----

--Sig_/ax_l1zH4ZoJT.fBDWuOuJKK--

