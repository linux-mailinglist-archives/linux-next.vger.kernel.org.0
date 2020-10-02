Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52334280D0C
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 07:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgJBFWi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 01:22:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbgJBFWi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Oct 2020 01:22:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2dfV6GbLz9sSG;
        Fri,  2 Oct 2020 15:22:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601616155;
        bh=iWpySPuS3R5GWeaBru4jI4Q8UuYzmWrxcjHfx8dS0P4=;
        h=Date:From:To:Cc:Subject:From;
        b=KBOkWQ2KhmAjBmv3jBHqOdOuzpxWLkD6CvfDgd53A8YUxBVU63+ZmO9PdtPJsfJa7
         CMlQ1b7VwP/0ff82CYS5jy2Twn/SGedwbYAwNF6Z8njFd3Vxb1iFrIPtJUQg/4mBrm
         J12oYLcL0hoiDo6W27eGNtYkgEkQnj7XxbG4nzRmnga2qhQ/BKr88Y5Jn9vjet/3+c
         HIMGXPwH0W/EgUPXnKIs5hQd8hm1YZiCzxcdawdcBrFXYU2vCXcLtNg7L+mVwHgJC1
         NvzUQzx9BvR8SGtV+2rj1p7hW0qI4/0cUNjhkcOH4AssfaT7uBWncWvwX1PuXiew9h
         fLbrQ6ZabrsMw==
Date:   Fri, 2 Oct 2020 15:22:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Borislav Petkov <bp@suse.de>, Fenghua Yu <fenghua.yu@intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Jacob Pan <jacob.pan.linux@gmail.com>,
        Joerg Roedel <jroedel@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Liu Yi L <yi.l.liu@intel.com>
Subject: linux-next: manual merge of the tip tree with the iommu tree
Message-ID: <20201002152224.3077f9f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wp2FiCSyFMRrEp2d4Icz_iz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wp2FiCSyFMRrEp2d4Icz_iz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/iommu.h

between commits:

  23cc3493b5e1 ("iommu/uapi: Rename uapi functions")
  d90573812eea ("iommu/uapi: Handle data and argsz filled by users")

from the iommu tree and commit:

  c7b6bac9c72c ("drm, iommu: Change type of pasid to u32")

from the tip tree.

I fixed it up (I used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wp2FiCSyFMRrEp2d4Icz_iz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl92uRAACgkQAVBC80lX
0Gz8cQf9Gr2hUz3h64l6f+6TqeI6GOkciGGdT+dmWYwXH0yHRlru9y3BEad+ma22
MlUFYCd7txSDGo22+uBqNs9xdevtrurAEfdlRTzqrgwTawODZDZzy7D3u3nR78HE
mjHazl6qN7YJBTTr8d+gLFWn6vitxIEbLq0Nqq2aRI4YWGdhudAnOPwM9uix4ooj
FvfSX1sNblsGvSVvoYat+IeQKWwWEDOTXaJTtLORpk0dF7ugbHOamrZdE5aD5TEB
rtkXtRKXq7YmLtSikgLsSWUYUcMU7M6a/kc79pKBwZiPhnJunPPbvmdK4GtRiC72
XFwfC7eHd4VM+kaVwln5pABxW27Qcw==
=Flxl
-----END PGP SIGNATURE-----

--Sig_/wp2FiCSyFMRrEp2d4Icz_iz--
