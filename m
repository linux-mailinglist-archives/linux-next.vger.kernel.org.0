Return-Path: <linux-next+bounces-4124-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66E993899
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 22:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA895B22C46
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 20:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447F61D31A0;
	Mon,  7 Oct 2024 20:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CZ41CPq9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7257681727;
	Mon,  7 Oct 2024 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334477; cv=none; b=Nj1akiE9oyda1NdMsawNwlVCqSKqjRoBYIRVoqMA9LlwraILT5ZlumixI4vYke0HubYmCDtLbuHsqk1mYcy5uILKYdULqWaUS6Y1I/sGwnu3MZxwFg9wsJk4APSzjPOtenyD0hzZcv0994M2VkmPkTBipjmEiFd00mJAl8pu1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334477; c=relaxed/simple;
	bh=0XSO4Z+PU1Z65iGp0SJdK6fCiescl2TV+5uAWKgSEns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dlJmzOtWAXoCBS8EK9RBKMIreGJZshNZQVcVkD9uHSajvGF2gtGCjYuOKHKzwHFmT2Y09s7/Ghv+G+90yG+hXJ8676sxpk35iEDeov+bEg8NKOndIi4OriypYR46ADDXKX7MadsCWU39Xfvl6Qiwh3ADEqQ60Xmfp3b8Q3eGvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CZ41CPq9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728334473;
	bh=0diJfBvGnZiHzF8VuYhPVjkRnqIVY7Xthz7bq0Lnclg=;
	h=Date:From:To:Cc:Subject:From;
	b=CZ41CPq9gU0G83vB2IS3/WKJPf5qHdKD6y7eggOsWfryGXjRVahZliZY481BpvvBQ
	 yO4q03hANS6iNbuxnQW6sJmTcNRSY9ZyrE2jvhNrLXdQVeNX5S9X4w4CpZLx0bP/eF
	 thvOcAZLHvuTPa66pG/OGLg/YpxCl3WdzXslrr/gIStfkjtdz4BcwIrVwdkTFbb+k1
	 JLnneKADhlhR02fEZG8oksOmxJ2NM38Mv9qhdo/dVVk/y82D+WHpM4gz/bSRwwkHCr
	 7bdaiaquThyHRnhBKvJ13Y5iXgOnetrgtHXLWxyZKmfowEOe+yzebT0x1hybPh3L5t
	 c+iRxHm95gguA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XMrxN6YB0z4wbr;
	Tue,  8 Oct 2024 07:54:32 +1100 (AEDT)
Date: Tue, 8 Oct 2024 07:54:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the slimbus tree
Message-ID: <20241008075433.78fb524d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nPvsYgwuukge1zsNksgH02Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nPvsYgwuukge1zsNksgH02Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0eb9dda9d1db ("slimbus: messaging: use 'time_left' variable with wait_for=
_completion_timeout()")
  7d317b95d033 ("slimbus: qcom-ctrl: use 'time_left' variable with wait_for=
_completion_timeout()")
  9b6e704955fa ("slimbus: generate MODULE_ALIAS() from MODULE_DEVICE_TABLE(=
)")
  9f5fd5e2aebf ("slimbus: qcom-ngd-ctrl: use 'time_left' variable with wait=
_for_completion_timeout()")

--=20
Cheers,
Stephen Rothwell

--Sig_/nPvsYgwuukge1zsNksgH02Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcESokACgkQAVBC80lX
0GzWgQf9F0HqGqMaRMKjtEBwzN2jRN2XChIWiQwx1qn4FGxDjdN9aqfgkudrTSHc
ZQpKXu+QNa7Ygs/CMC5Xv425zuQRo/tsc89RQoQY4P62AWmv70vFSgxcZ/WgkeR3
nrzODENkj0+4wa+jhp7VIbU/9jnXIn8/T+iNDvj3B1G+jbTX9Pq0jyo6i2suI5rI
GUHwyO0CvqZqEsEoIgY4aHyU1UScsPP2Y15HTaUSOgBoiaOXvs4Ei9Yf5bJnu3a7
lZtT5NLVXQBngSyJY5KipoSGREMdT0+ZoyQujFrHo0o7P8S600k7vs2uv7kQBrlh
FlxdKS1aAgdVRVAVEYAycVKs+J9P3g==
=QrdD
-----END PGP SIGNATURE-----

--Sig_/nPvsYgwuukge1zsNksgH02Q--

