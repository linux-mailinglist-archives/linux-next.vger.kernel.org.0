Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52B45187AB8
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 08:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgCQH5w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 03:57:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:32963 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgCQH5w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 03:57:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hQWd5DLzz9sPF;
        Tue, 17 Mar 2020 18:57:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584431870;
        bh=6akH8jaT7H14jsILYalv7/O3qTkBCjxhEuoTdBkZWvk=;
        h=Date:From:To:Cc:Subject:From;
        b=HiceBG1nu6w3dneK++bLXks6HWpnUKVQSHhDvwPMUYeFnEvz/4FXhZiJpd9tddWcg
         m/NFlxYRFmIiwKD6wefyEAEUT3h7BfOx4LLUvkTNtjsRLLSIT9CTbRcx2SaBDAv7RU
         M1Oe4h9e6uS143lyNeeoe4o1Okn1SEDPzE0AzwdCh8iPiyA0VwLeTzugrOAoliKWe/
         mTIImU+GQImLp+PejQ4F2/iwfchYRvz04sfgCJ/5TTIyy76JRM6YZoiZeUoLyAAgd4
         eDpCau/EEZvE2c22ABefDTsw+DxsBamWMfugQeXgiW+yffFRJMw4p29iSLIettm+G8
         jykrxo6Nytidg==
Date:   Tue, 17 Mar 2020 18:57:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: linux-next: build warnings after merge of the usb tree
Message-ID: <20200317185748.085ecf7f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TR00VRTfTBicEud5wQghO=Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TR00VRTfTBicEud5wQghO=Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's (actually yesterday's) linux-next
build (powerpc allyesconfig) produced these warnings:

./usr/include/linux/usb/raw_gadget.h:74:12: warning: 'usb_raw_io_flags_zero=
' defined but not used [-Wunused-function]
   74 | static int usb_raw_io_flags_zero(__u16 flags)
      |            ^~~~~~~~~~~~~~~~~~~~~
./usr/include/linux/usb/raw_gadget.h:69:12: warning: 'usb_raw_io_flags_vali=
d' defined but not used [-Wunused-function]
   69 | static int usb_raw_io_flags_valid(__u16 flags)
      |            ^~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  f2c2e717642c ("usb: gadget: add raw-gadget interface")

Missing "inline" n a header file?

--=20
Cheers,
Stephen Rothwell

--Sig_/TR00VRTfTBicEud5wQghO=Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5wgvwACgkQAVBC80lX
0GxF2Qf/XMjGF3Qw2Vb8X03VWONe+qgGHxA+3MGTMkXgLZ7K2TKyKWB0JB3SdNEp
S9vhuUlcPiGjPsk0huCZjF9lljA0By4Qrz8YAe9wKxlx5DtMcPWQ+5+8n4DFHU7b
Qu1i12JUV/uXRCqFHH5kUKZGoR2tK5KroQt6b4pm95ukmQVqL2eYHHeI9EhJDfis
BThxWfi2FZ97LhUjAb+FRtnxOuWZLs+HpWPsPBml24jAcA+aLi2DA7x0zLGhb7ZH
BZyYnT75RFGsppKmKRirCdI/YjihVNtA0W42kOvtP5jNSJg7OtQjMD8ucrgMjct2
YKljDjL+AgMx/atQPBfZybOVDf2xjQ==
=PTzx
-----END PGP SIGNATURE-----

--Sig_/TR00VRTfTBicEud5wQghO=Q--
