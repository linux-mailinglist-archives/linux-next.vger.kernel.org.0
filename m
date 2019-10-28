Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E70BE7CBF
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbfJ1XML (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:12:11 -0400
Received: from ozlabs.org ([203.11.71.1]:56095 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727689AbfJ1XML (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 19:12:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4729Tg2GRgz9sPK;
        Tue, 29 Oct 2019 10:12:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572304327;
        bh=9D/5rjPWkoGoBcm7/hprULTCOCWl7sCezLmIjc6WehU=;
        h=Date:From:To:Cc:Subject:From;
        b=I3gCV9Nb8eA1xVfa6W9SQsDAxpaH6vlOa3dCv1i1ISbWmxLUJ8lmVC/KROOCI/IFT
         io+BLFa3IQ9oMzollkfzIckKJU2nKx2viWEtimVQMMj0jwdsNB9XZ3oPiK+neg+7rY
         708YvD2x9hfbJMtImFZ/4tYmWCbrGdX78AVD2EtVMjRxUkr8g2UbEmAF38/mhnFKWY
         fyPgH7ZhmkPWxE+iDBM6YzacRbiHbGG6AZ8f1Iv6c5nGLyBNepW3OdkFSSZyL1t8Zr
         6jTFw1U2HqK5snT8XEBbC40n/b4Ax91QS4Z/1xAZD+EbJZZ+uO2YoOEtzvP6nKYItf
         lQNB0WEschzAA==
Date:   Tue, 29 Oct 2019 10:11:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build failure after merge of the xfs tree
Message-ID: <20191029101151.54807d2f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jnnxwp.T2a0xymDBZc5Tn2T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Jnnxwp.T2a0xymDBZc5Tn2T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/compat_ioctl.c: In function '__do_compat_sys_ioctl':
fs/compat_ioctl.c:1056:2: error: case label not within a switch statement
 1056 |  case FICLONE:
      |  ^~~~
fs/compat_ioctl.c:1057:2: error: case label not within a switch statement
 1057 |  case FICLONERANGE:
      |  ^~~~
fs/compat_ioctl.c:1058:2: error: case label not within a switch statement
 1058 |  case FIDEDUPERANGE:
      |  ^~~~
fs/compat_ioctl.c:1059:2: error: case label not within a switch statement
 1059 |  case FS_IOC_FIEMAP:
      |  ^~~~
fs/compat_ioctl.c:1062:2: error: case label not within a switch statement
 1062 |  case FIBMAP:
      |  ^~~~
fs/compat_ioctl.c:1063:2: error: case label not within a switch statement
 1063 |  case FIGETBSZ:
      |  ^~~~
fs/compat_ioctl.c:1064:2: error: case label not within a switch statement
 1064 |  case FIONREAD:
      |  ^~~~
fs/compat_ioctl.c:1066:4: error: break statement not within loop or switch
 1066 |    break;
      |    ^~~~~
fs/compat_ioctl.c:1069:2: error: 'default' label not within a switch statem=
ent
 1069 |  default:
      |  ^~~~~~~
fs/compat_ioctl.c:1078:3: error: break statement not within loop or switch
 1078 |   break;
      |   ^~~~~
fs/compat_ioctl.c:1077:4: error: label 'do_ioctl' used but not defined
 1077 |    goto do_ioctl;
      |    ^~~~
fs/compat_ioctl.c:1073:5: error: label 'out_fput' used but not defined
 1073 |     goto out_fput;
      |     ^~~~
fs/compat_ioctl.c:1005:3: error: label 'out' used but not defined
 1005 |   goto out;
      |   ^~~~
fs/compat_ioctl.c:1079:2: warning: no return statement in function returnin=
g non-void [-Wreturn-type]
 1079 |  }
      |  ^
fs/compat_ioctl.c: At top level:
fs/compat_ioctl.c:1081:2: error: expected identifier or '(' before 'if'
 1081 |  if (compat_ioctl_check_table(XFORM(cmd)))
      |  ^~
fs/compat_ioctl.c:1084:2: warning: data definition has no type or storage c=
lass
 1084 |  error =3D do_ioctl_trans(cmd, arg, f.file);
      |  ^~~~~
fs/compat_ioctl.c:1084:2: error: type defaults to 'int' in declaration of '=
error' [-Werror=3Dimplicit-int]
fs/compat_ioctl.c:1084:25: error: 'cmd' undeclared here (not in a function)
 1084 |  error =3D do_ioctl_trans(cmd, arg, f.file);
      |                         ^~~
fs/compat_ioctl.c:1084:30: error: 'arg' undeclared here (not in a function)
 1084 |  error =3D do_ioctl_trans(cmd, arg, f.file);
      |                              ^~~
fs/compat_ioctl.c:1084:35: error: 'f' undeclared here (not in a function); =
did you mean 'fd'?
 1084 |  error =3D do_ioctl_trans(cmd, arg, f.file);
      |                                   ^
      |                                   fd
fs/compat_ioctl.c:1085:2: error: expected identifier or '(' before 'if'
 1085 |  if (error =3D=3D -ENOIOCTLCMD)
      |  ^~
fs/compat_ioctl.c:1088:2: error: expected identifier or '(' before 'goto'
 1088 |  goto out_fput;
      |  ^~~~
fs/compat_ioctl.c:1090:15: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before ':' token
 1090 |  found_handler:
      |               ^
fs/compat_ioctl.c:1092:10: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before ':' token
 1092 |  do_ioctl:
      |          ^
fs/compat_ioctl.c:1094:10: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before ':' token
 1094 |  out_fput:
      |          ^
fs/compat_ioctl.c:1096:5: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before ':' token
 1096 |  out:
      |     ^
fs/compat_ioctl.c:1098:1: error: expected identifier or '(' before '}' token
 1098 | }
      | ^
fs/compat_ioctl.c:976:12: warning: 'compat_ioctl_check_table' defined but n=
ot used [-Wunused-function]
  976 | static int compat_ioctl_check_table(unsigned int xcmd)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  d5e20bfa0b77 ("fs: add generic UNRESVSP and ZERO_RANGE ioctl handlers")

I have used the xfs tree from next-20191028 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Jnnxwp.T2a0xymDBZc5Tn2T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl23dbcACgkQAVBC80lX
0GwQZwgAif+LiTi4cdFmtlWFCqcHRZTnq+Te9cgoYjnPm+MGjHpq+4w9OpDaVW+C
d2iox+69fLKaBuW0iFxMZUdFV7FHstFX18b8lN20q2lr9KiRyHhom6ZTKlu+2vRS
QXaNMKwIDyeVDeqmzS+y0EhQSISoU0wjH9c35kZsdHc/gXgtN9ZaXJmqVSQI/IRz
hiRGneZR3uWkbBy1gCAg3GUjxyrAqcdX7sdvRbZLjfx5jgK/PQ9e8PBEq1suQcu/
JmRX14/M9XeIgjhXXyIu29OIKv9X46ZL/rI9xKlXT7ZM/CpyuVKvyVl+oxd1XcAH
hAzP7m2XhACsSf5YMbmNZFbyTPaWag==
=WGz4
-----END PGP SIGNATURE-----

--Sig_/Jnnxwp.T2a0xymDBZc5Tn2T--
