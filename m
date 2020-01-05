Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2716E130A2E
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2020 23:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgAEWUw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 17:20:52 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60181 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbgAEWUw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jan 2020 17:20:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rY4c4ldBz9sPJ;
        Mon,  6 Jan 2020 09:20:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578262849;
        bh=E+q6k2ycXQHw60uj6CbYGiIlcHxFmrT3dVHqeFlccNA=;
        h=Date:From:To:Cc:Subject:From;
        b=KCFzcTa2t36ibetYQPZXyOLVKxEN4ZNmaRjBvA9bt8oXEXq8KUl0nWNsIdC+n1Hj5
         pedhOWb5wDWJ03ctJ0pk6nWr+8eAedZM3yZEnKM7fKz7dTFZqZW1TRI3fStKt23KrH
         eDo4zZcoDGN7ZjFvvKBVQOoM6Q+GaTo+h/RqY+oLDP/8naR7GQoGAb5zVVe08dD7C6
         ymvFKrw22itw98dbEv21OaQB8Ud0gXOdL4ib+Bf49AunWUEdLPQdy4HidVse2iZe56
         +q84ckpgiFMslEnb0s7Bfl5xwe1pqZD1s4uL76TnqcP+Yv80usPhE9sDHKYFUTPvrb
         LXZKfwGMZ9HVw==
Date:   Mon, 6 Jan 2020 09:20:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@suse.de>
Subject: linux-next: manual merge of the csky tree with Linus' tree
Message-ID: <20200106092029.00d365da@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fJam.fbauvI2BuJDaqF6+i0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fJam.fbauvI2BuJDaqF6+i0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the csky tree got a conflict in:

  arch/csky/kernel/vmlinux.lds.S

between commit:

  eaf937075c9a ("vmlinux.lds.h: Move NOTES into RO_DATA")

from Linus' tree and commit:

  338ef1d06f0c ("csky: Tightly-Coupled Memory or Sram support")

from the csky tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/csky/kernel/vmlinux.lds.S
index 2ff37beaf2bf,02b35d916fe7..000000000000
--- a/arch/csky/kernel/vmlinux.lds.S
+++ b/arch/csky/kernel/vmlinux.lds.S
@@@ -49,10 -51,59 +51,58 @@@ SECTION
 =20
 =20
  	_sdata =3D .;
 -	RO_DATA_SECTION(PAGE_SIZE)
 -	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 +	RO_DATA(PAGE_SIZE)
 +	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
  	_edata =3D .;
 =20
+ #ifdef CONFIG_HAVE_TCM
+ 	.tcm_start : {
+ 		. =3D ALIGN(PAGE_SIZE);
+ 		__tcm_start =3D .;
+ 	}
+=20
+ 	.text_data_tcm FIXADDR_TCM : AT(__tcm_start)
+ 	{
+ 		. =3D ALIGN(4);
+ 		__stcm_text_data =3D .;
+ 		*(.tcm.text)
+ 		*(.tcm.rodata)
+ #ifndef CONFIG_HAVE_DTCM
+ 		*(.tcm.data)
+ #endif
+ 		. =3D ALIGN(4);
+ 		__etcm_text_data =3D .;
+ 	}
+=20
+ 	. =3D ADDR(.tcm_start) + SIZEOF(.tcm_start) + SIZEOF(.text_data_tcm);
+=20
+ #ifdef CONFIG_HAVE_DTCM
+ 	#define ITCM_SIZE	CONFIG_ITCM_NR_PAGES * PAGE_SIZE
+=20
+ 	.dtcm_start : {
+ 		__dtcm_start =3D .;
+ 	}
+=20
+ 	.data_tcm FIXADDR_TCM + ITCM_SIZE : AT(__dtcm_start)
+ 	{
+ 		. =3D ALIGN(4);
+ 		__stcm_data =3D .;
+ 		*(.tcm.data)
+ 		. =3D ALIGN(4);
+ 		__etcm_data =3D .;
+ 	}
+=20
+ 	. =3D ADDR(.dtcm_start) + SIZEOF(.data_tcm);
+=20
+ 	.tcm_end : AT(ADDR(.dtcm_start) + SIZEOF(.data_tcm)) {
+ #else
+ 	.tcm_end : AT(ADDR(.tcm_start) + SIZEOF(.text_data_tcm)) {
+ #endif
+ 		. =3D ALIGN(PAGE_SIZE);
+ 		__tcm_end =3D .;
+ 	}
+ #endif
+=20
 -	NOTES
  	EXCEPTION_TABLE(L1_CACHE_BYTES)
  	BSS_SECTION(L1_CACHE_BYTES, PAGE_SIZE, L1_CACHE_BYTES)
  	VBR_BASE

--Sig_/fJam.fbauvI2BuJDaqF6+i0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4SYS0ACgkQAVBC80lX
0GxAzQf/R6CFXdOq/qt5pWjnHV667FsRaxvmRgkXeuAfd7oSlsWPyjC9L8De3/eI
cu7KK7K6B8Lky2UhB+nGeh0T2eplLvMEF7qWrvJuGw8tLNX25mXdd+rrPNDWws8r
K0T/SrOJoAFyPMYVGwbQ38AfZWtKr7YMMRKECNmnE7yac73c96xpBwJ7YSGrIeRT
kwxU7RMJi2tmmkxHgXaQoiX/A421AWWPv2czza8u9/o1SQ8UrVuToJnFhGT3aXy5
E7VlQH6K/3QYfWc0wplhFRZDuSXXsauSRA0j2skiBWpgwelUyKOI11ba1EvonV99
YZKoNL9NJC8L0RMhQ1Zb1rDcf3iXsw==
=jEHF
-----END PGP SIGNATURE-----

--Sig_/fJam.fbauvI2BuJDaqF6+i0--
