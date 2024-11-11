Return-Path: <linux-next+bounces-4731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 550979C36E0
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 04:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3A72B21203
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 03:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7679A13D62B;
	Mon, 11 Nov 2024 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n3uIJO9e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA9E79CD;
	Mon, 11 Nov 2024 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731294640; cv=none; b=oEkqIjU8Utw55o6GPDX+k9BYD3xd2pM8thGXiVFJd+G78TXnUmNAG9yRiCikIQuAassThOnVXKNyIKVxEW0sKUz0bFgM/UksmIaFg7YISoquFmyZCDDlITyi1EVVZ+TpiDLVBD218CHQEoTKUXd2ULbUcIagpKDjMtA4ZSbQipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731294640; c=relaxed/simple;
	bh=uE7wtkLrFkkr5ZP5dZEVaD6lbf0me56voPoqdQyPNSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CEUciymic7zE4dbLnGXJZkEksspDkEG1IupYs40+e7sbG9k3wvJkX4C5tdLSdrHMbHkdKciCRZupPulQPQJaCi9KjAtMhFWUO+HzhDb7S7wsFy2uK0IGAM1l+hPoEW3GAnTxPInl1sFcuSZOOBuH/usIjzVrF0i3KE6LyorJP3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=n3uIJO9e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731294631;
	bh=vNCScQf9VWjezJtNrCNSqYw3fxE/N1TFD4sswO0hZcQ=;
	h=Date:From:To:Cc:Subject:From;
	b=n3uIJO9eC94wZNU5aMi9WeSuYj/2wfwpPEuvVfpVsKuUdaLUsk438UsgDZwxNGelx
	 CqDDJU4rYlCyZ2mKZs2F6Pnw0JRMqpWqAamoLGAkDCEmHzbKw32kHKptzi9DfWNYBW
	 dBdNp0JlJ8A6EoeC1EIGlp+Y9GBZ60DrGGJRkjNT9DQS5ihz/zk/96ZijKMPs4xkEI
	 dDReP+gbjUIE6MJB+9BES61CCWx2/kIqvFU3q9PyMMsC3dgw5gCCoEdixH5bnpN6l9
	 pjbFc7yV9bb+LZ8vp6HDDCxl8K3uN/JSRMM+AWXgj2df0sjyyv+36uwBe0dV/DXwdL
	 DYQTWjP/UJopQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XmvgW0w8lz4x7G;
	Mon, 11 Nov 2024 14:10:31 +1100 (AEDT)
Date: Mon, 11 Nov 2024 14:10:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Breno Leitao <leitao@debian.org>, Keith Busch <kbusch@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20241111141033.2485eb96@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//=19vAkJKIy7woiqCJgNah=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//=19vAkJKIy7woiqCJgNah=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/core.c

between commit:

  6d1c69945ce6 ("nvme/host: Fix RCU list traversal to use SRCU primitive")

from Linus' tree and commit:

  6b6f6c41c8ac ("nvme: core: switch to non_owner variant of start_freeze/un=
freeze queue")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/core.c
index 855b42c92284,b5b5d5dd6b51..000000000000
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@@ -4893,9 -4891,8 +4893,9 @@@ void nvme_unfreeze(struct nvme_ctrl *ct
  	int srcu_idx;
 =20
  	srcu_idx =3D srcu_read_lock(&ctrl->srcu);
 -	list_for_each_entry_rcu(ns, &ctrl->namespaces, list)
 +	list_for_each_entry_srcu(ns, &ctrl->namespaces, list,
 +				 srcu_read_lock_held(&ctrl->srcu))
- 		blk_mq_unfreeze_queue(ns->queue);
+ 		blk_mq_unfreeze_queue_non_owner(ns->queue);
  	srcu_read_unlock(&ctrl->srcu, srcu_idx);
  	clear_bit(NVME_CTRL_FROZEN, &ctrl->flags);
  }
@@@ -4938,9 -4933,13 +4938,14 @@@ void nvme_start_freeze(struct nvme_ctr
 =20
  	set_bit(NVME_CTRL_FROZEN, &ctrl->flags);
  	srcu_idx =3D srcu_read_lock(&ctrl->srcu);
 -	list_for_each_entry_rcu(ns, &ctrl->namespaces, list)
 +	list_for_each_entry_srcu(ns, &ctrl->namespaces, list,
 +				 srcu_read_lock_held(&ctrl->srcu))
- 		blk_freeze_queue_start(ns->queue);
+ 		/*
+ 		 * Typical non_owner use case is from pci driver, in which
+ 		 * start_freeze is called from timeout work function, but
+ 		 * unfreeze is done in reset work context
+ 		 */
+ 		blk_freeze_queue_start_non_owner(ns->queue);
  	srcu_read_unlock(&ctrl->srcu, srcu_idx);
  }
  EXPORT_SYMBOL_GPL(nvme_start_freeze);

--Sig_//=19vAkJKIy7woiqCJgNah=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxdakACgkQAVBC80lX
0Gxm2wf7BWDqbkSlSYQhNRzjKsHixGTxlVhFsCC7N00yvw542oFz38VJ/JXNP0We
ODEMMABWy/fjmhedwW9GP4GAW332Fo26AKHek3JpCAC4s/1LAop0BoNABJg3ksBz
fvo/KCdBm7ixteeUNzaLr41p78b5ZttA0TJp2Au4rdA5BDm0SrS/QuagUUHdYXAE
D6K2Yo4/8cjE0hfNXcgBrmoaq7X2UYqiLBug5KOJf8SU1mz2BdBW8m4oZ3QvRaCH
vfi1zmzThefJV3nOWmvKVD4odtrpPmKVaShcfZFFSquFUBp5xGflKxnWOshsERif
i0S5+PwteDeb2ahNQharDGNo35CTRg==
=IP+m
-----END PGP SIGNATURE-----

--Sig_//=19vAkJKIy7woiqCJgNah=--

