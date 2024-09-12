Return-Path: <linux-next+bounces-3774-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFA975F9A
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 05:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 121F52844A8
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 03:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF427DA67;
	Thu, 12 Sep 2024 03:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kL/RcbnM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506228F5;
	Thu, 12 Sep 2024 03:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726111155; cv=none; b=Dj/2j4dVKh5TKQiBFCk6JGTfkNpREtGd0KGnnjbHM5BIX5ftpR0XAJvuNEIkcY/kCTNNL+iuIzJQhr9zXTut9BBKQt/NMhXMoBRaxlu3acIZ9E50JeZejV+IIZLs7gabv24oylCWjATkwxza9DtB4+x9cnWg7eUj/RTKt1YlVIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726111155; c=relaxed/simple;
	bh=10Hzo8yoE0IM8JuqwSpnU2triLci0mempS8gwX6EpIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QcGUsJUl/yFgW7kj4ASMhT7f1IaeWT7DhgUUX4nus3o3Hi0h46atcVBLOHsAiiG4qlF0LFz5WS/3iMALBzCDJSCgPRjMIGkc8OEiG4YEJ/aDF7xfxqK2aKmcNfY+QkxD/vPoWlfvxbwONHywfZlTYrEG/YMheawcNVBqawDlGEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kL/RcbnM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726111148;
	bh=HuOlq/KZ6L7kveB/YZxaq/groAzlZhjQD6fVM8bZYvo=;
	h=Date:From:To:Cc:Subject:From;
	b=kL/RcbnMN7nI2PRIi2RAE1up4F66uo4HbtN+MlES+RUWoENjJvqfIVJ9S3MV5XT7f
	 NjeJUEaxFVxHXXEpVhvicYpHp61qvvmHZopQ2sriXI7qKN9x0KvgBG3lST9Z6CxVUT
	 G7j+PGj9N42t1zxTu+dD8o+yRmoO1Lim9BXdQfneZzG9DVSrYJQP6fctp6c1kHU/xl
	 CQDyJQZ9UstZMNKWMfBOAaAGJHnEH7Qq7lbDRXC2Gm5Un5gHczHaDVaT3WY7tnYRWq
	 n2GAO7kvQLqXxrgIZi9h3sjFBWTpHT5eU9i8WJA0zLpYqL3I5tWDBclLhYRqwCFCTo
	 Ht9qqBoY1A2KQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X42j82DVTz4wcL;
	Thu, 12 Sep 2024 13:19:07 +1000 (AEST)
Date: Thu, 12 Sep 2024 13:19:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the net-next tree
Message-ID: <20240912131906.1d96c87c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/285=.ozpEip_Z0hBq/vOPbI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/285=.ozpEip_Z0hBq/vOPbI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

net/hsr/hsr_slave.c: In function 'hsr_handle_frame':
net/hsr/hsr_slave.c:74:34: error: 'struct hsr_priv' has no member named 'se=
qnr_lock'
   74 |                 spin_lock_bh(&hsr->seqnr_lock);
      |                                  ^~
net/hsr/hsr_slave.c:76:36: error: 'struct hsr_priv' has no member named 'se=
qnr_lock'
   76 |                 spin_unlock_bh(&hsr->seqnr_lock);
      |                                    ^~

Caused by commit

  430d67bdcb04 ("net: hsr: Use the seqnr lock for frames received via inter=
link port.")

interatcing with commit

  b3c9e65eb227 ("net: hsr: remove seqnr_lock")

from the net tree.

I have reverted commit 430d67bdcb04.

--=20
Cheers,
Stephen Rothwell

--Sig_/285=.ozpEip_Z0hBq/vOPbI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiXaoACgkQAVBC80lX
0GxwaQf+N2eP8DpXGuJFiNCVeEVF7fhQAArmB9cfpG881ciHGRsjfuu4BK8mNMeU
x7/6Vo23ZbpcdxLhDbh0AgQJrb7muUP3qM8fV0MBMDH92PsoE4YUaRr7BrCOL+oR
Hg9mLWs3hM9iZdjS5VbnIDNVK1FjooKeY3nrPaCsuYpebiCG0YgiwtxifM5MAHer
onCsRFqw7PYg4g+AVAeqD2KI2hP20Osc5D3VY4JopLR5XRo7imlJEpbC46A6l6MR
fS59Tzwf25fhkHakTPpzdFpKe4d9werw3dWuPmcwvengevccb+eC9ieSd1/aXQdF
r549hyMA7Zu790ElLhVxEC34oD6amg==
=F7Vg
-----END PGP SIGNATURE-----

--Sig_/285=.ozpEip_Z0hBq/vOPbI--

