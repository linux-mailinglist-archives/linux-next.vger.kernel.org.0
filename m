Return-Path: <linux-next+bounces-8976-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C57C5B091
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 03:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B8BA34D78A
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 02:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE66246774;
	Fri, 14 Nov 2025 02:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fQNQmvhZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D427456;
	Fri, 14 Nov 2025 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763088754; cv=none; b=IZ0mPjgDTgIPRccTWE7i26VD4u+mjK7OqSM0AU9fXu8XbaPGYg+VCbxNEynQUmW81Y66cLBUeMzci1SErUwaVTkPL6xLVpIvMWRJCRWdcdMQ3HrOO2+Qmg+/ENa+S895qF+4ZVYafdMo/XvWfvImTcueZdm8qVKdRDdxNAUQ4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763088754; c=relaxed/simple;
	bh=DdjJfbnaUGPJUs+1scMV62v4TeAno/t7u/yql36pd8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KWqF5O7gy8wRCUdVJYCvSKOxIYnxyjL1zgBfV2jpEn/3koQApivO1aXCNygVy9nTSTpArvbKcbhuO4BQibJDFCxps21NdfGIRMrehW81JYD4Sg19cRNSnU1+YY+JIHTHvi/InXv2JbxWKtCtYjX+pcGDl5TzCLp1TsiPQvpKmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fQNQmvhZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763088747;
	bh=P5jhhiYKnJsPWcbEGX6EylW2Q9SEn6MiB/ZARdZXSGs=;
	h=Date:From:To:Cc:Subject:From;
	b=fQNQmvhZT5YAaNFrlFFcmB1y+Xs4QJcjJ2QXhwsY3IMF/haez0D6F1h3vFtXpZWDx
	 h/nJt3zdB6/Hhh9vFF2INJBeftXyHUyUiMzrRNHoNYUHIAw1NvOSZeArF7B2dCEn+p
	 R8PE+3nIM0RyXI0AXBPuLjDJjN+0esYfa1J1BUFV8A/YA/TdOCbq5UzZXU5eNxiUNX
	 HVY1kMeRmVTzrS8EBy1YRNwEn1IV5FDpUbnp1SeBwy+4Ho8wjj0pqPMv/e4qA0Aycz
	 sqzMlbzNR9K1UqtfBRiUF8fvY2T4Zeudva39zqBn38sqYYQ3AMygGx5Ko5aFzb2WAj
	 4b5ricy6YqCQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d71rq06kcz4w1j;
	Fri, 14 Nov 2025 13:52:26 +1100 (AEDT)
Date: Fri, 14 Nov 2025 13:52:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114135226.64831207@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Pu8WbzudEVUfPmS6biuUhf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9Pu8WbzudEVUfPmS6biuUhf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/trace/trace_syscalls.c

between commit:

  a544d9a66bdf ("tracing: Have syscall trace events read user space string")

from the ftrace tree and commit:

  35587dbc58dd ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() =
with SRCU-fast")

from the rcu tree.

I fixed it up (Maybe - see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/trace/trace_syscalls.c
index e96d0063cbcf,3f699b198c56..000000000000
--- a/kernel/trace/trace_syscalls.c
+++ b/kernel/trace/trace_syscalls.c
@@@ -878,6 -322,8 +890,7 @@@ static void ftrace_syscall_enter(void *
  	 * buffer and per-cpu data require preemption to be disabled.
  	 */
  	might_fault();
+ 	preempt_rt_guard();
 -	guard(preempt_notrace)();
 =20
  	syscall_nr =3D trace_get_syscall_nr(current, regs);
  	if (syscall_nr < 0 || syscall_nr >=3D NR_syscalls)

--Sig_/9Pu8WbzudEVUfPmS6biuUhf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWmWoACgkQAVBC80lX
0Gw/ygf7BBFPd/vfhhbWcsJ9UG/vdfXiHiu4KRYARCCoAWvMw9J0N5mi8glGINjP
uMTiI7eLRLb+899hh/+SrTOKJQ2Ipkn+GR8tKA8XXz5x61ZRjcnsPyciGSthl5gP
Yc2gDCSny4UTe6LmQZSoLsy3SSgohTd9bJ8f0RhJBuZ9cauaPVzn7TnNeFfWLylG
9LmDwIK64Dk0IfY7YnxBz0qOpu8AyeDv9kSxjvsayLFgqoA6XGKYYzIEXys4E8gg
ngfjyHl1xhyBebnD60BrnOaQ1cCFDik7TD2GVgfSAYs9JKkecTEnWD0WeBQNxnoW
QwcY70srrPrGfV30F3RB2DvMLZWTWg==
=vlNj
-----END PGP SIGNATURE-----

--Sig_/9Pu8WbzudEVUfPmS6biuUhf--

