Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC482A7798
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 07:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbgKEGzL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 01:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEGzL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 01:55:11 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F2FC0613CF;
        Wed,  4 Nov 2020 22:55:11 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRZ5m2t4Kz9sRR;
        Thu,  5 Nov 2020 17:55:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604559309;
        bh=Gsdqk8eogJriZy4XKrFmPiunxG6KHp3jD6Um/oO/a5I=;
        h=Date:From:To:Cc:Subject:From;
        b=InIgU2mnUxSO27jciJU8QQWM4jDrvfaArhS8QLNT8zKMOjthSTz1vXmXBhV8SYMdd
         P0nD3ngbvHSFI/I3bLBwVVpplAlUHGgXtTlbQ+hhDk/QGp7eLInYRggPtZsPUdWVAl
         m4jRrap3bb6WjtGjqGYtvX3fJPCLX4xxvXiOx0HlwO0Tz27uOpNKZQgV3GAKVfHGqf
         RJBEWK2Nx8jfgPCb1cEJfYJ3mcy6UesEJjFl5BDTlHe1kAYU174gndmMLWfzOUBsuO
         1MI2T7oV5Z8LKJtN3NwxhLSzh6dpMmtYyUiqjYP0B0kWPKbjpGK+vUVKRSehXXNaV0
         H9tjSYCqpC9Lg==
Date:   Thu, 5 Nov 2020 17:55:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Divya Bharathi <divya.bharathi@dell.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drivers-x86 tree
Message-ID: <20201105175507.5f59883b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nkSBGBB+N6hYCokjTi3WIQs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nkSBGBB+N6hYCokjTi3WIQs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Unexp=
ected indentation.
Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Unexp=
ected indentation.
Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Block=
 quote ends without a blank line; unexpected unindent.
Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Une=
xpected indentation.
Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Une=
xpected indentation.
Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Blo=
ck quote ends without a blank line; unexpected unindent.
Documentation/ABI/testing/sysfs-class-firmware-attributes:111: WARNING: Inl=
ine emphasis start-string without end-string.

Introduced by commit

  e8a60aa7404b ("platform/x86: Introduce support for Systems Management Dri=
ver over WMI for Dell Systems")

--=20
Cheers,
Stephen Rothwell

--Sig_/nkSBGBB+N6hYCokjTi3WIQs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jocsACgkQAVBC80lX
0Gyvfwf/VUFar1I1U7gsuqiMUjMfxMpJ26X+TSf86Oqy1jc8yUKqzYhg4gZYG7i5
RCytCq0Lx2Wo2xFSejgYBkNrRFzX8qyW1Ywm0B7onxCjJT627iSn0QvwJ9lYrmjd
AXyaVbPtXl2BDg3Skps/uAuure2NhHPMZAinlzc9VZpNl9o3I6lyHGyi9JCYD/HT
1RjzemEWq1Kffe+Z6EZ0JWSGcoAuMUgm9oMdHPiF7CrLfC1DTp9ui9hGaUI1dU86
erhGfTOtpaJeggu/fsMh5fZRVD/02VaQRrHjsBOD2CoDUgZqaHVgFJ+Hyoav2b+1
F1jvgT6cLJ2llGPkB4ycyrRjJy8J7Q==
=pX2Y
-----END PGP SIGNATURE-----

--Sig_/nkSBGBB+N6hYCokjTi3WIQs--
