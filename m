Return-Path: <linux-next+bounces-5507-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A999A3CBCF
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 22:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 605933B43A8
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 21:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA1A22A81A;
	Wed, 19 Feb 2025 21:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="enVd0QmN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4DC1A841F;
	Wed, 19 Feb 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740001888; cv=none; b=Im4eXc0Cac3R7nuNbPnvpurkMXvTpECi5vVZNsSC7oaL0fVFv7Z5qvOb3e/7iq31pA8NzLv3fAteb5mgu+p2Zy27NaRVBGtqcXyfIDeuvfxJShQLEc2pQWgIHbq7BximLOCSJBmuLvC3q8OMNjZNtOnRa3E/7UVQe5Eubg+wtjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740001888; c=relaxed/simple;
	bh=rPjeYmKJydRc6RxImkLoCXPWMmB5KRSLLkwqXEY2Mlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BHfIDas3ZTIJv9xNyR8phxWSjVXI6b/CC7MijP3E3vgCI1Tk8wvFCCX1Uo1maDQMYT26PAbf6T5s1V9VdrF+lOqRoNG9DfbI9TXdA9j/8XCFpHqSKA10WlsdJeF+EGKlbQL567O+98ne9Ox8CLKI5E1Q8tyXAp3b62HJdow01Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=enVd0QmN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740001882;
	bh=NUScgfZvaIi7Kic7ViCMQoAnbJX3U3IyXAhfMMsBT18=;
	h=Date:From:To:Cc:Subject:From;
	b=enVd0QmNuzsXHShngikp8JazUgrHVuweYWiYl7kyvlcR55AX/V2X80LztLSdbUloF
	 /nnbsG8wFKzoiz/wXEbvC8KvxlG3fNdNUQU376Vip3F4mMNhKqdiypKaJiapLalhjR
	 +/O77jTrhWrar2PQozcCMJmvJ5rWSNGgXKNCMf4v4vhZNc/q4ua1IqDRsTGE3shNPe
	 UaUojMvkdldkZ77dUY7QqZh4FchFbT7dLCuNl+YpswZaYDgLv9nKehyXGEpwdKIejU
	 Gdmo6jncjI7czzfzIcjWSVMeGmq/KJvzyatypjCMat0WxB/4W2zIJ8BOKt2YXQQgjA
	 rwZjaQ9Qyj/Kg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yyqpd5sZcz4wbn;
	Thu, 20 Feb 2025 08:51:20 +1100 (AEDT)
Date: Thu, 20 Feb 2025 08:51:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20250220085120.149904bb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sNqbWSt9Q/ZQM1gOKFuKWeI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sNqbWSt9Q/ZQM1gOKFuKWeI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f6977b06c598 ("io_uring/zcrx: fix leaks on failed registration")

Fixes tag

  Fixes: 9fd13751abf5f ("io_uring/zcrx: grab a net device")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 035af94b39fd ("io_uring/zcrx: grab a net device")

--=20
Cheers,
Stephen Rothwell

--Sig_/sNqbWSt9Q/ZQM1gOKFuKWeI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme2UlgACgkQAVBC80lX
0GwOIQf/d3xi+F5Kdqo/80lialZppsQg18jITmFS7YtuKQY/2nZXmAO6k0DMzxMA
goTj+QU91Bq87IYjMjJ4u7QxTHwLzdWnFFj/r6sPxdGrfTlQyXe5JBANN1RXR0Ts
7DPBN/tizhptdMvROG8viALpChChJ+DcCmPi3ay6qZRJBAf2MULuimAMDVkdLiwm
Uku8CoLWUEKBjWbTSMQrwJslscCMQyVOx+FMZjLTs3s9vFHpC+BWXDpmP6IPlCIf
tw0y1Jyb5vjiGU7XCU9c7yw0tVJbIBPZutuUk8nD0QRm6s+IgMYaSsFvXqSLf6bX
8EVg09pGHTEMBw6do57qzrVDxPus5w==
=Pg/X
-----END PGP SIGNATURE-----

--Sig_/sNqbWSt9Q/ZQM1gOKFuKWeI--

