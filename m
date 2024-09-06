Return-Path: <linux-next+bounces-3644-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF096EE30
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 10:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B888DB2290C
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 08:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB82A156887;
	Fri,  6 Sep 2024 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lAbhSCkw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B672545BE3;
	Fri,  6 Sep 2024 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725611627; cv=none; b=tVqI4pHRLlwhYxvQUnLjVOrqTZkReWu5nMgZaPhZxoJpydnsLIBx2t+YuxWxoJ8X6PdgAGEc+i692N0hqPzt7cTX39tsIv9ErGeWCQo19U1VbxHYPxBkGB4tSkfN2Jp0HWssh6Nx4VP9DV6+tmzi+7MSOUVOzGVics69tl8/Vjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725611627; c=relaxed/simple;
	bh=zfqVcNDd2InBULh79J4Bpfr4W/mecVaaNu0JccNnN0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WiwR4PdyXLjfCpApPznwacn5ZwEwdfGmIl7BIoPFB0bfYaXALz9I3rzWY0DXSxJbgD1xcGLBu979r2hS3bBvpC7UGEQFMBXdv3TAaf6tqnWYA5xcUEmXWcLY63hxdTD9qwq0wquDhUu9Usr7yfZuUBzMRzQvAyx83erBDEJzgHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lAbhSCkw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725611623;
	bh=oWhWhJ1rtSPcuJ/t1xAToET/G6tEZKPb4PuXuNI2Hw8=;
	h=Date:From:To:Cc:Subject:From;
	b=lAbhSCkwEzViSjcIa0XORiO2QFDgTSs2pHIjZINGRpDmsnreqSW+twOU8VdKf5Ocd
	 cYsPnz9fPiYfy/5xdVtU/q8hUpddcMUqaQrYpKwybjFIc5JT5DN0Se13ug5dpnvxr7
	 wXvL3DJM8fSvm92C8BCsBaVG9gI9Q5hfF+puVi+U7ZroGdBiOfx2V166Yz/eX8stGH
	 1gs7kEX7bks0bRyAWrGxI4wEIJMiI+mmMffEobtRNpu8L9PIdhV9esT9VvK2R2kgVw
	 bypDiXGkcUL4rSiur1n61rAhzeX4r8zu0j38UlS+cUx5ajGzFLMZjX0qD65hh66Slr
	 6YANg+kVNSt1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0Tyv3qDBz4x0H;
	Fri,  6 Sep 2024 18:33:43 +1000 (AEST)
Date: Fri, 6 Sep 2024 18:33:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the slab tree
Message-ID: <20240906183342.78d62a54@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VtoQ=jgr3bk8pqcBWL++1VA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VtoQ=jgr3bk8pqcBWL++1VA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the slab tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/slab.h:244: warning: Cannot understand  * @align: The require=
d alignment for the objects.
 on line 244 - I thought it was a doc line

Introduced by commit

  0c64b97ac116 ("slab: add struct kmem_cache_args")

--=20
Cheers,
Stephen Rothwell

--Sig_/VtoQ=jgr3bk8pqcBWL++1VA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbavmYACgkQAVBC80lX
0Gwmmgf/WeN8lZwfxJHe/vGPHatVkb3/O2ioQEeNXXQhDUNN6X2coLOLA0wWQvK5
Edwxh0JO7qUC0DORv8tCxaahuQi+i0IxtWn62Eaql7pnp0Spf/ZzOGBckp5xbIH+
B/nDHPX37MVJOMCAxldb1TtnbJtpiZ96nSdqgOvXJ8DJFSrwhqrVhLouDSZ7Z/dE
G2tQzPzY1W/DQgbGYlFCctU8/PcKtFIbaDKmG91vas/xNkkHtnexA+UHiqkf0cmg
gW5dnzc91AebOFpV/f+fGfdyLTK39sTx/wAYXUJ5FWTmWPkgRA4pko0LS+7Dbp4H
bwU7EFxwLJt3Clr+v8JQA31svsSamg==
=3bY/
-----END PGP SIGNATURE-----

--Sig_/VtoQ=jgr3bk8pqcBWL++1VA--

