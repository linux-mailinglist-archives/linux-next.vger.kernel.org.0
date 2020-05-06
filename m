Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB461C7DBE
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 01:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgEFXKN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 19:10:13 -0400
Received: from ozlabs.org ([203.11.71.1]:59205 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbgEFXKM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 May 2020 19:10:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HXPG6MQ3z9sRY;
        Thu,  7 May 2020 09:10:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588806611;
        bh=NKbfujZOrLKWiiQan91ejfOyxp39jVb/mWO081cKRBs=;
        h=Date:From:To:Cc:Subject:From;
        b=T+Tqy3V3UEci8qprSLZ2J2rGNBVYGDgYx5V4f+9k7dT1dCt5wiVo9UXn17TF5jo8j
         8ozNA87gyfNrBiVJfHyiz1llOWdFQNaBNvqrkmFMuBHMtJRWxgHGl1BxF1OawogVRk
         /JKEZbluevfh6Ro6X4dijZX6KqS6cK0/PdCXw8XUXRxId39GiaFAhtivks+7vXr2rx
         mXBLgGR5SUi3yNWdgd/UH3NSQy2qUtFCAi1gRm8SkOSb48fcTyRbKIBJM1BXCB6VGi
         C6SwpjLrocsBGGzTrVlaa8Ee5Np13rMwHQXI7ezhsHnav/7ffRJxxzt0P+dlE8aOvG
         pKZTyOfWq5+4g==
Date:   Thu, 7 May 2020 09:10:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vkhemka@fb.com>
Subject: linux-next: build warning after merge of the aspeed tree
Message-ID: <20200507091008.1bd38185@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fVJI0q5=a9ABUMQKFYa7GSl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fVJI0q5=a9ABUMQKFYa7GSl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the aspeed tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126.11-130.4: Warning =
(i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10: I2C bus unit addr=
ess format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128.3-30: Warning (i2c=
_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg: I2C address must =
be less than 10-bits, got "0x40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:137.11-141.4: Warning =
(i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10: I2C bus unit add=
ress format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:139.3-30: Warning (i2c=
_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10:reg: I2C address must=
 be less than 10-bits, got "0x40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:148.11-152.4: Warning =
(i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10: I2C bus unit add=
ress format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:150.3-30: Warning (i2c=
_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10:reg: I2C address must=
 be less than 10-bits, got "0x40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:159.11-163.4: Warning =
(i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10: I2C bus unit add=
ress format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:161.3-30: Warning (i2c=
_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10:reg: I2C address must=
 be less than 10-bits, got "0x40000010"

Introduced by commit

  266056d3c61d ("ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC")

--=20
Cheers,
Stephen Rothwell

--Sig_/fVJI0q5=a9ABUMQKFYa7GSl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zQ9AACgkQAVBC80lX
0Gw1lAf/RlzuiNx5cyhETGU6NBKJPZjTeo6NIRHXVwQ7q7exJrzYb+nhDQ4bFbPj
2TbXoFijAIsATRED8hktXA081LSC/MzJo0rX6qHNmhDQWvO/RtGvKRvSloTHzB6E
21JlC8zQpy64HJAmpMRHax8/1ITQwjtpPUng/a6lXoC4RpkRQYE5jZIFkkMG2OS7
p/AojtKjN+NorqWc/G66jNh2P68/jmsq21yvXRB/lq08nPS4rA1Kg3s128hQ717Q
P50gum7/hJmmbixaphk+xyylDgL1hJS2ObkPtjEnDAux/7hulXahT8Ib7Jxysrao
eilmKFe2gYF0DaD/jzuInK8j/JWgLQ==
=8pUC
-----END PGP SIGNATURE-----

--Sig_/fVJI0q5=a9ABUMQKFYa7GSl--
