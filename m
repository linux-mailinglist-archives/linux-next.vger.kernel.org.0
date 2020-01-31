Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2850614E7B1
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 04:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgAaDwH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 22:52:07 -0500
Received: from ozlabs.org ([203.11.71.1]:49575 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727739AbgAaDwH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jan 2020 22:52:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4883FG3gLRz9sRQ;
        Fri, 31 Jan 2020 14:52:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580442724;
        bh=FhD3fqfXfaKMs3Id654DNyX/jTg1LpLJISqPjzax1ig=;
        h=Date:From:To:Cc:Subject:From;
        b=a2cS0UPlD+cQAUHD30Pl0TfbkR4A0BEitv5hXCsiVvzVvba/gsIkwbpa/0v+GzfC6
         6kYOSysgHSCwef1GanPB1oEy2JAIELpxJDlWTQs4850Mvb3Ovdn8fvHTJhUktnbwMB
         i5QYc4FRJkBvdkEW3VI6jlQEgSoClFj2C5/O94Ev7QhCpQUvnLJwh3HQzbJ7qhu2ZS
         vdz0nbsy443mbBtW5KLqotp7VXW0F6gV7fr5R6h1jnv8qZdhTCIoLQeqlJ1dRtqCcW
         JjWP7rNoUedExTO7WGo/BgzmYxY1BsR1F0F4TX40zZ+OUFsnGb6BqzWxZlTlKEuMVn
         VD5wh2IJJeA2Q==
Date:   Fri, 31 Jan 2020 14:52:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: problem building perf
Message-ID: <20200131145201.422b6fb4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QAiyLP.h==OJfoUkX1ltQaY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QAiyLP.h==OJfoUkX1ltQaY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This morning trying to do a native perf build (powerpcle) produced
these errors:

util/srcline.c: In function 'find_address_in_section':
util/srcline.c:200:7: error: implicit declaration of function 'bfd_get_sect=
ion_flags'; did you mean 'bfd_set_section_flags'? [-Werror=3Dimplicit-funct=
ion-declaration]
  200 |  if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) =3D=3D 0)
      |       ^~~~~~~~~~~~~~~~~~~~~
      |       bfd_set_section_flags
util/srcline.c:200:7: error: nested extern declaration of 'bfd_get_section_=
flags' [-Werror=3Dnested-externs]
util/srcline.c:204:8: error: implicit declaration of function 'bfd_get_sect=
ion_vma'; did you mean 'bfd_set_section_vma'? [-Werror=3Dimplicit-function-=
declaration]
  204 |  vma =3D bfd_get_section_vma(abfd, section);
      |        ^~~~~~~~~~~~~~~~~~~
      |        bfd_set_section_vma
util/srcline.c:204:8: error: nested extern declaration of 'bfd_get_section_=
vma' [-Werror=3Dnested-externs]
util/srcline.c:205:9: error: implicit declaration of function 'bfd_get_sect=
ion_size'; did you mean 'bfd_set_section_size'? [-Werror=3Dimplicit-functio=
n-declaration]
  205 |  size =3D bfd_get_section_size(section);
      |         ^~~~~~~~~~~~~~~~~~~~
      |         bfd_set_section_size
util/srcline.c:205:9: error: nested extern declaration of 'bfd_get_section_=
size' [-Werror=3Dnested-externs]

I traced it back to an update to binutils-dev I did last night :-(  The
update was from 2.33.1 to 2.33.90.20200122 on my Debian build machine.
The above three macros no longer appear anywhere in /usr/include
(they were in /usr/include/bfd.h before the upgrade).  I have backed
the upgrade out for now.

I am wondering if this is a perf bug or a bintuils bug or a Debian
packaging bug?
--=20
Cheers,
Stephen Rothwell

--Sig_/QAiyLP.h==OJfoUkX1ltQaY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4zpGEACgkQAVBC80lX
0GwCmAf5Ac7qCykVT/sTa5kAt5HTaev3N2s9Piyq0ZxsMkwgaxUekOpzkfZNn6q3
porRNt/SPfB87FSqgpePi0Esi8SnaSnRHGhgLbjnQTA1qPdLiZbtifn0gEFZcVsh
+lusM5nj517JwEA7Jait6YQqcJ5ql/K9Uw11HrPpxn+I8nxhHPb/PGU89OcXVo7t
0j8xsvnsIcBAlwvfwwEQKP0gw0qoIeucVMGM65/Aw9Ks8A3AlKev+yEs/JRcJaaS
xkr4JFKhPBWOFllZFlSR84KPEqMtizN17MSYKsFVHbgF7uEoqVMPmrDVX+Sp9Ywm
penUgS68TWPIiFblG9wiD0JokBy4DQ==
=AjKF
-----END PGP SIGNATURE-----

--Sig_/QAiyLP.h==OJfoUkX1ltQaY--
