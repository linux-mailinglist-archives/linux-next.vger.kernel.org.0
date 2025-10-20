Return-Path: <linux-next+bounces-8647-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A767BEF230
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 05:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 069D11899B5D
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 03:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FA9299AB4;
	Mon, 20 Oct 2025 02:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TD8SSc8N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44B733987;
	Mon, 20 Oct 2025 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760929199; cv=none; b=K+g5pgTumfegV0BCJBglTABTy/1+1fK2nyJqr54eckq9s5jp7Jf8Oj/d3as8XncRf2Sl7+whNXNIoVYrXNfgsCfvHTmkQV00lVe5IxjF6duJa9XF9oWaEam/kZH8HgK0SUCQnhQYP8F6xQbdd/b4kGBzvvBZLvwqSJgHV2tAR5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760929199; c=relaxed/simple;
	bh=RmS5NB5qNXRGMFDL9edkrf8RFjSJ25ZVouPXadIoJ5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=txl/N/N6TVvxAUZfUz0WAjj64EQ2JygNwh9i4/fVNtIyv4TENzVCh7bcAFj14sy0l7nHZofFUYhazmr/aDhXZuN6LNWH1I+DpWskGhu+lbl/+aGVHPbKanmtOjCcWp99nWP4DYDt9x9PAMCGTppTFiDYtgz2wvrjPK4x52wnY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TD8SSc8N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760929195;
	bh=VygRHaKFyTH8wEohNV5cQqkLYV4tuG5d3M6g2RIa+IQ=;
	h=Date:From:To:Cc:Subject:From;
	b=TD8SSc8N7t71LcK9ykUNh2xQzk6CviyFjLgWEuZRDzeRNV9yBbe+ccNuc8EWqg1qP
	 I4MpftZ8fXE/jfvwOgvOeRla0upPrTX7B1/qvW8+h+Sgq0Ekp+E2vQpSNq6bGgRJJK
	 HUEa8hD8cZB+1jA7SSkAVeLGKh29AVvNuG9pUmiiFwSMasNZMW4BlEJNL0DwQc236l
	 PBw4SNKI+OXfpfdibvqLjNLoMYZAZ8d8Bv/gpIiCveIbXn3F83DsU+p5shVAAo2/xv
	 kkZy3j3gEPeIWBVb/8bRg5wTpjud5Jo4YrBO4BWLMTm0BswpZl0f6QlW+QOfeIAPuA
	 kgkHdu3OFtoYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqgBy5zcJz4wBj;
	Mon, 20 Oct 2025 13:59:54 +1100 (AEDT)
Date: Mon, 20 Oct 2025 13:59:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tomoyo tree
Message-ID: <20251020135953.1bd68b04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6lLt.Z7dhemV/PiT=9poDB2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6lLt.Z7dhemV/PiT=9poDB2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tomoyo tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/linux/netdevice.h:2566 struct member 'netdev_trace_buffer_=
list' not described in 'net_device'

Introduced by commit

  645c9b0cb27e ("net: update dev_put()/dev_hold() debugging")

--=20
Cheers,
Stephen Rothwell

--Sig_/6lLt.Z7dhemV/PiT=9poDB2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1pakACgkQAVBC80lX
0Gx0Agf/ffJ4Wk0zAPr3R6pNWVee1Bi+HHmFHTYy0IWUjDjjf7rezYR63UxZ4Ol5
lofaNXJuRGfKlxcsT1Vn7svwg1NunOaOJkb0gEEBXikfTJXPX0o5/0dTuDqGzEVe
aSNyJu4syirnpmSsQV1soVaWdwrSD572m7t8v+2T6zrvVM31+gGqJ3DWEVczxXv+
2a2C3TvtNe5Xlhf9ztPPL4XaWC8Uoh6Sxclc5gftqTZG8q3vllb16/h2MmZPKEiy
ihsIrw7FPZsNczsMMfSaVjT8Fcj2H8Sh4SXA4wnYcm7NOM1VIQnn3h39ssbCUScp
h5rkDcy1KKQLzYIOMtdv6qbtUp2I6Q==
=Yv0K
-----END PGP SIGNATURE-----

--Sig_/6lLt.Z7dhemV/PiT=9poDB2--

