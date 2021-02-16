Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D8231C857
	for <lists+linux-next@lfdr.de>; Tue, 16 Feb 2021 10:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhBPJrl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Feb 2021 04:47:41 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52151 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230064AbhBPJrI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Feb 2021 04:47:08 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dfx1t1pNSz9sVF;
        Tue, 16 Feb 2021 20:46:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613468786;
        bh=mhNRPRlD0jLWUQYUSdG7QkkCZ3e0fk0jXhX5UZ0n6MY=;
        h=Date:From:To:Cc:Subject:From;
        b=XVs4qbdUQfys2JTS2Sk6Csyve3o2DKCVvwWDphjFROy4wLFf5uGjZ11kn2/k1PiW8
         bCFZdAAuyi8eS3vy1kPBMXbK8NT/yAkEZmtlQ00pUuz2HrCPEfnj8W9ATSTSk5zi8y
         P8Ljxh/RIu/k1rez4CVSWE7Bj8zM7/14nACA4tE4BDVmnadvYTCFXFP3NoU+iMbKKv
         QwGesYUHSoxqQVJ9AlfjU5x5ZmXolLOQdScxycfoSgDENzel9pclLhwXN/tF47q5U6
         pxSLHxT1hMDmAsJfSb4CRBDvwSvsq+3jqf24Lhpp11qvc0mIEStr3RA9YGn6Dub3mC
         SVoNIi0V2fFNA==
Date:   Tue, 16 Feb 2021 20:46:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Ben Widawsky <ben.widawsky@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the nvdimm tree
Message-ID: <20210216204624.65a2940a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xPa+kqWI1+vmB9bFlwx4HgE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xPa+kqWI1+vmB9bFlwx4HgE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nvdimm tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/driver-api/cxl/memory-devices:112: /home/sfr/next/next/driver=
s/cxl/mem.c:474: WARNING: Inline literal start-string without end-string.
Documentation/driver-api/cxl/memory-devices:112: /home/sfr/next/next/driver=
s/cxl/mem.c:474: WARNING: Inline literal start-string without end-string.

Introduced by commit

  b754ffbbc0ee ("cxl/mem: Add basic IOCTL interface")

--=20
Cheers,
Stephen Rothwell

--Sig_/xPa+kqWI1+vmB9bFlwx4HgE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmArlHEACgkQAVBC80lX
0GzOwggAmHiOak/0/WRp3H0McpnGASte7k2lGfCM3g+/NtBvigIrgWTW6L5IUdSf
//HfGO3mIWrt48sJrmUL4D9jcchVWKYMsixg9JSGcp5qH6xBlPcMAvyyLFLEJZTI
/8O4uv6z/c09h3RK+9GdV2d7uZnlyWkGrzf9sK7qRbSRTJu12uAw7815oQbGFezZ
I412dZnuM+SyegNBaAXAqFkE3jVX/z2aaUIea//vCPznWJ1zdWP0BBLVWbMSPAao
PHn9kbhQXk0fOT1phOLBWd7Xz3hLqDpHpuTyNoPsp1KnZEsb1Ao3KHf6p6JxScYn
Dy/KnnkWbghGrN9ZlqEw3dlXKocotg==
=U6Di
-----END PGP SIGNATURE-----

--Sig_/xPa+kqWI1+vmB9bFlwx4HgE--
