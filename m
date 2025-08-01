Return-Path: <linux-next+bounces-7801-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4ADB17B67
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 05:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BDF1586D2A
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 03:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B771E1448E3;
	Fri,  1 Aug 2025 03:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ociUoZqM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8961E33F9;
	Fri,  1 Aug 2025 03:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754019020; cv=none; b=OoZnLvN3ngdQywVidelIZgtfAGLGjjsjFcNGWuwFuAXzg61yvNcjsPCtBQVbNGH6K5CgWABjJuEJ5LAmTZdU+6rfnLJwDSMmX5sIdMX2+Fmyt9vpaeQRy4Ndi7Jaf1E2Jy65gc43ea0q3NWLMXfxrH+IPysr7I6AwyQF1CcsQcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754019020; c=relaxed/simple;
	bh=+rG6RkrtlD4q+DZ9d/Kr/kFnjxBupXnlqBW37stsxhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MGerfNUrMT+z3m+b9P19wL01pgBgBl5IwtmOyVNv7ZWDj0vd5fqmleqTB4iFudT9y57LjcU3CZyDcNBcwBSNPLR56fEF9+1zQ8MV9skR0+haEZFJ++b0ij9cTTz5zALQ7FhFiOAmdsqv/C1R+iWksXgaswucB+cXxqrlCfF/MdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ociUoZqM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754018782;
	bh=YEpyVB7BXORcn8/ntzQKlvVRXmUjh1dmTI9nTw3UdoA=;
	h=Date:From:To:Cc:Subject:From;
	b=ociUoZqMkeRW/nAbheDJkGiMBGgXgB5KuB48oCPRCR6P27qftTnMYumw+2xYVdq0F
	 OPfWvxdeg0DwNZ7OhXDkif0I24SETB19+EoPRyJbUr94reCJunRSwmc+SXtk9wEIrZ
	 B4Q0Ir1dopumTAQ3TysKixAP4JHQsAJabNlZ4RJLR3DykNJIdAq037tPTaSJVYSoNZ
	 wBsxhqhAyICT4lyATTsOUabTLuu7h3k+wpPC/e64fe6KfnXt71GQ2txsD8w9BYpNa+
	 JhQnvzOUt5bZSvCL2pyxMNZcMyWlwG1BaUN3dfAkfC5uUBD4731HAGOel1OxoLSsTV
	 wKpMvVpvb2tuw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btWZP6MxLz4w2N;
	Fri,  1 Aug 2025 13:26:21 +1000 (AEST)
Date: Fri, 1 Aug 2025 13:29:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the modules tree with the kbuild tree
Message-ID: <20250801132941.6815d93d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/es/NFSMNXHYTi43OYQqAAud";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/es/NFSMNXHYTi43OYQqAAud
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the modules tree got a conflict in:

  include/linux/moduleparam.h

between commit:

  7934a8dd8692 ("module: remove meaningless 'name' parameter from __MODULE_=
INFO()")

from the kbuild tree and commit:

  40a826bd6c82 ("module: Rename MAX_PARAM_PREFIX_LEN to __MODULE_NAME_LEN")

from the modules tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/moduleparam.h
index 00166f747e27,a04a2bc4f51e..000000000000
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@@ -17,12 -24,8 +24,9 @@@
  #define __MODULE_INFO_PREFIX KBUILD_MODNAME "."
  #endif
 =20
- /* Chosen so that structs with an unsigned long line up. */
- #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
-=20
 -#define __MODULE_INFO(tag, name, info)					  \
 -	static const char __UNIQUE_ID(name)[]				  \
 +/* Generic info of form tag =3D "info" */
 +#define MODULE_INFO(tag, info)					  \
 +	static const char __UNIQUE_ID(modinfo)[]			  \
  		__used __section(".modinfo") __aligned(1)		  \
  		=3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
 =20

--Sig_/es/NFSMNXHYTi43OYQqAAud
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMNKUACgkQAVBC80lX
0Gy5lwf/YFH7H4I78EgLgYyJOao1U3eDSZdx/z/uCMoa4doViHpNDhKG8WLpVqOO
E7cT4s0AyE1LMkcnAYP4PyiJE69WTp46kuX0Tp31os5/VYuS3UafUqclszaxxHdr
Z5at7cA46lz0OIEPphqFTY79lTgki8eCEV1fmP8wp5fq52fK9BPIUhfA3I4gv5lw
3iZXcIaxoqrkdvxSHEwFN9n8NPfS2adOJAlG9WEmWbahGHvPikL7uuegyj1/mIP9
witlTy18luyP3rSRwJswX5oum/qN+ZKjw0I93kFKb5pkyTsBdtwRPTNOFaUgdMQu
NHX3ZTGTo2rjMTo/e1WZv08TJtL2Zg==
=j8Hi
-----END PGP SIGNATURE-----

--Sig_/es/NFSMNXHYTi43OYQqAAud--

