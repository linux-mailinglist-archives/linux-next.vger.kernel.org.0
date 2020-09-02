Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A054525A225
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 02:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgIBAD1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 20:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgIBADY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Sep 2020 20:03:24 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D24C061244;
        Tue,  1 Sep 2020 17:03:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bh40651wLz9sTK;
        Wed,  2 Sep 2020 10:03:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599004998;
        bh=TafR9jtaY0GaA3rIEKpugx8KdZnfWM2Qko6C1NGi0F8=;
        h=Date:From:To:Cc:Subject:From;
        b=WfYoHoAwuFOFeyaOAqXf9CXvAZAxVquqCR18saxQcjSw5SFg4L15u5KTM5doYwNko
         JHTHmFvTAkT6+et4lsQ8NS2zKxlPXIqUmiwPfUthk6s9OJ7Sj5e6T0f2zRo0c4fQXH
         DfNqx9fRPm4a3Ea5+qj1GdwmUjLD7wXUblrEA3BOtEuKLG7L1ktZciYlnmleMmbNiv
         xUBMrjiO9lQC58ARohTYt+iu5JEDd/dM9sNWH5mVZvHpz6QJ5cLuapSZGhXz3dPA1x
         NajT/Mlw1lL7O1yic/ETIfEyX2RdTdB37s1jTdktIqHE/VD/RmHzrjz/69cVC2gTaX
         8xolhMHn6cSCQ==
Date:   Wed, 2 Sep 2020 10:03:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: linux-next: build warning after merge of the dma-mapping tree
Message-ID: <20200902100317.142db5be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aK6x.Oc52X+djELhZVnHxDh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aK6x.Oc52X+djELhZVnHxDh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from arch/arm/mach-keystone/keystone.c:24:
arch/arm/mach-keystone/keystone.c: In function 'keystone_platform_notifier':
arch/arm/mach-keystone/memory.h:17:34: warning: conversion from 'long long =
unsigned int' to 'phys_addr_t' {aka 'unsigned int'} changes value from '343=
59738368' to '0' [-Woverflow]
   17 | #define KEYSTONE_HIGH_PHYS_START 0x800000000ULL
      |                                  ^~~~~~~~~~~~~~
arch/arm/mach-keystone/keystone.c:40:39: note: in expansion of macro 'KEYST=
ONE_HIGH_PHYS_START'
   40 |   int ret =3D dma_set_offset_range(dev, KEYSTONE_HIGH_PHYS_START,
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  eef520b232c6 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_=
offset")

--=20
Cheers,
Stephen Rothwell

--Sig_/aK6x.Oc52X+djELhZVnHxDh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9O4UUACgkQAVBC80lX
0GzTnQf+NwmQjAtd7YsvE0/fo93evzTWcEZN1yKNUJl+RegtCUvj/p7ax/iaglkR
FDIi+afU0M9IbRLidRPXySH62k0IzPivwexEmkYqw+7fiMXwcZNWWfMt5l1Bxszt
thtwe8ZwZywPZEkN53EiJmngI6FYPW3rM9e3TGuSW1DzmylF5/nUtLGBt+nkoeZP
93a2X2jg2DMSLQ+q7t+aTIZK0denQEpdMnpd5mLjjo2H76x+cFtPhRaENCP2/QJG
yelu3xL/K3/EZ3kSKLswjqAbp98C55mQP2DVESeqOxOsMviUSj5qKFaM9EdLgzk/
57GFYAPiGaopHQCwAuyaqcL1Bi7sEg==
=jnDr
-----END PGP SIGNATURE-----

--Sig_/aK6x.Oc52X+djELhZVnHxDh--
