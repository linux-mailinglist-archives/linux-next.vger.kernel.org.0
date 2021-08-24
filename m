Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B57C3F5696
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 05:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234069AbhHXDTi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 23:19:38 -0400
Received: from ozlabs.org ([203.11.71.1]:52787 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233885AbhHXDTh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Aug 2021 23:19:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtvTR65y6z9sXk;
        Tue, 24 Aug 2021 13:18:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629775131;
        bh=aZA0MxZV2syqPqzW4k4W1sjD8tLPSUM78b8udh9Yu24=;
        h=Date:From:To:Cc:Subject:From;
        b=FFsJDhUcm78gBjnxrbOEWwonV1SnO/TiuGJ7GVDJp4xAQepiXNLP96JiWNgvGJHpE
         NMs+AOGrf0WzmmNkGRJM/9zEYqhZAZYF+m5Xl5EaN/nMHzXaDSISm9rjMfWartJMTt
         RDEK67KFUv4vAv8J2cbDF1ef/q58ZAxo+xu4v4/WY5cUdyo1zdCpHtaCyViJ1Z0G0C
         Gu6kqgPSHLC/xz/VNAFXo8upQjl+7yqSntsrpl8Sh8BHvJNY3Qtqow/qIz8pU3yMzh
         P0SfVSdg8X1fMgoB4eL2JIr2SrBBi1aZUAA1OlKHbgkAYk48h+LD6yUmZiJw6ZFMg1
         FkrTXYzJhkXUA==
Date:   Tue, 24 Aug 2021 13:18:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the devicetree tree
Message-ID: <20210824131850.62b29724@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Els_f0f_OmDxFoFHJ.8+ty8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Els_f0f_OmDxFoFHJ.8+ty8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg=
): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"
arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg=
): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"

Presumably exposed by commit

  1ee7943c3343 ("kbuild: Enable dtc 'pci_device_reg' warning by default")

--=20
Cheers,
Stephen Rothwell

--Sig_/Els_f0f_OmDxFoFHJ.8+ty8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkZRsACgkQAVBC80lX
0Gwe5Af+NKrhLuD+XfyLsyZd3nW/7yb6pl007gy6eDl/VZQP8q/p6+cZtIDFBJNc
tahy8nfK+nLnUdFiiCF2vLixdf3QboaE3UX2WTzIBWt+Kbpx3vSigjAxjjhNHzz8
VTKMwf0ODBBpFTaITfyiM+q6kD7GQmnifuH4O/lKwbHxE7jVTMAzKm0JSGZGo70e
mSNvPIkA1WmcU7a8wxujKJsLooHnTkqa6TJbGSSzFWwtvskRZ2obpSzLXvRj8TGn
Mp1kAbpDlGWs0PEtrW0IZ0GuZQTALfwMH4g0f7vzx8fBlNtIkVqem3AmL62tLUfx
H5b3tKNlAUTtscTUNuhwFOMpdGOapw==
=LOw+
-----END PGP SIGNATURE-----

--Sig_/Els_f0f_OmDxFoFHJ.8+ty8--
