Return-Path: <linux-next+bounces-4878-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5669E3B57
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 14:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03E27285A68
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 13:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD921DE2C3;
	Wed,  4 Dec 2024 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPaRFFLC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDE1DE2B2;
	Wed,  4 Dec 2024 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319368; cv=none; b=fGqvMU1d5IFrx6Eom/iYqO6j+X16XMu3QVwC0aeQRFEPtlcaRLUZ2wzc6htt0xPqZ75A39//ED57yFt9I8XnHT91osVEHKMUrrlrYFh7pN+aCzuSHGBa8Xf5N3nMKGOu1UPjTLnBr5VEDjzaH13tBURcmYSeG2N4LaziLrV/Yv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319368; c=relaxed/simple;
	bh=Si3lDv3dhTLBqjaTl3xWq8GImWdI03PuIq4p38ToNT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwCbB5oPkPTkTZqx6oC8Qfox8AP9w5ofCAs++7pCRWho4MWDiCbd+BPJhKVSaXde5uHn5FZ8TFkBP37SCmvI0un1+hP9QqQS3SyocE1ZFF5t0fM0NsVL79ddEoYZsQGD34aun5YMs/bJIxIOMM+5W7d8HAAQuXD+qYnSK8n6OwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPaRFFLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1F2C4CED1;
	Wed,  4 Dec 2024 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733319367;
	bh=Si3lDv3dhTLBqjaTl3xWq8GImWdI03PuIq4p38ToNT4=;
	h=Date:From:To:Cc:Subject:From;
	b=BPaRFFLC9nC0ptHCnnys6W8rcY3m47kYdMvvaviSjq7r78xRvVeCvuUaGvbi4CscQ
	 8bDeZArtBOgs4pKjXCiXLOsMn4g+fVW6cuLkqHle2RGKreQXFMdsiIrZi1xpQLQxNt
	 ifaPHpIQOrUKlyPDlOa/zhWjAQxWComqaG0MFEwegmXi7z9TFL2w5zJTmvH1dRumd8
	 sKniHKpeOqxqAkN8x/QUNPLPZ0PP0+dknOtuOahjMbg/i6xiKBMpASbL/ygcveM+pq
	 LBHnZ0I0XkSR/EXQawF7GtTywE723Qz1kHRILEeOKSOHQx1EsLk+B89YTvEskU5mbU
	 WCJsMRmZhiJ2g==
Date: Wed, 4 Dec 2024 13:36:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <Z1BawrcFMsj0ByLk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kguu343zm9FQzSso"
Content-Disposition: inline


--kguu343zm9FQzSso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-xe tree, today's linux-next build (x86
allmodconfig) failed like this:

In file included from /tmp/next/build/include/linux/module.h:22,
                 from /tmp/next/build/include/linux/device/driver.h:21,
                 from /tmp/next/build/include/linux/device.h:32,
                 from /tmp/next/build/include/linux/auxiliary_bus.h:11,
                 from /tmp/next/build/include/linux/intel_vsec.h:5,
                 from /tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:7:
/tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:233:18: error: expected ',' or ';' before 'INTEL_VSEC'
  233 | MODULE_IMPORT_NS(INTEL_VSEC);
      |                  ^~~~~~~~~~
/tmp/next/build/include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
   26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
      |                                                             ^~~~
/tmp/next/build/include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
  299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
      |                                 ^~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:233:1: note: in expansion of macro 'MODULE_IMPORT_NS'
  233 | MODULE_IMPORT_NS(INTEL_VSEC);
      | ^~~~~~~~~~~~~~~~

You need to merge up cdd30ebb1b9f36159d66f088b61aee264e649d7a ("module:
Convert symbol namespace to string literal") from mainline and fix up
for the changes in MODULE_IMPORT_NS.  I'll apply a fixup for now.

--kguu343zm9FQzSso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdQWsEACgkQJNaLcl1U
h9BTkAf8CXjx264yuh1pv3bz3YKkorH5JtTv1rkbHODX66qAMdQzmRwNI+ph3WtD
GbooP/pPe9jKnpNRgZVeGdQ3iee7zdQsJBEFEfmYpwA3XJSczAOZ0q0M8hk+kRKQ
NnI8LOtg5ZTFDUvk7MRlJp033aneRljhiVhbpE+EjlyqYEl1cPFGqTR5/dA3H4gX
Xw2RuY+YrQVjuixw9pSiDS4OE7k91TyOeYa+f6SNLGEaBeU6zqAhkKLu70r+cTuR
vnO1+++a5wKELKollGZATD55BYy5U+b21eTAVbp2SCuiZcd/nZdWuvi8Pf8BuKyf
Dwo2y3m026nXs/gC/Czm5tTh7nFCyQ==
=8dLq
-----END PGP SIGNATURE-----

--kguu343zm9FQzSso--

