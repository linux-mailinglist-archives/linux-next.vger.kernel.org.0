Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E45A43288B
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 22:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhJRUnG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 16:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhJRUnG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 16:43:06 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8844BC06161C;
        Mon, 18 Oct 2021 13:40:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HY80H3DJLz4xbP;
        Tue, 19 Oct 2021 07:40:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634589648;
        bh=SRCQJBsqf6UegozLaiDKl7Z0FmxZIrpMB+5roSN+NpE=;
        h=Date:From:To:Cc:Subject:From;
        b=h2SGGqSVw1uMugQLRyXyxUwJJZRWTOrwo42VRGXEG+QJ7Y0KhGl4ERO05Ob4ECdh2
         X5AhUrzoyRT9DHwK7b0K9JkUywYT61RymZrsnE2C/xpa2UySWQ+elafO/Smzo3SOhc
         kHmr4WYsSEcK9MCPP9wFWDyhoqyiqBma1NFd+gUclmQX2LTCQzakPnW784GlMNK298
         CmpwyvwkLQBxTn25IcbcTy23fX3I4mKDqL7qCho6PsstsyxR/6mdLHn/TLRISKTfuR
         d8UzcG+VI6EX2Du20VxxYqxJzb2Fa8Yt69xUN5eSvcz0nKRQLkl8BhTwI4NOa+mgVa
         16NsLsCB/j6Og==
Date:   Tue, 19 Oct 2021 07:40:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20211019074045.65719788@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k9ZgwRGODMrrhlmwTl+njp9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k9ZgwRGODMrrhlmwTl+njp9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f63543d5f682 ("media: vidtv: move kfree(dvb) to vidtv_bridge_dev_release(=
)")

Fixes tag

  Fixes: 28bcf7de1bfd ("media: vidtv: Fix memory leak in remove")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 76e21bb8be4f ("media: vidtv: Fix memory leak in remove")

--=20
Cheers,
Stephen Rothwell

--Sig_/k9ZgwRGODMrrhlmwTl+njp9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFt280ACgkQAVBC80lX
0GxvTAgAkXHiH+Kxbb1z/Uxa48rrWp7SBYcXCiD8jWHOjvFAPlotVBJeqJw/671Y
GCuABWFblze47D/YnY8udtKtiScymq8XEtIonEFI3ld4+dEKVb3FxQXHvxqUvjvy
1dWNpBEscCREsDbJfo5pS73+lx1/X36yh4g59bTP3TJW3gBOIf5eYouZwjn0j+pg
lOZ6ZnLK/EjtFQqHKdJHVVdqGNohQpInFefQ8qpRsD5sZXCdJxqJulRELXluteiZ
6y1tcH0kuhbRGJ3YCtciYVIpdWjBNWaJEAdy49ulnY1e99SBJkcIiKTSiddYsA8p
6iyKf1+mf5IEGxC94e0BP/azGht4FQ==
=Wlto
-----END PGP SIGNATURE-----

--Sig_/k9ZgwRGODMrrhlmwTl+njp9--
