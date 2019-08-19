Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29DDC91A68
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 02:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfHSAMf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Aug 2019 20:12:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54487 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfHSAMf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Aug 2019 20:12:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46BZB75tg0z9sMr;
        Mon, 19 Aug 2019 10:12:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566173552;
        bh=Z3fiQbsinLJQrAPAnouFwZvoKicpe5UIrfjSEB1eD1w=;
        h=Date:From:To:Cc:Subject:From;
        b=sIthLoFtmVlBrnyLHhBRevJtUs1hBiWIjpI2W6XIQRvulM9YDz97hsT/DNXmdWVJq
         WhbSJtNaY9uk8C/wClo9AOsg1yH6xSNR4GYP+fLH1t3jAml+eaiwBrDMRJi3Mxd3SL
         B6lmCf15ZtKy/F4SVHetUK+oKcIVHxua40TKTtZqngQANcOO+8e17lbOr/TLoFU8IL
         Uwrn3VXpxzRlechysI3uJYwcCF0XD9WS3m3QUSiEOZK9R06yZ4mw0kDEfqj7mGgzU4
         89SBzpG5HbfG+qS4XHp8x3OixVz39ghI2Rsd8QUtb2cIF+MV+eF1Sf57lcZcaTaYhj
         YI4Ny9NI8klQA==
Date:   Mon, 19 Aug 2019 10:12:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Eric Biggers <ebiggers@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the fsverity tree with the ext4 tree
Message-ID: <20190819101231.2832d23c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vN0dcT96_yGz6PnY2S2j/Lf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vN0dcT96_yGz6PnY2S2j/Lf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fsverity tree got a conflict in:

  fs/ext4/ioctl.c

between commits:

  b0c013e2928d ("ext4: add a new ioctl EXT4_IOC_CLEAR_ES_CACHE")
  1ad3ea6e0a69 ("ext4: add a new ioctl EXT4_IOC_GETSTATE")
  bb5835edcdf8 ("ext4: add new ioctl EXT4_IOC_GET_ES_CACHE")

from the ext4 tree and commit:

  c93d8f885809 ("ext4: add basic fs-verity support")

from the fsverity tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ext4/ioctl.c
index e0d1c05b9409,ce811df71690..000000000000
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@@ -1351,16 -1242,10 +1362,18 @@@ long ext4_compat_ioctl(struct file *fil
  	case EXT4_IOC_SET_ENCRYPTION_POLICY:
  	case EXT4_IOC_GET_ENCRYPTION_PWSALT:
  	case EXT4_IOC_GET_ENCRYPTION_POLICY:
 +	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
 +	case FS_IOC_ADD_ENCRYPTION_KEY:
 +	case FS_IOC_REMOVE_ENCRYPTION_KEY:
 +	case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
 +	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
  	case EXT4_IOC_SHUTDOWN:
  	case FS_IOC_GETFSMAP:
 +	case EXT4_IOC_CLEAR_ES_CACHE:
 +	case EXT4_IOC_GETSTATE:
 +	case EXT4_IOC_GET_ES_CACHE:
+ 	case FS_IOC_ENABLE_VERITY:
+ 	case FS_IOC_MEASURE_VERITY:
  		break;
  	default:
  		return -ENOIOCTLCMD;

--Sig_/vN0dcT96_yGz6PnY2S2j/Lf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Z6W8ACgkQAVBC80lX
0GzrXAf/YmQC/x23lDaFHPYWtup3TX0Ciy9SMxqt3PXbb+00w/mCmzghxoAzm253
Pz/Y3XME6oSyXg3jOgJrdcXrQo1JtAJmBkSXhcpra2r2HLtssRkJm4iqMGuD5mHg
VsHNZy0RIvecjRwOTRnCAP7Kj0+9S1x3fbGJXRUlOEDQQ5G+hM3bVOyJwKJR8h00
Z2gl6aa4LFGdQDtTpfVFn66czj4YOLyaMCdNpDYqUzmtdf9uzyoxqnHYGfTItzyj
gtGaK39l6L1jDK3WIpCoTO+GcrbN9N6cS9mTZBpqDhFMdUc5n9kPUHRYpuFTuIZr
6o0flDCfDZ9D9O2k5nqLfcKuHcB4Ug==
=jJYX
-----END PGP SIGNATURE-----

--Sig_/vN0dcT96_yGz6PnY2S2j/Lf--
