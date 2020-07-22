Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E1622A31A
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 01:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgGVX1X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 19:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgGVX1X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 19:27:23 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E55C0619DC;
        Wed, 22 Jul 2020 16:27:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBs7W0ychz9sQt;
        Thu, 23 Jul 2020 09:27:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595460440;
        bh=UXbRC8qsJcxaXO7rHGDv/GKUgr2U5PIHydnZuXfQFBI=;
        h=Date:From:To:Cc:Subject:From;
        b=oWSvgJnpV1uNV6fVUqwobGRcETqZ2Sx8RNvqv2rAs5Px+pVjdBqqhUN1q+qYGZrVY
         nZbqEBDH3jqFRm7DlFB1ptwwg1YA3yBsrasrc/OXiVIWlDV1lo68Vgl6SO09hJyx3T
         vNAFFNnmd9AMJyb7xrLfz+KFCHW383iv2DbJTgZrs8o9T26jq8xzsn4YfYoP6lhDF0
         41mVyMqNz8kRy5aNGglx3f8rjOW6RfPzR3xiHvBjBaMFTh1gkwPmed5XFzwniBSWOb
         IVxd3XUsR2CWKDkVQJYbrB30gnxSVY93HdPoZ/+btj9Y7eOA5p+trBLTuuHi7nUVNK
         ZQyOmrC/APnFw==
Date:   Thu, 23 Jul 2020 09:27:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warnings after merge of the arm-soc tree
Message-ID: <20200723092717.0f90fd26@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K./6MtM_RhTL74T8oyN4XUZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/K./6MtM_RhTL74T8oyN4XUZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /soc/ap=
b@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
  also defined at arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts:225.7-237.3
arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /soc/ap=
b@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
  also defined at arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts:225.7-237.3
arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed prer=
equisite 'spi_bus_bridge'

I have no idea what causes these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/K./6MtM_RhTL74T8oyN4XUZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Yy1UACgkQAVBC80lX
0GwtaAf8CEQfYqYL092VhNFcPnHDsnd/elWcYbTKtTZJKdoX2Wknq9zU5DJUQVcC
Mn/JfYPK58L9YrsgvhhpuYmYIBhk2pS0yGZScglmuHxbRbMZ6zsSpz+rI6SgkRcB
9BaanZidN5NgfORUTZ4EpsNVivs7MuaJW6eqqx8Q8Apkz229SnWtA+54VBhnrCfP
4h1O1OHfMW6FbybdcqLZtA/9ZoNHh9/h3Psycw3e8WNV72hM7Bvk1/SFbl6MYZSk
YxhjSD7PlkaNNhO7/Wfwz1UCmihGk+VV16jAaZIVHscfllRcHQmMmC7NWXybMi8H
iOnKLigu3mH3G3Lom6QhUIiCMeCe9g==
=UvvD
-----END PGP SIGNATURE-----

--Sig_/K./6MtM_RhTL74T8oyN4XUZ--
