Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FEB32C9F2
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 02:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbhCDBPy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 20:15:54 -0500
Received: from ozlabs.org ([203.11.71.1]:37311 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343695AbhCDBMy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Mar 2021 20:12:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DrXs452QFz9t25;
        Thu,  4 Mar 2021 12:12:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614820331;
        bh=uMm4y/vfuu3fINQ0NjirOSzSr0A0AGa7QAJ4LOTrf+8=;
        h=Date:From:To:Cc:Subject:From;
        b=ZAIKH71wxhpcU9bp267diQo0NaXz+jKSQDx94KVdex976C//99/LiqKBzk2dQqCVg
         ItHNkda2VWAOI8fXnE3b9Z5pyG07k4X2iS+OFAELlrsoFMzJ6whZoNJRIMCpQNkO6t
         IXAcwPfIGRU7xr/cKsigvULjRdwXK5oDwnqbAM2yBuPBRIklfkilgWjbL4wH5fSmEC
         YPhipEPyFc6vN1XwuFSjLPVPrJ/2MFTcl4wcSYR5aSuAu/wiFLqjwjBjjBhbHIEf8Y
         iu3/XP31QZxWj2O8cWpXdq2U2xcxoMv6KSTbXXJ63zmmVaeDGc4ufSFXa9veu2keha
         vhHGLQLVIic8A==
Date:   Thu, 4 Mar 2021 12:12:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20210304121206.3a7ed310@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/81bds_vhIYZRU8e49ynuD0D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/81bds_vhIYZRU8e49ynuD0D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig ) failed like this:


Presumably caused by commit

  c9e84d46cc03 ("pinctrl: rockchip: make driver be tristate module")

I have used the pinctrl tree from next-20210303 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/81bds_vhIYZRU8e49ynuD0D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBAM+YACgkQAVBC80lX
0GxcEQf/aIGK5hPznrO2Fx+f/qQjugzoxmpjvY+/DdX0cMS5T1Qu4QZx++GVWVrY
2j4aENBat8DRrpG3tilX2iNqJpp0Ub+wyt42sXLmISn4L3311Vx+ks7DdXTwKsfj
2sK3Q+e1tHc+4cj/hEJskmoiClTuy9+eDQD2+Z88nTRpiPwmh373aZcvSPnUK4QH
b8WvHT0O0uwbLBjETXU91uMn5wDkApUqKIfaA/tutC0ELOf93qG6ZQpVKcN3+hRZ
BVOn3+0Q/pKSwf4YBZhSGgiouAMQR2Gq4L8rP1eEHCSiCHQCV6mv6/aIlX2zRqj9
FvAjhQ+SSrR1WFguWr06qT+q3qdZHw==
=v0bY
-----END PGP SIGNATURE-----

--Sig_/81bds_vhIYZRU8e49ynuD0D--
