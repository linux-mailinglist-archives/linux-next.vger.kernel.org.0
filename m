Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E30B418D41
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 02:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhI0AS3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Sep 2021 20:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbhI0AS3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Sep 2021 20:18:29 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3363EC061570;
        Sun, 26 Sep 2021 17:16:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HHjqk3g9Bz4xZx;
        Mon, 27 Sep 2021 10:16:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632701810;
        bh=FehXuxB6oT8eAwQjsNBUfmCb7XkbAPtKUXwG4DUuwVw=;
        h=Date:From:To:Cc:Subject:From;
        b=P/b09+Y+t4Irxe9D2ceeY/7hmn3peEEREivRk9rqey21NWyImqXOazkOIUo7ApVZ7
         74x+w0lyliRp0FoZoSjWCmFfQAKCgWKs6Wh55G+XimOcRf89AB8Ovo6opCmBKtFc0l
         ihZ6JlyXHh2Dh/puNLcntGukrg2m8Q5d4VUrugmV55J1H18CE/XXpmiUVRD34qRG+s
         fZKp2GFkqErYPUk/TneBCii9qZYeFKxnQnq0eqgkc5ugZ8KL6EOxGm6Eva2ZtI06DB
         5lf8L2WQz5dN23MCW8engv4tXz+7QAcMJHNCEL+w93JhGoTDgoX/OjqHwH036PZlXV
         drVt7/ZMtUxaw==
Date:   Mon, 27 Sep 2021 10:16:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Manish Mandlik <mmandlik@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bluetooth tree
Message-ID: <20210927101649.2cabe5b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o_8tp.Hi.bdRwptj9h2jotG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o_8tp.Hi.bdRwptj9h2jotG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: net/bluetooth/hci_event.o: in function `msft_suspend':
hci_event.c:(.text+0x6e60): multiple definition of `msft_suspend'; net/blue=
tooth/hci_core.o:hci_core.c:(.text+0x36fc): first defined here
arm-linux-gnueabi-ld: net/bluetooth/hci_event.o: in function `msft_resume':
hci_event.c:(.text+0x6e64): multiple definition of `msft_resume'; net/bluet=
ooth/hci_core.o:hci_core.c:(.text+0x3700): first defined here
arm-linux-gnueabi-ld: net/bluetooth/mgmt.o: in function `msft_suspend':
mgmt.c:(.text+0xd188): multiple definition of `msft_suspend'; net/bluetooth=
/hci_core.o:hci_core.c:(.text+0x36fc): first defined here
arm-linux-gnueabi-ld: net/bluetooth/mgmt.o: in function `msft_resume':
mgmt.c:(.text+0xd18c): multiple definition of `msft_resume'; net/bluetooth/=
hci_core.o:hci_core.c:(.text+0x3700): first defined here
arm-linux-gnueabi-ld: net/bluetooth/hci_request.o: in function `msft_suspen=
d':
hci_request.c:(.text+0x2d0): multiple definition of `msft_suspend'; net/blu=
etooth/hci_core.o:hci_core.c:(.text+0x36fc): first defined here
arm-linux-gnueabi-ld: net/bluetooth/hci_request.o: in function `msft_resume=
':
hci_request.c:(.text+0x2d4): multiple definition of `msft_resume'; net/blue=
tooth/hci_core.o:hci_core.c:(.text+0x3700): first defined here

Caused by commit

  47cb49448039 ("Bluetooth: Fix Advertisement Monitor Suspend/Resume")

# CONFIG_BT_MSFTEXT is not set

Forgot the "static inline"?

I have used the bluetooth tree from next-20210924 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/o_8tp.Hi.bdRwptj9h2jotG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFRDXEACgkQAVBC80lX
0GyQwQf/XngLPfadG/MBTnGRtvf2/emOPDl2plr0bI6uhFExFm8kbOOyYHkF9QKt
+GEATKr9QZKn2w/p9BVd11NSG60zCrPbLXNzQD552h7aDTEPSWzwjrWVgSkMerBp
1lzU4aayNxelYNOhe69p3lMLGFgcEMdL3TuAiVS7bFYeIMQMZH+slWf5meCUV+N5
Q27q10XiNvfOKjGqGEbFgpoep8NaNoAMrpgCVYm8GBBDtlIfhXIeWf4MPEOF1G9c
a5qwSFRLuhsfhkGomUt9xOfu2bKCSggSB5f0lo16WMirWT4sAQaDDn4SS8guJkWC
1muhUcaVfrJtgkOvpFKrsrZWPItaDQ==
=dMWx
-----END PGP SIGNATURE-----

--Sig_/o_8tp.Hi.bdRwptj9h2jotG--
