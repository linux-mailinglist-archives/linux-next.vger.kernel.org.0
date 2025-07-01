Return-Path: <linux-next+bounces-7280-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5085AEEC73
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 04:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05143BEAA5
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 02:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DC7347C7;
	Tue,  1 Jul 2025 02:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GgYB90z9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A48DDBC;
	Tue,  1 Jul 2025 02:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751337077; cv=none; b=M5TgODTVZ9suyvdhf7RRj4JyTghRS0XuvbI4SpNKf4aoIHgfjgRIzd9SuPQr6U7cOvp6XDnjU0QDxrhCTcGziIbfki/wCwpTUFW0+VywujVlUG+EPAwYF76A74u16hIeepJDuwG71HIKuVrtZxU0dR8hzE7o/afogoiP28GtdaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751337077; c=relaxed/simple;
	bh=Zv0xrZjMLX2KL+34YMGMDc3sj/DK324mfEdWQq//3uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=C7u7sPMJn0VUQ0AzgVHslbNH7737tkENIOrI/ZX+Uo6cLRtroPQ0DVxEJCrZikyQpgtoRj0Vl/+/IQnPwVj8CjYmg06b5l4n0P80DdMzLTAIx/cz8t2Q0XVo3jthoccJnsmd77aSyGCDeho/HDNG74LB19ifomHpe5dwl03BnJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GgYB90z9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751337062;
	bh=FVkHezmfEQX5JBGZuMMnl0pNJtbMFRNRWou42A09/xU=;
	h=Date:From:To:Cc:Subject:From;
	b=GgYB90z9R6eJ7UOplshlAall0i9+uK5g81QmstQabh5z+tFZM0FyZJan5Vp+kPv2P
	 joJbtqP9Rervxu90Hj3l6Ejwn0d/Pyy6TnhjJ+y4pglvkrXv0EIBd5tQ/Rb9LG5o9f
	 ltW0sKfYGbKWhN5uCv+Zn4uE2rGqThN6jm+H+Ysm3h5EqQU/Pf+f8UbGVhq36x4tHU
	 HT0bzYzoZtPdaQlDu8SeAsMtFPQRSVs8+lMA53c6Rase/yqPShuN6dPWw143jiRted
	 bO7VibDb627NvZet3e93u4/1juODYg7eTyXvNFoAu/H/Hqp5DYqxV3btLGEaSMCQVy
	 /YUYnUPyKPaUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWRps6m5wz4xQN;
	Tue,  1 Jul 2025 12:31:01 +1000 (AEST)
Date: Tue, 1 Jul 2025 12:30:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the libcrypto tree with the
 libcrypto-fixes tree
Message-ID: <20250701123036.0d25bbfc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8VA2.f9VVtR+fzUXokgZigx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8VA2.f9VVtR+fzUXokgZigx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the libcrypto tree got a conflict in:

  arch/s390/crypto/sha512_s390.c

between commit:

  400bd45ba798 ("crypto: s390/sha - Fix uninitialized variable in SHA-1 and=
 SHA-2")

from the libcrypto-fixes tree and commit:

  b7b366087e0f ("lib/crypto: s390/sha512: Migrate optimized SHA-512 code to=
 library")

from the libcrypto tree.

I fixed it up (I just deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/8VA2.f9VVtR+fzUXokgZigx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjSEwACgkQAVBC80lX
0Gxbhgf9FYRKpv0ZrBuFaXEL2XLcUAMokGME8GB0haagImIInmD/ICLItErMPORa
vdL7u3VAI0yLVosvSpGdzMVxXtSjRBxnCeTqJ/KHNJaQdhfqUOqPhmO2JgJk6+vG
ONORlfYq/Uk4jttYY2NcHLp8trYtQ6MAVigUJNSdgn85BqawW4HKHk8KW53IO2Lu
j2JXsy4d81ba8O0gw40JXA21mPC2Bq/kNvcePuECZIAdzifOTlJsgr2VkUQoxrGT
+aOrH35P+zSqzCBmHujwT7siJ/wPOyIfF5nIdOoFD4x1exn+s+dMtExlMUfbqQFD
T3whXU+NOAVhoZklNE3b0zeczPfKTg==
=hfOg
-----END PGP SIGNATURE-----

--Sig_/8VA2.f9VVtR+fzUXokgZigx--

