Return-Path: <linux-next+bounces-7318-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA683AF68F9
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 06:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F6841C23066
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 04:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7296C28935C;
	Thu,  3 Jul 2025 04:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qvt4NIff"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21382853E3;
	Thu,  3 Jul 2025 04:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751515350; cv=none; b=obnBSs7iJkmq+hwmtt1g9CiSap7UU4uP07tHnqe937D2LYmP/h0qPtcNNOpBNftXe6aEiYwTWoke0dK1pYW+MBcaM/fqwBJou0l3i80wsUG6NlFRXy+XIQIOBQ+/b/zJFH67ToEnUmtEtE0v01cZefeAoOYLaATbGAJXAkDJTXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751515350; c=relaxed/simple;
	bh=y/gNKA96Ik9ibN6WTKSDZclUu6MbvXj7RdF/07+hqx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VZgIZprgtATtOxyCBrrJvXlV7pa5EQszZd3GDP/8lwtKa4x0RDN+1l1fMEYXXEHDrULcoPH5WLaqAIANzJxX42d+f7M8u7DC3L3lGm3CCZU297h+T0BacrqJO4lhONGv9oP+gccaTbGuLJfTh5EgMheCg8ej4zFcxt06OSpSpXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qvt4NIff; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751515319;
	bh=FeqDNqBx247KctMK/8D5SjUowUGlsPzYsySN/IEDWd0=;
	h=Date:From:To:Cc:Subject:From;
	b=Qvt4NIffpaBmvPBs3Vn8GZzC1Wndwfh7Rg9O+37kzj3BpRHevkVuZAt6WDsEPpFbm
	 rIfpIKWHFYABTizUqrxDV+HeW7VGCG0JQd8cWbWSxOH8AH8OD96sNG6DG5sKpWJApq
	 UxeNqght50GUu2OvKzOidxVUWcQQfRWUCwgGBkuWx+RrA8tB5fl5MqInieqxTnOztk
	 3ngqizRvg3/CHhEbQJmr7ly4UcUV9j41ZWbJIWglogBYXAmJfn5JoTg/MiukqQwKQw
	 cb9rwChdjWYnnryds/XhDGLAFL8J7wPe98rH9V+pf5mQce+bzMRaudhhGzTISGq6OV
	 +W8OeBDbUEbMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXjkt4w2rz4wbr;
	Thu,  3 Jul 2025 14:01:58 +1000 (AEST)
Date: Thu, 3 Jul 2025 14:01:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: linux-next: manual merge of the mfd tree with the input tree
Message-ID: <20250703140155.1e118ece@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qL07yJSPHDDHX95pT.Z/mpr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qL07yJSPHDDHX95pT.Z/mpr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/input/keyboard/adp5589-keys.c

between commit:

  43a8440f3969 ("Input: adp5589 - use new GPIO line value setter callbacks")

from the input tree and commit:

  3bdbd0858df6 ("Input: adp5589: remove the driver")

from the mfd tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qL07yJSPHDDHX95pT.Z/mpr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhmALMACgkQAVBC80lX
0GwNhQgAmrZ62KE5i01Qd6GmNs1vUm90q+oa6qmO61ndTKVxoF+ZgQ7s5p6hWx9Q
14ygQNeKjwJgBSP2CTqmKCcRphVOIeU4RnMHbeM4QtdO9XVZ/mPYC/voXZ6h22Ah
Cu37voMGgQdku5TEmzYE1w9RKZBn2VHACt6dWOW2riqWVB0mqsRJc1MK2v52brnn
Jw6VE+uYVOEkGn7kpubs5cmdhgVvdxJTtN1xchxq7pqwXbdV1Nd5uIJ4FmQnV4uE
nqINY78dWa31q7y5jBjcsxId0Abq5/kdgjN5o+jL1cK7vSRoYFfkNquJpcHO87Gw
XDCbBJCUktJiqxSL/yJGuH+ofzANrg==
=9GZ1
-----END PGP SIGNATURE-----

--Sig_/qL07yJSPHDDHX95pT.Z/mpr--

