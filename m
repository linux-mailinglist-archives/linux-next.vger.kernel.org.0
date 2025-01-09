Return-Path: <linux-next+bounces-5104-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD33AA06C5D
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 04:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5533A364D
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 03:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5854A2D;
	Thu,  9 Jan 2025 03:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s0fzsh/4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271543398B;
	Thu,  9 Jan 2025 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736394067; cv=none; b=ZUVQEhJHhztKJ14H6OqYUSv12td8A+a30lc92GUApTRzcoNziHwP9yiR2iSfqD9zFDO3LSWEe/lRNijYMGro7jD1PuO/VBQhMVHkvMeee/49zfg+0T1aVMnZAQrxX7L7SVARrp8zVKVzsA0I+bZCW/YjLt0ZEl7v/i/SG4qucAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736394067; c=relaxed/simple;
	bh=Ph6Zjzl6Zbk2Y1dEbc9qPYJKLPKxVxFujcaB7DpNuAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MQms1CjmAjfoCVMvHB8RsKaU+vnkeLa+UZ0UUDxK6mD4wJC5K/REAw3JDKejHlbOSoo7I4KbGO4FlXDNoS26rxWu01W1vdBuiU3nWM5syzHC2EfKmCjctZGGS6LfSWC6At0EkB5V5I5VaCiMdWGsLc8WOTeSg541PKmPu8nGZ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s0fzsh/4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736394049;
	bh=JFNXXg1lhaUeWqg/EYPMGJlkEG/bJxfF2/9U5a42Cok=;
	h=Date:From:To:Cc:Subject:From;
	b=s0fzsh/4MP4CV7vrw4KVDE8X8ST0xa6DIiqWNeQ3nE+4PqhgVbN3YiftZC1GI3i3A
	 7wp9PiIclOhnbN09L5JypKOdz3PKGphhoaESicVxxmqI6HrATx0eh31cxr7pr/9BJZ
	 eoA7nuAtKOWJKbj/1LJSge+JXwPiAwuYV2b+YhEnVsfVIERySm55ZBlAVvrUKpaNFq
	 dv3CjqJ1NcLkAYlIK6TSdjPj+BNc73SHrT34ltG4966TygIdpBw91lsngRd7I+a0NH
	 ZODxW496E/DBYjXA/fOt7m/P2fm3fgJGebDr8vT9JIIGbqswo/dDEngD4eojrCpfFc
	 DQWpHB2cNsAJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YT9YF35ylz4w2R;
	Thu,  9 Jan 2025 14:40:49 +1100 (AEDT)
Date: Thu, 9 Jan 2025 14:40:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vhost tree
Message-ID: <20250109144054.6bdf0189@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hgi+=KsLc.o0M6pJ7h9Keuo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Hgi+=KsLc.o0M6pJ7h9Keuo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm tree as different commits
(but the same patches):

  e981e8d8b23e ("s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_D=
EVICE_RAM)")
  a4bba3b65c20 ("virtio-mem: support CONFIG_PROC_VMCORE_DEVICE_RAM")
  b9ad8a711a3c ("virtio-mem: remember usable region size")
  a8328b40b3b0 ("virtio-mem: mark device ready before registering callbacks=
 in kdump mode")
  ef78030ec96f ("fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect=
 device RAM ranges in 2nd kernel")
  a127bc45d3de ("fs/proc/vmcore: factor out freeing a list of vmcore ranges=
")
  98c5f8c3827a ("fs/proc/vmcore: factor out allocating a vmcore range and a=
dding it to a list")
  5488433f810c ("fs/proc/vmcore: move vmcore definitions out of kcore.h")
  23365031b34f ("fs/proc/vmcore: prefix all pr_* with "vmcore:"")
  006f0492f363 ("fs/proc/vmcore: disallow vmcore modifications while the vm=
core is open")
  26b866c242e5 ("fs/proc/vmcore: replace vmcoredd_mutex by vmcore_mutex")
  5c04c6205add ("fs/proc/vmcore: convert vmcore_cb_lock into vmcore_mutex")

These are commits

  9e85e500e8b3 ("s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_D=
EVICE_RAM)")
  5605b723bbc2 ("virtio-mem: support CONFIG_PROC_VMCORE_DEVICE_RAM")
  3a365d7b1a60 ("virtio-mem: remember usable region size")
  e4c56e7d625f ("virtio-mem: mark device ready before registering callbacks=
 in kdump mode")
  342dc629fe62 ("fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect=
 device RAM ranges in 2nd kernel")
  44df29fb6c95 ("fs/proc/vmcore: factor out freeing a list of vmcore ranges=
")
  10a41d9df694 ("fs/proc/vmcore: factor out allocating a vmcore range and a=
dding it to a list")
  e8685745122c ("fs/proc/vmcore: move vmcore definitions out of kcore.h")
  cfc7a194e459 ("fs/proc/vmcore: prefix all pr_* with "vmcore:"")
  19b42b73afa4 ("fs/proc/vmcore: disallow vmcore modifications while the vm=
core is open")
  527d8662c520 ("fs/proc/vmcore: replace vmcoredd_mutex by vmcore_mutex")
  9a775759ac92 ("fs/proc/vmcore: convert vmcore_cb_lock into vmcore_mutex")

in the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Hgi+=KsLc.o0M6pJ7h9Keuo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/RUYACgkQAVBC80lX
0GwZvAgAgWlxlkwoo9nKz6Nlv5KVEpGHfWMRZBT9ROu+Klkt5OlIsSFKgW/vRpxK
+/VEKVa1iszezlCnJ0yiMHJfox0XS3JiNgYqcEcNW+7Bw6GcXJdXncxtjo9dfzeg
bmsYZebaU5I91RrtciW1EsUCx63kWXhYGbrDi3yJbUtDUgt+zbNzQ9Rkx05wFDXP
AR8n48R6oVtKWwvpK9NP6K3XF1Rgml1X13W88PyiDtfE1F5kJUkfE+XhmTclzNmq
2OrGSOq3yBuWoTAaMvI4Y30mAYhMB79JBPplctfbGR8MlumzSKT3CmwINBofVx9U
QyPj2LkLIWjssIgIP/2BByCDtcm/0g==
=dF9Q
-----END PGP SIGNATURE-----

--Sig_/Hgi+=KsLc.o0M6pJ7h9Keuo--

