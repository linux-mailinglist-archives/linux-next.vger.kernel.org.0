Return-Path: <linux-next+bounces-7647-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197BB0BBB8
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 06:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4251896AD1
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 04:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286A119CC28;
	Mon, 21 Jul 2025 04:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HUcz3kK6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257EE469D;
	Mon, 21 Jul 2025 04:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753071609; cv=none; b=cZ3bCvXGk72Dx4fHXNyFKhdUzAAtNirQXtYoTVpBAUX2vttsVnPYO5V29RYryG5yjvRyzJgclGX70hwrDAYmKTTRpJvXwnJUVpOXJyPAknoG7tSCLYw1QbOr3um5uJUSosMgkrPxzOeRMc3c0dzI8lT2sb0dkAJRBnpD1/DUNCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753071609; c=relaxed/simple;
	bh=eegu8XhnliDkrtnoLhFcsI9gwuo3N6c0N4F/U8ERIOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WnWu/2YCU55kuLRj0XT2ntH3ugIX+gYl2/1Ao5hY9/X9KvJygXoz2mF4bmgkZE8Mx8kM6Ve0sEyYUhcU9qsAURqXxIusZcq3a5b1+TzCbQMENhK+BzT2A7RdD0MHJz0N3vLcpU9gVO4C0E67cYekSK9vSaoPor9OpUYx9zoWurA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HUcz3kK6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753071452;
	bh=HkPSkWhg3pmeStwmeYGSd5zpZ6MCM9xdxqpouVDOC7o=;
	h=Date:From:To:Cc:Subject:From;
	b=HUcz3kK6yt4lqVlmkBCIopm8bhv1qzg69VDuyGdsS5fIB3VrnMN+tIC5hGjO0ZzJA
	 u2rtHIpLeTga3dtWUXy7aXjufX7fO2BHtxORhNmboD/+LlZ6SIKWUw8r0mLnpTAvRX
	 aeyOdBcDWNvdIrSq048vrO5J1nPF0Kg6A0ib/AaSoUiwRk79GCurNtSsW8enwwqcma
	 54Y2qhgzSxOqtZmzFfBgnmHOvPc/N176qLflu08wXTWNAFWUWnz7eRSsyW06XuCtoD
	 YzgSHE06wqzjVopBkYGB4MzKIdBK9L5HXA5bGg7EBZOq1tr0oCSv5KsDx9BjlTdpF6
	 3yYIWkRn2CiOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4blnDW4ccGz4wbb;
	Mon, 21 Jul 2025 14:17:31 +1000 (AEST)
Date: Mon, 21 Jul 2025 14:20:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Luiz Capitulino
 <luizcap@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the slab tree with the mm-unstable tree
Message-ID: <20250721142001.3d1c8777@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1PuWWKKJlkMvocUc7qMcrhU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1PuWWKKJlkMvocUc7qMcrhU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  fs/proc/page.c

between commit:

  a602ee331e31 ("fs: stable_page_flags(): use snapshot_page()")

from the mm-unstable tree and commit:

  d8178294c53e ("proc: Remove mention of PG_slab")

from the slab tree.

I fixed it up (I just used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/1PuWWKKJlkMvocUc7qMcrhU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9v/EACgkQAVBC80lX
0Gxe4Af+NuUsW41E33vKHLWwM0EEz1l951OhtbCFAveJzXqMPZly9lqdy/DbuNbC
kMKVRO0n6w5H0Ok6yvqWnMRg6xRY2ror7ZBkVAmvdRs3tzE+V2S8vxsKsEY+RAmc
2i/voxiEIv0qOya6bE9xtxdLJKIORQFpdoO2V+yEM97cADezMWEY6yheWKiTd/sc
t9G8zxNkugvCRjedBlHSKtnW3j+fsZRhTHN9sdR7/lHFTeDgzkvXdWsakGBOmTXd
be1tjyZyN48VcnXq009yk4MhXAZefbT0qL42+8pI8iEpk0OZY0dilModEgouZakf
Tuc6qczC4OcfUj337HZlqqykVBESdQ==
=Dygb
-----END PGP SIGNATURE-----

--Sig_/1PuWWKKJlkMvocUc7qMcrhU--

