Return-Path: <linux-next+bounces-496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A452881ACC8
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 03:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 626ED2844B2
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 02:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81CA8C17;
	Thu, 21 Dec 2023 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h9MbPNN4"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D938828;
	Thu, 21 Dec 2023 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1703127363;
	bh=Lr1oBlxQLw1GY9u8AUJerOmQRYWB2QKubrOP34tqmzM=;
	h=Date:From:To:Cc:Subject:From;
	b=h9MbPNN4EdWPZL9o4ehpfRCPVgbdcXDd9R7+ZtM2DBhiZCBm1mQnr2po9MaNngFUc
	 jLGuEDQWH7cZXT5NPT+yn/FnueQLW8v3wkYBc6vk2rkgb5zgR/IkqfDNnfaF3MWXaJ
	 yX3r1+0Lm+DGZB4QGRkutjt+VQjTgTWLC2fubgtOvNMyNpPRD2ArNaoCmJ/VY1bBuw
	 DjHfeFULt4SKZpMXPwoTW0mEcUtseRz7xwvmM10VAxkR/iA/QOEHlV+sh9CDMxUB4d
	 lC9EAMk20z/uJFiTdY50qvyAVNHPpXY/cCEPc18FV38bpYsnXZbHRY25K9XrOb+EbI
	 pcXrWlaunnsuw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SwZnH626Gz4xKR;
	Thu, 21 Dec 2023 13:56:03 +1100 (AEDT)
Date: Thu, 21 Dec 2023 13:56:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the block tree
Message-ID: <20231221135602.12bf82f5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EHon47Mh9tqDJwV79_5f637";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EHon47Mh9tqDJwV79_5f637
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the vfs-brauner tree as different
commits (but the same patches):

  24fa3ae9467f ("file: remove pointless wrapper")
  253ca8678d30 ("Improve __fget_files_rcu() code generation (and thus __fge=
t_light())")
  372a34e66fb7 ("fs: replace f_rcuhead with f_task_work")
  4e94ddfe2aab ("file: remove __receive_fd()")
  7cb537b6f6d7 ("file: massage cleanup of files that failed to open")
  a88c955fcfb4 ("file: s/close_fd_get_file()/file_close_fd()/g")
  eac9189c9619 ("file: stop exposing receive_fd_user()")

--=20
Cheers,
Stephen Rothwell

--Sig_/EHon47Mh9tqDJwV79_5f637
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWDqUIACgkQAVBC80lX
0GzQMAf+PX8DTNbTMO0feKDR4858ggm1OYnMH3ot3nJZI7OeQnX95iYDKdtqU6Z9
R0DVIMyzj8LS8Fz6Z2EaoWrZbmfyRzKQ5WbKDxHdmYdve4R5unrvNVIIWQgIrEuq
jIqC00OuK2xCjDPtzMigtwx0BTuspm6S7cbS1s220EGpXX2hk1gyRUyhOZyAYmzO
tw1WXtliysVSWmaZ/2KzkxUmKWkdo2NHkpbA7751kQFY0JBVeNwJL9SYc++6TQir
OYrx3Ii1r2xRUnUAAMdmogSniOi7BbcSFePcyGNwikrBMe9igMApX4zTmLOjBGfk
GzEyeg4efPpUDAUa/fG47SoCy4dC3w==
=UW6q
-----END PGP SIGNATURE-----

--Sig_/EHon47Mh9tqDJwV79_5f637--

