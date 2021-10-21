Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8D3436BC0
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 22:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhJUUHR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 16:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJUUHQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 16:07:16 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB896C061764;
        Thu, 21 Oct 2021 13:04:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZz3T52Tpz4xcb;
        Fri, 22 Oct 2021 07:04:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634846694;
        bh=HqHIHnG1rf3cb3NZafBhvLJVlKorWC20d6n/zKikG0I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kadgdumBstpaQ9k8FfUG6Ao+n66i1lN59z+t+b7obvCjVwrIiNcAQeRXDJEX6eaKI
         Tl7liF4RX6B7FYdECjGYdokL26wwE9E0XImGYXGvsiZp8DIhCuij3fnLVtsEdGE7yL
         7qxwhMjP03w09qnZXvxmLb5dEwb5udA/UkJ1A3+ul9EY+x2102r72gJajOb6hkEYUm
         zDKJXwcvvSys4pwd672/2t3j6cOAxcgTFJPRSe+QsgQQTh3gk/SjrkQ7H8FMvgNbdF
         Ep5QrLP3ynMVW64XSDsWLXGck91CWUM3VwaRWm2AlEr2aL9UjGfpda8i5bXAggwTyH
         B/3TsFmhYvh/A==
Date:   Fri, 22 Oct 2021 07:04:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warnings after merge of the drivers-x86 tree
Message-ID: <20211022070452.28924855@canb.auug.org.au>
In-Reply-To: <BN9PR12MB53814D3DCD5BD5E9441DE3F3AFBF9@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <20211021184735.794b22a7@canb.auug.org.au>
        <BN9PR12MB53814D3DCD5BD5E9441DE3F3AFBF9@BN9PR12MB5381.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xc4ry4agoJfB20tgSuUNd2T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Xc4ry4agoJfB20tgSuUNd2T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vadim,

On Thu, 21 Oct 2021 09:07:03 +0000 Vadim Pasternak <vadimp@nvidia.com> wrot=
e:
>
> > -----Original Message-----
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Sent: Thursday, October 21, 2021 10:48 AM
> > To: Hans de Goede <hdegoede@redhat.com>; Mark Gross
> > <markgross@kernel.org>
> > Cc: Vadim Pasternak <vadimp@nvidia.com>; Linux Kernel Mailing List <lin=
ux- =20
> > kernel@vger.kernel.org>; Linux Next Mailing List <linux-
> > next@vger.kernel.org> =20
> > Subject: linux-next: build warnings after merge of the drivers-x86 tree
> >=20
> > Hi all,
> >=20
> > After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> > produced these warnings:
> >=20
> > Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING:
> > Unexpected indentation.
> > Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Block
> > quote ends without a blank line; unexpected unindent. =20
>=20
> Hi,
>=20
> What is wrong with the syntax at line 230 and where blank line is expecte=
d?
>=20
> What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_active_i=
mage
> What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_auth_fail
> What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/bios_upgrade_=
fail
> Date:		October 2021	<--- this is line 230
> KernelVersion:	5.16

I am sorry, I don't know.  Added Jon to cc for advice.

> > Introduced by commit
> >=20
> >   527cd54d49dd ("Documentation/ABI: Add new attributes for mlxreg-io sy=
sfs
> > interfaces")

--=20
Cheers,
Stephen Rothwell

--Sig_/Xc4ry4agoJfB20tgSuUNd2T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFxx+QACgkQAVBC80lX
0Gwf+gf7BLb+woF+pYMnQX/ZX8ojH/tQY4+b/09lMG//jWbeZ5S/o67hj8vchKCg
oa71eTCwWQtgzMp4z/FexGyLFhjXK4BnDfw6wUczaL5GTS/JXk3hFBpqF1D1DvNP
b+ZekE8+8fPLHQLNxjYVDy5+qOtrFEcKYnwwKp5Ev/Q5M6gv+Ukukma8W13vEq7A
80xtutDEoOwVcjOQ21rugeDH72zVQ8w3McQW+QeblALsFDcpUFqoLvA+O++Bb4IG
E3wn/iMdPoXRJJ+KWWIvVuGHvBf1HwaKN1ZoE4ngQ93l1+Tg2ooKdahhWHy4FrCo
Vy5bIs8pA/D5yZIXUThCwgGs2pZnsQ==
=YnIu
-----END PGP SIGNATURE-----

--Sig_/Xc4ry4agoJfB20tgSuUNd2T--
