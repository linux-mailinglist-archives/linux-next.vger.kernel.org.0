Return-Path: <linux-next+bounces-3941-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D272797E501
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 05:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46580281594
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 03:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403564C6E;
	Mon, 23 Sep 2024 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fHlGOGkl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F2139D;
	Mon, 23 Sep 2024 03:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727062821; cv=none; b=U/oAzweXWzvUOTsr4/CTUKywdzjPhHJy38rN/ZlNLoIPp1/KVM9aUuywV/tSgIJn/uXZHO6s3YED3WyK4RrJcE8L81Gk3/RXoAY1VRLRIrCUzwZkrehAf2ysqK17d6U1oopZsCRPVteFWpZ1NgHJ8oPqzIk3EWlnIMfYIdPz/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727062821; c=relaxed/simple;
	bh=yEXgOsxAVuCLW/auiNN+DdV5wxEH+cW85821HvN/NnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m6PCTUGVkznGTRhyi8KfSN6GaXn+JUABC6VeQZGdmSS7Zi+Qax+hrBqiHWPGsOkmAczvNlhsDYPcR7LS9OTW2sn/dI3hAlQmxLmror2H2ACgv7yOB8mvt+yi+/FLEeZr6u6cv3o3BzRDZ6BbtWQVnPEfr321tNSH3WE/hNkvsLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fHlGOGkl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727062812;
	bh=0dLzaAqs0oHdJSuaNkwZ3RqDp3/htZq7XsxpbQHdeU8=;
	h=Date:From:To:Cc:Subject:From;
	b=fHlGOGkl1Z+9cwYZVDpDdwyltXlD9laPrawa5g0l+bIEfvhbQZxMyxxqGuXs+Cm8k
	 /T9Zgo3W+QnpLi9GNA2clbeW508Z/b6oMxLIcCVrwlrw1tPyyJUGgGqkVzIkEwDUf8
	 t1HeNH+Faz/0ns76jF3SBi1BjVDDHU9SiqyKfnaz0RRfYR149FVUI0tVPgNrAX94CG
	 GNeFXFoJrYI9ikZA1tS8BDNo8LlXFdqcW5QLb5a1S1DaERZ7gG+AkYW+2ct8U6WehC
	 b9rqzMw3B2151etrCmCJjDzU5qCZ3HN5WP6xM/IKP9Jzk98Lpv6qWEkaktIjOFdg7K
	 sfODwnPctdMCQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XBpfN12Hkz4wcr;
	Mon, 23 Sep 2024 13:40:11 +1000 (AEST)
Date: Mon, 23 Sep 2024 13:40:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the cxl tree
Message-ID: <20240923134011.7b11598c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vfaYGiIGdqPHNAbZgjxvzf2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vfaYGiIGdqPHNAbZgjxvzf2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/driver-api/cxl/access-coordinates.rst:33: WARNING: Block quot=
e ends without a blank line; unexpected unindent.
Documentation/driver-api/cxl/access-coordinates.rst:34: WARNING: Block quot=
e ends without a blank line; unexpected unindent.
Documentation/driver-api/cxl/access-coordinates.rst:34: WARNING: Inline sub=
stitution_reference start-string without end-string.
Documentation/driver-api/cxl/access-coordinates.rst:35: WARNING: Block quot=
e ends without a blank line; unexpected unindent.
Documentation/driver-api/cxl/access-coordinates.rst:36: WARNING: Block quot=
e ends without a blank line; unexpected unindent.
Documentation/driver-api/cxl/access-coordinates.rst:38: WARNING: Block quot=
e ends without a blank line; unexpected unindent.
Documentation/driver-api/cxl/access-coordinates.rst:40: WARNING: Block quot=
e ends without a blank line; unexpected unindent.
Documentation/driver-api/cxl/access-coordinates.rst:42: WARNING: Definition=
 list ends without a blank line; unexpected unindent.

Introduced by commit

  43cb008f857f ("cxl: Add documentation to explain the shared link bandwidt=
h calculation")

--=20
Cheers,
Stephen Rothwell

--Sig_/vfaYGiIGdqPHNAbZgjxvzf2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbw4xsACgkQAVBC80lX
0GzMsAf8Dhs/B1TqAlaaWAK56S7pR2liDDik+7vjOVZegb1L76QUrckfLzwOWgJf
GJuwuimJUqnJVLGKEcNGto+AJZrQwEiRQk1WN7sdk26eoch1ck4Vbqb330QIq2n/
p2RFzUYomh2VnIJ3knt5J6E3Wlr/iLNptIeBBIxZAI3NQC9hJbWmcezacgDKFX/S
AssDbrIVTrECBCtWLCpXxzpdovEV1li4qe5CCmlRNXv/jNhzFEwkqptyhdwy0mg7
Yw/7T1i5pL0I8Yzpl/mO5NniBNoJn+A40SlGRfYKldYeo1lGkdUoqFYj3QD09cUS
5sCNaTbKMnipdvAuzduHcb3XNiiUuQ==
=oXc8
-----END PGP SIGNATURE-----

--Sig_/vfaYGiIGdqPHNAbZgjxvzf2--

