Return-Path: <linux-next+bounces-3523-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D497967D13
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 02:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD6561C20F20
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 00:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344792C9D;
	Mon,  2 Sep 2024 00:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lKH0J3s4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383763B9;
	Mon,  2 Sep 2024 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725238291; cv=none; b=Mkha9G+pZbtc1wwGmJQHjBcbYxMmM00Lg7wr4/hQUgY1wN82eFaXBy56POai600mrZhu9NhNsve/YLZlFZv5o/UUka0hjkfi5CWZ97YglNMMsWW1lpCMCBfcFaJFy1oVMjses7MyRs4QM9oivypbwfYPzzwKmbDtQkwCuHJe+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725238291; c=relaxed/simple;
	bh=RbSGX0UOcgxxW7iRPTx7wOAI+BIEyoz2vHNCnYPa1Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i5kwzuvMPBqPA66aSHibAQMxvP42N5Au1HZbMmufjHiqu7ssttXEv97PakbzCITo0kJ0mXV27WL7v0EDAyJ/KVV7vt8iNkIgWca2RK0EEg+3oLe0sssBhTf53vuHmWFbSUAEHJLwBmkFqoBaaoCbvBZYog5moa4tSrDthMzDAuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lKH0J3s4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725238284;
	bh=17hM6iILcwwlZ/x8DZy+68FDVyPD/80SkMXiNMEAlB8=;
	h=Date:From:To:Cc:Subject:From;
	b=lKH0J3s44oA1Y9/kgHZ0skSfa6V5s81uL0aCxnaoF83xfqIh0gb7Xlnj4EOW1tTl/
	 zDL/JpXs2YSLHJeVgFntHodORtYZ9geywiCv4gNKdXFDPjNo5wF3vwSvvmA8zP2xn4
	 QXXUBNWmIzt2GXhAuqv0jJqXHfCffrBHqiCKcnzzzhMnChtmngexBnTxNdCh4j+iRH
	 nuIF2gAh1uxdPtYvcaYkju1suMyYHQS4hcOrD3eCACbE0anWTlMUw7S2Teq7izhwqF
	 LKD0rxKq+fpR/mwxdlJ0NTbvIjGSjtLObu9n1yyAB65P2Cz6n7oRPoeDcQ9/rT8CJW
	 KR+zBgCs+CdXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxqvH6cqPz4wyR;
	Mon,  2 Sep 2024 10:51:22 +1000 (AEST)
Date: Mon, 2 Sep 2024 10:51:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the perf tree
Message-ID: <20240902105121.1a5b25f8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wVMvj.YsV61lDsX0jv=zj=o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wVMvj.YsV61lDsX0jv=zj=o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the perf-current tree as different
commits (but the same patches):

  6236ebe07131 ("perf daemon: Fix the build on more 32-bit architectures")
  2518e13275ab ("perf python: Fix the build on 32-bit arm by including miss=
ing "util/sample.h"")
  74fd69a35cae ("perf lock contention: Fix spinlock and rwlock accounting")
  37e2a19c98bf ("perf test pmu: Set uninitialized PMU alias to null")

These are commits

  478e3c7ebbe7 ("perf daemon: Fix the build on more 32-bit architectures")
  4cb80590f12d ("perf python: include "util/sample.h"")
  60f47d2c58cb ("perf lock contention: Fix spinlock and rwlock accounting")
  387ad33e5410 ("perf test pmu: Set uninitialized PMU alias to null")

and this last one is causing an unnecessary conflict.

--=20
Cheers,
Stephen Rothwell

--Sig_/wVMvj.YsV61lDsX0jv=zj=o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVDAkACgkQAVBC80lX
0Gwf8ggAoAxqDsQup61pXCVNhGAxxHbU+yE9pPjWMdK2IxXanMsgIRbFygMcLW0j
WyrdU0e6s7ZybUtmwEtqfozCscOyWtzI88TqqmlGSnS3UkI/JppuM4qIsfEAQyzv
7l2Q1XNyV1HWNYs3P90YyHFcDkVyFCyWMrxRPvMLIMSvohlEbQipo4r03wQ2+gXF
eocGgLMeaL75SB0LNXkn9IIIr2nwqCReWbSbO8bUq+unQocy8c7LgO/VP42TMHS2
yXDbJ1Lj9VzE9L4AFWwhUp1+2GMoHQFtiCQDE5/djqZLPz1DA4+nGueCxpnDPZ8S
Ach0aV/zeEUv62y3vFBZWQe+nY4pFw==
=hNDa
-----END PGP SIGNATURE-----

--Sig_/wVMvj.YsV61lDsX0jv=zj=o--

