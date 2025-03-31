Return-Path: <linux-next+bounces-6101-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EAA76003
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 09:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43AEA1682C0
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 07:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6080D19CC20;
	Mon, 31 Mar 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oF4qd0wr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F702033A;
	Mon, 31 Mar 2025 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405986; cv=none; b=TKSFHceYNdlsxvynsCCdbVt41yY8C5bOWVZoEFl+RokbY1kxhYNF8Jt0Tr2veqbl+8wleRU+3wrUXU17Oka5vojNSZ4dA1r4RqyVwG+YnCcad2LTwicLNlP6rFtfV1AZ1tsvHuYr1km9im9kGSD5Btb95eea0kr5hWUUqyjP8eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405986; c=relaxed/simple;
	bh=lKARU/pJR/Y04f6vJ17fLkSlvD4EZ9Jmm90qVJgkArg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BI0xUfTZVENivslExm07YhPDvofC4Z6xyq64kXLvQMlVM0YLbNyAQv86l0pDfLwCFzDq0Qv8i2qLxpLjiCn1xY40qGtrpMZB+Z++Nxw6/mjt/mZ6c5IED5TUlLmPIPH+zMBqbIZ688yurYuIJ+XcnjIY6ofcHOrvNZekXyMGJtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oF4qd0wr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743405978;
	bh=lKARU/pJR/Y04f6vJ17fLkSlvD4EZ9Jmm90qVJgkArg=;
	h=Date:From:To:Cc:Subject:From;
	b=oF4qd0wrB/TyhbaT49+wF0qWMRpJ9bU6XvucqdxHNeBrfL42NBnrwFFTW9eq/qrKW
	 B5JI3aG5ZFoLoiH28VJZ5s3X/JA3DKZ3mMCvC9hhgab2kxYJPEa9bMnKNkmHqp0J4F
	 QGyt8BDP2Ww9HwaD2vP4ff6XA9Qa6KVgZ3I3qKVPppSDW+Tv2cmGr/idHuYvgh8Lhq
	 VsgBm27CVP1ZE09O7jEj1/9hRWodSVq7ZSXaVVCejP+E+LbGST/bRkxgT8CxMzdlJ6
	 0xNDk+FV19yFfs5ezwpJsvFvl/L+iupYArIkcj0GZAFXEfLsqXqM2L1JfwWoXzcAxS
	 v3MPIqAlKcd4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZR2k20cgrz4wcD;
	Mon, 31 Mar 2025 18:26:17 +1100 (AEDT)
Date: Mon, 31 Mar 2025 18:26:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: in the merge window
Message-ID: <20250331182616.2e94c03b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/23nb6bfbw7dGu3aooafdI=g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/23nb6bfbw7dGu3aooafdI=g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just a reminder to not add anything destined for v6.16 (or later) to
your linux-next included branches until after v6.15-rc1 has been
released.

--=20
Cheers,
Stephen Rothwell

--Sig_/23nb6bfbw7dGu3aooafdI=g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfqQ5gACgkQAVBC80lX
0GwvBwf/b6tUIPikBEM/wGEfpns2bjGnFH3/o4eS3b7+37UBbczpBkKghhdRAX9F
+Fn59qSxUuO/2AIpr+qtpkAvZcia30pd/HI/XKEGkn7bbvN7GrH57gjB8az0RyQs
LDlB40nCtZHrNWaPnJlZhd4BPenyYTSgO6Mi5qVZtkvmEqwnIzj5Ur5TnzL3jpMv
jF1IA1Fv7hqTCl3bOOQuVtdH+QvC9DNMWGgKSS3CgzJptkSo77dl5y7pHgLfunOs
re1LnCRnsIuRotXXvXAq7nbtHpS7aujKbROCeyOnpI5GQ/9ZDWcRQJ0XjU90hkcR
K09ugM1sj5gkRlfdLtCClg8bdZzATg==
=A35u
-----END PGP SIGNATURE-----

--Sig_/23nb6bfbw7dGu3aooafdI=g--

