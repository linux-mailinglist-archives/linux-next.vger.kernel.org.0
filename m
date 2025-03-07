Return-Path: <linux-next+bounces-5690-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFFFA56264
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 09:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A28973A8988
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 08:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DA91B4141;
	Fri,  7 Mar 2025 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="icjA+9c9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CB719ABAC;
	Fri,  7 Mar 2025 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335302; cv=none; b=mxV4Vb+KURUW6EyLrlzQzo1swbwkDMVN0Tg2OUXPKvqB7LgFNszoeoXtOmsSm2aIoQbAfKXuW/J6/zNnCI6nAK/p8/Krjv+Ka7Z+vpG8tIA2ImHdtIMT0f2WoCJlw7WW9mfRa25Gh5NSv8XmSIP8rnEW29QOdlkMDbHFPrMNnZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335302; c=relaxed/simple;
	bh=ad+wWgzOD6VVEOOvn1et6WYyKf5RiDr/hQYsr9mr3+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X52di45GfQl6MJ3qHzieX9glS3gy/T3nRlloRE9bXanNbXA8z6gW7S+QP2wyrRhMkLy1kA0cE+7W3+p/Sc6SDuTMzPvn7KM5N+vyyL0j5iVP0vaB85ET814Itr813as+u4TdJsm80JCwN8twfEaOX2kzNh8txG0wZXbsFuTQBI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=icjA+9c9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741335291;
	bh=Dv0BQRpvtojFFiRisQZXxawt8DpU0LlgNvImdUnuOHI=;
	h=Date:From:To:Cc:Subject:From;
	b=icjA+9c9UMhEtnUzGY9MpTU8BH8ast3mSEfigig2UvG4UCk6MB1Y8CfPmyn9Uj9uR
	 XjE08SNJVM6o/tGDLUDvtw1Rjqs29lGsKyqzSJPoFAJ642wexUcmbrhYLxPGMkXdEc
	 kcXfM400iydAkQSnUXC/FjyDgqwNlrTh1XNPapNqB4GlwB5Jh1SmcymPi0H9LXKN7w
	 OdhlO+jnG3nZ+d8fedsYtW3gjItex/3fu/pM863JJi/m3uv1jYkVLps6Qy7V7eoU71
	 USsBcbZmNM5/bU5t9E6FXRpQpOMlG0z3XeUZMvrXjn3mZMSp4kOtXwQGVYGVaFLT/M
	 qAvsBMkvWXAmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8Jx626MXz4wcd;
	Fri,  7 Mar 2025 19:14:50 +1100 (AEDT)
Date: Fri, 7 Mar 2025 19:14:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe
 <jgg@nvidia.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the cxl tree with the hmm tree
Message-ID: <20250307191448.36be9934@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JIVP2h=FiGKzDCG36str/Pu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JIVP2h=FiGKzDCG36str/Pu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cxl tree got a conflict in:

  tools/testing/cxl/test/mem.c

between commit:

  6d9391839741 ("cxl/test: Add Get Feature support to cxl_test")

from the hmm tree and commit:

  2bb67004903c ("tools/testing/cxl: Set Shutdown State support")

from the cxl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/cxl/test/mem.c
index 9495dbcc03a7,0ceba8aa6eec..000000000000
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@@ -177,7 -169,7 +181,8 @@@ struct cxl_mockmem_data=20
  	u8 event_buf[SZ_4K];
  	u64 timestamp;
  	unsigned long sanitize_timeout;
 +	struct vendor_test_feat test_feat;
+ 	u8 shutdown_state;
  };
 =20
  static struct mock_event_log *event_find_log(struct device *dev, int log_=
type)

--Sig_/JIVP2h=FiGKzDCG36str/Pu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKqvgACgkQAVBC80lX
0GyKgQf+JpCzaHSR4lRqpnf08geJ8gqG9xG+H3Dst6j6DdoEFZ5KmLyvrvsh8AUq
5poFTqb8xJoKklthHfS4GIgck7ZaRNwx1dBHivmAt5P2Zm0DnF684tsNbOjwsCyC
FjZKoSgnEByyHZjRhYYIG2odgFAxJ0QHSCrpLpi0m5sh2VAJADOOjryDNgFkl9rB
/NGQrHhQL9qyC7lpclkItwCy4Tz36NwYWes3wsLXhTauJq/x9M4Djy6VfvoEASj+
f0NvDpB0eCrgQpuT0D19oICArK3FuBnmaDjFMNdStzNhOWGEV5Mh6qSDKfkGbc7C
vC6J5DzhR2JghD8l0DM29N28iW48Vw==
=DBg2
-----END PGP SIGNATURE-----

--Sig_/JIVP2h=FiGKzDCG36str/Pu--

