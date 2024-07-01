Return-Path: <linux-next+bounces-2732-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98F91D596
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA13328119E
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF801865;
	Mon,  1 Jul 2024 01:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kBU7ZfAE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609DA5F;
	Mon,  1 Jul 2024 01:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719795680; cv=none; b=gelU5grxhJ5WBfG0G2MNB0rwmg1Ol1Tx4TJnmL4BEauc4+dr8RILS8gKl8/jHNFSin3uEae9MXrJjY4SxzgYstmOIziqSmf1XbjJbTsM2RsOz1Qxxeoqg/PjEg+hYJ0HzPjCP90i+uetQDYpe0EWVoOWk5ncpeZTs2nHGhzcxWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719795680; c=relaxed/simple;
	bh=T26QpO0hszRW+vOuDMZYkBQDvcgmL6oE3qM1ctWST2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NHPkl06ZtnvQDu+qSk/6E/E4k+CFhTsDd8tTi/0HqdBl715Mqkbc8fN/qbkINeDrs57n3/7T5V2wx1vkcTLQa7jh54C+i3MSGFvTQNKE5p8ZDCwFzjRZfBcstF88dLDYAq0805HxeT90vRSWAsKfyv/wfUa/19U0yJymYTni6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kBU7ZfAE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719795674;
	bh=n7sOaVDuEiB4hZ/+CIQHxN5BPm4yOGw6a7aicLHULJw=;
	h=Date:From:To:Cc:Subject:From;
	b=kBU7ZfAEt6sye2nAaogDOPKZEP2FNGfqD0JusjxkEMjnqSv5Px/1cAqmgMhezAQ3T
	 S9bWzTikGt5ficgu4A5M46erAbUhX40Lh8YYu+S2elVYRMzvWs1j+ra0JjhG+/Fm1Q
	 RlLWZXE/Dv4/h0m8LP/pgndmQodnNjC2TRE4yvcvZqo4IsnVqQFobvdLdWIfhDC/kI
	 01XnaOkMeLCLvLJMA3kp7jaxF5vUKGJOC58Ul2jX1dG0hfMPYFlc+JLpKTWzSRg2CR
	 qJP6O0Owc8Sv/ksog8k8ufL3vt2GTKcDz565lMJC3MdJSZLfsK41pRb0vgQKTcE/P/
	 mePBo+jwcSV0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC75j6v6Nz4wbp;
	Mon,  1 Jul 2024 11:01:13 +1000 (AEST)
Date: Mon, 1 Jul 2024 11:01:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm tree
Message-ID: <20240701110113.1248c8c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i4.Oq0t3WYyVGGmMRbNJGPb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i4.Oq0t3WYyVGGmMRbNJGPb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

fs/proc/task_mmu.c: In function 'do_procmap_query':
fs/proc/task_mmu.c:598:48: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
  598 |         if (karg.vma_name_size && copy_to_user((void __user *)karg.=
vma_name_addr,
      |                                                ^
fs/proc/task_mmu.c:605:48: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
  605 |         if (karg.build_id_size && copy_to_user((void __user *)karg.=
build_id_addr,
      |                                                ^

Introduced by commits

  3757be498749 ("fs/procfs: implement efficient VMA querying API for /proc/=
<pid>/maps")
  df789ce1eb90 ("fs/procfs: add build ID fetching to PROCMAP_QUERY API")

--=20
Cheers,
Stephen Rothwell

--Sig_/i4.Oq0t3WYyVGGmMRbNJGPb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB/9kACgkQAVBC80lX
0GxgFAf/XLfXT1RwQNQ3YtG8TNVPl1GEC5INTD/kKVukyKC/sj3pmidE8WefG52V
TLQLC3YeyjQM1XxjgUpuQklxWgVEyhMSEHb7RtVwUkYWyrZpVmV4kgfN+jZTjTW6
DyTL+kJyyREcIF6LStq2siZpTB6+s0KGU7gwMlPl3KLd4rCMUDYCwRhrXKsRcwc4
l3L0LZAHC0/dMK5B3LtGVCdXSdb/xYpIW33smpRkA1keVDLZirDNEoFAnB7oYd8X
0ISF4gdZPeK999PIAfXfDCkLwUqw6f0MQFLhRK3RJoQMutGxhMPYyLkFeSBvmapf
CFd0ugiwU9iRVdvF1+22w1ZeJYm6YQ==
=r/Rp
-----END PGP SIGNATURE-----

--Sig_/i4.Oq0t3WYyVGGmMRbNJGPb--

