Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7562626DA
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 07:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgIIFrN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 01:47:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60551 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgIIFrM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Sep 2020 01:47:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmWHf2Qg3z9sT6;
        Wed,  9 Sep 2020 15:47:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599630430;
        bh=U6GHMd9+AvuutVPn/7ykPT+QBoCaG4zgFeEpJKVoQfI=;
        h=Date:From:To:Cc:Subject:From;
        b=HbprA94qVJ4Xg4XKWVqpv0PnbTFQ7TyMdoMFb3j/1eUflvHrVY457RYvWzv6WVNrX
         5c6teLyT86hvyICyTuLmwVIh0uoelv2MV2wDjpOighUMnjs/1tEStnr22wN/RlygQQ
         tAi2/qXwoPzkH1rAVtP1sFhz0l5PxN8+fC8bKjJY9Q2i6mi+v49NHICoVrEBRhBSfx
         Jc+ARvhv/WLPLj98JainuwpQVpqIhhpnJoUIy42ormsn4AmNya6MBYNdVe+ebyQ/xf
         Cjm17+1WZFAq3mef14PDjfdy6LDSQVS6cu+C9F/vRjM69dtVVsfLwsKO3Q4lSzwzlp
         OhZ1Vuz+D8HFA==
Date:   Wed, 9 Sep 2020 15:47:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20200909154709.619fe9bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4=35Z5EuMkpcYusQuct4w8d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4=35Z5EuMkpcYusQuct4w8d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

lib/test_firmware.c: In function 'trigger_request_platform_store':
lib/test_firmware.c:517:35: error: 'efi_embedded_fw_list' undeclared (first=
 use in this function); did you mean 'efi_embedded_fw_desc'?
  517 |  list_add(&efi_embedded_fw.list, &efi_embedded_fw_list);
      |                                   ^~~~~~~~~~~~~~~~~~~~
      |                                   efi_embedded_fw_desc
lib/test_firmware.c:517:35: note: each undeclared identifier is reported on=
ly once for each function it appears in
lib/test_firmware.c:518:34: error: 'efi_embedded_fw_checked' undeclared (fi=
rst use in this function); did you mean 'saved_efi_embedded_fw_checked'?
  518 |  saved_efi_embedded_fw_checked =3D efi_embedded_fw_checked;
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~
      |                                  saved_efi_embedded_fw_checked

Caused by commit

  18efb2f9e897 ("test_firmware: Test platform fw loading on non-EFI systems=
")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/4=35Z5EuMkpcYusQuct4w8d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9YbF0ACgkQAVBC80lX
0Gwlbgf+NA2K0yOtd6KjS4KPpL9omAoYMXYuh+IAhefmr8m50qcMkgUdLgCVb3OV
CPHs+gO+bwbj0f8IbTwyyBraoGXlTHla0Oy46yeghMFJRNmDTK0DHEXj6d7+0PEQ
Wx6MOZDW7M6c8snXNCTKPfxMBNiGkAeEi9uciDS23UFHYsQuesoD+ggHu9VJzMDl
5xmw/zUMuGzftFYWabRrFV6iiT8IZL+XyL3k2QpMf8T0JUyeQDbYVgfmoNS5MhTh
6MNowozt2qBwGAAuSygGqWc+Tqujp3hsPLColgdvAGeRlffY4RRSMtLLsR+d9WlA
8Znkg65Kj7ZEuOb7TYu1zek0uuAPeg==
=6IEQ
-----END PGP SIGNATURE-----

--Sig_/4=35Z5EuMkpcYusQuct4w8d--
