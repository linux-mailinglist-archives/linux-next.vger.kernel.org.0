Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D273389D74
	for <lists+linux-next@lfdr.de>; Thu, 20 May 2021 08:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhETGEu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 02:04:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41493 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhETGEr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 May 2021 02:04:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Flzgc4ktKz9sWW;
        Thu, 20 May 2021 16:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621490604;
        bh=JYW7BBiW4SCYSs7XUcEVt+cNReQ+SXkLndA2+yTqtBo=;
        h=Date:From:To:Cc:Subject:From;
        b=bERs0UuDmYY8eGIk5Hx8LlwNuwiylA5wodV7CeVMlNQbvD1FJ4uH9ukZWPrwkEj2T
         GdSUyGmMIPg+Y/xoxNP4MtVUepEBtDlZUMLpLnq1/TEIHqi7zanS+2pizfPO1rkhQf
         ivlggnPP3MwUESWlW4DbPAcG6aPho2QP42SiVQ0ELxj1sOucHoCK9Fby93nUVcpQbF
         hjl1yxwNyRQO4wXX2bUv8vh6o0frdUPZJBRTMOoNzs2MBr8i6TuZLsZl+rWuMgy6vh
         tNe+JJKS/npDKXXYuAutoky0GtyuJff8iJ9AkFPrgvtrAu2VFvLV/rybhDWJ8PPrOj
         FM511Agn5sKHw==
Date:   Thu, 20 May 2021 16:03:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cxl tree
Message-ID: <20210520160323.0467b629@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ayGP_AIPojzEGKUmVmpfME4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ayGP_AIPojzEGKUmVmpfME4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/driver-api/cxl/memory-devices.rst:32: WARNING: Title underlin=
e too short.

CXL Core
-------

Introduced by commit

  5f653f7590ab ("cxl/core: Rename bus.c to core.c")

--=20
Cheers,
Stephen Rothwell

--Sig_/ayGP_AIPojzEGKUmVmpfME4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCl+6sACgkQAVBC80lX
0Gy4CAf9EErwKeUhqzAv2+Hpf/dfuI1AtmuyMn4AxJBbSLPSy5Egrd7ysrs8BB4U
ZWb+rOCSI0o7dOgyafBNEXFTG7jyXHk0Xz+j+EWGAXwGfLRwJrWjQmmXSnaA40tX
P2HdpASuoc59JKyT8HyGcXNmgTRiAnwJ9OF9NgvkTkKHVQiUfL50URS7fAyFgOsy
iPrh8vf++Qp38jsP6FAMPla1sJLD9EMG+olIS47mPfmvAhXUiFXAf9LmA5u1z9/z
kST7mcWwoBdkRX6jP3K0SZrw/zaQLgGUW/0d9TAquRbUL4VBxcrh4ca97fMj084D
BzDCcZYCu2ck59hsN+z7+JXmBx5utQ==
=1hy8
-----END PGP SIGNATURE-----

--Sig_/ayGP_AIPojzEGKUmVmpfME4--
