Return-Path: <linux-next+bounces-6277-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4DA9115D
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 03:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C9A188CB68
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 01:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E951A2658;
	Thu, 17 Apr 2025 01:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M/R8b8I/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BF74BED;
	Thu, 17 Apr 2025 01:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744854732; cv=none; b=Zi1BYo56hSGNGPt3UJgzCAmWasjgWbeWzslE8m2IWObj19VnWUQkwYWMolfMghcu0U8wEgJ+A3TxVkBLtKT/n8bAa5pvc7eKCCPxcBubEZC8Uv/seB65bzMMKsduwgly533YXc7IQfk6l97lzp9HCMUOgCrfvmIGHVWSbiKs6gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744854732; c=relaxed/simple;
	bh=8P33tZx+FG4uxbrNDNGiIx42lfZjyKNz1e0q+MTU00Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Kv4gEu8BL+WSpgI53s1Xy81momNNoF/j6WGe9IoEoCJvh+gPdAbe1y39Q/wBPrBsu9BiQPFPC/cLPGHfJ5rzPT4p4dPTwc05n0CFGVGprEoqveHJJrD5rsUQEfIFPx4kTE3dpYNzf4w5m2KZ057VN960K3inDxq5i8eNhUZO9T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M/R8b8I/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744854723;
	bh=NL+ho5AbXUYunSuWKJArnY56fdGu/V6TOvKjJ6or/Sk=;
	h=Date:From:To:Cc:Subject:From;
	b=M/R8b8I/dlDbjY2Dip7yYTIT29huJr7KfafedW6/5qIbT2XjCe9RQMX8csv52e1yo
	 +nGX+pLbplvaCMBLJEHYlSbvA//FbV6f0XDxztvUINreoPIMHtSr/yAt/U6UH5c1Ti
	 E1P2ckl4Y0s7+VQH1m+nNFKpR7x/oybeZ/3EmB68iVPlbcHfMkVkYJ9QKBe2JqGSOd
	 cSYFm3GmKpD92dhodp/DyknKb1QpyVQcWSh+hsK2XWXL2WYCxbFvR1IKK+NO520rpf
	 Pem0iqaWomkO0b97oXvYa0TyaGohhqPVeyg+zeppbgqg/bMaKfhWvSUIQXNbYgZIPZ
	 3ypZJNW/zI2tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdLVW07K8z4xRB;
	Thu, 17 Apr 2025 11:52:02 +1000 (AEST)
Date: Thu, 17 Apr 2025 11:52:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the crypto tree
Message-ID: <20250417115201.05de8b5c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dQDpTbzmc7/cDLg=1IeyOPF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dQDpTbzmc7/cDLg=1IeyOPF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/lib/crc32-glue.c: In function 'crc32c_arch':
arch/powerpc/lib/crc32-glue.c:44:17: error: implicit declaration of functio=
n 'pagefault_disable'; did you mean 'preempt_disable'? [-Wimplicit-function=
-declaration]
   44 |                 pagefault_disable();
      |                 ^~~~~~~~~~~~~~~~~
      |                 preempt_disable
arch/powerpc/lib/crc32-glue.c:48:17: error: implicit declaration of functio=
n 'pagefault_enable'; did you mean 'preempt_enable'? [-Wimplicit-function-d=
eclaration]
   48 |                 pagefault_enable();
      |                 ^~~~~~~~~~~~~~~~
      |                 preempt_enable
arch/powerpc/lib/crc-t10dif-glue.c: In function 'crc_t10dif_arch':
arch/powerpc/lib/crc-t10dif-glue.c:48:17: error: implicit declaration of fu=
nction 'pagefault_disable'; did you mean 'preempt_disable'? [-Wimplicit-fun=
ction-declaration]
   48 |                 pagefault_disable();
      |                 ^~~~~~~~~~~~~~~~~
      |                 preempt_disable
arch/powerpc/lib/crc-t10dif-glue.c:52:17: error: implicit declaration of fu=
nction 'pagefault_enable'; did you mean 'preempt_enable'? [-Wimplicit-funct=
ion-declaration]
   52 |                 pagefault_enable();
      |                 ^~~~~~~~~~~~~~~~
      |                 preempt_enable

Presumably caused by commit

  fcfbdddc6f02 ("crypto: ctr - Remove unnecessary header inclusions")

I have used the crypto tree from next-20250416 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/dQDpTbzmc7/cDLg=1IeyOPF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAXsEACgkQAVBC80lX
0GxrTwf/cRkXDexTV415rtU80TLkkFReh0SqQUZpeFJ+HTUiEywKjy2USV+iH26R
1cV/kY0+ug42BQIUrwinNWewQgzCmZYySnjMhLo5ksyoG/vmJ9ygu+Wp55UMO6Hf
jhNmXj9EM4atj8VrgoHXqDRTmXUDBRtiry7A5m+PQookN4tOI3av97PO/757lPRD
/XtX1AMetacfoSBCznsSQjRyrxff6bFLNh2RzuM1tp5IEk1aSd5xlDs893i35xpo
SB5GzoeM6Zpx61vHfCbXCG0oYMhv8gWbpNiFPzpmAwIqcW0lV8n7H9mJNfSJvnoH
w7td0b72gNYHAdAlWW25/NUZ7mPkOw==
=MaM0
-----END PGP SIGNATURE-----

--Sig_/dQDpTbzmc7/cDLg=1IeyOPF--

