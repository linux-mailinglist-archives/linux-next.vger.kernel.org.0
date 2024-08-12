Return-Path: <linux-next+bounces-3287-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE3D94E589
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 05:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148A81F21D23
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 03:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B3313A3E8;
	Mon, 12 Aug 2024 03:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PCl+6xf7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47C91C3E;
	Mon, 12 Aug 2024 03:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723433065; cv=none; b=FekOsDplfayYvjPwd4p0POXesVaYlw2sF+2/4CHs6tZAOlRmSYb87OtGBKQqasjMh3u3NkK/5WMQvM36izk3VNifCgNvROP9xztl1liHjI5zTNYmKBeD5hWtU849yso2y2YhbyLkMHuUy+BICYQHjoKjc7FaBrkrDEyK3ILzmRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723433065; c=relaxed/simple;
	bh=njG9B89npw5WwsL/z4bYU7Z/ql30hfLcbx+xXdBNNOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A9/6kWSuq5SsCPSmloq1UifQVPQHGmoVlhbuZ8PbVNetbcqd6Y317em1/sHBgbrHZCT2F24kRDZoppKeB2FWTWYa7H55TmIJgwcsuXAubBAZyCceEu2aYdblbPH20fjdwCx/aVxLlJnUA3ZRG5/pp87vlpf6G83aTwEBAYlHs6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PCl+6xf7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723433059;
	bh=VAKuMdF1LiUYtUYh3JDUU9uZLogF5+q8peQRBluW6Os=;
	h=Date:From:To:Cc:Subject:From;
	b=PCl+6xf71gFY49zglq/hdHlLx/s3sI0Tc9eGZh3KRVvpLuv1/vcvTUT7KyM10y1gl
	 kFoM15vllhjSKxygQkU/lCYYJ1vN8GM2L89omufSUiaQjQVEQ95neAAfBZFz5YCazq
	 lOGaWfyDUDok3cPhQySzpEq6UIXkNPd7Cmd9/vpCEiWK3bFBttoNXvDIhrdDNfM6Xr
	 ybNsUPbsvtXssge1vr9c+79DukpNXyQz7tizoPRFBB+azB585oxyUCEn7AlyellHGG
	 jUN7iMBuUm657GOrb3iusZR98zeulhq8JzTeYSBKz1G1A46bqf5KU5a2RG7mLk3xiy
	 yjzKhYTeZtgzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj0HR1lDrz4wnx;
	Mon, 12 Aug 2024 13:24:19 +1000 (AEST)
Date: Mon, 12 Aug 2024 13:24:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kaiyang Zhao <kaiyang2@cs.cmu.edu>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20240812132418.3349ecd3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hEek0Y2xCx8qF3xAvrr+lbu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hEek0Y2xCx8qF3xAvrr+lbu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

mm/memcontrol.c:993: warning: Function parameter or struct member 'folio' n=
ot described in 'get_mem_cgroup_from_folio'

Introduced by commit

  75747a26eec1 ("mm,memcg: provide per-cgroup counters for NUMA balancing o=
perations")

--=20
Cheers,
Stephen Rothwell

--Sig_/hEek0Y2xCx8qF3xAvrr+lbu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5gGIACgkQAVBC80lX
0GxUVAf7BCa0KASAnC257CGrle+jhZ/XmxTQJUPNOpy0jKCBUQNyYdRAb4rM2m2u
59G9tjqo2BDw0FOSDswq3vjbrU07BaSjtCtmRVLiQhLAWarZDLMIDsplLaFnXaqi
F+2YHAlEv5BHb3NYiveuq2cNZkcrZmk5/aO2LoqrIBaM2iYd3lZSwomK3jk2jiSk
fQIkAkUH92fuLGZexJtTiJ6075Bmn4G1C03cX4qX0Elz087F40IAxGY67X+3kUYD
xjGDG4NNeuThJGEqJGY2lSj2mC1JViM3hspWxNXWBQXG/wmcQkV7R0dbPzZtpRae
YCP1aQB8HyvyC/q4H7hRfoRCI4R+Wg==
=jJ6O
-----END PGP SIGNATURE-----

--Sig_/hEek0Y2xCx8qF3xAvrr+lbu--

