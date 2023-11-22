Return-Path: <linux-next+bounces-17-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23A7F3AD7
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 01:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412EC1C20A66
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 00:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF7815A5;
	Wed, 22 Nov 2023 00:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nBRZfI6p"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BED18E;
	Tue, 21 Nov 2023 16:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700614300;
	bh=5Y2aSfjsCdGy6qFz2dwjuQl2kp/3JDymxNRBgtubDA8=;
	h=Date:From:To:Cc:Subject:From;
	b=nBRZfI6pFAAPFgya7CKcjI66blAYxQYN5+eyug6nkowRsBesBCXMoB4Oxa9Lxescg
	 GWbdXi8H3OcOpzp58h+tJ6Du/kTunWzaNDJz2dTsEbcHk45WCyFI7LM0WGZ1FTwAQ8
	 fUYpwZmn3G1q2mntV1Lu7TTdckX/yD8MDqDoBgFREq8pUmqIDjo+66cjhKbrfwB3Ik
	 vaNPXu+O8Sg/vusu4aLUk7kiett3RAIGUnoJQ/titb7LcN4OBOLthywrlMWlWidPJo
	 e/iWV6fV0GjHsY3ThtOh3nHI/rV7Ck2RKmnGTW8pcjoayo6MfgM6/UWynSjjg1+Stn
	 R5T8EDqIDKUcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZjP70df2z4wx5;
	Wed, 22 Nov 2023 11:51:39 +1100 (AEDT)
Date: Wed, 22 Nov 2023 11:51:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Alex Deucher
 <alexander.deucher@amd.com>, Imre Deak <imre.deak@intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wayne Lin <Wayne.Lin@amd.com>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20231122115137.04a33a6c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I2H4f6VqQn9wBne0MzTm_OF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I2H4f6VqQn9wBne0MzTm_OF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c

between commit:

  9031e0013f81 ("drm/amd/display: Fix mst hub unplug warning")

from Linus' tree and commit:

  191dc43935d1 ("drm/dp_mst: Store the MST PBN divider value in fixed point=
 format")

from the drm-intel tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/I2H4f6VqQn9wBne0MzTm_OF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVdUJkACgkQAVBC80lX
0GzV1wf9Gz35ouxAlzrIOa/+NQj7wvVFopvSvxFv+GEE8UCRSrnkbg96TFLa+4of
vlG5Bvbtmd0N9OoNKGminwK3T5ghQNa38oZ9Ic1tSXEcJY+5W5XuN+PqFRU2eupv
8owuRqF2dH424CfbV0EE5FEr5hDJWNY6e3hFl+hUcH/CF9Z9UYImw51LZxSQyF4d
LhDqVlKq0bgBID6zDTWMRzRB188rdVN+EGjxz+xsO5ysPh7OLLdMdZL5RbcpfE0F
uUVvCDb9ksqZ5HElFgz5sEiYmOVv9ba1u93TtuPrIzLiF69x7VHqhH7cTSOJ9ODJ
g50onkxt3YOqEiasXkAqBMlhGbOCGQ==
=W9Ap
-----END PGP SIGNATURE-----

--Sig_/I2H4f6VqQn9wBne0MzTm_OF--

