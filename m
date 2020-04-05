Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 777FC19E82C
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 03:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgDEBNM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 4 Apr 2020 21:13:12 -0400
Received: from ozlabs.org ([203.11.71.1]:41101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgDEBNM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 4 Apr 2020 21:13:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48vwdx5YLDz9sRR;
        Sun,  5 Apr 2020 11:13:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586049190;
        bh=3YZKWaUv/T/setVmm6Y8aUdwLJnkxxYLCvnrIMKQ2AM=;
        h=Date:From:To:Cc:Subject:From;
        b=X2xJWeh8/aoEV78VbreQ3J/MOKnM6UX8taUv/OPH75aw6i6wIIxcUExOwutC2nVW/
         mDNWro5cvQv2FWTYqZLXPJ3BQVGKq3Htcuvba5rfNTMtWGl0QCnEbS39C43Wi1Srbw
         52IrDIfliUz1pohfkN1vABoF83TV3vvlKbBPIxkPKiNYw60Daq+afp6xou5Sg63dSI
         2nYg22RS/pPyeJfipiSbyReSoTjMuh0xt0CEe/8CC0yxYEjIfTFm6+qLkKt0etzj8O
         oaKdow/pG6qtLCol96cfrXjxnD3Atua/BtV8Yb7rukmAR4V6v9yR0Qv2X6n6UIQaKh
         BO09xv7S4+dkQ==
Date:   Sun, 5 Apr 2020 11:13:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        "kernelci.org bot" <bot@kernelci.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        chenqiwu <chenqiwu@xiaomi.com>
Subject: linux-next: build failure after merge of the ide tree
Message-ID: <20200405111307.6d0ac36e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E6SS.F_Nk+ZIg05FmH33vi8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E6SS.F_Nk+ZIg05FmH33vi8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ide tree, yesterday's linux-next build (mips
bigsur_defconfig) failed like this:

drivers/ide/ide-scan-pci.c:104:13: error: incompatible type for argument 1 =
of =E2=80=98list_del=E2=80=99

Caused by commit

  6a0033457f23 ("drivers/ide: convert to list_for_each_entry_safe()")

list_del() takes a "struct list_head *", struct pci_driver::node is a
"struct list_head" i.e. there is a missing '&'.

Reported by the kernelci.org bot.
--=20
Cheers,
Stephen Rothwell

--Sig_/E6SS.F_Nk+ZIg05FmH33vi8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6JMKMACgkQAVBC80lX
0Gyzwwf/Qg1FXs9DRibhpaSJvInzfnEIV6cN/gvgOEnAko1L0fpM2Yvz+OF35qXV
Pst3YEKgZGJGOpPxgZY/LYo2/Q0LkHFwaJtYliIMBMRNFDE0+U4yBp5jBANxXhZr
FLPuPmStEaqkrlAQ1G9JNBDrJEss+M3tp6xJkteNgPYyycFD82hZ38LI0JVWXQm9
V8LsYxrb1w8yWkFijgYnx0MIWdgT6vfPCDznE5TG82562CkvYkl80wYZ26DdiENq
Q18W83D/EP4P/Ika2Ot1vHhoF1Jwgow3Y+fayxpMckSBeCNcL0/SLG0aENQbxR54
HD69fk2oZZY4hB+NbQM3F9771GUuwQ==
=oEy9
-----END PGP SIGNATURE-----

--Sig_/E6SS.F_Nk+ZIg05FmH33vi8--
