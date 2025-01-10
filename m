Return-Path: <linux-next+bounces-5132-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72CA0860F
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 04:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E093A7519
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 03:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8595158DC4;
	Fri, 10 Jan 2025 03:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RUl9SYfJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC23C2F3E;
	Fri, 10 Jan 2025 03:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736480458; cv=none; b=S4w3BDBF25QQ/3MaAf7h8UxpJIwzbNdf6rJNsakNaeuC1f8ZI3OkzuRj49KhDTLXYYnljXlmsjN2m/ZJ4GFjnOWyX+L2meS1l5K/L98Kqqgq6Nr4zj+IksbT0496WExdtWGVy5fHAKAV0b6WMzBEnz/f+pYnDBes4uaujB6MMek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736480458; c=relaxed/simple;
	bh=hTrgip7ZHGio+9BOw8iJkjgiA8x41UWNI6q+6xrdUh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sVX/dM7zY3A+D7RezOmT+uqc4KEen7nNZF6pvBwOlRx7CNFEauf6+nHvqHgRbGVxFyNBgJQnZUnYNlOtAHxwv40xk9SzuqXgEPf3eS5l6gFnPqNXp6pj6pdeN8w6rUdQc8N+qOt0UF7hq3c2n8HLH6gr3f8CF4zioim5JMKrsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RUl9SYfJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736480447;
	bh=bP3PD01KVeZbelSUWWZ6SeHJqvsalajX32tqxYPbMYQ=;
	h=Date:From:To:Cc:Subject:From;
	b=RUl9SYfJMxxjX2LqtRQ/mHUZG78R9M6wwetxvXWtbZmUqB8N1WSn8i29Ur7U/imSy
	 Dgn76Fdxqwwv69WmgxQUkXIE8vrhL01LM5bk7Hl5suXiGTfDPNJMVNXqqqnBzFp/J+
	 bbyV+WFX9jwQvu8CvkD6l1+pSzvZ1na8GeRDqK3jyYxCaYnL9crJbJCcleVn4dke06
	 Gov+BJvfjz4D3R7/vI3+AL4eP2FS4x8ee3L0V0kBvU91WGBqj6V//UDRJneG9gbPdp
	 ztakHNL44/fV2LLtiaKt5IxTS0alMWwJRZRwhqPhawxM9P55oJCEI6+LsU3p3z15dZ
	 g2EsnCLpaDSfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTnVj2jD4z4w2R;
	Fri, 10 Jan 2025 14:40:45 +1100 (AEDT)
Date: Fri, 10 Jan 2025 14:40:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr
 Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: linux-next: manual merge of the driver-core tree with the modules
 tree
Message-ID: <20250110144051.36796c49@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A.TpYBBR=qKrgwl9AHeAGt7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A.TpYBBR=qKrgwl9AHeAGt7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  kernel/module/sysfs.c

between commit:

  9953f4227850 ("module: sysfs: Add notes attributes through attribute_grou=
p")

from the modules tree and commit:

  3675a926feef ("sysfs: constify bin_attribute argument of sysfs_bin_attr_s=
imple_read()")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/module/sysfs.c
index f99616499e2e,254017b58b64..000000000000
--- a/kernel/module/sysfs.c
+++ b/kernel/module/sysfs.c
@@@ -190,8 -196,8 +190,8 @@@ static int add_notes_attrs(struct modul
  			nattr->attr.mode =3D 0444;
  			nattr->size =3D info->sechdrs[i].sh_size;
  			nattr->private =3D (void *)info->sechdrs[i].sh_addr;
- 			nattr->read =3D sysfs_bin_attr_simple_read;
+ 			nattr->read_new =3D sysfs_bin_attr_simple_read;
 -			++nattr;
 +			*(gattr++) =3D nattr++;
  		}
  		++loaded;
  	}

--Sig_/A.TpYBBR=qKrgwl9AHeAGt7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAlsMACgkQAVBC80lX
0Gyukwf/UAtmTVabvllTw1ppm6rS6Nes7q74xr4TPtKUcazaAt7KuOzmPdoyEA9l
ErwqGmtoBuShvDt9UAS42ALwhxCW+jhEjXwvdyn54fTIfRNdYRx9ZYmLy5xmS5ft
7FWK7ASFEluwejW+RnfVfx1ggajpEbme7J30Z4Yr7LZKfULJ7gukV+2PEMdkZeun
WJmb6KuavUr7A+MShQUrIJNqEGKTs469IZ/lFwatJcRXmtrELWXAK+391CqLACh1
maRoncBsAj5RQK1qEMgJ3/S5T7/fXZtE1IZPM0p2cdrPMcfnNDZy6WejGp5bYfW4
9VhfE52gptDP6zixW71mrIzxG/VbUw==
=K2Oy
-----END PGP SIGNATURE-----

--Sig_/A.TpYBBR=qKrgwl9AHeAGt7--

