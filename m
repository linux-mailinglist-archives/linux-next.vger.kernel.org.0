Return-Path: <linux-next+bounces-5624-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A3A4B703
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 04:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C9E189106B
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 03:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF6915854A;
	Mon,  3 Mar 2025 03:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qL7jw/5X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2770523F36D;
	Mon,  3 Mar 2025 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740973825; cv=none; b=lVwu5tbLUzXjYKbMIO15eSDIHy71h/kBckJqDty00mp3FXJbwi7z9q173JNUVeVq9Hb4qw1OBzRXiyP7JgcJywYO6vP2tS4Z8jq+OaDoZOrkBosy/yv51QL/kp25wZlcBQO/RmIXO8n0S9hqDXJW6EJq7R4hz0gDnq4/faXZIPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740973825; c=relaxed/simple;
	bh=JjBkoOmpamdWZjwHJsC6fD52gJHLByww1lbem+DKcDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D4dEy2FUHQ6/EzHyicQUlzRmtmg14ESSrGMoaPSPAmuPswMSbWNBnSQHN43Ba2u9mzl4hxCeLT2HtsInG4nC6JI0F5NbS/f9EW8ay0jL3nyHPkjQiKZmr16kjZjzkbi/iu8c/Lga77s5069USGXXLeGby8toDWL8e6jFODmAac4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qL7jw/5X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740973821;
	bh=Zr/h43Zh5pL9KD6JE/gziQFlzF5v35kno022dI2jbaE=;
	h=Date:From:To:Cc:Subject:From;
	b=qL7jw/5XRCuHrgueOEV9sch6x/IYbLBpQlknM5KjMvOwTulWfaWcPKYJA/x6uaHJB
	 zYZPBljVICGjp4T6Jn7WI7Yf9ERUuT+XIh4vAqLIiZK+dY8aEyuBiO+/o/mZdGtCy+
	 y/iOjJMG6Rfxm7f3cNwhdSEgVI6pjhTV8p0Kev8bnz5+MKgEzMPwSkQPpYvVrHus8M
	 ihteiY5ZRicpQmxukkw70EDSlU7QqYrEE2FGoo8iZgMqwKDY5bSkJt3oeOxRquBfv0
	 muYcq5UB2NQagVan+6DGXwcGT702/YGqG+pmq+9yBszycV5YxMywm45DGqcB9/24rU
	 OJ5DiO+m1EFuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z5lFm0zGdz4x0L;
	Mon,  3 Mar 2025 14:50:20 +1100 (AEDT)
Date: Mon, 3 Mar 2025 14:50:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>, Wentao Guan
 <guanwentao@uniontech.com>, Yuli Wang <wangyuli@uniontech.com>
Subject: linux-next: manual merge of the tip tree with the loongarch tree
Message-ID: <20250303145019.16b6b153@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NhzCiUc+4Adm5tI32rLcoM0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NhzCiUc+4Adm5tI32rLcoM0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/loongarch/Kconfig

between commit:

  30051fca4509 ("LoongArch: Enable UBSAN (Undefined Behavior Sanitizer)")

from the loongarch tree and commit:

  d2862bb9d9ca ("LoongArch: vDSO: Switch to generic storage implementation")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/loongarch/Kconfig
index 0043d5d4b5ea,d7ddf2a43e63..000000000000
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@@ -30,7 -30,7 +30,8 @@@ config LOONGARC
  	select ARCH_HAS_SET_MEMORY
  	select ARCH_HAS_SET_DIRECT_MAP
  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 +	select ARCH_HAS_UBSAN
+ 	select ARCH_HAS_VDSO_ARCH_DATA
  	select ARCH_INLINE_READ_LOCK if !PREEMPTION
  	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
  	select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION

--Sig_/NhzCiUc+4Adm5tI32rLcoM0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfFJvsACgkQAVBC80lX
0GzSbwf/TqCfyGhRU8S8RSZDG6jqtjS8p/DGb+Nw3iM4cqmvYFNUmurfnwO0zbvG
2D8UrrM9Fl+w7ly0B3ICdq5wT9QyIi8Wp3EERW42hJ+2jmgAMwsWgyThCe/QpxnO
zAOZSIbe4kH+o8ynJ5XWLyPu/kFhjYqRi1bUSNXwgSdxfmM5LLssQ0bqK/XUP7Iw
Lw62zHX5fInG3Yqx87Dco5uTkKd6RGx1txpwUpwpi5J2s1yiLZKyinSps4LAFRAg
LRIfKTfmS5dcNfKVaMX8AdXFx2KzFIcYFGMadVXVeG7vFhOxxoONNngiOUjpvlR7
LNxihPx6sy7Km65IK9PPqBFGR/Zymg==
=28GK
-----END PGP SIGNATURE-----

--Sig_/NhzCiUc+4Adm5tI32rLcoM0--

