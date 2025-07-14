Return-Path: <linux-next+bounces-7512-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF39B0380F
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 09:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 330743B1102
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 07:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278B42264CE;
	Mon, 14 Jul 2025 07:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aopcSJtB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F322594;
	Mon, 14 Jul 2025 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752478493; cv=none; b=aBHxrBCSxPFo3MTTFh9Z0sBjkN5K+1lURZ1WVnIgN3lZXll/9O52pyRDmwOar2HcFuJNV95F1GUIrf1m/OJiGqcs6cHZFS2bHQ+OBDnP+aNFq/vIG4dIbrriHP+103uxhiOF1dT+Xo2SsFj7GxgrjL83r0qxposHzmNdsJOIRyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752478493; c=relaxed/simple;
	bh=LfM0xrOXhrin4UzvbAFQT98BNy9i6Cqkd5aTBAlJIwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=df1i9P9584MlRBbAIIck7Bd1HOW+L/7QQVaAhcV/XBC0QU+uXU77Fh0KsS1frlFTMf7XLLzrEhYLzixwMzA7H9z/XX0TAdCzUcRXre4CDhqaBdxTdN7QHdk0XzxzUa5m5tga7khGFkUcYPucpEPYyNeFvqQGiNwqgm9De8pE2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aopcSJtB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752478386;
	bh=U68Ba9duRCXQnGtdHamIoguXoRG1IWKXn/narYgJCU4=;
	h=Date:From:To:Cc:Subject:From;
	b=aopcSJtBXhXsRghdWcMiNFyK8HgwlTphSzd1uHY6bwWybc7NWBHsagoy5SlVMzOYX
	 czDXjF+jl/+zQlgKIN3ZNB+kFgRRm2zqtiuass9evmDKHggqIZjUa6UVO8Zm+aVmjy
	 CHN66Z3J4DOWsHQwhQ9Dpt8D+lzNXoI5JH3OpREFSoMBRFbcEmd+ENxPY5GTOKa+GL
	 aS0nXNAOX/avhDj9+1GIuN0KUHoIEZTEe0zG3Gp8UC/g0EjwUQxYRjrNQ3aoM0qsBi
	 3pqZLOOJbJNf2i7h//d9n2jNGNZwRhqqXguuyyPXPfyM89Hzoa/PHrXeCfbDWIdQqT
	 D/N7+a0T+CRuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgYvP4f5Nz4w2K;
	Mon, 14 Jul 2025 17:33:05 +1000 (AEST)
Date: Mon, 14 Jul 2025 17:34:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srini@kernel.org>, Greg KH <greg@kroah.com>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the nvmem tree
Message-ID: <20250714173446.7e78d9cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7afK36RYVcEFFQr7+SRr9NT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7afK36RYVcEFFQr7+SRr9NT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc.current tree as a different
commit (but the same patch):

  d102a7924f44 ("nvmem: imx-ocotp: fix MAC address byte length")

This is commit

  2aa4ad626ee7 ("nvmem: imx-ocotp: fix MAC address byte length")

in the char-misc.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7afK36RYVcEFFQr7+SRr9NT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh0sxYACgkQAVBC80lX
0Gzq8Qf/Sm4anUGm6zkHiQ4T/QozQhokWnwHWHdCgEqkefAd405iH75hvIFCnv4B
5g3piDzSds6+jnqZgSfrvx5JTWnzei9sUxSw1gxG+Be4gg91+9eltY9Ahk6QQss8
8pu2OapzrQyb58W6dg2pbgDM9iDPBqLMWzhr7DCGNFhzHdij/XuE2t35UypMQQ3e
RI9byRJL5rJyDYqDyvtIUmG6aKzURlNqc7txhvc9D2hUivpFckphCgUWwB0Y1pah
BwW7m8uGOW6xSS3MksGp64/5ICdjDmDKcfwu+aIWzEd68a7KFnUq1eLSvlF07/M+
JYR6ZBaKoOL1b22g5qkP1oPZW2i72Q==
=/Nkk
-----END PGP SIGNATURE-----

--Sig_/7afK36RYVcEFFQr7+SRr9NT--

