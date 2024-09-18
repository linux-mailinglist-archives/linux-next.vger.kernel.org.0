Return-Path: <linux-next+bounces-3913-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599897C165
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 23:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBE43B223AB
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 21:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8C41C9ECD;
	Wed, 18 Sep 2024 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nqBjGHWF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F6619DF51;
	Wed, 18 Sep 2024 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726694935; cv=none; b=NRjoW944XcDafVDL3dBwGkaUTbqZ93nu8WGt2U+1rD1gyf0LGGILLtHBJP4TYSpCxuK3/2w7NeQKRlBhDTmpdsIcA4u8x6OgUzRBPpunbmAAuvxxCPvejizmDKA2sF8eg02hNH8qHTfLP+EpTXnIGpn89l5W/KDr2d595JleCY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726694935; c=relaxed/simple;
	bh=12MN3zXCEuIYuMlEQNdarBm7eY34ZwL8l8+wqVt/Q5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bw5mryXZ1Tbfp/nzhN6XoP70pVPWrrWxDNU7qwpkUwm5TWOyJ9rXrimhQjg51I2CGdR/ombBm1tShO3umiluvk7tK3qqK86R3LwCoF4GR8OQeRsvW21bpTnYYvUogWjkT+wYU1KI6fd+FSHbcR0mHK490b7jHzG2eztb9f7/tyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nqBjGHWF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726694930;
	bh=fIHr+/1s7xN3faKzKWmrmQAo6E7RPx19pCd5va659zM=;
	h=Date:From:To:Cc:Subject:From;
	b=nqBjGHWFhnaet1xtsLYadjl3Gg4NjqBT9DcNWF3igTtwA+GFcTokztK/rsPN0MLID
	 /Siy1BYFTc1XLkF1Ha9i+JuJzgcClyvtmCuCl7X2zZHQbTsCgsb3M2zjvzaPAoC5r0
	 Tzcufq6C0x/lOGFt1AYi8AY35UxwgOalrxDL36UI+1rz9P64dYWoWLhRkygxD+Obck
	 M6SqzL2x8L909Dw1W/NbykZuN84Tpy4GhyVqbLObXzXc5pks0qx0j5+y/9RMYGMceN
	 nSi2fff6PxFABaiPB9QN5UIM+2DXs+O6DSLcr5LmNGeTNluv6pZqfbbgoiP+R4LsNy
	 21J1dEngZi6qg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8Bbk3j0Sz4wcL;
	Thu, 19 Sep 2024 07:28:50 +1000 (AEST)
Date: Thu, 19 Sep 2024 07:28:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ftrace tree
Message-ID: <20240919072849.09486807@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RKOcy19l3OoRTQ=WqonOzie";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RKOcy19l3OoRTQ=WqonOzie
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ca088d067ebd ("uprobes: make trace_uprobe->nhit counter a per-CPU one")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/RKOcy19l3OoRTQ=WqonOzie
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrRhEACgkQAVBC80lX
0Gz0EAf+MmFTAKNBi4CwZQ+Rd9x+dOYl/21+f8tmzJeuiCQe5ORjLs16dQ2tNeSD
Cw+616s892EblWF4CBEFXzCwuRr+/dLUZP5vmV7m1vnM5q3KLI+KBIzG/TvpNvOA
T6sHV/FMwwH4zrBzXe8dcyzp5X0bNQCGn0F6aPb2SxyS35aMz1IsOk7+B9BKgQs9
JTA83Q9CHN+EAVE+KVSTnhO+6X9UcqAG3wy8sy9l7Y/wZjqanDFOkdtHTNbGv5bq
ylJ4MaD/h4jUQGHNMZpU4GNJIHqxTVj+LvgGlBeJ156NwZYLVdz5NETNd2Wj80HH
UnlYgr94rLzygBQE6mwAmmzGfZe0FA==
=8s6Q
-----END PGP SIGNATURE-----

--Sig_/RKOcy19l3OoRTQ=WqonOzie--

