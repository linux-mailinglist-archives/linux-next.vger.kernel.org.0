Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3306250C28
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 01:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHXXN4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 19:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXXNy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2020 19:13:54 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3445C061574;
        Mon, 24 Aug 2020 16:13:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bb7Gg2h2xz9sTY;
        Tue, 25 Aug 2020 09:13:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598310827;
        bh=ifLv7ja+Aq93zBsZtMzOydHNKEXb+JJjJEis39Q4jYo=;
        h=Date:From:To:Cc:Subject:From;
        b=mCD4PIpX4zZq+gaAhPhPdYefg9QrDDZithjdHOx1m394E+QvfA3YEs0kv9hA1kgvG
         oYBZSqnk/SrVsQQLAW4AkhjE4hfLciRq2+qul2KbKNAX6A00i1czOXeQz/tRnEUt2W
         ku7iHEkWeZbXNvTcQgj3u1nyA6KrYRU5nqdzT2C6KHBMrSdkwHDuw9mmN9zOljCk9s
         cgSvLFisOthKTRX4b9Km7t3kyFMrVmCAOKGTw8rAPlRV+4sglhYFY2c1tYWUW4VoUq
         kfp5x8vqJTMX5EAP6dcHQW084CWPjYd0aWpdZw8cKjNKQAPFD1kO0/iTcTYlzKmigy
         KQQNn4U81FOqg==
Date:   Tue, 25 Aug 2020 09:13:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the jc_docs tree
Message-ID: <20200825091346.63395129@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oAGNZb0hMR77VSkbTB.0tLa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oAGNZb0hMR77VSkbTB.0tLa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  09824ed3a906 ("Documentation/locking/locktypes: fix local_locks documenta=
tion")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/oAGNZb0hMR77VSkbTB.0tLa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ESaoACgkQAVBC80lX
0GxEsAf+MQfnJcAXHj137awYvrci3XJ0bhuzX+i1khD2yXdZpgCin8AWEZbeYcT7
5fQpzPBaRj5bv9cO7uOTpmR4f4br3kVvh5fLZVPjRLBEtAciZn3hDSJbZ76+gw4P
2dnZM28DT5kDh8Ro1ZkdpjdomMTDq3210P6wzB965B7QI6LA+sGcRn774hCdUOop
/0NdMZ8W/bvWS9Qq1OvMzxbQLO8Zc0O9OMmlIzETjm6HtpgCqWOfOjzEEatEb6uh
AU9sqjwhm8g1yoLKmvDYz8qmE+ElWbSqiM3QsWGDgYWsPDJP6IQkqnDjhj5XySIH
jEHT3Fgn7A0K281aA5E0RXYxY2zKBA==
=yN7E
-----END PGP SIGNATURE-----

--Sig_/oAGNZb0hMR77VSkbTB.0tLa--
