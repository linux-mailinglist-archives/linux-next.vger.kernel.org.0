Return-Path: <linux-next+bounces-4928-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FD9EA457
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 02:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CB5918814A9
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 01:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC27234CF5;
	Tue, 10 Dec 2024 01:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N4Ed1XIy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9607F4A04;
	Tue, 10 Dec 2024 01:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733794219; cv=none; b=GqPpqHHV6RSdIh+r8LWUqLdtw9sPmk6scjrt5DDEnKxcJwnwSRLid4wRLNuryvy8tfS6jMfp0WOeCV6Hh6vUlMOPNc1EXSJmJy/wYQZVCTFo0z5S4UYn0ABhct7tGdr0Yo6G0EfLOVHetruunVqrAV9haHTSxVt6JM2w0W0jzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733794219; c=relaxed/simple;
	bh=MI+1FDBSdcgtFatbg/h9hiNhgycwBsXF6wrb1dr7PiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DsJsonjIzVhKa+sy2xnWOImb9bE/dutKJjKKERnA1J6hYvha8QvhhSyKqa6n11a26x80RcazlR6MRyJMX6KKOB+rB3nIaeN9WnqTcdG+s+AzRNcjYvGC/9dZtpNujyCFipoIYtKNceFyCqM8N8+HItCcSOXctXNETBuhMNiIEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=N4Ed1XIy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733794208;
	bh=An6uolrgf00SGJ8E+TJg/LlT/r+g0QzjXRT5lhUqzD8=;
	h=Date:From:To:Cc:Subject:From;
	b=N4Ed1XIyDTsO8lZaqu0waqB+8djd/FB3UpH8uk/3yzQBavdwGZUyWlWG/xDk4TcrS
	 QMIrmvF3xeD+yIu739ASkwAZxs0zCsd4Ek5/+pTcpKPXZutnVy74g7DVEDUECZgfLL
	 kuPDj8kY1heGG48vl0t6m2AwpwsSCjtWIHR5tOJz4TpDF2t2+MtRtZ0FH222y54VxT
	 fnGJJWHnfXDKbFoSRvw3hB7tIbqNH9cZz5NTLbv/WEtvGuCM8W9dARynRMPBIC814u
	 P5ENS6UT1O32usMvWRaTZMiFDPGsBANP17Ved98SAdhM7NJCN/Pu6TLzZ6jTT+279A
	 PZI43rgMDdg1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6h4H441sz4wcy;
	Tue, 10 Dec 2024 12:30:07 +1100 (AEDT)
Date: Tue, 10 Dec 2024 12:30:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20241210123011.503ddd5a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5nFw1kQmLV+O/LDFyqcNIaI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5nFw1kQmLV+O/LDFyqcNIaI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  a4de6beb83fc ("drm/xe/display: Separate the d3cold and non-d3cold runtime=
 PM handling")

from Linus' tree and commit:

  f5d38d4fa884 ("drm/i915/display: convert intel_display_driver.[ch] to str=
uct intel_display")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/display/xe_display.c
index b5502f335f53,b8bfb666ebe8..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -446,25 -470,20 +475,22 @@@ static void __xe_display_pm_resume(stru
  	if (has_display(xe))
  		drm_mode_config_reset(&xe->drm);
 =20
- 	intel_display_driver_init_hw(xe);
- 	intel_hpd_init(xe);
+ 	intel_display_driver_init_hw(display);
 =20
  	if (!runtime && has_display(xe))
- 		intel_display_driver_resume_access(xe);
+ 		intel_display_driver_resume_access(display);
 =20
- 	/* MST sideband requires HPD interrupts enabled */
- 	if (!runtime)
- 		intel_dp_mst_resume(xe);
+ 	intel_hpd_init(xe);
 =20
  	if (!runtime && has_display(xe)) {
- 		intel_display_driver_resume(xe);
+ 		intel_display_driver_resume(display);
  		drm_kms_helper_poll_enable(&xe->drm);
- 		intel_display_driver_enable_user_access(xe);
+ 		intel_display_driver_enable_user_access(display);
 -		intel_hpd_poll_disable(xe);
  	}
 =20
 +	if (has_display(xe))
 +		intel_hpd_poll_disable(xe);
 +
  	intel_opregion_resume(display);
 =20
  	if (!runtime)

--Sig_/5nFw1kQmLV+O/LDFyqcNIaI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdXmaMACgkQAVBC80lX
0GzrfAf8CQNQLyvtHwD0N8dm5jXXHlNMtQoirBpRCe1plSNol9py/L0e0L0H1UMV
Fg7OKElNC1p48U+R3XDdZEAKbF1LW5vXy78CTnDLNfcjpt5AIdICiYZtMq4hyz56
xwYMtQBNXVBYLViRfty5OvR+LMwr5dstAcM/wZDT18zjuuVbuoU/ozmVKagezqxM
Tdzi03oEoDi808Zn+6jClIYOSxTLbMjcoYgdKh9d8Z/yAHSpkNqd0dJFXInyBaKe
jlcyfREij63DtP4s1kJz8FHjC59pJahgfktmuqDWe34MJe7TJx8pmPeYAaPWdBv+
q7tbSO6Qs/bW1f40XqLqHLoRsRbuJw==
=TiTq
-----END PGP SIGNATURE-----

--Sig_/5nFw1kQmLV+O/LDFyqcNIaI--

