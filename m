Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A17462B12EE
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 00:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgKLX6X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 18:58:23 -0500
Received: from ozlabs.org ([203.11.71.1]:59359 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725929AbgKLX6X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Nov 2020 18:58:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CXJT91Wr4z9sTL;
        Fri, 13 Nov 2020 10:58:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605225501;
        bh=T6tufzPX/ux6y2VYb/bvb+FqPknFPULT55XpD2ZAR70=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ccVv8OPIDeZUHt8xM96DVU5J5MXMDdOspIkN3qOyK7xQdLRvrv+MpkPBAjNYmKozN
         HtvAVrO61itoX4R7Sk43wxorxYvrVjlbb5Fy8yKbdBMxhEAkSKE/z0U1Ijgehmp9I+
         6x3KMJY8v3LsjsuUEZCp5qVyyHqbYdJaMoM2/NyPsC4GH9KKXDe05ePNyNW+tIEqAf
         y19T/5g2DgRozhQbemUhPzP6hAgLbttbf9PFXAhotY2GYOfEYunybaNwiNS0TLFDRa
         DrlJLaz1pQYlunr/udBusuHmUcTv1+QiD676dvLL85n7zRJNl4N469bBOfQe4wN8Nx
         bkvzaPsqqEBgQ==
Date:   Fri, 13 Nov 2020 10:58:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-next@vger.kernel.org
Subject: Re: next/pending-fixes build: 212 builds: 1 failed, 211 passed, 808
 errors, 367 warnings (v5.10-rc3-420-g5364e201065c)
Message-ID: <20201113105819.09e2f416@canb.auug.org.au>
In-Reply-To: <5fadc9f9.1c69fb81.e93e.d857@mx.google.com>
References: <5fadc9f9.1c69fb81.e93e.d857@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2lY1kjCq=ZJgui0dK97f=.b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2lY1kjCq=ZJgui0dK97f=.b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi kernelci.org,

On Thu, 12 Nov 2020 15:49:13 -0800 (PST) "kernelci.org bot" <bot@kernelci.o=
rg> wrote:
>
> Errors summary:
>=20
>     126  /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No suc=
h file or directory
>     56   /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.=
h: No such file or directory
>     15   arc-elf32-gcc: error: unrecognized command line option =E2=80=98=
-pthread=E2=80=99
>     14   /bin/sh: 3: llc: not found
>     14   /bin/sh: 1: llc: not found
>     14   /bin/sh: 1: clang: not found
>     12   ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or dir=
ectory
>     8    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or d=
irectory
>     8    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or=
 directory
>     8    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No su=
ch file or directory
>     8    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or d=
irectory
>     8    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
>     8    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
>     8    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98pidfd=E2=80=99
>     8    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98parent_tid=E2=80=99

...

Is this going to get fixed up, please ... it makes these reports not very u=
seful :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/2lY1kjCq=ZJgui0dK97f=.b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+tzBsACgkQAVBC80lX
0GyLZwgAixle795CaPeODwSY0Y11zbPofcfN1qqg6p1MADv7P45D3/+ZORh9Mi4/
PY9K6FjVJKs9ux1muGqKmDQ3Jmti92HdYKwO8M7g/p6bjGr1znOIxEF6yIZHE8ep
QXmyzIEb586krMciuF6bSpkCf7wArBSMlFOwMmE2stW3pfH020lbEjOdtQ2k++U+
r1cEMDB14kdhGzaa+hgociXKBdeUYg1rrtqlWR8rmRXviQZDLeKZhx82l8IH//fi
mbpc3SUWn5TcjCRoHAv/HEZ0vsT1+dAKMPBtlNRS+Kz0tn12hemEpO3IluWJ1mxp
v7tqakJtb2H0uTltMbGGgOcJwwtD8A==
=rWNz
-----END PGP SIGNATURE-----

--Sig_/2lY1kjCq=ZJgui0dK97f=.b--
