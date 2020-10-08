Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E77287D8C
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 22:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730838AbgJHU6U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 16:58:20 -0400
Received: from ozlabs.org ([203.11.71.1]:59203 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725931AbgJHU6U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Oct 2020 16:58:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6k7Y3zKsz9sSC;
        Fri,  9 Oct 2020 07:58:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602190698;
        bh=9c1Til4Y3UBbGWRrIquuN5DFOYAZEZAYupyZq9Fi8gM=;
        h=Date:From:To:Cc:Subject:From;
        b=E5jxrI87KzDCdl/PkOEPlDk4jDzArGl+ZINhFsuHiQwuJE27/bb7MPSjotXbgGrtM
         B8wtOPr5tsXmZaNJDxZ0+ym/i1k0r7cUsKf1cGyREgjAY3ibY8R8ye8J3SJ6W+jizY
         pYMtjjjVhORPd4YDgI69oqYQTMjqCZqOskTOLFpblzvSF+1A8M/7Ih6kPT3jNvRVVU
         hhuJG1UYna9IEUGg6Qof7rPS2Gyam3oyoVIXfF2KMSoWoxX0mv179sfGsOcz+CHJY7
         8el7f2QtJUFm0DkF1LBjgPhBmFj7ikWX5VOqLieZqRlP3mkA2Kykdeci7WOzq0rUK3
         uEyXmRc35YyrQ==
Date:   Fri, 9 Oct 2020 07:58:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the powerpc tree
Message-ID: <20201009075816.0cb5a86f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//dl+c07CTYJmvMsmyJW1Iqc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//dl+c07CTYJmvMsmyJW1Iqc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a2d0230b91f7 ("cpufreq: powernv: Fix frame-size-overflow in powernv_cpufr=
eq_reboot_notifier")

Fixes tag

  Fixes: cf30af76 ("cpufreq: powernv: Set the cpus to nominal frequency dur=
ing reboot/kexec")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_//dl+c07CTYJmvMsmyJW1Iqc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9/fWgACgkQAVBC80lX
0Gxr0gf8DYBDjl0ngETwLLLd7UDYnOunr5gO7MKaHqpeUtqlvXTRCfJNBerWqCNL
qTh8ni4Ud9JclJiAy1Mjxb3ONdmlzccgWYr7kXELlElWvcxrNhRknEuOMQpIhx7n
zmR/lsy+yRcu+oDBWUw+CK/tuRs5iN9CTdBmThbkPx8EL++Ee4NpgrThkNHPUbqS
mNl88leOb13ENKxcyHm1c0a5TopoHlRQgBj/xnXDnFJDuLmHki1SOJfApzvqvNHv
dRoZ0K51dLeT5b+pd+e0SD4miMjMEP7GWHGE1aBVtkKPsMb9mF9M8TOxRQnHDJlu
tnWDes8v/IKZPtA2jhP7Zw2KKlG/9A==
=9V2B
-----END PGP SIGNATURE-----

--Sig_//dl+c07CTYJmvMsmyJW1Iqc--
