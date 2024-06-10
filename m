Return-Path: <linux-next+bounces-2504-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC68902B04
	for <lists+linux-next@lfdr.de>; Mon, 10 Jun 2024 23:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939191F2005B
	for <lists+linux-next@lfdr.de>; Mon, 10 Jun 2024 21:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C358714BF89;
	Mon, 10 Jun 2024 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bcWy75rJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DAE15099A;
	Mon, 10 Jun 2024 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718056516; cv=none; b=RlLl2An5rMt9uG7wjFcKb/bP0K6N96G+10MphjDr27OTkL4f+w2pPKboouCSFQdQKXWXruvZId9zKneDlshcy5JaXH8qbpIral5oVGCUoNtHd+gosbAoSjTR/CLdKyvPZoEF8WZhameOfrO7xlwwl14G6m4jm4TprEQDWsIBXV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718056516; c=relaxed/simple;
	bh=I31+l018ZJkAPMrqbsxHto142/RasYaNEftp5XzPRgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xd+kcs67J72mMjV3L5HnM0Tw2jjPQDdDNDSu6ZmA+wLds1On/D1fQKijaR9NlxVu15w0+X31U6MiJQ5xbAr+Qh1FYxRI2AOuqkHOeOHKGGQXwrNDiXwqAS8VP0HodUcjPO/RGA36sW+cdH3OFGB5CgBiejN2oOWVrd1tONy1wVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bcWy75rJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718056512;
	bh=TjcNnBjCpg6NTgLre5myLFTNM7i+ihou6bJ5XIR3MrU=;
	h=Date:From:To:Cc:Subject:From;
	b=bcWy75rJB9s3pH4zq4zoKKRISjGUOU9jKug3rynlixVPOGxqkOuRt9EX4tLyPc4Ht
	 Uit1/IoDkWScWX0xA6GLXhL+0Jg8WZo6ziuFoJm1uAy+1rjfKwFJ+ua2ULph3GP7av
	 UEUon91DJg7vLTqKDLrZ/J4wunQk/90oa1nT3VpiFTE5t2nrDeAJhdFwtIBUQ1Bta1
	 fsYFPGlabaSyIvTRIJsQrF5a0ZmDR0S2U7UmEgZJDR/+ngoYlXruGwF1RwNPnWwIEc
	 MrkVJmQOUuGKNzXtn+X1GhmNiiXsrpZjvPIo5DJ0WM/qbhA70AHP7JjDmY1w351wXn
	 d2erWVMNDSinw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VylwJ3qNHz4w2L;
	Tue, 11 Jun 2024 07:55:12 +1000 (AEST)
Date: Tue, 11 Jun 2024 07:55:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the btrfs-fixes tree
Message-ID: <20240611075511.523dae55@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TR1+_zdXTBzYxWav0h+l1ca";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TR1+_zdXTBzYxWav0h+l1ca
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  d202776a44d5 ("btrfs: protect folio::private when attaching extent buffer=
 folios")

--=20
Cheers,
Stephen Rothwell

--Sig_/TR1+_zdXTBzYxWav0h+l1ca
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZndj8ACgkQAVBC80lX
0GwWtgf6AxmYNexGzofKOQ+NlMAkGqjcuDdR4a6wbRwcYd6+inM680g1O9zEesN4
ZsuyHUmPtMB/vmYo7YQThhk/MCqWRbqUGGweKBMw4uCMthgdghJGlGyRTS1ymMZ0
oNeFYesZwWmEOU+DoDqOuhksm/zbS87iFS6w6oghsmj9NEZat+y6lt6RLWRDlP9F
mBfy2kuSFIe/BvTZw7KKpb0SIgrBlnhsMBYJdQpToniRKvBKjCidIBxBAOQdFRCh
xbFDNFn4G2c8m4kz2VnG/KSMan3vzE7OKR0kkCJXX/EmqkuFBIcIREtXXke1d8gD
wzI55/+EBpszfNn5xOwJc6eVs7WXlg==
=KnZs
-----END PGP SIGNATURE-----

--Sig_/TR1+_zdXTBzYxWav0h+l1ca--

