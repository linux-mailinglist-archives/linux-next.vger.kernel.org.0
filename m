Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C4E232758
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 00:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgG2WIy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 18:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgG2WIy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 18:08:54 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DDBC061794;
        Wed, 29 Jul 2020 15:08:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BH73m03bCz9sRN;
        Thu, 30 Jul 2020 08:08:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596060532;
        bh=bLo2jV4Pvy91H8WO10H2/xAQgCc3y11jzZ+ul9Ox+qQ=;
        h=Date:From:To:Cc:Subject:From;
        b=OrxpFOnfMIgzZjtEYhg5AZFkfppkfqg5I2l2cJTtjufZkftTBh51TcNsFEFdV5iD2
         S9FlI2V5rWZo9LWaES7FDqg3I84QBvEum87KL4caWlI2N/TwPLtVz0M7aiORmbAOoB
         WAZ2yLNdESw2Po7iMwpv250oYSx7MKH7ORxNvZdCnVETsnt3H4F+60+pFjBhf7tUC0
         MDoxHseDnJDbH9VrJJk7D73LYxuIMDpjlXbHckQOzehNeOfqcSSFSGB7TT77WPX3iy
         XAtVGxNzTnSKRT5J1J6A3NwXbWhE2HULm60Xq7aLHjuTQjdKsZD961mwB2aTDaoPS+
         T+8we2aAH8vpg==
Date:   Thu, 30 Jul 2020 08:08:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20200730080849.70cfeeb6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=gaXBSUfvH=CKmleEgdPqDg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=gaXBSUfvH=CKmleEgdPqDg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  64d452b3560b ("nvme-loop: set ctrl state connecting after init")

Fixes tag

  Fixes: aa63fa6776a7 ("nvme-fabrics: allow to queue requests for live queu=
es")

has these problem(s):

  - Target SHA1 does not exist

I can't easily find what commit is meant :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/=gaXBSUfvH=CKmleEgdPqDg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8h83IACgkQAVBC80lX
0Gywrwf+MnGnrCmh26BsZ+dI4646/vvRICbge8pWJ3CBFiuOR/WqI1Q/BQGFMx9M
dv/je4YNSrLZ5DJnEkeka8/v5yBC//kxbHfsZ6HCuOjCRK3vVJk88r/4fJsPNCzG
xC/Nqe4clUBMtsgicMKOk0F0Pmi5rOQ2yKI1Q2qbgaOtR1BHeLVk60DYBvskHgZd
pdLyCx1V8Lpft5OMh/QJY7Y8tSqIrzPSgW9P4Uh7KgaX4AbecA9YdbfLSjkodsXu
+IQ+3jWQVYEhSEn61YA1+jCnPvAs1cAvNCrWoSRcRb2W50H1RXQHE8RdhDkRV+J0
myMQNoYfqZS5N9UDZ2cqKWTbfhpeJA==
=90iK
-----END PGP SIGNATURE-----

--Sig_/=gaXBSUfvH=CKmleEgdPqDg--
