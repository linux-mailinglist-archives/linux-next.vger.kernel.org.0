Return-Path: <linux-next+bounces-6138-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7883A785D3
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 02:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 288FE18928C5
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 00:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6792E338C;
	Wed,  2 Apr 2025 00:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hn62u9G3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E84417E0;
	Wed,  2 Apr 2025 00:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743554850; cv=none; b=ZKQBjvYIiwu1EapJPiTUJZUhL+D6kd8ce5ixK3jA5f1UZT9AXaegs72M8UoO9VuPueOZU6ZMXPyYjveENms23Vs5xeG8VNKM72eRctaFAT6+kIOfBiwi+Uhwv42hMbBfZ623UaxxDwisZKv7BUjW7SuWZszAaIt6O9/M4LW+164=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743554850; c=relaxed/simple;
	bh=X4+sk8E5fb6cVw4vLqlvldH3oiN29ffIQ1EHBotytAM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YFwYO4JnX9DkmxAIqv1GEiv6WhZbEtFklPQgdrc+lwMd1aFfl/99yYFDKoR30x2bv1tjfMXB/2mv9Vn2UhB6er1+RVHVDiq7HJIhCJS7z/BMH2q6uBSIrbuXhASFJhj139zQER5IOekx0mEx8TMB9RFirnJDsSgyakkK07llll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hn62u9G3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743554844;
	bh=NNeervXTVG2bxwUWUe5lImSIDvauv7dxdaSfyTrS2/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hn62u9G3ciFcVh+iCF1pB+qGWgEGUaQ9DJEkA0wpKCNCGEeqWbJPIDK/3AEPs0OxG
	 sf0/rwc+qlngR7/e1y7pD4Fwk6RgeWepgHS4Is61B7OeBujloAYy4jBaBhFrnbsKtJ
	 e1qS9jQTlcvwrOVnkmKumUki5FioOaY/pKdEAGKyXZdsndk2yFHbeZN1ikEA2zvcfh
	 KU/XtH4x/+oT2mH5QgXrx8QwpWdMY2pRLgsGAQcqHNv8tv0+9Kua1DQZoqjRn0Mf9y
	 CMbBusry8UHDKsABtdQi4b6ncqWsieRRvTdDTm1mf0pQ/+vXWpRoI2UdlET9PtEr+d
	 CBvFaba0wAFDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZS5mq2LqTz4wby;
	Wed,  2 Apr 2025 11:47:22 +1100 (AEDT)
Date: Wed, 2 Apr 2025 11:47:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Jiang <dave.jiang@intel.com>
Cc: paulmck@kernel.org, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Dan
 Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-cxl@vger.kernel.org, dave@stgolabs.net, jonathan.cameron@huawei.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com,
 gourry@gourry.net, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <20250402114722.35cbd9d5@canb.auug.org.au>
In-Reply-To: <e9c57344-43f3-4f90-9894-eb4f5a1b22f2@intel.com>
References: <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
	<51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
	<67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
	<1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
	<20250331132439.GD10839@nvidia.com>
	<67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
	<20250331171755.GC289482@nvidia.com>
	<67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
	<4641ce2f-74eb-45ea-a2f8-c7d0db905b7a@linux.ibm.com>
	<79a032b5-b13d-43fd-b56e-01098122e104@intel.com>
	<66ae49a8-d7f9-4fd9-b94e-9be26fd9aea4@paulmck-laptop>
	<e9c57344-43f3-4f90-9894-eb4f5a1b22f2@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W0kSwh.B3FiqaEzCB1._QLm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W0kSwh.B3FiqaEzCB1._QLm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Apr 2025 17:18:23 -0700 Dave Jiang <dave.jiang@intel.com> wrote:
>
> > I of course do have some concerns about the number of userspace packages
> > that might be required if CXL is adding seven of them...  ;-) =20
>=20
> Technically it's only 1 package. libuuid-devel. Do the other 6 come
> with the installation of libuuid-devel?

On my debian build machine, I only need uuid-dev and libuuid1 installed ...

--=20
Cheers,
Stephen Rothwell

--Sig_/W0kSwh.B3FiqaEzCB1._QLm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfsiRoACgkQAVBC80lX
0GwymAf/atmjjvLE/f5FFGLTh0ney7n3gxvB2QXt4NgrmrECnIscCmkZ1CnL2/Hd
zLdDB0t6ICZ9LecHPSbPCVY+S6Ag3f/sFBI9HI9ihBV5jZ6shILJ6OUAdmkOl//F
Gj/i2xi/dkW954MSVvW5B34ydCo/UDJlgZKWedwQFS96I5vJJeV/v2zET3oqSxIP
DV6gF4oy1nqSet4gxA4FuSWT126fL2aRlthBvQ2fc1Mr9zDK5UvDUmVEHRITKNh1
IPOe63/CGVkCSmGoElHg0L1SJ/bOfTKwM1DZaZtfa4v5kf/vKJuMBMFY0yYvwesy
wlsNyESpfg+t/5D/kypxYbkYWeimrQ==
=++to
-----END PGP SIGNATURE-----

--Sig_/W0kSwh.B3FiqaEzCB1._QLm--

