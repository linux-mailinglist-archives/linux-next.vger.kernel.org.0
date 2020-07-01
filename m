Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC33211584
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 00:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgGAWBR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Jul 2020 18:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGAWBR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2020 18:01:17 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CA0C08C5C1;
        Wed,  1 Jul 2020 15:01:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49xwCr1Gn1z9sRf;
        Thu,  2 Jul 2020 08:01:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593640873;
        bh=VHwdW1vT/s6ckSN9i/ISxHoKGW5YumIiwPoW9KfgCAQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Gc+3jqpizUBwOeP8ppTxkIPGSDQDqMA+yh8DGI3xl8mzLVOkCmcE9KUA6kSzhz/pD
         o/eeN/ugA5T+fOZ0VdXBYNLhtB2clZUHdVEQjXOjEWth9xDHZ7roMVGJsdKFVA573K
         0Fllt3jx2I+xeIifcrd7zqUYjyXh27lbtE5S8M82id6wzqb8GblAhddIKiTJ2vwjKh
         LRmsllhQpxTqA5yifv/cAsYhU+TLQH/4/ururl9CmjzHV2cb4mfyemH5tLMAsvdY9W
         l8je0pIPld7wIrG1jNJisu8/f63ihtij6JZuiV+BTrMlqub6w7enCInwjplPviuQ6Q
         UK75VCnb1BZww==
Date:   Thu, 2 Jul 2020 08:01:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wade Mealing <wmealing@redhat.com>
Subject: linux-next: Signed-off-by missing for commit in the
 char-misc.current tree
Message-ID: <20200702080110.24d42ffe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XddFE0jaews0RUKaC/MMvZm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XddFE0jaews0RUKaC/MMvZm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  853eab68afc8 ("Revert "zram: convert remaining CLASS_ATTR() to CLASS_ATTR=
_RO()"")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/XddFE0jaews0RUKaC/MMvZm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl79B6YACgkQAVBC80lX
0GyQBQf5AQogOXSyDmB6nboIldCVWSIp/2coW0qV7Rg3y0f9XwKM8+wkV1ebVAhZ
0JcJZ9zViNhuQY5ygKVErIiCnDAMc7Wa/n4DuDQyZp9/w6oFVZ+qqghV+HsNPDH6
oFvgdZlNdXnwLqtdlZ5kmD1MpmKvoVAqg/+wwpfUM0KqSmoX0vHD18vIbqE/Ielb
y2JIrPNg8a/YhoeJF0meflbDM0/PosyRKLB8KrCjr7UbeIkVdAcrZhCmrJ+hGl2I
E4TqLz9KXSYNFtGtFAhhwusTyp3kUr3opI7FJh4NCyVO5VBagDkZuCBO+IDyRIDD
8oEg+pf8+pA0+r0vHkU0Z/6sS3wVoA==
=UAvn
-----END PGP SIGNATURE-----

--Sig_/XddFE0jaews0RUKaC/MMvZm--
