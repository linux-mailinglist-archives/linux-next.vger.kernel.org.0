Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36882CBC49
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 13:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgLBMCs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 07:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbgLBMCs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 07:02:48 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF67C0613D6;
        Wed,  2 Dec 2020 04:02:07 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmHdP2YK3z9s1l;
        Wed,  2 Dec 2020 23:02:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606910521;
        bh=DhMubd6l3BkR2suMZ4zYCgw+AuiQFHha81BSdGb7ifY=;
        h=Date:From:To:Cc:Subject:From;
        b=GCc/dmFwLk6BpkAQlNKd28cSx62jh+3FZ1A5cDQn1A73lAZkTLKx6ncdSS4sK+xAe
         f9IikvOgf9AMXCHrCgUrZQ5bWRGFAOXPtCSw1WrDYw5acXaHIo810qwMVbuME+ZRzf
         /IGVCjsnAtwVl3ZLq2eVa1dv3hzOMNABKiK/IfOPR8rAysV6H15sUUJDjy+TF0PdTq
         6xRu463h32rZeeLDF/UUTZxX+zfzGnpnKAUfHKRNf4n34o0QDe4OD2P6RpVDGDX58Z
         byVZotFA8SUwibbR4i/vebkyfJHVTZaSDan9cgJoXlo0zOFxR78AtNmzjRib8DUVRK
         0JgcY8t4lam+g==
Date:   Wed, 2 Dec 2020 23:01:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Jack Qiu <jack.qiu@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the f2fs tree
Message-ID: <20201202230159.17045522@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9U.raGBIXvFkUXXK1m5=vhS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9U.raGBIXvFkUXXK1m5=vhS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  32c202c563c7 ("f2fs: init dirty_secmap incorrectly")

Fixes tag

  Fixes: da52f8ade40b ("f2fs: get the right gc victim section when section

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/9U.raGBIXvFkUXXK1m5=vhS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/HgjcACgkQAVBC80lX
0GzhTAf+IlL6C/uXm5WNqB43zQypzoyh9/YiaCoA0J+8PestVBkaq36o9jNREq/T
M1Otjpi24RVemwxsdd+rmg/e1txujRKAaIzQ8I5pjR5vcUsaVueRiJotiBbI9lE6
64RpE39MrsO5WzhilxzgywYX4k2B18dwWIsL27/JfWniE2Qjy/YKqLNN2okc2LMl
zJ+OilqBa+C4ObUU1zEnrtXyeD9kq6k+w4laHoYZtcBQ7D4D0kd7IEdkpiMYPFqY
SKOXXdZRNoiIyGJ+uNPbb6bVa+ffdoc89iOnWl6GWrrS5q0HrceTFLTVdesuJEjA
ko1RH5jHuKGVlIR8HoTY+IoS8wedng==
=7Puj
-----END PGP SIGNATURE-----

--Sig_/9U.raGBIXvFkUXXK1m5=vhS--
