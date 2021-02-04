Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2852130EBC4
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 06:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhBDFOg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 00:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhBDFOg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Feb 2021 00:14:36 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC38BC061573;
        Wed,  3 Feb 2021 21:13:55 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWRXw5QXQz9sjJ;
        Thu,  4 Feb 2021 16:13:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612415632;
        bh=g9IsbOeoSY8KcmdjfDbMJUNHzUDclc5vninqn3OnmNc=;
        h=Date:From:To:Cc:Subject:From;
        b=T2v1iq9+Af/pxmHsJv8PmEDjyje2e9aDu7hipFvINc8Rv8Do7R3WYBa3SH7wOdwWR
         gk3Hcg18k6/QxiOnFHNVjf+2QGxmmYhx2HafGz1Gtq8rVWrTXPj5c+BtJn4bEcXvLw
         5GS77vJQdlB4v38M8kqLqFCjwdNKx2Ke7MaGW9wLTOFHK5WAcasVIh1Endls+PIhff
         gY5wrIH5eJe7KKvNy6cMZaakoyxArtsT0qf9EQm1cb3FbwUUSSS/XtZymhW5EsNDNq
         8uRS6gmPW5ZOX4IHjXjTuSlAlcsqSMRRbwbhi6x3YpQE9S7rjaBbQABuyg7uPwwleY
         Xd4u91Zl5nyZg==
Date:   Thu, 4 Feb 2021 16:13:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Message-ID: <20210204161351.5c934ea2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RWzQo=VpZdEzZIQN.B_hF8S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RWzQo=VpZdEzZIQN.B_hF8S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/platform/x86/intel_scu_wdt.c: In function 'register_mid_wdt':
drivers/platform/x86/intel_scu_wdt.c:66:28: warning: assignment discards 'c=
onst' qualifier from pointer target type [-Wdiscarded-qualifiers]
   66 |  wdt_dev.dev.platform_data =3D (const struct intel_mid_wdt_pdata *)=
id->driver_data;
      |                            ^

Introduced by commit

  a507e5d90f3d ("platform/x86: intel_scu_wdt: Get rid of custom x86 model c=
omparison")

--=20
Cheers,
Stephen Rothwell

--Sig_/RWzQo=VpZdEzZIQN.B_hF8S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAbgo8ACgkQAVBC80lX
0Gw/CQf+JkkPcHCpMifpv91fbXx0P3Sg8dXEzGbvYHnWgtggYXp+LUPzNX+sK5FX
vh1IYjq9905DfxJXcPF4/DwwUIftpI0gZRiJNtw0NOOo4obGt1+CxWrZVwnZB/y9
qsYo1DVJMmHnkksfWppR1bHCJmSEhS3S94P18Bn8yBpuQ2cn0p7VXpfi06uqo0tw
nxQdqXjCzLcJ1YaJ/ZMAW7tr3hpkESa/FmK/kT6hDY4NIgbmcBCJVSNMheWizpqt
GnVR79xA5A5hGbAd1+wFXNPZ2Yt+tvMmeIgUGXpWb0gQrfMwfyy403kjsK0+bRnI
HvcyoZjoGJ0j9smWXTSpcoGysYTQBQ==
=ds+d
-----END PGP SIGNATURE-----

--Sig_/RWzQo=VpZdEzZIQN.B_hF8S--
