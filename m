Return-Path: <linux-next+bounces-3582-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A2696B0EE
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 08:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF64287862
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 06:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D5A839F4;
	Wed,  4 Sep 2024 06:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p1TWR20J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F91EC00B;
	Wed,  4 Sep 2024 06:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725430030; cv=none; b=NIfxZbZUh5Q5VA9B9J0KmBf9hhPkwbPhyR54CB88xe7RAs+PNhS0FV9ixqEzjBJfClifDiA6/iCA+xM3qYDTWlD8QmBOMl4V9KBxdvRK2J3XVPR50A0IV1QGfNgMpzAQMla4Sk8zpE8vt+GA4eR/GWo6/MDEtMeBgjdwJdW8uJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725430030; c=relaxed/simple;
	bh=ptj0vR5+/+WV8NkK8DLkADsVWUeSufMuadxsig6hA78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d8vaA4YAUG3oZdJNpxyAtWm4Hz6lDIGGthTEsvVHvYHBxOlHjlYJ6eifiFASzOyZr7ufPlT//66BgYfqFY8WdwDGvIQs11O3P9u2TqId/lZLIbHqgZW/LubpG35inZkcKLIyaVFfMVSb3tC6nVLRHrlqJyP1lWhwmVJqF627yJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p1TWR20J; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725430020;
	bh=SAGoOF6qurBm6IrIHxM8opo70XqvwtO1qqbWel1pNLI=;
	h=Date:From:To:Cc:Subject:From;
	b=p1TWR20JagUZTIIACW3eZLMd5rIlIWwYBtMZdP5PbkEz+d5o2uSwWBE0DC/EVPUJQ
	 zwQx94c87Etb7jHa2XB/CvxqRt+jjjOEusPKEFLR7mbUvZm4qWx9LirAoHwsrkg4ke
	 xiEvkE/SjUktzclArzu0yvzXEBkwKC+4kSYEr7dlvlwRVTvqW3gEvsL74e1kTxCCAA
	 6Fx66lSesgPtX+nyRKUjkJulrDc9RjaGkGrlmasV08Lcbcecw2+Yyg3bzH1fu4Y/D+
	 7nySorNw3pAeG0ZbDk0K8NszdEAlcrIUFubU5X57RuUMFbjZrIU0gb5pJOEe/j7Zzp
	 QcMA7z1WHolhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzBpX35zGz4wj1;
	Wed,  4 Sep 2024 16:07:00 +1000 (AEST)
Date: Wed, 4 Sep 2024 16:06:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg KH
 <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the nvmem tree
Message-ID: <20240904160659.3c0f7b54@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ddiTiH0aaYq7OhnnqBt5NIW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ddiTiH0aaYq7OhnnqBt5NIW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the char-misc.current tree as different
commits (but the same patches):

  6eabcb1b4fed ("dt-bindings: nvmem: Use soc-nvmem node name instead of nvm=
em")
  cd6acd8a1903 ("nvmem: Fix return type of devm_nvmem_device_get() in kerne=
ldoc")
  0a55faea9c90 ("nvmem: u-boot-env: error if NVMEM device is too small")

These are commits

  a759d1f25182 ("dt-bindings: nvmem: Use soc-nvmem node name instead of nvm=
em")
  c69f37f6559a ("nvmem: Fix return type of devm_nvmem_device_get() in kerne=
ldoc")
  8679e8b4a1eb ("nvmem: u-boot-env: error if NVMEM device is too small")

in the char-misc.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ddiTiH0aaYq7OhnnqBt5NIW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbX+QMACgkQAVBC80lX
0Gw+xQf+Jk5iLq5DK42dbc7xVjRg77zPmNFzMXcn0kF5NW5HIcZY49iCmK9dpO+e
3z/M9xOI9uhIgJrWIGewWbzaDFcIHK8zhtP2E0LxLadud4ygS9062gS/INH+ym16
dsa2Mb/TsnfZoHl8rJJSSYWbhM6i9k+Xk6kEfmA4OBqjjOg/QtQPMAmso4rW83+1
A9P0cilIg8XFE0mky322rmQ+s1YaFrMG9pO8AAHoyWF0kZAGpMoiHjiz2xFnZWBB
ns784FZ6yoyL0JDNDsmvHp0lXHWaNC97+Bnh90cFWcXbEuEdVpjRZ9fyK+yTzVnY
V+5UshalzKKhuDXQGHfdFzQpHtF7hA==
=MDBt
-----END PGP SIGNATURE-----

--Sig_/ddiTiH0aaYq7OhnnqBt5NIW--

