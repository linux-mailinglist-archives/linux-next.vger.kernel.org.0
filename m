Return-Path: <linux-next+bounces-8501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24971BA3777
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 13:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FD34C6FA7
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 11:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19505246BC6;
	Fri, 26 Sep 2025 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/03Z5zI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1C1A2398;
	Fri, 26 Sep 2025 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885632; cv=none; b=LIDT6N8bXEQjlV26wgfIkhJIaQkwtnLem0dqCsEYJ6MC+4TcMS85StMhqoQ2MWLOQ7k6WtTkWxTW3g1wcfcBHmpuYDApm6oNn+5DrCG1BolzuaV3eEwHcALHmxkg8rfySPY6NKwFqYEywzK806DOEZT31/ymXNPgfA0qZX46eMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885632; c=relaxed/simple;
	bh=K8AahNd6DL4smpboYZBm2E+eJM2r7KJlkG/ThKxeJSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhxONTr/BD/mW6kMoycA9oRJjAB747Ntj9YOIqJkLe4MRKvL6r0Nd314gq7iMclj5HOI9rs9RWKBnmgLi38QIOYhNS9uTxSnhHATkurltpsLib99cDhRCe6W5+QH+x13c2k//MxCdiTRYG9YHskq5Tohvc5LgrE5Qe+Ndx8Tb5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/03Z5zI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640F2C4CEF4;
	Fri, 26 Sep 2025 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758885631;
	bh=K8AahNd6DL4smpboYZBm2E+eJM2r7KJlkG/ThKxeJSw=;
	h=Date:From:To:Cc:Subject:From;
	b=U/03Z5zIOnNug3cCk74UshOTojRT6e7wH5IP0kNO/sSMrMEfIP16L0psZX4bQ4jpN
	 QhasIDLTxtgqC3Hh3XFMOCLa1mBBu3np835ks5jhR433G87Er03EVExZkIwEApixTk
	 0pgwjiDBpHGxaW7TQlGUmy2YkqqzVUpPcbzC+emlQ+XqKx2dcZQOi5snjC4Xb+JN4t
	 rlQdv0XZh64mkmJrOYu5/QEd9vFVvKswWNk7phSU7vyG7KlOzPXrStCyn24o8Tlha8
	 SbGjZINeWyFbN70P63i5wHZmKnP0NnKmfgf+Q00xUrJcRAK0Xin+SeetkAH6ptPuf2
	 AUCR46sXcpI0g==
Date: Fri, 26 Sep 2025 12:20:27 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs-fixes tree with the origin tree
Message-ID: <aNZ2-6TZzpXbS50a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Olj9ztmq2NnX06//"
Content-Disposition: inline


--Olj9ztmq2NnX06//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs-fixes tree got a conflict in:

  fs/btrfs/zoned.c

between commit:

  53de7ee4e28f6 ("btrfs: zoned: don't fail mount needlessly due to too many=
 active zones")

=66rom the origin tree and commit:

  cc53bd2085c8f ("btrfs: add unlikely annotations to branches leading to EI=
O")

=66rom the btrfs-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/btrfs/zoned.c
index f426276e2b6bf,e3341a84f4ab3..0000000000000
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c

--Olj9ztmq2NnX06//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWdvoACgkQJNaLcl1U
h9BUqAf/c7+BudQ0cSYvKvTzcVwm4N7pFzuhnX+SuYxTdJNMpbaGdN53brh63QMN
qielK5x29FBFj3DiR7KzswtmaiORiWJuGzT+3QFQAb/cW/0HJmAAh+lVbOURrCyx
Ucjz28gExTzYU3eNztGMXD5j1wxhJ5ybaw7ZoCnM1VFE1Xw2whp7BPimbagvSgZC
/2SktxcUVutyfEUi1Wr06A/7SHxjdOmyET41NZ9GV8dRT9zo+VwcK1XRrLNPWhs3
jB9M2iZJoZMNJNTmhbUNXffwuP/M2QAoY6oBY0JRx/xBkepiuMShoW9Q7etiRp++
Wvz72AewZHRDYQtDZxGzbHvPHUOIjg==
=z6jd
-----END PGP SIGNATURE-----

--Olj9ztmq2NnX06//--

