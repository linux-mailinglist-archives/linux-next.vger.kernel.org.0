Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E370036B356
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 14:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbhDZMpD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 08:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbhDZMpA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2021 08:45:00 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D3CC061574;
        Mon, 26 Apr 2021 05:44:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FTPj96qQNz9sVw;
        Mon, 26 Apr 2021 22:44:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619441054;
        bh=UPE0vA6J4tXPSQv54xevPfw1LChpV74C10W0KZXMuCo=;
        h=Date:From:To:Cc:Subject:From;
        b=j9W8DHa+dc+mKkKrh3Y/CMxYDwQmTtyIpbq3i7f++SkSaHcU5zrdhqBm7ASyI3lFi
         GqCxZqqiVIJxF6QH9eFXegHSJmxN++6vmdlppkGl1fhnzHo7w7CeKVyIdmdFKoM4Zl
         8TYBlW4zegetE9u8FlGvCdkwyFjHh9+c+8fipCX7S8JPHxCiKPQmE5pUnkCfGs01d/
         wVaTVyeqwNWbClZ6FeWOk10Jllmr19MNWuDQ18IkXJiZGMNWbaLI2eOujzi6NyHUWM
         KyrMhzk8kcmHwSJcs0CIZrYsiqkGFndfG7cBoh/C+0zUq6dQUGsZ8Z/gLlM7rxumzK
         pp0sKxw8TQ3EQ==
Date:   Mon, 26 Apr 2021 22:44:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20210426224413.2ce59504@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=Ex4SoKYFv4hqqa25EqZU5R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=Ex4SoKYFv4hqqa25EqZU5R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htlmdocs) produced
this warning:

Documentation/driver-api/usb/writing_usb_driver.rst:129: WARNING: undefined=
 label: usb_header

Presumably introduced by commit

  caa93d9bd2d7 ("usb: Fix up movement of USB core kerneldoc location")

--=20
Cheers,
Stephen Rothwell

--Sig_/=Ex4SoKYFv4hqqa25EqZU5R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCGtZ0ACgkQAVBC80lX
0GwH2gf/dmc9WXXAktN6Gbb2C5ojZWa0lDL1nACKQnzehkS8Nwya3nfck1LLnq2b
CETVmbvOXh/1ZjqKNz4YqEve80DGAUEQ7u1nukkhNgr0MXRbIe2Ew3BPEcqObZTP
wN4zUVs9pyajdnQnhGHb0/uMNjUcrTBV7Fbp0Q0mcq99nd29yopScboehZIwebzU
mMQ7gD6IO4nZK9S4yXU5iElHCv1SnFlGbAYRDkpe3HD26SkMNFWR5shWGM1tk7/S
iT2HLWXhRFGkHFk3L5uEM6goKLXe9hnG5G+2tTfZ643AVAxCeAWlHVrBwJ7JCEHx
z+i5gLhGAQPgdhuyHpAQ3tQ0Lo2YTA==
=F6Uh
-----END PGP SIGNATURE-----

--Sig_/=Ex4SoKYFv4hqqa25EqZU5R--
