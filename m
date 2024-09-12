Return-Path: <linux-next+bounces-3769-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A735E975E35
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 02:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51E931F23B71
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 00:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AB31799B;
	Thu, 12 Sep 2024 00:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KWlWr+hW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0712F30;
	Thu, 12 Sep 2024 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726102435; cv=none; b=ct8zvM4pZK2Le9+WkCFowYKDQTN2io+fN74ub+f59YkHtOPVQ+TENB/jQvdEfTsc5CwTL17hsJbVrQIvHoBSEVpDtwcRdmgEF4xcZCBwR5WCFpvFOs4d8r578nYWu29Gbd3g9XPLELarjKQAZQuoD90mrkRXn+iGCBYdrCVP1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726102435; c=relaxed/simple;
	bh=TgAoOwpLsmF3qMmXJaguGJJbxwyk5iJ3vNN0bHU4YEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FzRUc7AU0z81YS0+ScVicTD9Zf/NBFzp2dUv7AuiLhYiYAuv74CdNH2nJwQeGR8MgU+JC0HkqQR7rm/N+PWpsapVdVFePv5KhkrtWbbZT3ceVa+rD+xxawQsay6Qdt8rQ9VmuOlLrehpAzVNMEVAByWWt4xT52cpax5OG0MQGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KWlWr+hW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726102430;
	bh=8/eoE6bD6HvwWRSWGilEVojbPq7G8URUaArMouAmCfM=;
	h=Date:From:To:Cc:Subject:From;
	b=KWlWr+hWkFFQndWWhYZFQknmcHSI9f3kC9ljxbJzQNmhxaTkLacSIRzguYtKXOk5a
	 l1iMIgxoqxK+KdMQjfzmC43kgbzj9mQ304ppcTBdqTkmKflPVfTmEzF5X4mq0RCKEN
	 mZGnuoBKVtkT6Akpccr+m+1Ko+RseEHp/xVUUV7bg2iVcmtq6EwPrcMHaQMMQ511jW
	 51e42Ebk1TXUOUxS/zxJxuGbZhLJkTbfJ83mPvSPLBxPSV0tcM8Xqq31oPOi7eQ7UZ
	 esx+TB8G6V41dGRm6rrDP7+cKrVtADUsxRhFi9Bb11tNNfWQ6nUBQovzEW/PguAGiA
	 oob5rW0K/+tGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3zTV1Mlkz4x2J;
	Thu, 12 Sep 2024 10:53:49 +1000 (AEST)
Date: Thu, 12 Sep 2024 10:53:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the clk tree
Message-ID: <20240912105349.0453d06b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PFVXMe05Ftg0YffIxbI0vnt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PFVXMe05Ftg0YffIxbI0vnt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  706ae6446494 ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_paren=
t_data()")

This is commit

  f579278d690c ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_paren=
t_data()")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PFVXMe05Ftg0YffIxbI0vnt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiO50ACgkQAVBC80lX
0GwrMggAiG2LoYgXOIAcVFunmodac5vPmwTd56v6Clo2JLtNtc11NDt9o7LjQC3c
colq3fOKxiqN8cpr5/PSkCHfk05KnRTSctXRiyZKV4KLTAbTXEXntqmO4PESPxm6
3pcwBZ0WqOoFNYZpM3TbXvh+KcdTs3eR9dueJGMBTfLlUcHiUeW1JUX0xoo4Pqg/
sdrrM5PrqQPS2Qs+ixV2xTo838Iv/j1LyA8TqvXOZv5cP2ljc5ajnRjdJSErrjDV
C0UqnqhMdaovFn1fR5A1tJQseS6N51nXyN3swNQCy3l8EaXnkwD799jjr8O4jtHL
dRoMolIm7VKOy583F0EQfsxC5mXy9Q==
=MjZc
-----END PGP SIGNATURE-----

--Sig_/PFVXMe05Ftg0YffIxbI0vnt--

