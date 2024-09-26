Return-Path: <linux-next+bounces-3983-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9946F987AD7
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 23:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBC0A1C21C2E
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 21:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9425C188733;
	Thu, 26 Sep 2024 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VfIwrFbK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B74D8C8;
	Thu, 26 Sep 2024 21:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727387687; cv=none; b=lehe/iiQIA3TM3RlKVvp22evRWJukcDVGpVBhC2EJeTKOv1lOVoc4ri/yJcLnPL+gABj30kfJFm8VNx7G2c3+xCrj3/MS0zlu9CgHVavMW0ZZKMqmMPyntvFFU3fc3/kWC7yea2tx3hI0m27q5xnbADmR5A3fEvN9kaiaoWxgoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727387687; c=relaxed/simple;
	bh=GMaI/gRqjexWn4lHeEnJ/pKOc3fxdqFbjWlnY29hRGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HVcTkQPFOtEpIHuwhhFGtrSzUO7ZTc+hlgRhubGRrZ1Q7yrb5rv7RaQnmdFN05uCRI1R9w1jTNKKLNANdk0i3h5Thh7wEJ7CwlX8hEDQi0vyDt0p9gAxUjU69EmfvD4Gh9j03Gzn83R+xAjecCTqFKdXQH0VdHEygmIev6UrVlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VfIwrFbK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727387681;
	bh=TAuRc1E8BTkVpoePZCSkTfuwEKHVPj2LuCmlGX3mJGw=;
	h=Date:From:To:Cc:Subject:From;
	b=VfIwrFbK1ltnWuBcD/RSFjEKuCkMT0G00NpNgrHJkREspWwXcvuyxS3lbvXe7DJqR
	 mM4VkGUD+AUhQCa9f4ag+kOt8llattdQFCGCs3ajW5MsE7JRdiwcwWFTSvM0+6tZEi
	 FEDe7dyIawKJXRqFU/P5eD07/iS2HVxzFtiLQT3Xlwo7kdcToT6teHrnqebGY43H1P
	 r47Y1zoXT8ZrSlJX5l0HaZv9aK72q6I+WpbyaioW/BWhFHecnMOCNG1RPnaMQSQTL1
	 /REbAx8FSRboF4iYT0JVkSUI4wTowQASg9asVbXZ/9crqIqPv5AZBt5dtaSqSNSVD2
	 4WJuU1v8dH/2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XF6ns1cJpz4xKl;
	Fri, 27 Sep 2024 07:54:40 +1000 (AEST)
Date: Fri, 27 Sep 2024 07:54:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the ftrace tree
Message-ID: <20240927075439.2dac541e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gV0tAzXY4Vl5s2lrxg=sphz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gV0tAzXY4Vl5s2lrxg=sphz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1a41e44aaf63 ("tracepoint: Support iterating over tracepoints on modules")
  3c842de2d916 ("sefltests/tracing: Add a test for tracepoint events on mod=
ules")
  4ca74b253b11 ("tracepoint: Support iterating tracepoints in a loading mod=
ule")
  59c9f2923c04 ("tracing/fprobe: Support raw tracepoints on future loaded m=
odules")
  8e327678a908 ("kprobes: Remove obsoleted declaration for init_test_probes=
")
  c37e4bc7f70a ("tracing/fprobe: Support raw tracepoint events on modules")

--=20
Cheers,
Stephen Rothwell

--Sig_/gV0tAzXY4Vl5s2lrxg=sphz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb12B8ACgkQAVBC80lX
0Gyq/Af/UC5bGI6VgEavdGaTqT+rIoRmbcpuTbb1Ejy8yh7xufQxqAfyVZFB+qoL
jlLoyICC4FFJ1lDaJeckQy55wBCR1lRrZZgq4iEn2tZ3QsrdsPwm9kIKMkg2OS8f
ony6ZsHYVY8iz+0Uz80WK3ne0UXLSmk5BCEbC0xsltixQhD/zCsrmFEmHvvKiamh
cUjR8u1D8kMJjkkwJq9us7pyaSQNBq5fOTx1d8eHl4yqEqlN/zfFRSu3iQJ4OkJ6
QNoL9tBogOOOJ3y6HPNw4xSGb3ghCiSKjPj7raB/IfCaKdKntkqitdiMXFelEwIV
PoNWLzZh/YsZLjUCatMZTU088i14cQ==
=RxQM
-----END PGP SIGNATURE-----

--Sig_/gV0tAzXY4Vl5s2lrxg=sphz--

