Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A6B2C7A5A
	for <lists+linux-next@lfdr.de>; Sun, 29 Nov 2020 18:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgK2RoP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Nov 2020 12:44:15 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39511 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726309AbgK2RoP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Nov 2020 12:44:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CkbLs04Zyz9s0b;
        Mon, 30 Nov 2020 04:43:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606671813;
        bh=12TB8Tot1UPqqko9B8n/QXPyID7KflY+Z8Ky2Sj5JXk=;
        h=Date:From:To:Cc:Subject:From;
        b=vDHT41Y6tHfAjLyPJp9uwCMX6rM7GzRjBVU4fZkn7gYYfA9CLDH0pw/7A06YrVWo0
         5tHhCLA+iNrESccMsMJgzhZtMMMpg7ydsEjucIm8avss1H/NRslNBR10QWCZsjLS0f
         uLsU+Grvpk3hxlsvtq6Y1C9OJWQPQ03e+KV0uVdKSFvOziEFsuwKbfy2nbieL/hKJ5
         1Cyc8qAgQbJ28XYl9WHfymldkm8aoZHdYyXAczWEWlM7winQBrLJ5mdaiKyFxhdUKy
         OVHNLcahuI1bRpclymA5YbSHmXi7Szdn3jR/h7t58Ur1150/Q36ZqKo/4MSrxFiLXJ
         crkSkfW8KLoxw==
Date:   Mon, 30 Nov 2020 04:43:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drivers-x86 tree
Message-ID: <20201130044331.4abf7b91@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f2Ah4giIT/Ac1VanpFLq_RC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/f2Ah4giIT/Ac1VanpFLq_RC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  912b341585e3 ("platform/x86: mlx-platform: Remove PSU EEPROM from MSN274x=
 platform configuration")

Fixes tag

  Fixes: ef08e14a3 ("platform/x86: mlx-platform: Add support for new msn274=
x system type")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  2bf5046bdb64 ("platform/x86: mlx-platform: Remove PSU EEPROM from default=
 platform configuration")

Fixes tags

  Fixes: c6acad68e ("platform/mellanox: mlxreg-hotplug: Modify to use a reg=
map interface")
  Fixes: ba814fdd0 ("platform/x86: mlx-platform: Use defines for bus assign=
ment")

have these problem(s):

  - SHA1 should be at least 12 digits long

These can be fixed in the future by setting core.abbrev to 12 (or more)
or (for git v2.11 or later) just making sure it is not set (or set to
"auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/f2Ah4giIT/Ac1VanpFLq_RC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/D3cMACgkQAVBC80lX
0Gx0KAf/VQfKN9RXzb6f0FlJ8YhbzZ2XufoKPzOYxL1Ib3+K/z10NfH+yL1S2v8V
6CULo0thM5UO1Rww7gr65jfE//1yBXDmWuHblVgNW8j+OqtR5SvfxylEMIZyAho+
1WMjlGYYcDgsOP06gXOg8x5/YMZNkXjcPkmzVOsSeqPPdOcITw9QEsdhoxqt6bEX
ZNJ6dVevEs409tPMfUPbfa34dfaEbOP6jUNbGjdDgLi6QylsvqNTcPoZZVNhw7Y/
59346uhJxok5CEB+S8DoTBnJodfTwNKfxBTmzRlzXsPakJAWDx+6CRKu5rvdYsb4
ctLTk8Z0TWIeyoofTnP7ctubx4ZZWA==
=NLTe
-----END PGP SIGNATURE-----

--Sig_/f2Ah4giIT/Ac1VanpFLq_RC--
