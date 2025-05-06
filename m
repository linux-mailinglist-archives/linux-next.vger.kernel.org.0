Return-Path: <linux-next+bounces-6534-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8FFAAB9D9
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C323B715F
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 06:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85F027B503;
	Tue,  6 May 2025 04:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QKNCGEE5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DDF3002BE;
	Tue,  6 May 2025 02:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498150; cv=none; b=DFA3a6PBovByedIy7i4lWXawQ3QhCRct+8LQMiwk21MpKPO0fm0T2DsTvn38wv7/O1v14SrbsQ27AJZTDlf2rbLvV9llendcODgXFSUtbeGjIwlF2X18uRdC4erihkONBQ1sJRqT64anIZM98CxeudrORKcNRXzDaSYV6SKxsOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498150; c=relaxed/simple;
	bh=ISoOrhO6ZcvDNVxFY75Ue3gOfPZtfLJNwCTvo+6IKCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nQ3M183NJjPB11Jwzk8ODTTTZb+VwcycRkOCraXiEUyEjU2StfBL9GmT2JBBtYUOuhkPJCjAzBJMurD1gYzbbA7oi6xFxY6kub7akI/mKoNT6LhEvy+NvdKBVS9la4zV2+uasjVadOJlIX5qJPeGxn3VC4bC8bfN5E26YYExGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QKNCGEE5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746498143;
	bh=v+uGUtGJ32z0FgIlZfhka6lWrnQk6smEFdDaYfbWoH8=;
	h=Date:From:To:Cc:Subject:From;
	b=QKNCGEE5fbWsEPrRdOMjiE/wjz+7Z4Z/lhBRWDuN8ogsHL9zdVXLS4F3Qp8yagddJ
	 e5ZHn5jthJnzIJC+ik/sZgtzbXqj72IpIglLhpgICyZ7el2RuQ77QXWqb5bIcdibNq
	 LCpXSr4zwv2mrttduH9iXe+3yrpylGeSmsv9Vkj00tk6eiySknhbMIChiqdAcG/vdU
	 3KClsGBbqzENvTCr0BRE0DW3m/iOBRsQYzq2ssln4roaUAueIhvRjS9jtxPJ+KZEiF
	 WTVu7J6P86HjXDSzmN2vEJ2NIcW+tPC5R/6erowG4pjI81AIWsltwui/egn+79nVjd
	 xndpmWxr6u+wQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zs2Gl47pBz4wcD;
	Tue,  6 May 2025 12:22:23 +1000 (AEST)
Date: Tue, 6 May 2025 12:22:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the crypto tree
Message-ID: <20250506122222.2a910820@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/non9b/L3zyiXLRua3DSV_Sr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/non9b/L3zyiXLRua3DSV_Sr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (x86_64
allmocdonfig) failed like this:

x86_64-linux-gnu-ld: vmlinux.o: in function `__chacha20poly1305_encrypt':
chacha20poly1305.c:(.text+0x1a690e1): undefined reference to `poly1305_init'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a690f1): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a69145): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a69182): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a69192): undefined refere=
nce to `poly1305_final'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6922d): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a69246): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: vmlinux.o: in function `__chacha20poly1305_decrypt':
chacha20poly1305.c:(.text+0x1a69480): undefined reference to `poly1305_init'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a69490): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a694c8): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a69505): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a69510): undefined refere=
nce to `poly1305_final'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a695eb): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a69604): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: vmlinux.o: in function `chacha20poly1305_crypt_sg_inpl=
ace':
chacha20poly1305.c:(.text+0x1a6c3f6): undefined reference to `poly1305_init'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c555): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c576): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c5af): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c5d8): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c617): undefined refere=
nce to `poly1305_final'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c7c6): undefined refere=
nce to `poly1305_final'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c7f9): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c822): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c854): undefined refere=
nce to `poly1305_update'
x86_64-linux-gnu-ld: chacha20poly1305.c:(.text+0x1a6c888): undefined refere=
nce to `poly1305_final'

Caused by commit

  10a6d72ea355 ("crypto: lib/poly1305 - Use block-only interface")

and maybe

  a298765e28ad ("crypto: chacha20poly1305 - Use lib/crypto poly1305")

I have used the crypto tree from next-20250505 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/non9b/L3zyiXLRua3DSV_Sr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZcl4ACgkQAVBC80lX
0GxexwgAjqdJDJ/bEJ2Jeg4q2RHlaTHwHhYqF5q2nqYUQV4HYjSdU+iq8VOp+O0Y
95SzLLL3dhF4hlHFgbEXQbSeye/SCoz7rWvhdMYf2UrNuEciw1/BCFWM8+yUrmNR
q/RG81Vsmt28al5eH9Tzrhwqokykro7WMVSkp/b0tl3/eDqYGs72qPm/CzpucNNV
wn9R+4+5z4ZPzuWmUj/UKaxSjsmWZ/qxxFdORWC/pHNqRJC8ppnlnKKf1gG4Zsm5
fpLEHC94te2tMvy70vvu/mTISenUFBE0cgw4OOEt+CX7djoxR6lAy9XGsf8OrNlq
xtSWIcYIMLJbjMuSdUZ8mUpPDMc2WA==
=iKS9
-----END PGP SIGNATURE-----

--Sig_/non9b/L3zyiXLRua3DSV_Sr--

