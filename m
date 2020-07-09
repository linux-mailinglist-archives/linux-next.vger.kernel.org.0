Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B931A21A083
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 15:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgGINIu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 09:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgGINIu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2020 09:08:50 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2B5C061A0B;
        Thu,  9 Jul 2020 06:08:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2c1p6kb3z9sQt;
        Thu,  9 Jul 2020 23:08:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594300127;
        bh=QZ2TXUsNwQX+5fM9Z1XiCcYS14Bjz3U37QBOvz6UKLY=;
        h=Date:From:To:Cc:Subject:From;
        b=S+pa8QchmxP/Hxz4V1WUici9SiDKn8JD1Us5ZCcQAQe1yWQShqT5YaMiaOZxeJ3dC
         rBBqvGc64UF7gICaq5k2juWXu5gvNKnpQ4p0wydsDPTTJazoe9sK9exr5t7Qy2IdDI
         GXzQJQFy59DUMKIF7MHCax9LgfeJBBCj+sa6Y0bUGX78O54OwKpAediiFX5+0DXf/l
         IQHYNnOTf6JNcSASxc+CRCmrh34Ph+vWm7JcD+JLpcSfw0DdyGSimLSdiBlxDTwipD
         PNNgOkftpOHxE6WGZv1w5aKmSoa3kG1DTALDGYc+7dDtjPmPw6+Lnmkh27dwaIaq3h
         EOopchiXVINNw==
Date:   Thu, 9 Jul 2020 23:08:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the btrfs tree
Message-ID: <20200709230845.12f5d4f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n5OSowseHPXt_qLhu/dGza6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n5OSowseHPXt_qLhu/dGza6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  708dd6a863c3 ("btrfs: switch to iomap_dio_rw() for dio")
  11b399d70e53 ("iomap: IOMAP_DIO_RWF_NO_STALE_PAGECACHE return if page inv=
alidation fails")
  b65c4e58e476 ("iomap: Convert wait_for_completion to flags")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/n5OSowseHPXt_qLhu/dGza6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8HFt0ACgkQAVBC80lX
0GwvJwgAkjueta/Jkqy2dpDRSgMtlGhK1bZS35hZSJqFp9UiqCfMGuJGv0d8CCpn
pBXEb6qqJJqqjuH2nAW9ft8R2+GXFxJRsq/A/lcKM73x4BeKH9vwhDagTCzwxn4R
PB3jZ0X07lTepLDIgL7R2xqe+It049aMdeB13wnEkJHVqYboidKgAjRLnqfZZWB3
JS+mLzgGbFaUVVo5DwYoKxowUuTsuMQFDdaKZNZMQOea073YzFcnM8qUZ8GpvCVH
Vb0dDyuiiBzsKwaZiNhNgZBreFZAI11P9z5xTOLK5aaHJm21F4sTG+bt6VCja1b4
j2P4fx+y/uKsmz38VQU7w/T1HtKFpw==
=anhP
-----END PGP SIGNATURE-----

--Sig_/n5OSowseHPXt_qLhu/dGza6--
