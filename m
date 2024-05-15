Return-Path: <linux-next+bounces-2308-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20B8C5F40
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 04:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26D67283C00
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 02:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9809D374FA;
	Wed, 15 May 2024 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pbwU1bmT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61577381AA;
	Wed, 15 May 2024 02:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715741293; cv=none; b=W4TYMpMNx4oVYiEyY5oKXoRrBsdqg/x+ppkCLaM/N16Oxj3tD3gOfOZeqQ4pTvjT+TnF/GRgozI0DvlngW2xLNzIKwtR+/mUDuPHb4wITsDfwjNc6hmFkT15OENuP1vFHXyw/YGTvZDL6WqybZJman5bTI3N4olFqF6CFDh2XeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715741293; c=relaxed/simple;
	bh=J8IpVA+TVmeDEG8BMLw2vNKbtjxbfIpHOz87BO+aGzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UmvdL3BWlAFIr8esey8uaQWrpXHYoYlgr3Zgpo741iS0fqybTLFawn5CsYwmtDBB85KETRVDK8hcyr/ElDwuVpasHAFQ6ohFUT7lLGIMFGPIuMUiR3OWLlcx5T8sImNUQMQtE5dqzqIxo4c10rvtnrX0B1VbR+ZRZxaORU+TboY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pbwU1bmT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715741289;
	bh=s1xqAhJBPHJOy/WnPfJwsMZ2zaaeYxarvDeVZlZURas=;
	h=Date:From:To:Cc:Subject:From;
	b=pbwU1bmT7SUw4z93MfirBeAJ5KwWbUasNvDOU3tztEBO1sX9u/HOf6HFfpygPWt+A
	 QaNaz0xVtvJ62M70SgkwTrglQubw9DAxlTn1ebbwSixyiexlf2/Ar3JNPeyBXeI0W3
	 FwbDMia/cFwUU/SGInPRdKV+bSS+dRXCbTeFMA01m5dVCa8tXpTAVoFkYFdCNXKwZZ
	 LVkg7RqRtv/GS0c6ZoFkwwP4tWPXZNC6JyiKbKXXTVvcMj5WI3iun4IeXGKGCQa9As
	 zGeLSvlCNsZWCIgxaAbjmz7PP4i57lXYic0dpf0KHyY8kHw3qgq5QERD5eeghKvs7L
	 Al6DYl2Xv+M0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfHhn3znXz4x0y;
	Wed, 15 May 2024 12:48:09 +1000 (AEST)
Date: Wed, 15 May 2024 12:48:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240515124808.06279d04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hkv7KYxt=ZJPTkeOAOTf7A4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hkv7KYxt=ZJPTkeOAOTf7A4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from arch/powerpc/include/asm/page.h:332,
                 from arch/powerpc/include/asm/mmu.h:144,
                 from arch/powerpc/include/asm/paca.h:18,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/thread_info.h:23,
                 from include/asm-generic/preempt.h:5,
                 from ./arch/powerpc/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:79,
                 from include/linux/alloc_tag.h:11,
                 from include/linux/percpu.h:5,
                 from include/linux/context_tracking_state.h:5,
                 from include/linux/hardirq.h:5,
                 from include/linux/interrupt.h:11,
                 from include/linux/trace_recursion.h:5,
                 from kernel/trace/ring_buffer.c:7:
kernel/trace/ring_buffer.c: In function '__rb_map_vma':
kernel/trace/ring_buffer.c:6286:72: warning: passing argument 1 of 'virt_to=
_pfn' makes pointer from integer without a cast [-Wint-conversion]
 6286 |                 struct page *page =3D virt_to_page(cpu_buffer->subb=
uf_ids[s]);
      |                                                  ~~~~~~~~~~~~~~~~~~=
~~~~^~~
      |                                                                    =
    |
      |                                                                    =
    long unsigned int
include/asm-generic/memory_model.h:37:45: note: in definition of macro '__p=
fn_to_page'
   37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
      |                                             ^~~
kernel/trace/ring_buffer.c:6286:37: note: in expansion of macro 'virt_to_pa=
ge'
 6286 |                 struct page *page =3D virt_to_page(cpu_buffer->subb=
uf_ids[s]);
      |                                     ^~~~~~~~~~~~
arch/powerpc/include/asm/page.h:228:53: note: expected 'const void *' but a=
rgument is of type 'long unsigned int'
  228 | static inline unsigned long virt_to_pfn(const void *kaddr)
      |                                         ~~~~~~~~~~~~^~~~~

Introduced by commit

  117c39200d9d ("ring-buffer: Introducing ring-buffer mapping functions")

My arm multi_v7_defconfig build produced a similar warning.

Is this really intended for v6.10?  It seems a bit late.

--=20
Cheers,
Stephen Rothwell

--Sig_/hkv7KYxt=ZJPTkeOAOTf7A4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZEImgACgkQAVBC80lX
0GwOhAgAj7ODuxxnNuGzSwzEfz6sbtHs/Zc+2QkfRJ9ULvjLnQ/KseOaLnHD5X2j
cJc36Q3PhKYkoPfCpjhGJJSqVSNrXnxJT4JS00Snqa4JKV6GHtMysW7MUBcrHop/
M8EXlgDYcC2uOIz0cxx70+PFVu0r1NrQvkfZq6lzpCnk5Zeg6G6TrWTPmI3aSZvL
DZ3yonmtHgEbEs7hcRxOTgV24QdjJgDXYkJyIRWbXsAkdd6GnjI3x5huD2sI39Bv
XfU7O7fzwQ1wSR53ThhzErYLtoo6iBpEyq2JqntsbCQAYh2P2q8L81SE8EnlcLf3
QyjFfARapOzKN/HFNdpos5Hd0r9U0g==
=CiAH
-----END PGP SIGNATURE-----

--Sig_/hkv7KYxt=ZJPTkeOAOTf7A4--

