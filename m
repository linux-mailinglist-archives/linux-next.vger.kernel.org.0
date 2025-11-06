Return-Path: <linux-next+bounces-8861-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C78F2C38B15
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 02:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 682C834B92F
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 01:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14812221543;
	Thu,  6 Nov 2025 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PhhXWZhR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E904A945;
	Thu,  6 Nov 2025 01:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762392256; cv=none; b=RaL+h6TgtcJu0CBX14WGqJbBJckW167zlN3gw41SGsatqJdrSW/UM8truFexqzkW3k1MlMAVixNLQSfIB3Nd2qxdyXpItNlmLcBVp9jdocMjRT6VkdVLHkqcbkogCRJ8Vf8V9PCkLSaS09w6F0A2lW1AakRpeb5zJbNVUSAYfVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762392256; c=relaxed/simple;
	bh=/D8BLS405uGPUBqeSh+BJM6ARSJDPJQlrKEfPerH/HY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JKlQn2VS8RxOHM1eXwBUCT91zTgSnJQ6A+KhFtve/FZKqFzDAOrgY9TxAZb3cIIZkTjS1Dr0jA/P8cgyPL13iJ20Ecj3Wrjgtdx9SlytTxlev7QivYXNsvb0V0kdrWVzQ5/3ZZ0kwMVuCc6z5eRNeWWMmt+v87Mw2petplzYDtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PhhXWZhR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762392249;
	bh=V4pmWVssy7IWVvHaleVqXfEyTFwLcNr22STLdSVj9WU=;
	h=Date:From:To:Cc:Subject:From;
	b=PhhXWZhRGtRHOgKe0fg2mdCNXTuhY7Y0pJWNbZjoi2G/cK42UfuYwCrN90H9UNbll
	 dUHffKhok46tSKg/m37LfmH2fngZWkW+GMS9sEgoDbJ3+2u4FtjfZmpVSf4iYlebJk
	 v5jUQRxG6hhLobbb++1sqNaGPXRQDZVb5mWRUxn7/AZnCmz6r9Osz+WqfUYqiTyGgO
	 AGbxE6ScX7Nb5usocaphiWxvKs378O3cy9Wx/V0SYSZme1Xy3GUkXNtxWNgp0LkNGe
	 RXofJPMAF4Uro5hWHLVDGuhb+66u6jLiP1jYYXpUvz56PrkqLQwVH/lHwOpq+Wd9Y4
	 cw0yIl39RT8dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d24Gc2wrqz4w2S;
	Thu, 06 Nov 2025 12:24:08 +1100 (AEDT)
Date: Thu, 6 Nov 2025 12:24:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251106122407.57aec996@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E_48pr/xYtxUcKR/BxF.Tgb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E_48pr/xYtxUcKR/BxF.Tgb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  include/linux/tracepoint.h

between commit:

  e30f8e61e251 ("tracing: Add a tracepoint verification check at build time=
")

from the ftrace tree and commit:

  e79b1eaca338 ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() =
with SRCU-fast")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/tracepoint.h
index 8a56f3278b1b,9f8b19cd303a..000000000000
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@@ -275,24 -271,29 +280,30 @@@ static inline struct tracepoint *tracep
  		return static_branch_unlikely(&__tracepoint_##name.key);\
  	}
 =20
- #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
+ #define __DECLARE_TRACE(name, proto, args, cond, data_proto)			\
  	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_pr=
oto)) \
- 	static inline void __do_trace_##name(proto)			\
- 	{								\
- 		TRACEPOINT_CHECK(name)					\
- 		if (cond) {						\
- 			guard(preempt_notrace)();			\
- 			__DO_TRACE_CALL(name, TP_ARGS(args));		\
- 		}							\
- 	}								\
- 	static inline void trace_##name(proto)				\
- 	{								\
- 		if (static_branch_unlikely(&__tracepoint_##name.key))	\
- 			__do_trace_##name(args);			\
- 		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
- 			WARN_ONCE(!rcu_is_watching(),			\
- 				  "RCU not watching for tracepoint");	\
- 		}							\
+ 	static inline void __do_trace_##name(proto)				\
+ 	{									\
++		TRACEPOINT_CHECK(name)						\
+ 		if (cond) {							\
+ 			if (IS_ENABLED(CONFIG_PREEMPT_RT) && preemptible()) {	\
+ 				guard(srcu_fast_notrace)(&tracepoint_srcu);	\
+ 				guard(migrate)();				\
+ 				__DO_TRACE_CALL(name, TP_ARGS(args));		\
+ 			} else {						\
+ 				guard(preempt_notrace)();			\
+ 				__DO_TRACE_CALL(name, TP_ARGS(args));		\
+ 			}							\
+ 		}								\
+ 	}									\
+ 	static inline void trace_##name(proto)					\
+ 	{									\
+ 		if (static_branch_unlikely(&__tracepoint_##name.key))		\
+ 			__do_trace_##name(args);				\
+ 		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {			\
+ 			WARN_ONCE(!rcu_is_watching(),				\
+ 				  "RCU not watching for tracepoint");		\
+ 		}								\
  	}
 =20
  #define __DECLARE_TRACE_SYSCALL(name, proto, args, data_proto)		\

--Sig_/E_48pr/xYtxUcKR/BxF.Tgb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkL+LcACgkQAVBC80lX
0GwpiAf8CNkf5ddm3ueTZDsk/tzg2hHCRh8K9LYg2gSsHcVL/iV2h4mBqM3omRfB
xaYKu8TLK1n0qH2HgHX92wIBnwha3tO+Xn7THXPIdk0dATKJr91BsoB9BhoJ5223
nkLp0a4m4U/7fuSxXGg1QdnbO4qxGHYTm/p4aE0Yy/QWmh/iru+eiXuE+diQi81t
6TsaWrxNDXSAog9Vn01qAHhtzeV5DrQczCXZbxVJD00YGPfYhkoc4uC5yrb5efWS
wHzhD+HFCmUofBePqzFqVj7HARj0K3oFbUgFTuU2+xeMf1KNfno+qAN8OfpApaL/
V9krX5RufYsX+4XaRlyucbnu+GjsDQ==
=XbWs
-----END PGP SIGNATURE-----

--Sig_/E_48pr/xYtxUcKR/BxF.Tgb--

