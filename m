Return-Path: <linux-next+bounces-5695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8EEA563D8
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 10:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC8B916C992
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 09:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49EA20B207;
	Fri,  7 Mar 2025 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m9WvjSee"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D71206F16;
	Fri,  7 Mar 2025 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339871; cv=none; b=oKfJlCGD6VnbzsBcaz3LEKu5sg5/lZw22JlORe3tH2ln4YzDkA2DUZR6HiLbxwKhFUwTp0IcTf0Y1R+S/hH+urUg2mNwAAP3qOEHAWZM3Lz8JNubsbFpNCV34HtNGyNY8C5BeFm2i44/IhsstPvXgu4ZstGlxwJvxf26e72igFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339871; c=relaxed/simple;
	bh=lFuJHQvGYq32ipY1BXC5XmFj3Ly02CxT1ItdBEJ989c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XeIGCx+49ufm20wE1AZsUQ0YbYL1prmqPE2lRHceyaSvkjPIuYuf3+HSGL/fbBAAyzBLygAXz7q9aCso7CAnracFwSQpZTLt0UNKETET9vSKWNvzH4C9mEAzsbJ5ilF+M3xsGnMey9u4mspOXKL5bgwIyugRsuRlbhY44bH1y0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m9WvjSee; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741339866;
	bh=z60q09Vz7nfb7WTpTXDnM4/nJciB4n6edArl2GQm10s=;
	h=Date:From:To:Cc:Subject:From;
	b=m9WvjSeejJs7Pz7AwGziF3QIqTv1g1IjhsLw97QrHbuF8+D3Ax6UIatpLj7hKTecR
	 M60UcvZCiFjFN5tG3e/5QEnq0tuv4Lkx1XxOg5w+ztAgBQD0UUzMx7vJYzGgaS1LZW
	 Pvesl2kzi6S9z9D8f3Anj7Qw6rT6RGJTidh9184wgG4bo41ItQYnZ+UK74KPW0asa2
	 34T4EqrrtRpCQs5F5yFBBh2D0OoiZkLVGSU5KHQ+MgzaTjt1UktOKqhLhPjKs88uCa
	 cyjwDyWIVbDDR576EhnmXe+MR2hqanFxT5VW0oQ+bWN4DNI12DFrpEV85MAh4UtA3s
	 Otnfy8RBGO1kQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8Ld572hLz4wcj;
	Fri,  7 Mar 2025 20:31:05 +1100 (AEDT)
Date: Fri, 7 Mar 2025 20:31:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hmm tree
Message-ID: <20250307203105.29644abd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+1dYvtUl3yT4kdN_XL24__h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+1dYvtUl3yT4kdN_XL24__h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (htmldocs) produced
this warning:

include/uapi/fwctl/cxl.h:53: warning: Function parameter or struct member '=
payload' not described in 'fwctl_rpc_cxl_out'

Introduced by commit

  72749296d686 ("cxl: Add support to handle user feature commands for get f=
eature")

--=20
Cheers,
Stephen Rothwell

--Sig_/+1dYvtUl3yT4kdN_XL24__h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKvNkACgkQAVBC80lX
0Gy6Wwf/QIa5Lsv7aUrq+x40sLkR0pwdYcMeR0GPvQFMeQ01AGWbMTMrygVx3R4H
XZndR8Y+ic8ChD0StZhHZae49x6zUBls1FkOs+PSmT6Od1enSur3Ce8zcLIHORiy
kaKP0xidGRZs6Yc1vFyha9lYTMw7KWb41Ltlv4nB7rx7TJipZaXJahv7KD7Ae3My
y0cxLDygMRNHoNtwXxtqR6w5djzIhuR+3OUXOQeE6ZDRoBXasM0RxZL/WraUTiFa
xDKgZTIowJ+qhsKNkcgvD9oYNOF2xgS1+r6GhMLofP2VjdkZIX0MDA5G8ZMyBVHB
VD75+trqMcANKOQCh35PpP6kiJzvgw==
=3OyP
-----END PGP SIGNATURE-----

--Sig_/+1dYvtUl3yT4kdN_XL24__h--

