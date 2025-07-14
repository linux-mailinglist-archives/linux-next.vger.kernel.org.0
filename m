Return-Path: <linux-next+bounces-7531-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E52B049EA
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 00:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25DF017EBE5
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 22:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30559230BE3;
	Mon, 14 Jul 2025 22:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WCx4Fm/7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93220A5D6;
	Mon, 14 Jul 2025 22:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752530570; cv=none; b=AyIE3v1s8xqZa3BQdHublGg9rnV5G65pWZmvTbkh6jKRoEE5HaLPaHLGLoW/RxKgk24roFVE0CTf4mUSs6IwaYlBuqy+ZWi3BcgbHQnmyIagr5biP0XvvAfC6d5lwx/vo7tMKnBy2p2IHth/lf9X9tfvOmzVwFr9+QLnD10hseM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752530570; c=relaxed/simple;
	bh=JGE1wDGx3xAOmjvKZ4dyFo3/vl1S4o/l/NIby3eNNXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P8wa3kEign9dHr5UB5cnUOWHq4d4/8dNHpGYZ8xideUadoOZizreDrlrn/OJpDZP/sW9DCyx0is+lhymuJLycciwXmG2LLOGJXlaMNMVBNvAKTEmRjC6Jzup7qjJfh8hlE0AP094/BuYg1Ae7z8WbL8RnJ6viyw1d3GfQ7Qjxxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WCx4Fm/7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752530460;
	bh=C7Ml6jV9UoQjB3YOr822a/ax+E8sd+966vN5TJvqTm4=;
	h=Date:From:To:Cc:Subject:From;
	b=WCx4Fm/7qI9qPZSelTZqcVqYXdN08hTu4HTYjz6gS6NgxFhT1RMjzQpdrXEeQrdx7
	 x2lMq9MjMH0cElxCvleVD7fFmg/6Sl1AeINlEx4IIJRIDaLRnA/2DFNknP8x/wTm8I
	 Kkec2RX6IfuaLqZY0r6AouGrTsMnGdKpHin/jHfe1KA6xgoSRsXmv4PrDJpC8undKq
	 B7a0u3/ZUnRzU3ZXp0otHT+XRWFfq9Q504XryNbr9XDgc/wTVTGaB1jVwHCw1sWM16
	 dfrCPniWUwZk3qu8dS33XJ2wCezdt6I5JYPqOA+dhKl1cIqroXOxN7L7FW2hmSfPZh
	 25tn2ZzvDBiUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgx8r0xxTz4wbY;
	Tue, 15 Jul 2025 08:01:00 +1000 (AEST)
Date: Tue, 15 Jul 2025 08:02:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the jfs tree
Message-ID: <20250715080244.375a152c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6t8x4L8badqpMDMVzHlec4t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6t8x4L8badqpMDMVzHlec4t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  4c5232572aee ("jfs: truncate good inode pages when hard link is 0")
  96a7c5605a49 ("jfs: upper bound check of tree index in dbAllocAG")

are missing a Signed-off-by from their authors.

Please fix up these mailing list munged addresses e.g. the Reply-To
address is probably correct?

--=20
Cheers,
Stephen Rothwell

--Sig_/6t8x4L8badqpMDMVzHlec4t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh1foQACgkQAVBC80lX
0GyUIwgAk3FyjONYVdiAB9wUW1a99cE7mQWr39kME8jNZTnjGYAYyYeqiB+Pczt3
Gv6dH676/Dhxdyn+echcd6ZahT+UzyoUb51kO4q9urXD8xY1sR3dZQfxlNxe5o7p
4B6uJHhPDB05znMMUk12rjOLxV6i629RWtGvI57R+NqUaUHH2wAVIsdtKO9HOfbm
MN7MDjX5ihKCepbnduNn6Oew/a851dJ6Rm7un6t7z3zfvpLcm/Bw8bjz7MLfL7xQ
VA9dxaKSMT+yxhR0OVZTAunvujrjvGxDTcjfLNaeg/FkujzVRT8/PGxpgL0jDB4M
3FcS5Q8U8wgmw6Lq9ZwIQLbwQGd1Yw==
=dbZx
-----END PGP SIGNATURE-----

--Sig_/6t8x4L8badqpMDMVzHlec4t--

