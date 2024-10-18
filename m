Return-Path: <linux-next+bounces-4326-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE489A31D6
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2024 03:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B154D1C221F3
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2024 01:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C242C859;
	Fri, 18 Oct 2024 01:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lUPXq7yX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D820E31E;
	Fri, 18 Oct 2024 01:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729213242; cv=none; b=KC60ws2p41K8zfV3Q8LM5lqzymYWzhDXSc7Wvn/xu6iCp4nz6tbZKtg1XLbx1rHrao7+daQBpN7XDK0rEXMgIUJ6m9uxRIrIeDiLecmrBrM1148JnKKkKsqqDIA3lAVKVSSXAOH/6g6zy6FQ6+CTnXHJiKrjF40U53o4o3t97A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729213242; c=relaxed/simple;
	bh=riF7DXKgckTFwLO6Rmx3Cduhzi9go1shd3LNXYG+2eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UGCSVdJ0sSWo4km6cDfgIJzayhUHKl8PW1UEw+lp06YP81hAwPASuGKnLiZV9yNvAn4MhyeLFeRYJqy5PspbL64uWb/ene57L0220dWFmirx57uqIidpzijAqse2HEKf0Q/+TKeChItSA6ryoVh18ijkdAKAuLBOrGx3+xOvmIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lUPXq7yX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729213234;
	bh=6jvh+yTLoiE3AXQemCpDaaZt6WnJOMGM9zDddxp2Jfw=;
	h=Date:From:To:Cc:Subject:From;
	b=lUPXq7yXaDiH+tdVECswBi+Ja7AUX95ldH4P9s/p9qiY62YNkYiHM1Jh9NWs3c1Dl
	 tgC7u3q7jIT8bGt8sd0avAqrNMuDlw6NcRSDy/wy8KFUydYv2WfdiGhIb3ORx5W+Ed
	 qFzC9dD5wtF9q6JHiaTK5g+YEt7wB+4aM43Lzs7m5UIHBLO1ypx9y/3VadnDD8k514
	 OOGT8AI1hAOXJgRnZEuGZ3S60iUNg6F1EPvUnwLLAYqGFiY8m9IELSWrRMmhHOSLNr
	 wRCLVmJqaExuLfPa+zBTeCt5XzrYy6Rf/pd3uTSrAO80t29lqeRPumcJJlVWJs0ZRP
	 l7ZAsS2+MxfeA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XV5wf38yZz4wb0;
	Fri, 18 Oct 2024 12:00:33 +1100 (AEDT)
Date: Fri, 18 Oct 2024 12:00:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Cosmin Ratiu <cratiu@nvidia.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Subject: linux-next: manual merge of the net-next tree with Linus' tree
Message-ID: <20241018120033.03deea3e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2xv7ZjPuvrOx6LSlDwRAZG7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2xv7ZjPuvrOx6LSlDwRAZG7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/mellanox/mlx5/core/eswitch.c

between commit:

  1da9cfd6c41c ("net/mlx5: Unregister notifier on eswitch init failure")

from Linus' tree and commit:

  107a034d5c1e ("net/mlx5: qos: Store rate groups in a qos domain")

from the net-next tree.

I fixed it up (the latter contained the former change, so I just used
that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/2xv7ZjPuvrOx6LSlDwRAZG7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcRszIACgkQAVBC80lX
0GxaXgf+O0f4q7dBxI+lYswTtqOgI2gAKhAY3RwAsOOFYU8XJKAgThv6X6CV5YwN
S3U3mfhgMq99hNKAymhq9MCVhkh/9rMOBhvizPhTkO/rw91omFWmlxFyFQX5hlVI
E2nB8dD9WkKSpU6rl/eCwxREIn5tQVDabYSUfRe8NAotSwkxk0Hm/dmeudNa6Ubh
1YA8YTAvEIuO74pzf9t5DAYiQhQqcsaz8ndAbkW5pQYPklq7XcJdUtx+XZSs8pKz
BYJAPfVGf4FLXARcy9R81+SeHuqnit3E+LTwBoTu7wVNG8p/fK+gi2t0mTqwjQlQ
v3Rrc+PMQQ+aaC3rI/kIe/D1EPdiKg==
=tNpG
-----END PGP SIGNATURE-----

--Sig_/2xv7ZjPuvrOx6LSlDwRAZG7--

