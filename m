Return-Path: <linux-next+bounces-4198-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB8997AAA
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 04:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ACCC1C21988
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 02:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3AF2C6BB;
	Thu, 10 Oct 2024 02:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DDdWD1hm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19139179A3;
	Thu, 10 Oct 2024 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728528425; cv=none; b=mTr5PFV/xnOR6Gt2T2Z2GUirsKqQm3vsmkdG2wkJOq7t18dfXwPfJCD22hBj6jC1nHHEd+xfLPNlbEeh3lWwZwBpJYUB8yPxjgtME8KIcQ6kuwmTT3E1k2C1tI5C+TxGclHfeUuLLjMxEpN4qsSPKmoBYCYXYY5bT8yAGqh9uIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728528425; c=relaxed/simple;
	bh=qvEppdChzo6d4DK4Jtu9arnULPkfDSE2/tuQQu+gygM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XpPoOvsOBgncPOpRde3NCcM+dO4nxWuVCcMiK3BnMcMpmbvoxXXLKbY5qx+pGpixR2Fv/6skj+o2J3g1burOFTncaYwLHX6DMieNy9L6rU7KecNx59wRURgsVY5IqSaYbDSryY9KXPkzGtVM2Fj7WyfPZ70bMT/zY5Bs8647+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DDdWD1hm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728528411;
	bh=jiKO6ddxp5fsBj5ocwQwlayWkPopjw0WxHYfCI40KRk=;
	h=Date:From:To:Cc:Subject:From;
	b=DDdWD1hmfHTZCbHELXNziBd+R0VPL0Z3fGWbJd01IagS0w5Y35BdiPd+w7aoenvbF
	 20j65MUbdRRHEyS4GKQOE5kgpswvyfZ5gRd0ajlF5IGtwhfsj59nqwxo+603Q8F6YZ
	 0FvFaicIYOYqwtBVE347g3z+ovc6vGXRDr1mjmdcO9hfFu0BFStSCd/ugPvIYaVo/q
	 erUYU7hBHpPLsVRiZs9JjkgcqkeT2e1bkw5B0wKX3BoXcaWvMXTOCHFucKpzmabJf7
	 axmzASD+lI8ftq6KYvFwkqn5Xb1xF1M6AB7Vght+2SSMzApGlomSbfgVDlhmX5nXw9
	 r4JyrUrbzvWEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPDfy6G6hz4wxm;
	Thu, 10 Oct 2024 13:46:49 +1100 (AEDT)
Date: Thu, 10 Oct 2024 13:46:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Zheng Yejian <zhengyejian@huaweicloud.com>, Donglin Peng
 <dolinux.peng@gmail.com>, Donglin Peng <pengdonglin@xiaomi.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241010134649.43ed357c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6.keqUnW2nI81eHysddd_Cm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6.keqUnW2nI81eHysddd_Cm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/trace/trace_functions_graph.c: In function '__trace_graph_retaddr_en=
try':
kernel/trace/trace_functions_graph.c:151:14: error: implicit declaration of=
 function 'call_filter_check_discard' [-Wimplicit-function-declaration]
  151 |         if (!call_filter_check_discard(call, entry, buffer, event))
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  21e92806d39c ("function_graph: Support recording and printing the functio=
n return address")

interacting with commit

  49e4154f4b16 ("tracing: Remove TRACE_EVENT_FL_FILTERED logic")

I have used the ftrace tree from next-20241009 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6.keqUnW2nI81eHysddd_Cm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcHQBkACgkQAVBC80lX
0Gy6Iwf/QqU+hpihRFU9kFKsIkpTMCzbtansHRKJB6y9R3/6a1V8PLZvXWdSuRxt
5E8t5UgFZu9xVeZ4NDB5GXmgb+4xpjibYGXCmSsrEUMLEkcragu7ggVFKUdoLl0d
wcUsbuKUq8H/J8zRG/HSfk1Yagmv6fWa9wAnFakJVh7iZBRzw2Lx7TjTIkumCyc2
nySD1QvF8XO98VxQzeMGtbqLKEKdso06KO2MCkWO+RaJx/qv99iNw9HeBrT2ZIy4
W55ls+S7n6M5O4z7KC3UzqPq7/0p0QeJreaiMY1rF0oZHBx7tf+pBis32ZatJ6cG
D1vkXlTSSFeYqe5BuNrBtMnh350M0A==
=EY0s
-----END PGP SIGNATURE-----

--Sig_/6.keqUnW2nI81eHysddd_Cm--

