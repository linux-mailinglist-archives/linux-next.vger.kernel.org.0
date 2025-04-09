Return-Path: <linux-next+bounces-6190-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656F4A81A24
	for <lists+linux-next@lfdr.de>; Wed,  9 Apr 2025 02:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB8D4284BB
	for <lists+linux-next@lfdr.de>; Wed,  9 Apr 2025 00:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EEA7082D;
	Wed,  9 Apr 2025 00:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oz2NEWkq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E708AD5E;
	Wed,  9 Apr 2025 00:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744160054; cv=none; b=uDsbdzf5dKgKidC3bYiWI0I1h+Cs+539ivncXpXNadb+slUOPq8Mqsj0j91j1Q/RBef3PfqPcjmNx4mAVB2am+H23nMDDtuix1vrOVErGGkqNNxIbfmFoG3FWb7wEexOXi9gSO/odtHqP6uRnzSqKaohb9AXcor0ad7fBPpzj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744160054; c=relaxed/simple;
	bh=JfGlzv69zGEFl+qcZZ+KUNCb7tdC5fCLE2Jm5rMMsJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fw05a75/obWsWHMedbvtDeOVD8xiiNNp1rs0ssDTrZOJ5xm8Ou0bNn+ERPwPNZMsaOsW97FVkkVmHZKUhO3a55596TFfht/HNQcXppuVMwX/3XDmtoUFIrzsxm7WyMkSbMstoNy91rM+8FEc38EKE5IgYPRvrcTalE1wg0OeXQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oz2NEWkq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744160049;
	bh=oPaeGjMrA95apBWIScB3znZQ9syVg3xIAXQXCPMbO84=;
	h=Date:From:To:Cc:Subject:From;
	b=oz2NEWkqx7GG27bR2Rm1c/d6lgVO05lljh+T9sPxZz9Tt6j1vDu4zPE3phMoLOaoB
	 F2qDb032fcvkSw7/VBEB3NDeMq/MwLfpYwUCxNSVe8fYPEor+Lc3LLY8ia298gr+IS
	 LkpHwbqzoUOC14/ZQiA8WhtgRZJYypKRzdl/RSLuA5Jji4VTfsGy7xZ8+znGb9cxVE
	 P2b8FcPq/AWN/jLvGKlZ5gar+msF/2IJWjLJCbGMROm8UJ0lBELMQ20OPS4mh3xsqn
	 CqfGMsRHwDTVMRWt8lYLVxJ+VZj/0tJA2wc3fzOhSoR2HVcqQSDMfCH9Ci5erHjfPt
	 /SwNDSYON3hyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZXPbN5s44z4wby;
	Wed,  9 Apr 2025 10:54:08 +1000 (AEST)
Date: Wed, 9 Apr 2025 10:54:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Ingo Molnar
 <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20250409105408.6ca50fb5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uNRuILqIDPQ6VGZ1yoWVk/l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uNRuILqIDPQ6VGZ1yoWVk/l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c

between commit:

  8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")

from Linus' tree and commit:

  cb17fff3a254 ("drm/amdgpu/mes: remove unused functions")

from the amdgpu tree.

I fixed it up (I just used the latter since it removed the lines that
the former updated) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/uNRuILqIDPQ6VGZ1yoWVk/l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf1xTAACgkQAVBC80lX
0Gyilgf8Cksfjt1Tn8yFZjKzicWTQSOm9wVRs2SB/X0hoYhSf1Plxnw7K6f1Ggy2
QAz9pIeEQ7me/NMSwhHvi6Evv2VjKu539wQL7sbMRp5YtDYE/Ag+uvFo3/mzWmos
JB1+ew/5P6Fj74O1grFHVA6m8OcDEkN0DrxqIE2sRaYcGc6wXsQI3njph90Ubf9b
tlfBJNQBEa29rYe4PNLomNBVNpTg22hXkHaTRX3JXcNQq2YDWK926S9DZc8ipMKh
4xQXT/po4pc8ZOEdjDKmHQe05zq79GFFmc6tJ26wx+LDxIWGZLytrn42RbLqlRU4
sucBk1bkSQ1qdeap/XV5dgswuzRlvg==
=sdzi
-----END PGP SIGNATURE-----

--Sig_/uNRuILqIDPQ6VGZ1yoWVk/l--

