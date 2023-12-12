Return-Path: <linux-next+bounces-345-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD080E12C
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 03:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2400B20FB0
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 02:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5FE15B7;
	Tue, 12 Dec 2023 02:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Kcptjc94"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60ECD1;
	Mon, 11 Dec 2023 18:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702346536;
	bh=CFYtWsn2IndCy2WElq0hCUbRC1bhTMQ9uOInc5HS2sA=;
	h=Date:From:To:Cc:Subject:From;
	b=Kcptjc94DFtt+rYvILHE0YVLP3yIFPyozcxsHvxriJCYmtNksRJ+eX346j2SAwvm+
	 Gs5xn//QSZQ7gXiZrSxiw+hv0figLo5uATj28UQHcEWFZQBd8KZECpgu4nlwOWCiHb
	 +qRSMDZl7OyaP/7pgWvotD17Vl5xYSjEuKsOUh4izf5SfNzJ709aY6eTF+7zAlmOOy
	 IS6EHc11UpKClz0OuSk/6biH23rBKCG9ZGmvwL3XZ9P934lgXm+OoEFVbsEsO/fyY5
	 Ii57MztAABu6ZWtS/lIgyrEr+ynLImvMCnLHw+dN4Y1/Pir6og7M09U9I2FJOCHcK6
	 tOodoyFkjH0Yg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sq21M6RMCz4x2V;
	Tue, 12 Dec 2023 13:02:14 +1100 (AEDT)
Date: Tue, 12 Dec 2023 13:02:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the block tree
Message-ID: <20231212130213.631140dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zxa0WDHCLLo4022RlVaWCNs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Zxa0WDHCLLo4022RlVaWCNs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the vfs-brauner tree as different
commits (but the same patches):

  45257bc34f6e ("fs: add Jan Kara as reviewer")
  a6945447b3f5 ("fs/inode: Make relatime_need_update return bool")
  79b667a29e41 ("file: remove __receive_fd()")
  cc0f58c94dae ("file: stop exposing receive_fd_user()")
  ede533a19a06 ("fs: replace f_rcuhead with f_task_work")
  0e79bba572b3 ("file: remove pointless wrapper")
  f71d810fb8fa ("file: s/close_fd_get_file()/file_close_fd()/g")
  c5eb80cff4cc ("pipe: wakeup wr_wait after setting max_usage")
  9da5933ccd0f ("Improve __fget_files_rcu() code generation (and thus __fge=
t_light())")
  115df1ef9d9a ("file: massage cleanup of files that failed to open")
  8c76d6d99499 ("fs/pipe: Fix lockdep false-positive in watchqueue pipe_wri=
te()")
  5e62251b344c ("fs: reformat idmapped mounts entry")
  4224a79cbaaf ("mnt_idmapping: decouple from namespaces")
  8917f5d092cf ("mnt_idmapping: remove nop check")
  f2b04f053aad ("mnt_idmapping: remove check_fsmapping()")
  1c146b0406bd ("fs/aio: obey min_nr when doing wakeups")
  4a6fa23bd7cc ("eventfd: make eventfd_signal{_mask}() void")
  21aeae27900f ("eventfd: simplify eventfd_signal_mask()")
  1808acc4fab2 ("eventfd: simplify eventfd_signal()")

These are commits

  2b0400c00405 ("fs: add Jan Kara as reviewer")
  5aa67665b0d5 ("fs/inode: Make relatime_need_update return bool")
  a125c59d2754 ("file: remove __receive_fd()")
  475febe21987 ("file: stop exposing receive_fd_user()")
  5a13208f07dc ("fs: replace f_rcuhead with f_task_work")
  b89315e5d229 ("file: remove pointless wrapper")
  33cbb3ccbc3c ("file: s/close_fd_get_file()/file_close_fd()/g")
  24d78612cdf8 ("pipe: wakeup wr_wait after setting max_usage")
  a567958e07c9 ("Improve __fget_files_rcu() code generation (and thus __fge=
t_light())")
  e87d822a8f96 ("file: massage cleanup of files that failed to open")
  055ca8355991 ("fs/pipe: Fix lockdep false-positive in watchqueue pipe_wri=
te()")
  12c1b632d970 ("fs: reformat idmapped mounts entry")
  783822e44594 ("mnt_idmapping: decouple from namespaces")
  90fbd8b175ee ("mnt_idmapping: remove nop check")
  e65a29f0235a ("mnt_idmapping: remove check_fsmapping()")
  71eb6b6b0ba9 ("fs/aio: obey min_nr when doing wakeups")
  b7638ad0c780 ("eventfd: make eventfd_signal{_mask}() void")
  120ae5859363 ("eventfd: simplify eventfd_signal_mask()")
  3652117f8548 ("eventfd: simplify eventfd_signal()")

in the vfs-brauner tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Zxa0WDHCLLo4022RlVaWCNs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV3vyUACgkQAVBC80lX
0GwEowf/RGcZ/LZhi7k4Pd1w/uNrsXMyiR5TgX23QFINl+SUaUgLUvaZ3nhcIYwn
ueYknd97HI3nlKJfsC4mjJo/c71BZVSBAruIRBQOQpcuQ56L8KrSyIQADfqRiAc4
iFDcyOe+cncpYJufkUeTvArVWwh7t3v9+chD6VUgjSo9xI9iC+GfNxTDoFFm4Cue
EfRUjYSV/e3rFmFtkxSBrVijiy3Sy9GW/RFRg3JOoyO1dBdWkONyC22mBiQ5rSbn
E87Egg09Mqdvb5XeyMkZlpDLaFqSiLfSATykazXZn699eea4XOniKvsqJHRCe4r1
GP34vFd+7q+dmek77uJl7OHLJUtsag==
=H2i5
-----END PGP SIGNATURE-----

--Sig_/Zxa0WDHCLLo4022RlVaWCNs--

