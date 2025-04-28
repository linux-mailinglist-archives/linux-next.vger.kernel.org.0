Return-Path: <linux-next+bounces-6401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C9A9E687
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 05:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88BF5189AF60
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 03:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B787911CAF;
	Mon, 28 Apr 2025 03:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kd6k1BOw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8174BE1;
	Mon, 28 Apr 2025 03:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745811023; cv=none; b=sr8BFTw12u+czSCqKkQWET5A4WucNwEDk5UrYYC1MTrMT0N5cmee5xy5fWfWHfE8xFzMX6igBykBC/Rf+WApKh4HJCb65GPbUXtBh5A0GD6503k5hsLm25ARhgIeZk4j4/5ciCd6B1R+c4OqSVB9FNle3zQrNAsnmAOV/SUrtTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745811023; c=relaxed/simple;
	bh=6mWKq3lQatyjNdW/Cihez/BnWTvB8tMdp4PkpiNWnRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=go6H7x6cdr/lt/ye6ouLzZlZv7JePZ9548x9yAByhpuGtllRAH4B0T5DJuQrJo/xzHY9SQ/lIWOaIhAgqGq23Ee3zetKT4tkmSwyNcv1D9NNC6C25ZBmY2C7tq9fbS502Rk1qYuO/1iheXbTImMwuDFDFPOUld7eYODNQnjEdV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kd6k1BOw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745811015;
	bh=jVsaLEXMNvidpLj40+o8rBlX0uwUjWHgmyDQFjNXlMI=;
	h=Date:From:To:Cc:Subject:From;
	b=kd6k1BOwa61cmlciiPYmM6pN5yRqfo+mp5qaCkWAQMzTzfa7DQBpUafIwraXz5flX
	 MBIJprT0sKJtg4DqDrPmxbfreDAT0DKDKmMi+GgWWK4YbZ0l23rlyFo1QShfPPfg/E
	 by3vnNN7vXKh9n+tQnKLRWX0MQRqej/kLgLj2VL++DKPlu91stKVNDOUDuD2oZ8ewp
	 qlNPaIWUShf4jkJOaRYizzV8dsb29qf70bGqgrhXInYalUtHQNcZfWpCUnI3129New
	 S/xQ+VqydPn9VBQ9CZKZpRRVj2umbNdKhYPIXpwIgaiBy1X8J1zi/cb1crlFvZLicf
	 6FAmiNOFYOucA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm88k3gypz4wbb;
	Mon, 28 Apr 2025 13:30:14 +1000 (AEST)
Date: Mon, 28 Apr 2025 13:30:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20250428133013.5ad6b6b7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NBBoeFV7ZF2NNzEQXKV3LoQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NBBoeFV7ZF2NNzEQXKV3LoQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/gpu/drm/xe/xe_bo.c:3118:
drivers/gpu/drm/xe/tests/xe_bo.c: In function 'ccs_test_migrate':
drivers/gpu/drm/xe/tests/xe_bo.c:63:15: error: too many arguments to functi=
on 'xe_bo_evict'
   63 |         ret =3D xe_bo_evict(bo, true);
      |               ^~~~~~~~~~~
drivers/gpu/drm/xe/xe_bo.c:2939:5: note: declared here
 2939 | int xe_bo_evict(struct xe_bo *bo)
      |     ^~~~~~~~~~~

Caused by commit

  55df7c0c62c1 ("drm/ttm/xe: drop unused force_alloc flag")

I have used the drm tree from next-20250424 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NBBoeFV7ZF2NNzEQXKV3LoQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgO9kUACgkQAVBC80lX
0GyAnggAmHLlVC9qQysUQOD+ukgNvCJLzL3FXgmP2knj7KjKvyCQWOyErdEN3Jv9
6wrIetk12gRZ3mSzPtS1bhN5/s1l/a3CPaG7bXFUaTbwffTDetIA+gPWnDJJHaCb
eCVbVD+qM0lPWIMBJALxexRimirVBoAesxq+2CFO9bl3gUQo7Gg2eSbP5tUHLIfP
kUgUtSV6/MhlrqcRglU5TsyQI4LeU/XaxzTpAg36x4reRnJxKmV6soxDx7KmoteH
le3nYh2VZ6nCObeq9zs7AeZCeoLWFYHKqxX4Rjjis/L0sxeHXEXCa3IFyqM/I5oL
HgKeB1QmTqZoDVtp4n2/6WSISwZ0QQ==
=HIGf
-----END PGP SIGNATURE-----

--Sig_/NBBoeFV7ZF2NNzEQXKV3LoQ--

