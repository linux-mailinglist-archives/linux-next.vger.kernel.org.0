Return-Path: <linux-next+bounces-8648-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2246BEF254
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 05:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EEC0188C39A
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 03:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462B0248176;
	Mon, 20 Oct 2025 03:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jKMb7xPF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA3433987;
	Mon, 20 Oct 2025 03:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760929661; cv=none; b=HoPWyVYwser+O5wbzcEjODKUMZ0JvHRMP5o3kSKwhgGNYMA+6bjMrAhJP9KO2IHEvfdkiKrqw3pHhOIVqHjZCSQon8vQaGylvncQ3LFavw6WCJSbAdAwPSDsBmNaKAqdnDEdwRxtYUMbpF95EKseeyDqDzmM9e+JHYPnrfJ9JOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760929661; c=relaxed/simple;
	bh=vwz/ZV7ZBVKmELGx3Q8Ld/vgZJUtSdseOwB4y/u7fmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gEJdvDLEHiO3f0IYhFAuGr86SUJRREw6Sq0T5bHXo0GFvk9mwb0Vfw7H8U9nNn4osTWSkbgf9iXX0DoXtV2Bk3R41vJKJogVW2QoV0ije31awvo6yW2wNwNb/ce3vP+0tCtFthv223uF/jl4sxD+1kkJPtvGq5apg21O17AtwoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jKMb7xPF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760929656;
	bh=ycNA5QZP2shWwu+eA5hqxuvfOvT/eyPKJE6eFZiVZ+0=;
	h=Date:From:To:Cc:Subject:From;
	b=jKMb7xPF8V1cQa3+I9I44/msEwwgRNtHgCzrinUMt6tOfdD1qstk+2NqDrICiF4Xh
	 o42iSWY2aoRXJjf66jrQo5noADXlk0LX+p3zNiUQutNfXoLrg0B80oobitCq58hcjw
	 AkauZhlFArAXPul5BRkrVx/2xIweisWeIEc6KjLnHvG4oUGOOi5UrlCuvnNvjwtwnl
	 SICj4JDhFMLRwZHecvN+6PdNpG0mAdsGIR48HjMDI190O2AbIv4xtex8sqmgkfP7nR
	 EHwqxq9OD8DpIs8xpSXQ3ovBvauzFUD/R1jLoKHEf5RJboupWB3OoTgdG8QBfqnj6Z
	 vpuAfJs1oZX7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqgMr0vCTz4w0q;
	Mon, 20 Oct 2025 14:07:36 +1100 (AEDT)
Date: Mon, 20 Oct 2025 14:07:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>, Pankaj Gupta
 <pankaj.gupta@nxp.com>, Linux Crypto List <linux-crypto@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the crypto tree
Message-ID: <20251020140735.39084e85@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5M/pzNkGpv55YL_hm7iuxve";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5M/pzNkGpv55YL_hm7iuxve
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

security/keys/trusted-keys/trusted_caam.c: In function 'dump_options':
security/keys/trusted-keys/trusted_caam.c:37:20: note: the ABI of passing s=
truct with a flexible array member has changed in GCC 4.4
   37 | static inline void dump_options(struct caam_pkey_info pkey_info)
      |                    ^~~~~~~~~~~~

Introduced by commit

  9eb25ca6c973 ("KEYS: trusted: caam based protected key")

I am not sure what to do about this.  It would be nice if we could
suppress the note as we do not support gcc 4.4 any more.  Otherwise,
I suspect that converting the pkey_info argument to a pointer will get
rid of the note.

--=20
Cheers,
Stephen Rothwell

--Sig_/5M/pzNkGpv55YL_hm7iuxve
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1p3cACgkQAVBC80lX
0GzLgggAnI63ZEczZoQRbkSjQa364x0GKkxghxbIU3yOlijZC3zVlfRK22A4rBzM
VZh0Aqc8rCTU5xYTH6gdZKA1HsdylL+KzSk9zMwaHmXt7V1WnbU2T1Sra8RBjYHm
TgfKOLkJfgsLVy/3IQLmXGrm4PE9k8ogSU2pHrhRIs15d4h3saaSJd9t4vPLF39H
X40+sHjdNwGfH/4VtA21LuVqzmRDjKSDalMc8i+ABmQbba4NoDlNj1tg5oB2CpL8
3kqMLg+SgjB0j3896lXF0dp/qNqz4ti1fh1BX7QSbhV5Yc6P3DOaJ2x5ZWAQuxj4
xuztswSApACC5LTgR3O3wlZIOmVF7Q==
=k+R0
-----END PGP SIGNATURE-----

--Sig_/5M/pzNkGpv55YL_hm7iuxve--

