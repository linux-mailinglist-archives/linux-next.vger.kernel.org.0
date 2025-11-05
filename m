Return-Path: <linux-next+bounces-8854-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D2C38413
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 23:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3523AE7FB
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 22:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92057224B05;
	Wed,  5 Nov 2025 22:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MihoPuc4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121BF28B7EA;
	Wed,  5 Nov 2025 22:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762382999; cv=none; b=Uv0oqEeisPDVGyk6fz6jDkBQ7zG4otqbco6sD5ZgeEm/wz1J+EGfpMk5HSAkHBAAxFApX+kLE3t6bgpk+3KspaZoVWLkhstLrQwPKnmBPhjlZ+zBFIhIccLqG6rozvHIvNMkdqFxmK2cBB9Yp6C7hkMa5OT46yfCLNFdJvh/zZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762382999; c=relaxed/simple;
	bh=GpCtjN6SHyGVn3Uea1Jq3CBszKiOb3OEtVVncQOoyd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=etThl2Cvtyil17TCJmBQcHTW0NwlUJYH0uPjgyqAwXcP29CJTic8+cYK35cEacQZph6+hXfViUnDseTNgYHUtZYAg4lm2Iobu13j3ShdPfLpj/rAb0LiPIdPDDcWTL+P2Tf7uXQ32E7iR0uN74yDr3xOxzmCdMjC7sG5lJy9zcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MihoPuc4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762382992;
	bh=CO08Trqok0EYgpaOcqtK9LwfhUfVsk9sFujvAevFW3U=;
	h=Date:From:To:Cc:Subject:From;
	b=MihoPuc4ZdF8TlxA/gxpWgRDt0pUxRyxrlp1zzHccNISjMBMeHrXP2ztf4fKhL7B+
	 U4yrMZvJNzk/+HDFHpU+saKS9sqDKwSLuq+QTpASOrl9ygyBLOCw+qbHVQz265qiNH
	 dVIemAUxOo62zR9O0a5kg8lpIJGLn+HfmY1jDAtZxvSpa7Lns+FErEA4JK6p0HBJo/
	 B0Be2KUVYRC1sg0kRNKszlgiJIZwpZCp3iEV4kV2TpVFebDzrn7CFBn6EVHCeu/fv+
	 xc99ysWQ5yb8n3xj3R9IkIAL3v1Ob6ziLbK7GxWbiuDqNVqM+CcMxGNKa4CSpP4TZE
	 w2TVfSFv5GSzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d20rc3H2mz4x4g;
	Thu, 06 Nov 2025 09:49:52 +1100 (AEDT)
Date: Thu, 6 Nov 2025 09:49:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20251106094951.6fe49332@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n40uXww7+pV.f6qrym.ll2T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/n40uXww7+pV.f6qrym.ll2T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:13:
include/linux/fs.h:1431:1: error: version control conflict marker in file
 1431 | <<<<<<< HEAD
      | ^~~~~~~

and it went downhill from there :-(

Caused by commit

  3fef0b63fe1c ("Merge branch 'vfs-6.19.fs_header' into vfs.all")

Please, the order is merge stuff, test, publish ... :-(

I refetched the vfs-brauner tree (which has been updated) and tried again.

--=20
Cheers,
Stephen Rothwell

--Sig_/n40uXww7+pV.f6qrym.ll2T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkL1I8ACgkQAVBC80lX
0GybuAgAoMePJqe3Q+avikUB4msK8U/tw/z2DJXSgR3HNwVB+r1G+TKS64I9aqFd
PXNktCQYvS5UysMKBNPTTczwFimqfM1J3g2cPgCXmc2W+wmjC2QAU84m8wbXtmFc
ZDDJ/rI96434mQUgcBoPUTJTnM326pBepQJ64tk+vR59XhwshdZcq78Bv+HJ4wsr
9TwTULmKEw237+1e2yeukYAJiZ6/xe6C1G69+m4Dxs+trloIMpA232I5M0EwbgRA
sEpCZC+p9si2m4DmroNue0zG1N3CBbGxk3hkcydvYFXYfqZ6mWC2khrKvk6yV5u0
NjbC42XNZQcSopxMIG17Bumx+APSNA==
=4iL/
-----END PGP SIGNATURE-----

--Sig_/n40uXww7+pV.f6qrym.ll2T--

