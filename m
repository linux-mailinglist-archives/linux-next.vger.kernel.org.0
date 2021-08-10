Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE65D3E85C2
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 23:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbhHJV7C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 17:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbhHJV7C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 17:59:02 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBD4C061765;
        Tue, 10 Aug 2021 14:58:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gkmzw3rT2z9sCD;
        Wed, 11 Aug 2021 07:58:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628632716;
        bh=qHqa0Ty2Ne7tPAE1xBmKiYCEw14FMtO2sBfddx+zT+s=;
        h=Date:From:To:Cc:Subject:From;
        b=IEYyP02KN1oa1l/rozZ66Wd6QzBvFJHtOoN+cyPolsXNTYjsKfz74jYPCoWFuG3fD
         b34zHNm5uJvUndVLGEzyebGhZKWRWpuNi0GLWN7brBM6xPC8TbaygNiBUeHYmWX5BX
         VIPuujOik9ZhZ+SIqPYTQ1dR2He/+GO/flfPM1EsCIfxBpiqLmNmTpq05QBozGKNQa
         g8EcU40Ptoxy+Ltx9XfKw2mY6Rs0Dgr0AtxikgYY70YMpi5wWfhv6Wv5/slH3NTpqd
         jKFB+ae+4EE9ICRS5Vi7Zv4fwed6slSC02Fj3tknCr1zg8J5MXS4GfIhKG/6454DHi
         cFL965hyZsMZA==
Date:   Wed, 11 Aug 2021 07:58:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20210811075835.76696f30@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CVGJiKVe9CwnBbMloAmb=8.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CVGJiKVe9CwnBbMloAmb=8.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9d3b8813895d ("block: change the refcounting for partitions")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/CVGJiKVe9CwnBbMloAmb=8.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmES9osACgkQAVBC80lX
0GwaJgf/aRmvKJ5IO4cd1sKgD7/5+Lqouue9opolVBcGS2JVUqBO93AvqLmaWXeY
mKRAdmj1FEYf8mFbHfxOYSj09BFJNJYUKngVXhpBCL4bc+rDpHRMCPrH5T5T4hqe
3s/WIJkEDo+CIQxT87FSdxBAkioBkpWQDranUPUdioUm+gmRy65ZaQeXojnIkVW/
AbyNwHUelrRvltXuFoMXNxjSBVsXWEljc69ZCP1WUJ2VM45RG4ZFiWo2cEkiChLv
/LQ+8MsOgy6tiPvy0EUQ2tC6R/1nvEDL/+4f7zO8UZ0eViWQh+pwo7IFB0DVEKlA
ws3WHG5mcE4FchiP7CgA/NrVSRkt+w==
=1nRw
-----END PGP SIGNATURE-----

--Sig_/CVGJiKVe9CwnBbMloAmb=8.--
