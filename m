Return-Path: <linux-next+bounces-8961-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD620C5A470
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A11D3AD8CB
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 21:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C508B3254B1;
	Thu, 13 Nov 2025 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g1ZJe8nv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA557324B3E;
	Thu, 13 Nov 2025 21:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071178; cv=none; b=jFQhOHNQM8iQMR0cm1mEmGE1yhX5fnKJHv7QIJjJM4h3/WDtlrDqiP9zZFGvfnSdrbQLdG7qRPexHen0R9qY9aL19GPdJrmog2s+wQ3TyQzv7164PMUNzLo0J75fJUFjlDRBZ6GdBsym6yTbvcxsL39b3LImbR/2KduqAYu5Y+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071178; c=relaxed/simple;
	bh=s9p8v890lXygYJgg/c4gp9cxJTXojf+1a4IFsOY7Iw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MmgGAfclqecU/smaRRsIhZg8+b9YTDERrnfscCvtZxhB/TfTiELC9i/o24vpAc3xUOs96sRdO0su7TpI0SJewhoRhzvj++JOdaMe8gwU+XrhjQWCg7vBQhyVlOu+KQCa5Q53PxgISYWUcrPJG1GleL/6B4pqCKXYZBntbfsMz5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g1ZJe8nv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763071172;
	bh=tHtkNzj5K4l0OkeRG4S08kZtxMaXS2NrG9EvCBiSwek=;
	h=Date:From:To:Cc:Subject:From;
	b=g1ZJe8nv3Lv8T5V5Dfe0lGTBRwdFVaenauUfxpB3sj65pIx3dG19S/kkgkQopfZhj
	 21/kFSfXQTr9LD//NgOf3RwUFnC2uieffoju/N8wogvz5B4AhDdUA1KSRCE9tbsX3m
	 /DeCWMw586UIEnRvdvJ6xSm28PnKZO1qFHMaWHi/V5hIOUKA73j3y5p1nPm2LsKqXV
	 8TDaiLfj7xXvLa3M/ZiaiTWNT/QLunDgEXqDPa88mizB1o3eRQefE1+2X6n7EJfGcF
	 VM27WgP+GTUe6mVnS6xrupibjccxdCMRQXaaPGTlViTS7DYjGltk5hkQ8lewTNPVS6
	 wLhrfkvrZ1gsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6vLr4Lrrz4w9R;
	Fri, 14 Nov 2025 08:59:32 +1100 (AEDT)
Date: Fri, 14 Nov 2025 08:59:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20251114085932.18e76047@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=brkwebas7bFiiqpYcl5=c.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=brkwebas7bFiiqpYcl5=c.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  35587dbc58dd ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() =
with SRCU-fast")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/=brkwebas7bFiiqpYcl5=c.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWVMQACgkQAVBC80lX
0GxTeQf/eENdQrqYG/a4vSgksCQm7lKh4TIQSUu7ic+nCijxMpyb/AWnlALA8qcM
6/QX+1knKPeXF37Lux4boSvFsVC2/UymIiLnnJsONnLoWZg3XLxAkdwFUHt1T72O
H5QVPzj0dVxHrld6wgCbfYwwJqqTuHp1H7lhUBG+f349+/TwNmb+5DfkDCShIkzF
1fXqPK23pFbNMqpYg4A02ZDcNknljRqivvD1USIa2pKukVZdkiqC9wRgwgQrAIA7
froR1qUwvvJ/jqaMOQKpCJrYImqBWl6A4pWly/lE+9JFGmWzjz4tyRMVt1JcgyP5
+a74hFOTZyOXeZRrpHpnGIMP90Wsdw==
=M58i
-----END PGP SIGNATURE-----

--Sig_/=brkwebas7bFiiqpYcl5=c.--

