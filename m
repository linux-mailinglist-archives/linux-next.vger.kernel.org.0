Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98231DB263
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 13:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgETLzF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 07:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETLzF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 07:55:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01D2C061A0E;
        Wed, 20 May 2020 04:55:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Rrlm0MDlz9sT1;
        Wed, 20 May 2020 21:55:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589975700;
        bh=yDiiTAInSxyK1/TTzPLx+2xpNCn5L5xGDKCbAxG0qYE=;
        h=Date:From:To:Cc:Subject:From;
        b=nlMkxRsYAgPWReiVmkDR3EsF1GexJ7l4Hd+kQAF9FYnDcGXLSX53zlVYDXNfiHiqT
         i22+JGO578gIhFlbhbvbiJ+ZzZBAWmz/eU3LOe2PC0TtkdhptZjJQrgxbR4+qQjS3x
         gaRMPoYrExnpy7X9LlXydkQMHfoHAFGBSXerH7e7OqO5xSoZoH4Wd2cK3Yk64RJzhA
         oZPucsiJGLjSMyJPzYou17fI8cFBZM2QoPJZeuF+9GKe+PmcFn9aHgqOBR/tBjKQ9j
         KkLsHY8E9aK9jIaj2wAs+NMNQHTNemnsY0eYV7wo0YPEenuAPptfTDGE+4JzCoa3Rk
         2MQJCR6f3/Xcg==
Date:   Wed, 20 May 2020 21:54:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb tree
Message-ID: <20200520215459.4e921042@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sf4G2MbesCFRkAcAW=pjY6X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Sf4G2MbesCFRkAcAW=pjY6X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  21abaf06e4b8 ("media: atomisp: improve device detection code")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Sf4G2MbesCFRkAcAW=pjY6X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7FGpMACgkQAVBC80lX
0GyzdQgAn804dgQsuHo/zaLStzBlnW6hP1q0pWf+52tJ3S8jg/3O82SArxDJThBE
uPe33OZaovPQ1SZTWmWwdQkv/MS+ybLLf4PTxVcQNCdQeKMXJiARsfW0SGJ0ainM
+VVjwS0mk5MYRnuu7G0yiGCUjRG3fYZ4gTHc8W89wP2bls6te/R10b7sRCulGoPI
9Ud8r9IMK+2ZSgfID4YQIxltHhMzZxuGtRs2HPKCGSst1q3C0X6uUqp6vD18H/Cb
HWJXPZWj3Tont7m4FnX6HtTOevl86Qopy5YCDLQsad5hegrK7zvsMTQ3hkkED/hW
8Ggm1lQL+VlcnUivi0mZulMhQ9Dy7A==
=Faog
-----END PGP SIGNATURE-----

--Sig_/Sf4G2MbesCFRkAcAW=pjY6X--
