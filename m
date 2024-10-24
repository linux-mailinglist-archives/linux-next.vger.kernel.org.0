Return-Path: <linux-next+bounces-4418-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882E9AF3F1
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 22:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9BD4B21AA2
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 20:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76448216A1B;
	Thu, 24 Oct 2024 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DelDPcIM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430D216A1D;
	Thu, 24 Oct 2024 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729802674; cv=none; b=b4BXdLzRxdeeMoamnyKuDzu50YwuNPnrtzd4au5WUdTyDIlBf9AudoY2zKiJoQNajWRCzFst7leV4ZHuHG8KcwIBzvq3efYGrPFQaWR37dawumQEIOL0S0p1TIc7llT+OeRKStTzTJetvwgLh0PhWatfi74x/XBxkAAbXvxDYPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729802674; c=relaxed/simple;
	bh=8wwACknesbrl4HhiFNm08tMAcQ68j0NEP49to/xVOec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XJyGh979fO2IjD7aHr1DaiXV0zuW0SYHy8g1+3tPTMR4ApvNDbSfArIRci+DHJzIftn9B+ZizQx9qesOVQ1LuujTtJ6pYxUnRSpQlvitOBICyy13hZBqTOebq/dArKr5XEIy2jkletMt12n4RFqWL/caSjxHmUJ8GJ9HOWiGb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DelDPcIM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729802663;
	bh=eCy1E72EdKx5kmymPUg29zxTxGWZ8MgfS/yKdci8LBA=;
	h=Date:From:To:Cc:Subject:From;
	b=DelDPcIM78WkDPQuzoCWV4TLdaRD2Xw2YEZdq7ifMAJ0mhpsatBjeFkI0GNHvk/B5
	 ZqCRtNMSkrGpCNg7kBWC80go3/k25eSeICxxNYkC1OkQXMUqEgL8mBqQdu7gMyTWND
	 /fC33Tbuf6N9jIagWrdTEjBuTYB+sbMyhw+LU3CUAhlB017mSj6/XqoxOgNmayVWPJ
	 MlQNY8T9M/PzBlrYeWq7KFowS2WiSMMdZlam+OeuUgcXmfHcR16Uk3UMpoCIjlPoTo
	 oGFfO0ZFJdD6tIxnNzeqhhTJBhsRZsT9CGhLwpghG0sBASA+uPUZkmSOf0kHHgPWCU
	 q/lvmeOq/6Dtg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZHvq1HKtz4wb7;
	Fri, 25 Oct 2024 07:44:23 +1100 (AEDT)
Date: Fri, 25 Oct 2024 07:44:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bcachefs tree
Message-ID: <20241025074422.65ff2e0a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EGxRJUu9UAZNLD7/oDui08=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EGxRJUu9UAZNLD7/oDui08=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  07aab0860a91 ("bcachefs: fix incorrect show_options results")
  932afdd669b2 ("bcachefs: skip mount option handle for empty string.")

These are commits

  489ecc4cfdda ("bcachefs: skip mount option handle for empty string.")
  07cf8bac2d3e ("bcachefs: fix incorrect show_options results")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EGxRJUu9UAZNLD7/oDui08=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcasaYACgkQAVBC80lX
0GxbIgf/bZuXLuwCD1BmedNM7dEtyyLcYlIMAmFPl4TfQhuVha7kL1qwoau/wkXG
PihfYggrqJRaSZ7Ms9gCSxQDv1C6g/QXdopDmtoDylbGonKOD67zvAdPXlKTBpyZ
5B7BXFXJciMkKveNVUpa/Y+Ngb6h53LLxAhh9/tlsamFvdiYdRDOx7JRFYvzBLVT
n8HX+RwbFCMTI5ht76WhQCy0K698f11TVLcJLjENFaJGosQbQu47UdaRVEpUdQdx
rxL5W8/ZyH8Z6Z1yWMulRJuh19WEcD6AI84W9nTm8yqDoQdsdRVPjeX/RW1txitp
3SKlAeVHtDUYDLgX2Irislu86Oa1nA==
=sKBa
-----END PGP SIGNATURE-----

--Sig_/EGxRJUu9UAZNLD7/oDui08=--

