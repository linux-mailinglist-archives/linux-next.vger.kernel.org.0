Return-Path: <linux-next+bounces-3666-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA750970C27
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 05:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73BD61F224E2
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 03:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9B418A6D0;
	Mon,  9 Sep 2024 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HzwSmNtI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A96C4C81;
	Mon,  9 Sep 2024 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725851489; cv=none; b=lrIcLbPwxablKoi+Bc6vSGPxYIZDSgy+oBJxfyJnSewGt9+XigwLYbBJmPoSKx/QE/CQVJkGXtTOHFpbIL4/HAwRed3v1PSExFaVy9PlhevFKqYJw+VsagHzfAFR3jc8qqC3Vr8hIbPOzMZZ+knSFliycE0hUcE62tK/ml24eJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725851489; c=relaxed/simple;
	bh=h1OmK4hxiuEh6+8aSSIjBkORlrnFntePQiwMmHs3Nls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V2pr8tr6u/+59R/FH5MUWGsvJjw2BQ+6rqZO8vkv+lIuFXoHJrNxrxekJ5lZpcpygKWReNqNYxQj3ESj85VGqU8LMGvRJbT0U0xOX+tYsC2uKi0hkzxDqgNPw7baUCVdH146r3nL4FGtKhOdmB7i/0kJA4XyqYDEYgMrRQVfU+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HzwSmNtI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725851481;
	bh=1v72/rcYDS0zRktF/YD11IjuRHLtXhb86rJRmWyRvrY=;
	h=Date:From:To:Cc:Subject:From;
	b=HzwSmNtIQZfq7cykQ8/GQjInkwf4LBqXZ9xWyksTatIJuvBEp+hFi4l4qMD/naN3b
	 kc+zdtv0p5PwAtT6eEzSJfMRyLijMJLNu3kZYa5e/jJ1GHZbKlyz+/PJfCufHdW4nz
	 dTV41jkbnd/IOVnS8lFTbsEWXRVgC9Q7iBMmVkgJ1LuO+GWj+yl5a6MB1TAoby5Oey
	 Ho+7r7eQweirYCcwhg5efcKqVd950T7twBcchvfFW0aDG9gryggkNI0ccXH/vdKMg4
	 G6AOk7C8Zas53QLtEKK611tMKl2n33HlVzSnDvPlMaFMVyvv3IK9ptZ1f+qiSAk1Tc
	 l+rb1JG2YfIrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2BgX4zjpz4wb0;
	Mon,  9 Sep 2024 13:11:20 +1000 (AEST)
Date: Mon, 9 Sep 2024 13:11:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20240909131120.030c1d6f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iVcqoWFXbHt=imaJWxm7oC_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iVcqoWFXbHt=imaJWxm7oC_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  4bfc9c553f5e ("drm/xe/display: Avoid encoder_suspend at runtime suspend")

from Linus' tree and commit:

  769b081c18b9 ("drm/i915/opregion: convert to struct intel_display")

from the drm tree.

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
index c860fda410c8,710b1e2170c1..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -331,12 -345,12 +345,12 @@@ void xe_display_pm_suspend(struct xe_de
 =20
  	intel_hpd_cancel_work(xe);
 =20
 -	if (!runtime && has_display(xe))
 +	if (!runtime && has_display(xe)) {
  		intel_display_driver_suspend_access(xe);
 -
 -	intel_encoder_suspend_all(&xe->display);
 +		intel_encoder_suspend_all(&xe->display);
 +	}
 =20
- 	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
+ 	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
 =20
  	intel_dmc_suspend(xe);
  }

--Sig_/iVcqoWFXbHt=imaJWxm7oC_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeZ1gACgkQAVBC80lX
0Gzf3wf8CZjsTcUuiP77Xy7iDHdwAFNHY0XIxXJY9sA4X3kCwqXPN76O3aRHPA2x
3h66J7KyDQH0RKJlat353yL6+742h8nwHDhcahQpG1NuY8yREt8zzfb53sUDff7o
ZLPIgI6wFUDvy5EuZkRsVvueJg2l9iYQRWGzTx7YhD9E/RPofSVLXyMZIhq96xX0
QrNXIuVh2nETV9jsBMunZmM+Nd4/9yL4yJP/LUd9RLPPX+wjAn264Wxbm7bvB5qV
jabkFODKwVuF7cYZMwtIwsQQnD1BVmX6bDFD7r6BwhxHn0A+8d1nRL+WksKiGiOG
SGfOvtz/vtuaAOwhtFqXEl0fWpO/4A==
=J+cB
-----END PGP SIGNATURE-----

--Sig_/iVcqoWFXbHt=imaJWxm7oC_--

