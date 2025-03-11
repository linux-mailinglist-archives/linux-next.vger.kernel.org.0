Return-Path: <linux-next+bounces-5721-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B30A5B882
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 06:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 122E83A9E86
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 05:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1DD1EB5C9;
	Tue, 11 Mar 2025 05:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qa5IQytx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F74F1E9B36;
	Tue, 11 Mar 2025 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741670856; cv=none; b=lg+rclYZm3GXSx+48Y4A9VTmkWg8T3UKT1xXx6ap5FV7TDjlAGLZ6LT15Jtc+7ofmwi4VFjhO7E7s7uZR09Bq/580EEtnox2CB+yE58S9/5eXO1eG9z4WqrdK2wPUe35MpYNeQBX1fY5AT7txSfXtserK+2msaoIe5ZPgsN7Z0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741670856; c=relaxed/simple;
	bh=swyYk98GCb1QjGqyzf5ZJBUAE1q9FAtVlZRh92bxtG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tYWD9Szsbc+v4finjERTgLEioy6YzvzMjJSmWzaIVseW3ngDRIdgfkKF7uM/aqevl/j5LfzwE6HzMP9Tsa2+NDJx+QVnK1AYrFkXzIbgquaONsaxk1/b/O2Q5jAA2LUVAzz80ngOmyQQ6IrAoIgwspKgV4+/iwQ8QdXZfj5Lu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qa5IQytx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741670851;
	bh=y5fr0UTLOJJIqeRgg8Vg/OLNcU8T9+K3GX1Wh/1F2B4=;
	h=Date:From:To:Cc:Subject:From;
	b=Qa5IQytxImhu5nKdjyD20z/IqtKjdbO83gSYGxtozrj6LJz5KcJE8JnlfWs+jrbU9
	 v04/GnEzQTxmNx+vmxt0HR8Azbg+HelZOiDflDh9WxO18AWY4NzQQpc9IlzgKQlybq
	 1XQISVFlH5dkFwKFN7Jb26If/ls7wZvjl8rSewIlISjvAaiEvK6to/3M26zZ9wsblL
	 zK94ghNvKB6rC7yayrc0L/U2HJfoyLmEaEU2L5zMFbcnupQGpYCqqO748FAKh0mVrO
	 Rcqiw1TWGrdmy+N9xrk+zT+HmSgFwq0U/R/bdSEP+vIcB0UU6CXoh3h+cSyhFcBCwr
	 Zx3X04y3EpuRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBj2C2nwjz4xCW;
	Tue, 11 Mar 2025 16:27:31 +1100 (AEDT)
Date: Tue, 11 Mar 2025 16:27:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ftrace tree
Message-ID: <20250311162730.2762bbd0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z38POeWRo690QIe.Zl/IXxD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z38POeWRo690QIe.Zl/IXxD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/include/asm/page.h:185,
                 from arch/arm/include/asm/thread_info.h:14,
                 from include/linux/thread_info.h:60,
                 from include/asm-generic/preempt.h:5,
                 from ./arch/arm/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:79,
                 from include/linux/alloc_tag.h:11,
                 from include/linux/percpu.h:5,
                 from include/linux/context_tracking_state.h:5,
                 from include/linux/hardirq.h:5,
                 from include/linux/interrupt.h:11,
                 from include/linux/trace_recursion.h:5,
                 from kernel/trace/ring_buffer.c:7:
kernel/trace/ring_buffer.c: In function '__rb_map_vma':
kernel/trace/ring_buffer.c:7137:59: error: passing argument 1 of 'virt_to_p=
fn' makes pointer from integer without a cast [-Wint-conversion]
 7137 |                 if (virt_addr_valid(cpu_buffer->subbuf_ids[s]))
      |                                     ~~~~~~~~~~~~~~~~~~~~~~^~~
      |                                                           |
      |                                                           long unsi=
gned int
arch/arm/include/asm/memory.h:386:66: note: in definition of macro 'virt_ad=
dr_valid'
  386 |                                         && pfn_valid(virt_to_pfn(ka=
ddr)))
      |                                                                  ^~=
~~~
arch/arm/include/asm/memory.h:290:53: note: expected 'const void *' but arg=
ument is of type 'long unsigned int'
  290 | static inline unsigned long virt_to_pfn(const void *p)
      |                                         ~~~~~~~~~~~~^

Caused by commit

  10a299da2c2b ("ring-buffer: Allow persistent ring buffers to be mmapped")

I used the ftrace tree from next-20250307 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/z38POeWRo690QIe.Zl/IXxD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPycIACgkQAVBC80lX
0GwrDQf/QjVf9xAVRW965OaKz0OQnGhYnNsgbVIYAzDpSGWPRdss/QYb2qiT0DtR
+4OeytEp9G1rgAQJEFKTiLbEtl7mloBiOUykppnv1BhnFj895VVzcKBLHYrOS0l/
BG9kqzdbXtlMDyDuFcs5tBwsI9UXBegUOzWIQ5uGo69PTv5R6pTMyXMMmT6RQyVt
gO+2dqnfGKkNmMwjcr8C5cPap7/aClTTanxmGV8qmdBZEZHEU1jpYyHWLweeJe/P
kl1qBQFbxLWf+TKEa9SQegex/RLSvP2mMxtobNv0CdAE7hC1nt60gsjcRhcHzMB5
h5EDQoYHQ9CpQ3XxSm6TQ2WsAnJYAA==
=rWfU
-----END PGP SIGNATURE-----

--Sig_/z38POeWRo690QIe.Zl/IXxD--

