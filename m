Return-Path: <linux-next+bounces-5705-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB11A5A5D2
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 22:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD5207A6DAE
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 21:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF301E2307;
	Mon, 10 Mar 2025 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CzUGMiJ2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47421E22E6;
	Mon, 10 Mar 2025 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641185; cv=none; b=ruvarS258cgyn7fcdEWVwZtrQB48ft3Pg6qdWgtaWAeSTHPSmmzoW+4PoHkdGHqqdoHpw/vbvuZxzGYBzwdRENXlG45Qriz5DHeobpzl1Nd5Wg/Ke0O9/cPRODAtQ8vV0M+c8nad2fO49yGytfLMJHrMliqTE3HDPWGxsJHicmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641185; c=relaxed/simple;
	bh=+Kv/6kjMA/uFZCgoFF2u5xmnuCS9pwMnmJLH8opwzfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n6AvkYDO+b4tHbbIoL41GlolGIixroJZs6AciX7KxPR9BaPIwpL0pyCzWcmF+u7jgdJ6XLJevR/M6pJj7s9IIkANke4VD6YhVnKr7Gp6paeNa4ihA21/Y7sxIe/bGHrQ5FlbhBV04DLfH6pM3eIvs+XfyTvAWNFBm1frf1F/Jz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CzUGMiJ2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741641181;
	bh=wP7pYElV020dzStrLF11BHJwsXoWPu24x/+zB8gtJUg=;
	h=Date:From:To:Cc:Subject:From;
	b=CzUGMiJ2RhhgZ2jLOHxC8C39RP8E7MbWkAN+UmXzyrlhf4NrOTceP9yurzpUmkiNK
	 +U7t0kE+ecPpmSngliFWluR32+4XCBRH/xDUENbp4iqmFR5ltL3gEvTQXnoQxEGNnT
	 c6YdKYuuly6BJ4bmrHCPsdZIu7hud00DOBdElz8o3WPuWZuHcKSvtcY5xa4TZZgdcj
	 RhUpoBGdWDmA6UTd+tnr2cH9GN5u3b4kg+Z0cjAdUznYxSrzLguuI9A6WVxmnKVeqm
	 ys4LPNK4gJrLyMWosmljhoF1IiOP4kPR6vVgEQ1wA7CgS5E81+Gh5ZYmAuY92wN/g6
	 rCLjv4bkxEItA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBV3d5HrJz4x3p;
	Tue, 11 Mar 2025 08:13:01 +1100 (AEDT)
Date: Tue, 11 Mar 2025 08:13:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20250311081301.6a22ab25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sk9dF9WeMSb1MTQ+m.X3fMj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sk9dF9WeMSb1MTQ+m.X3fMj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  fcb83ae12343 ("Revert "rcu/nocb: Fix rcuog wake-up from offline softirq"")
  c37cf754ebf5 ("rcu: Remove swake_up_one_online() bandaid")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/sk9dF9WeMSb1MTQ+m.X3fMj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPVd0ACgkQAVBC80lX
0Gyi1Af7B61gT9q9ebrn1QHv4P969NJAzfrMabQSqawba1P9JqeVDPy0qJQ4sAvF
er8fDbIGDagVOJ7tcQiNk78Mef1uCFnU6RIEEoDEjFTM0XSUD+xwr402/QnJx1jt
TLntSlwTvX0ecZPgZaAXZgUaycmi+el/aeBcwULPbYudHd467IVEOvn//eL5IEfB
cAPiSt6epoU5rOzricw/0lUiVMiqW4NZ2TIal7hkD9LXzY+pAsBamJDsXF1lPYzq
wDgcozSKOybXvAzaJw0TuK0waKtxPu0eRg6VncLhPBRprpl7/gKp7uZmbpv5IoQm
Gj6zj9kIYk7c/zLCBvOJcJbb/3N4qQ==
=XTFi
-----END PGP SIGNATURE-----

--Sig_/sk9dF9WeMSb1MTQ+m.X3fMj--

