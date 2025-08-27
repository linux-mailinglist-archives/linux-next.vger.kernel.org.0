Return-Path: <linux-next+bounces-8112-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F141B3788E
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 05:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2056865A8
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 03:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8553E1FF1A1;
	Wed, 27 Aug 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y/qKOL+Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7842F2AD04;
	Wed, 27 Aug 2025 03:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756265437; cv=none; b=EChlrKtmcxaYOn+iw4TUwKJkjsBZ4iGt3ImL5NYhERPkGOSfHE3cVOT1LtUkrWyhbMDMqF4oZUHHGvAo7clpNlOGmcOU84R5NPeu9dAlts/1+kOGJE61F8LChvVCdjwmy28SvtPBP9cr9W/+pCqeWvq6fDFsqhvEb9nDBt/FrAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756265437; c=relaxed/simple;
	bh=A0Arlj6I0dpe5nwJFGCwJG8FMMvGIG8fqrSarvomiTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YOCpVNvqsXLQHz8P22GAN2bVmIr9vKI+JfpQMqTJcXdEKlcwIa3NRQtH4oKK9ga/YXywIQFscQzV5QTl9Ao+9FmPV7qclMT9Nc45cESbWRxPlEGSxgxoNGRPtwyQMNkjNCbHo6rNS9zkqBGZ5r6ITJQadLui/A+DXXB11DlZ0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Y/qKOL+Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756265426;
	bh=gjDvwcuvrG2LbaSFgeNFLjiCz4C/acD76Apktb3hnjg=;
	h=Date:From:To:Cc:Subject:From;
	b=Y/qKOL+YuYGM+nUSvvd6GiH57vSkho3r2F/LonF2yhVIyyhMqypqCAEVCTG2vvIwD
	 K4PW9ygGd0WcRUsA9ySPIL9usUSEsvPlZXR4leS3JDr8U3oaaXw3jnwGvtj/tRMQKk
	 hzdm9WtK2CL6vUaCNLIncOoclfyneRXGaZEzot0lhuorcVV5s1893iKOtZ5CwfJHoV
	 RJyiX8R1pIy2bMPfio2btSfy8bEyOIAauJBEu1gIXMw2g+o8KspflwWX7w7gBzhzoa
	 Z6H3HKRrVcA1LmCVtpSzkYn0lpHV0/KKdiUP8c45rRyOhOyCp1ALhUgPGNIRHYmog3
	 9m3Kl4gRmm0yA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cBVR55Hjvz4wbW;
	Wed, 27 Aug 2025 13:30:25 +1000 (AEST)
Date: Wed, 27 Aug 2025 13:30:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-xe tree
Message-ID: <20250827133024.41e3c2ac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i4K8jqK4lmbIlT3b0mo=m3S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i4K8jqK4lmbIlT3b0mo=m3S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-xe tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:2078: ERROR: Un=
expected indentation. [docutils]
Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:2080: WARNING: =
Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:2012: ERROR: Un=
expected indentation. [docutils]
Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:2196: ERROR: Er=
ror in "code-block" directive:
maximum 1 argument(s) allowed, 16 supplied.

.. code-block:: C
   struct drm_xe_vm_query_mem_range_attr query =3D {
        .vm_id =3D vm_id,
        .start =3D 0x100000,
        .range =3D 0x2000,
    };

   // First ioctl call to get num of mem regions and sizeof each attribute
   ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);

   // Allocate buffer for the memory region attributes
   void *ptr =3D malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
   void *ptr_start =3D ptr;

   query.vector_of_mem_attr =3D (uintptr_t)ptr;

   // Second ioctl call to actually fill the memory attributes
   ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);

   // Iterate over the returned memory region attributes
   for (unsigned int i =3D 0; i < query.num_mem_ranges; ++i) {
      struct drm_xe_mem_range_attr *attr =3D (struct drm_xe_mem_range_attr =
*)ptr;

      // Do something with attr

      // Move pointer by one entry
      ptr +=3D query.sizeof_mem_range_attr;
    }

   free(ptr_start); [docutils]

Introduced by commits

  231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
  418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and memory at=
tributes")

--=20
Cheers,
Stephen Rothwell

--Sig_/i4K8jqK4lmbIlT3b0mo=m3S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiue9AACgkQAVBC80lX
0Gy62QgAoY8X1FoWmvAhvnGa1TtAHLvJJFVv5V6tPq+Sx8WYIEg85jpc9UtdGg+I
BSeC41LqLoWj9Xke8CmpuWY2gN/KEpLH9AXOQoqZiaQkgrL2QLRiyZ1C+4qiGorW
Ab8sy9vbBE6KRxeJRylu9rkaw1n/BKgq405z2yMZHjp4HZRd7ssoUzjmxKi8CsHp
E2Ggb3/pYqFSvnZ4kyau11pQQ3DougUfb2al9I0MfEIS6JF6/FaEXfzWn+j+shcq
ONDAU/VThUPQUCm/p2Si/nmQwijmJiLKHmCfqxjO+mh40Aoajl2aV6P1curqAK0H
wK0AcMWIbkKIZHzJSphW6FW9PZqgBQ==
=Btwg
-----END PGP SIGNATURE-----

--Sig_/i4K8jqK4lmbIlT3b0mo=m3S--

