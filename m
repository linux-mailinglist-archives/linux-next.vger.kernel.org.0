Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84359197421
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 07:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbgC3F4V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 01:56:21 -0400
Received: from ozlabs.org ([203.11.71.1]:34855 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728571AbgC3F4U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 01:56:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rMCN3h5Zz9sPR;
        Mon, 30 Mar 2020 16:56:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585547778;
        bh=MnhxHvpAMsDDDEup9FogLzzIEZzCRqor1tztMiutcBw=;
        h=Date:From:To:Cc:Subject:From;
        b=EkR6q09v5oPYctQniRtV32FGVOJrJ2B56thCpiz6mWWEwPU6WkdsWBx3l5IxCATfR
         oGXo8VjKTTFdxPf+fm0DH+h4J1piQi97bMUh9hAPww+5Ufjz9EhSoaBsc8swrza1GH
         RKdSn3u4ywIO/3lqQu8IhIALVmi2PX5z5emBr/kNwvAqatvnthrRFMSartQkuhyUGe
         2NGdi7MNOLu8DXOXpni/qPFuWJ/1ApfM/x123Lfb8c1YbjgyHZSUxutHPDC8g8X6XC
         P9fXmagriBluIlBFQl1iM62OHJ0tc9NsuZHu7K9tJZhqcf3J80HNY/n4iJQWjjRUvG
         KAig5+bPuQB8g==
Date:   Mon, 30 Mar 2020 16:56:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Wang <jasowang@redhat.com>
Subject: linux-next: manual merge of the vhost tree with the kvm-arm tree
Message-ID: <20200330165614.4973a4bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E1j9J0VXHY+4bpL6arkmtbG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E1j9J0VXHY+4bpL6arkmtbG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  arch/arm/kvm/Kconfig

between commit:

  541ad0150ca4 ("arm: Remove 32bit KVM host support")

from the kvm-arm tree and commit:

  ec9d8449a99b ("vhost: refine vhost and vringh kconfig")

from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/E1j9J0VXHY+4bpL6arkmtbG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Bif4ACgkQAVBC80lX
0Gy0xAf/fV1d6QRfgLhzB+et6+gCVzFbRIA27s9GbeahQiWEAQMIRK7kd4dCWxAV
4dZRrbLRPVDQpv93pvXbIZrP7rZ8J9U7qIURj6QoKZKwyM/cNLvAYIUFPfTw4bSs
JmeZSveEzfNeSq9KWGsZy0smuVBq6lQl3digkgIvwwDnAu8/bFvgkaIiIAn4tHL4
xBZL1GnpnemxFnVoTcbcck1/yRhi/4iMU9L0eTeXzacAy1cTTUHPA99OfUXWdNWv
h8T/fbMS6kY3kVeOoCFtRZ1UnM/NE9ePNI0qseZmmW/6ZmWGtazZ5rZJIQXsGmnp
ZoHhmyNUkOM7gH7TsmBc6KKa0OofBg==
=bNVT
-----END PGP SIGNATURE-----

--Sig_/E1j9J0VXHY+4bpL6arkmtbG--
