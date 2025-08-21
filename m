Return-Path: <linux-next+bounces-8057-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5AB2EDE4
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 08:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6518BA009F5
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 06:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B62E25A325;
	Thu, 21 Aug 2025 06:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YS8g+a4s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1974B20330;
	Thu, 21 Aug 2025 06:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755756325; cv=none; b=GYE73v2aoT6QaW7pfyeacD2ejjW2VLlLg3/AKALqYKyPGEDjjMLvZSC0/yKd3e2Va2ShWXyfzzQqgQ4+DLUMMygZWmNWJZPwRvhtE4RNO7qWi+61y/MD/MAe0e9rII+07AqcJ8vamuSUjvCCkkF26ODxyItaWXBt4HzszY6pPvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755756325; c=relaxed/simple;
	bh=L2XaWQf8Bv1sBxfwNLa4pVuwLQ02ytj967/mxyjWWl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rcxMlt1bX/OJmiGBbPL/XqdcqERqnaXsc9ru9HYgpEuORX2a1YOzRYnGmw5v9uwh5nNjFdb68RrksOj0rHCCGFskNs4GOWEl8OlArP0A/hpNPC8Hf09BeyLCfSrYZ9FcRseHDr5M11LVm0+jGMKvdQDU5nu+gw6eVqG9D4srsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YS8g+a4s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755756317;
	bh=vqgDg4bCYW2gsBIgVXv2Kq5IO21o/xIVTLCrKpkTwtc=;
	h=Date:From:To:Cc:Subject:From;
	b=YS8g+a4srL64Y4fomXQ7zjm/1GPXrtCurkm2n+reHz9OgTpybGr/cfMXjenVgIAOi
	 dku4H3NFRk0G3XA+55SG277pPItvsGHAGoOO0b34XPfxklypFGzfVKIb8Zjrj//p2/
	 9H/Yaa4No5BB32tfNZv2p0E8fD9qdGJUc++1+v3f8FhSLYxLt9GUXZeofXFF5Nbwu4
	 m+ey9zvoK5+EXShCxwUmZ3pZwATJ9jvXnJ+5XqDYNNWC72TRODqLJLP/DaCF5abMGx
	 FlwvQWcjTSgY8xSSmQ/rSFKQW0QIvB5uJvKaM8XZ+GVNBWwjJxkF/0cKfc+ipStl8u
	 lCV7ib+8rMMUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6t8Y0C8gz4wbr;
	Thu, 21 Aug 2025 16:05:16 +1000 (AEST)
Date: Thu, 21 Aug 2025 16:05:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Harry Yoo <harry.yoo@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20250821160515.611d191e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3=oZanJ88xOlG5Opuq5I2+U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3=oZanJ88xOlG5Opuq5I2+U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-hotfixes tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: mm/kasan/init.o:(.toc+0x0): undefined reference to `kasan_early_shadow_=
p4d'

Caused by commit

  4b99d7a3e69a ("mm: introduce and use {pgd,p4d}_populate_kernel()")

I have reverted that commit (and the following 07cf1bc1f659) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3=oZanJ88xOlG5Opuq5I2+U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimtxsACgkQAVBC80lX
0Gy8MQf/TAZzOu2C5XGYFr8elkw88XdexwbCaMZh3PC/mmw3scaC3bUER+cFV6nx
M11qySWJ/+meGHmRdHkgLErWEp4hiOTCyBZ5SjJmuywXH0+TIBBmVDvG1MvzxTcC
c+iHCAZGnSe91wk05RKxVQh++irT6/FG8nLciaGFBLy6GfHDKuwOE1qqcYcQ5gKX
QLfQOin35ZbkCPwzGfVCqKaWBPs77VrJpOAqGhE9YUbizA7iIxGQrsB6VFcsJ1bL
2WsMwt26JffLuh1HiZqGgUaWPRznkKxSnwAKBzjYMxga/hFdDk00nVRO72glryF5
tjKglwSzed/4YMefrZu0Yf7nv3lb4A==
=uFr+
-----END PGP SIGNATURE-----

--Sig_/3=oZanJ88xOlG5Opuq5I2+U--

