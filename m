Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E21BED6BF9
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 01:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfJNXQy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 19:16:54 -0400
Received: from ozlabs.org ([203.11.71.1]:33421 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbfJNXQx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Oct 2019 19:16:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46sZFb1nwjz9sPV;
        Tue, 15 Oct 2019 10:16:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571095011;
        bh=1BwLRtBRjzVSa/TR6fEP9M6Lg20DbYIP5J1guvq/1YQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uHtkE2zSpA1ahbsnzKzxmYeFQYUY3YvPC+nUELw08G3u7PXIgCBo3OXcUEfV4gwGv
         fpYjAAscWC64JysAq7rRGIeoL9L6GkDSZECy9F/zjMDnX7cNtxzhzGes+3GuF6QbDK
         CoZjd6ikJZ1IH8VqczFvGjh+7HdYlkBTvwW5fnK1rK3X5El6N9HKcUXwxQPTJ+hXi3
         9tgy1AjWVW4DK3ox+dxMAWE23xTmQt0a9nHLkv3cVS3VWeen0eprUY/5nUSn/BiQQj
         tdv491xTtAHnW2nXr9RoX0eFRpfR3jTmDEiV22QpXX7EwmpIgttbdya5FALsRxzD2U
         GMBi8++az4jUA==
Date:   Tue, 15 Oct 2019 10:16:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: linux-next: build failure after merge of the pm tree (Was:
 linux-next: build warning after merge of the pm tree)
Message-ID: <20191015101650.2a1541af@canb.auug.org.au>
In-Reply-To: <20191015100855.31b8a3d5@canb.auug.org.au>
References: <20191015100855.31b8a3d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6GS1h5au_w04qPbsgg/ztsa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6GS1h5au_w04qPbsgg/ztsa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Oct 2019 10:08:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the pm tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> In file included from include/linux/irqchip.h:14,
>                  from arch/arm/kernel/irq.c:26:
> include/linux/acpi.h:682:31: warning: 'struct acpi_device' declared insid=
e parameter list will not be visible outside of this definition or declarat=
ion
>   682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2=
, const char *uid2)
>       |                               ^~~~~~~~~~~
>=20
> and many more.
>=20
> Introduced by commit
>=20
>   d1748b57dc88 ("ACPI / utils: Introduce acpi_dev_hid_uid_match() helper")
>=20
> CONFIG_ACPI is not set for this build.

This became a build failure for the powerpc ppc64_allmodconfig build:

In file included from include/linux/i2c.h:13,
                 from arch/powerpc/platforms/pasemi/misc.c:14:
include/linux/acpi.h:682:31: error: 'struct acpi_device' declared inside pa=
rameter list will not be visible outside of this definition or declaration =
[-Werror]
  682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, =
const char *uid2)
      |                               ^~~~~~~~~~~
cc1: all warnings being treated as errors

(and many more)

I have used the pm tree from next-20191014 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/6GS1h5au_w04qPbsgg/ztsa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2lAeIACgkQAVBC80lX
0Gw1WAgApA7Va7ZDZwaobRWeHYmNWZJT+LW1OTciIcsmrktUcpWHO6U6UYSQF016
sz3jdv+nktO51cMqMwyiS5OtbvM9QeFAKRxyI3fzcbDADw+3zV9/U25czAKp2GQz
QhOrUMetEWgbEXpLo0MU4BbEjoL09SozRTi61+ah30fIx5NGncwKzGH9RXLqDE3i
j2ogPaQI9uvv5ub1sZBmlL3zwKyRdp+xIfnop8rwc2LSmkC+dVkekqGsais4bw3p
47KQeMauTe7zvTw1cxGuBJeYDE/VHNGCp+kd6sckyEfPMs7ZrrcUFoQ1JARStLX7
cmf3CduLwLBKthlVtByQVRR7sY81oQ==
=HdGr
-----END PGP SIGNATURE-----

--Sig_/6GS1h5au_w04qPbsgg/ztsa--
