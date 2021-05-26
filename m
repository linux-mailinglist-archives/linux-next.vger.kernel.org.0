Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4120A39226D
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 00:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbhEZWBc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 18:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233801AbhEZWBb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2021 18:01:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B819AC061574;
        Wed, 26 May 2021 14:59:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fr4cX4CwFz9s5R;
        Thu, 27 May 2021 07:59:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622066396;
        bh=2+hLVHFT9QBw+1pJo3dO0FRsdTqnjFvgqsGvFSrYHiM=;
        h=Date:From:To:Cc:Subject:From;
        b=VCpq9oCv6bFI63fHslB/53RHMyFI+ZEisXkRmFoYKUoI6alXcMQM3Jyiw52V2AC/Z
         siEX+AsCG7m4Q2J0Y4UYy6yfxMH+Nwf3ksYQXf2U6AbCRkZTqj6s7uYBJgRZH0r7NX
         FSNnT9HWsM87noC3gsk3pm6vUmvh/lw/SVUQJ5YcvmLMMv2M3eStglG7bxpc6PTQPC
         iJcGZhSK1Oj1y4U4B21WS5iBP5hSjfJ/MIg1VXgGHWVi0Xur3rSru/9n6zrkV4v7qI
         Qnlp6nBAHfVEcjbfcdyBdTrTyrmRNYEVIBayjiBcl/TbDn8jjxYuXNJoctju25gPJz
         ijtBAYrDkZMDQ==
Date:   Thu, 27 May 2021 07:59:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Mikulas Patocka <mpatocka@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the device-mapper
 tree
Message-ID: <20210527075955.01aca52a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n9UZ1+54d/Ozhz2hG.7hKl5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n9UZ1+54d/Ozhz2hG.7hKl5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  da6a76c1f697 ("dm: improve kcopyd latency")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/n9UZ1+54d/Ozhz2hG.7hKl5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCuxNsACgkQAVBC80lX
0Gx0NQf8DZoSDuC5AXW36vakomHbZBhf92Wwms/Og9exIYMujOirTGV62hDb+osr
RWtr72jlYq3lKE1+u9rXJbuchntBOkqMbo6YYP3MsgXJtt0U1kC3bDOGCSdCXkln
R/R5YWP+LkbBp9PJZ69EatNs4uI7HsuEn8JhC2kscxEgQVXkrCeGiHuM2wM86IT7
adlkxN/m/LVMe4KYR1ZbwGpBCtfJnQTumr9C20JkhshYb7GT0WC9+ATZwOuxI1Bx
kyixyc/QVS7Lu400CVTcRoBIzsvrsoUNd6fumwnAHvHka/YbLc6x3j5o73VRQ/KM
ErzYe8ppd17lauBWwwrHqoSakXZiog==
=b4qJ
-----END PGP SIGNATURE-----

--Sig_/n9UZ1+54d/Ozhz2hG.7hKl5--
