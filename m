Return-Path: <linux-next+bounces-2413-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337418D2ADC
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 04:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 561711C235BE
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 02:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB6E13E3E3;
	Wed, 29 May 2024 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="deLsuFU6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100F15A869;
	Wed, 29 May 2024 02:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716949810; cv=none; b=dTyAHI4wk2JCPe/9zGeKydDKQxaV4V8j5j5SXLtF3g6Y8mlP7wlZVUnAokojYvVMRVpm3TJGW5B4lysodVEsiNwqz4EM4V+BaDyWgxKleMdlmRYrQmmsiGoMEdcmtUih6l1O3MCi0kabVyMRlWHxDv7vH982OXT6/TO65yKji+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716949810; c=relaxed/simple;
	bh=sGevyeaQbVP2pffKecupj52ybBhLEYMxZ4fijwHfe1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mp8+5Mi7TmLwVfLmyBBtkXmwlY4zDYmbw47gX6sv3ddWT/j/IQ8FIJAOdDqBuFZNWuWkYV0SsjL/pAPIiulv9bGJWJ6szLjZHU6RPckBOpLCfKphjmzRJWW0AAuhzjsv5eOIf4erZRhOAp3wvsrxliTBYL3BXF299dJ6FFurUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=deLsuFU6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716949804;
	bh=/6g0fw4OFmutDd8lwRVqyN5uwrYu6v54ZLV5usaohWU=;
	h=Date:From:To:Cc:Subject:From;
	b=deLsuFU6fqyZ2Y6RexxBHU7pFuBFNPcXPMiK6+FPeICx/eRV3VdQdwykoh+2oz0rh
	 uOeR+YhXGdTyg7ZTbh0WO+nIXoQQy/JBzjSniUmZ0sXbsdP+Z9dz0BysSoct4er4ix
	 Ab/U3qYFwp454nO7M4m9ELyinwdR4bbTmoQz0keJXXjOkRRCQYGmmtigZUSlSebmDw
	 vlY6y2wSK02dZh30YFQrnymL6zfosStT6ebeKKOqcch5z3nJfhO9kJOJJo5dL5a9mr
	 Y1O8cIppashB62bNuw7WIGhqoahis0DQa0lav0tQNTovm69z32NEXGP4BLBCTUYnTm
	 LGcLuCjalNMSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VptdM5tLZz4wcq;
	Wed, 29 May 2024 12:29:59 +1000 (AEST)
Date: Wed, 29 May 2024 12:29:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240529122955.4cc16889@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AtUmK9xWZs/5L=Sdac.GNkI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AtUmK9xWZs/5L=Sdac.GNkI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_bo.c:26:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_fence.c:4:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_gem.c:15:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_mmu.c:21:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_irq.c:19:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_sched.c:26:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_trace_points.c:4:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_sysfs.c:9:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_debugfs.c:12:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from drivers/gpu/drm/v3d/v3d_submit.c:9:
drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_pe=
rformance_counters' defined but not used [-Wunused-const-variable=3D]
  118 | static const struct v3d_perf_counter_desc v3d_v42_performance_count=
ers[] =3D {
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~

Caused by commit

  3cbcbe016c31 ("drm/v3d: Add Performance Counters descriptions for V3D 4.2=
 and 7.1")

I have used the drm-misc tree from next-20240528 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/AtUmK9xWZs/5L=Sdac.GNkI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZWkyMACgkQAVBC80lX
0GzI8Af/eyAu8WGcGEYnvY7iZ4y11TYbu+SyKyxVt5lqh2YVMEN8wl2DNCo7LBaH
Qp75+hZx7nS2ZhM2GXD2J9FyiBX0qlO9GLvM0rNo4g8GDEOSEbjoj6uZWM1jTNc3
VsCJzMV9n/kHJqlUzE9Lph3iBHT5aQVNOvgcjU3B74ctt69FUvie7VNiG6VD2zXL
lw44cScalcpXFbrY5UsH5EfcFS/ibXNrwPSSEShaLRmHBs/jzDVbHMvsCfRZbXa4
E/vyInnhE+k1ZzEIgDjTqn56/EiATBFt4B4PiPrekCpjvMqnXrKW//tB5JecZ2s7
rAOuJrPiDxW9xrnUyAdlU+5lFlfLHg==
=xGpE
-----END PGP SIGNATURE-----

--Sig_/AtUmK9xWZs/5L=Sdac.GNkI--

