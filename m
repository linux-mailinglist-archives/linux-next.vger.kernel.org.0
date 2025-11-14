Return-Path: <linux-next+bounces-8977-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02DC5B264
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 04:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9880134A740
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 03:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADCB23EA89;
	Fri, 14 Nov 2025 03:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gLKpcgPw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F10219313;
	Fri, 14 Nov 2025 03:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091141; cv=none; b=O+WqrUQAO4G6L05VU/fwSma4QP5KqOqG97M3esbOm2/EL0EpRMsVY7rl9As00UtsVGRHzgShFKDOemt5UYjULMwRHWjceCW36C2whzY9QtNBS4xgsT8SGuK2KP+ptYry81eeHg2deQTDZaQNPrqzfwzb6TxSJZ+h0HGNvGt7dl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091141; c=relaxed/simple;
	bh=3OSMDoiC+GtW1mtlIrRZjrHJhEbp2dKDFGxs2RK1uKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qraReDnOAffBmx40F88MajrkSSOS8f7vZM3LLrizul0EIrsap3Rk6GFgM3/rM7FYTDJFTUZtUw9DoMOl65H+NpYaZ66zs5kOx0tbJjr+CMpoRoXXDgOH+KfgQnx1Udbpz84o2YAEp5B7mE2t4VEWerE7ao3XeRLzNcMwuNNtu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gLKpcgPw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763091135;
	bh=a+kTq0YvCClwzJDuZID/ShuPCvWOmmI7rL4oXtFBUUc=;
	h=Date:From:To:Cc:Subject:From;
	b=gLKpcgPwvGP+JheOLkJvuYjYKkvQ/M+UfFYsBydNyqxUeunEunGl45EhwxjJs/ANR
	 7SRo71XgZCwEBmi0WvWtOCHaUtottPRVOiUM4CRifAYZrFZa8vkb109ZkFcgT68XcZ
	 Gn5w7y1ANmDMdgCJ6H3pGOejnNz5Thuv6HizE61HN1iMywfUlaJeo8uGyjkdUZycSx
	 6HO5gMlY/nJRKz890c9j3N5xpJmB5NyUv/A+3NAVnxlRU4h3FQM+XcFT8bKr0fkJgF
	 91zRZixSyqE1jBV1OABr86dLSmkLE9fMAB5vLsoTSicIqESmdzLdg6xp8o2CrS923D
	 XV1CTDgyBA0/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d72kl2Kdcz4wD3;
	Fri, 14 Nov 2025 14:32:15 +1100 (AEDT)
Date: Fri, 14 Nov 2025 14:32:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Ang Tien Sung <tiensung.ang@altera.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Khairul Anuar Romli
 <khairul.anuar.romli@altera.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mahesh Rao <mahesh.rao@altera.com>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <20251114143214.4e4cbbbd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LVN2CdxzxYm92Lyzp.ILsV=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LVN2CdxzxYm92Lyzp.ILsV=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/firmware/stratix10-svc.c

between commit:

  d0fcf70c680e ("firmware: stratix10-svc: fix bug in saving controller data=
")

from the char-misc.current tree and commit:

  bcb9f4f07061 ("firmware: stratix10-svc: Add support for async communicati=
on")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/firmware/stratix10-svc.c
index 00f58e27f6de,3acfa067c5dd..000000000000
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@@ -134,7 -255,7 +255,8 @@@ struct stratix10_async_ctrl=20
   * @complete_status: state for completion
   * @svc_fifo_lock: protect access to service message data queue
   * @invoke_fn: function to issue secure monitor call or hypervisor call
 + * @svc: manages the list of client svc drivers
+  * @actrl: async control structure
   *
   * This struct is used to create communication channels for service clien=
ts, to
   * handle secure monitor or hypervisor call.
@@@ -151,7 -272,7 +273,8 @@@ struct stratix10_svc_controller=20
  	struct completion complete_status;
  	spinlock_t svc_fifo_lock;
  	svc_invoke_fn *invoke_fn;
 +	struct stratix10_svc *svc;
+ 	struct stratix10_async_ctrl actrl;
  };
 =20
  /**
@@@ -1257,9 -2002,11 +2003,11 @@@ err_destroy_pool
 =20
  static void stratix10_svc_drv_remove(struct platform_device *pdev)
  {
 -	struct stratix10_svc *svc =3D dev_get_drvdata(&pdev->dev);
  	struct stratix10_svc_controller *ctrl =3D platform_get_drvdata(pdev);
 +	struct stratix10_svc *svc =3D ctrl->svc;
 =20
+ 	stratix10_svc_async_exit(ctrl);
+=20
  	of_platform_depopulate(ctrl->dev);
 =20
  	platform_device_unregister(svc->intel_svc_fcs);

--Sig_/LVN2CdxzxYm92Lyzp.ILsV=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWor4ACgkQAVBC80lX
0GzvJAgAlVIVQBV3QWsWnNv36ueRBHnFlax32L16Hj1f/OjaHfMaVOSfhDFO1RaP
YbjzpLtpHD1BIsTHFDDARmQVRH63ILrAL6P3g7ShJ5hj0y9dUaxFdcmpt8Ipay4g
cQYaLxoP/bPsla1VtUcgU4j0QwyZ9IwugGArnu+A8DWS8vC4M9fcgz43YHfyh/8+
zDJkbFwxJBsz/SJWziBwJsF8ixF5CFkLpuuLL1THQH5S8EbtVjPt/qHdqtoTdnDf
Rhy8Og7/S1QJanhir/0BqD7OYbf3A05x0Nj1CVxbtot09wTkwxYdN26bqSa/Jsr5
XtMXR8VETuq37tpO9/O9gp3+UmDg7w==
=YLcj
-----END PGP SIGNATURE-----

--Sig_/LVN2CdxzxYm92Lyzp.ILsV=--

