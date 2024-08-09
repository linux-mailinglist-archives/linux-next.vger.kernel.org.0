Return-Path: <linux-next+bounces-3270-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD9094C956
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 06:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A8681C2195F
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 04:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0AF1662FE;
	Fri,  9 Aug 2024 04:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TxupwZhz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924811649CC;
	Fri,  9 Aug 2024 04:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723177623; cv=none; b=gUHxBWtwbbHoGrM9qQoTGO8qgkIiUHW0sRGwJD9oG3UTTgljG5x13xgcTHbfkPXQS8I/vDBflYj2C4hzfbd3wsfmgqUyNWXOup4ZIFFc1SNJ/BH6ZB8YSz/ZpB4H02PV03p8aEbNxyB8/E9NYYP2WGG65wzmpguLiCyFxpcWx60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723177623; c=relaxed/simple;
	bh=TTJYNXCy1pPRc/5TO8VwoRKY621wjKLdTOcSlKLVEaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nk+1IwOE7puBbiBsGJbG5gSYFzQ9qrIUqWqNo/xcoeKd8HK7lN3Vu6Bzid6uTyPjJfHlaAd7rMisCO1Qn1MouriPYV4FkRJ1cWW0BjxQyQ9Mpiapr/FJCMAxrjlMyMumfkWcKBpZbtiWAYSaKfJ7oLED+dfN/z2vzGt4qQkkUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TxupwZhz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723177619;
	bh=du/NOwU5Mol4o9Dzpd2XjbaLktXhBOjZ7xYu7QkC1OQ=;
	h=Date:From:To:Cc:Subject:From;
	b=TxupwZhz9Nr/Dza0v/VonLSkKIF0/6P5MfpygbkL1m8BPoPTEUfbTJ1aPq0MBSBmp
	 IHVE1G+urw1Ugy58RZsqWgQrqB6CcCamnDgFfvGcKKaLhvsQPw0HSpi6IoUHQJqenF
	 BVLT8yjswcWXQgQXT0siRXaiPJa8kUdcQ67+Gba/JxIDhqqTXQK0bL2o1DCDmKVq0/
	 IG8gQbiNY0QrD5uGnlNby3ijLZbnmrt9Rcgs1La/L1Nk9SbKaZXowrTV5bjOxPz0ZO
	 olsdxkbjXXFryTClKKm7GclT+FE5MfC0W2GkHYt7oB0COfJliHaqneFmQ/cCgflBkf
	 //bXc5AXEBUBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wg9q74WmZz4wc1;
	Fri,  9 Aug 2024 14:26:59 +1000 (AEST)
Date: Fri, 9 Aug 2024 14:26:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: Zqiang <qiang.zhang1211@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the rcu tree
Message-ID: <20240809142659.5fee6d52@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7QGW0_GywIyt.sI=03zBCoY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7QGW0_GywIyt.sI=03zBCoY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (htmldocs) produced
these warnings:

kernel/rcu/tasks.h:54: warning: Function parameter or struct member 'index'=
 not described in 'rcu_tasks_percpu'
kernel/rcu/tasks.h:127: warning: Function parameter or struct member 'rtpcp=
_array' not described in 'rcu_tasks'

Introduced by commit

  a79e0e72ffa6 ("rcu-tasks: Fix access non-existent percpu rtpcp variable i=
n rcu_tasks_need_gpcb()")

--=20
Cheers,
Stephen Rothwell

--Sig_/7QGW0_GywIyt.sI=03zBCoY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma1mpMACgkQAVBC80lX
0GwCHQf/Vh+UPkAebGCUwurxoWyf+iLna3sIE1vBXkfpH5AmyDPNF87lmTlcQgti
4io7mzQjsEaotuErcqoIV5m1NgBH1uzt+zSjqVjbHJy4IDrb2k/L2Y/OdJjgBXie
LMnu/ngReY+lRTkrgK7DMlW0Z5XDRCoCf02NENeyCiLxqcc6GJR3DsKIlvoyuI0W
ReyIDhTsuxq3UjqyhOHrwlPt/T0KQ0fQuSTZ/99o+SulmnSIRcQjzvMeGjw9GEgQ
9ic5QIafdmHmSVHZbPfe/eaQyYv2YVr7lMS983dOfK2DrDiTZu7QOA7KPKXGQQQq
AZH19n1Pobz4fAtS7rypVgcmXqezxQ==
=/Lwn
-----END PGP SIGNATURE-----

--Sig_/7QGW0_GywIyt.sI=03zBCoY--

