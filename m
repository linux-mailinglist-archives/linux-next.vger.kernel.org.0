Return-Path: <linux-next+bounces-3010-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1C930E6E
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 09:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52B31F217AD
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 07:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1671836CB;
	Mon, 15 Jul 2024 07:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="esz+u1Wi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D2183097;
	Mon, 15 Jul 2024 07:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721027183; cv=none; b=uO9gMamF6oRUt6XXM73Su7n0/fg3K5TPM/Mhh5FsDJdG2E/htcojQ70M8V23y08aIW/2GL0Su7vOAlhtZqmK6tikItlAAX0hdDKUVy4DLU1WvCjxehKOqAchgdP9UBDxZXC1YSCIrHj1thOWg32pJA8V6aiFFR1KR84rPhROWtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721027183; c=relaxed/simple;
	bh=uTB6sm1aHNWLYqrbAFr85ntxILC6KBuO8ewt2iAQQS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XQt/hEbi5v4wPj1ZvcYlloJAn4lq04PdTCAKppTN/wQolWw2O1zLUXtCdsjR5f3wzIwWCofNCjevc3YKVt9OZa8F9u87J7685OfBV8bNwaAdRAGOcYLtkvdfase/+5F7e6lo1lf6amUSRRQBitHbhZQhddRfmd0wmrS9sPTl1Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=esz+u1Wi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721027180;
	bh=GPMcpUdb4jo0+oI5HuLmRP3Y8YfpkodW65U3stH2YYE=;
	h=Date:From:To:Cc:Subject:From;
	b=esz+u1WifWyBxDW/o1udL2l3R4xjryOT8YGGCwWjGD7lcw9/68gJsfbRC/k7tcc8S
	 SpGVUL4SG/8d/YiVMtopvEdqiR9m66fjc1p/54wcissoSmpetpTUtqsXjCUxetM4iX
	 Q41/M1sTLfkEQvvcXpE1AjouMYKGvJhC6oZql3p19Ic+jSMMmSfh7UP+y+69pNLsDa
	 +kijYTtfu6blyXpAfbChoWj2OrJ+q0Hgyxe0ROhcUEAfZPTw/Jih968QCjfY9T25Ew
	 ldXw3UbMQ2otTrFZtVa9UmH4QjZPMskVWydFMjufC53tJK20nb6cG6952RfL3npT9v
	 zx5Q+bvSTlvyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMtXW74Qcz4wcr;
	Mon, 15 Jul 2024 17:06:19 +1000 (AEST)
Date: Mon, 15 Jul 2024 17:06:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Alex Shi (Tencent)" <alexs@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the slab tree
Message-ID: <20240715170619.514913ca@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/55fOEtHuvL6HPAp3v5UvSGE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/55fOEtHuvL6HPAp3v5UvSGE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the slab tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/mm_types.h:399: warning: Function parameter or struct member =
'_unused_slab_obj_ext' not described in 'folio'

Introduced by commit

  05d5996d4b9b ("mm/memcg: alignment memcg_data define condition")

--=20
Cheers,
Stephen Rothwell

--Sig_/55fOEtHuvL6HPAp3v5UvSGE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUymsACgkQAVBC80lX
0GyN3wf/Sc+yhHzb2kfYjvyNEJ/R7XzGb5RKxlNzV2GTt2DvYFaGLoSkk7fwP5+6
q+BCNQdjA+vDI5IvIpGI5iOazGTRkZ+fbpQ5bvg9Ti+z3cpDYhsPNAlCkOeFkufe
l7RXfVBSBus9HUSxB895D7os94l7zyvroK4luauQ5aLtrr85zW46NvAQe4Kqv1Hq
qlRQv51IpZe+fzk66ic6a8CrcndQZU3WD7SMrOyePyKPE4sWb+PFpoEnnhTFKtTU
wKftX00njO6fPRJfOXrK7qevYFGDXBB44cmgpzWIHWWKAZ4hxYhgyxHT62eJBWeU
wiwi6Yy6gBHkEkgyYbINijuoQH6BCQ==
=izi4
-----END PGP SIGNATURE-----

--Sig_/55fOEtHuvL6HPAp3v5UvSGE--

