Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B952562E6
	for <lists+linux-next@lfdr.de>; Sat, 29 Aug 2020 00:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgH1WXZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 18:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgH1WXV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 18:23:21 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4BEC061264;
        Fri, 28 Aug 2020 15:23:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BdYyT3G6lz9sTF;
        Sat, 29 Aug 2020 08:23:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598653393;
        bh=0NbEH6XeHtBLzIXQULMRC91JOGXISZKhYaC+GkfXQBk=;
        h=Date:From:To:Cc:Subject:From;
        b=gMgbI+4jlOcqKv8+45lRTZxMsKcaUWjzI49nG3AE8Wkn1gAzrYO4AUuef4l+7xkUQ
         Lyfg/BgqPWmiA4juUL4YYYTYsPLQqLmArS6+vW7j5VGlCRn+B7DdsGQ/ukGaaMEPVr
         vZcGGs/z49U947FkTTvCINNB7T+uYJ1N9Hed210vG3GXN6Y7aM/ZlBQ5RmpCTV9q2f
         abDzXZ+2+LPf19uHbGh+rX19xYbGwbXLXsYSQNqjYogO1SEaMf5O38rrA1t+UEM/pY
         8TgRsevQX2FS4A2NeZnsfwIvfV0lNxbkMVM/ubXW1uo357nHSbZ4AE4MkNkB0kG7vw
         6ZVJGawjc9w+w==
Date:   Sat, 29 Aug 2020 08:23:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the kbuild-current tree
Message-ID: <20200829082312.40923017@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gdScR2BPEPLcFK9ScRdmYba";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gdScR2BPEPLcFK9ScRdmYba
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ffaab3f87589 ("Documentation/llvm: Improve formatting of commands, variab=
les, and arguments")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/gdScR2BPEPLcFK9ScRdmYba
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9Jg9AACgkQAVBC80lX
0GxobggAkRVyR0+EmrzkHTzG/S5n6oGf/tRB58Ote7VSLq1wTDea7X77u8q7NYmh
w5uup775Oz3WI4NQfqpPTFHMBY6V0SCyCBrLYDD5EFNgL8a5DiXfskeHBVlL9WMa
yWUzmXDJWT8dCxV0M1KPXCQtrmmRAMMb5aAop+7Gb/ayDsI0TaV4S6eVjjapZOYw
lliDWcvxYeLriTi4HZZWjwxEjafHUesNPykXP0HNA/No4MlACGKa9yLT3cKWjNsT
PU6tKAaWdpLywbOjbPyT5tEz+CHCwcLyB65mrcmM1eQOzPxy5KISggrlZ71C4JiS
U8Sd+n3if+6V6QHrHtNCcYBpM9YQcw==
=246d
-----END PGP SIGNATURE-----

--Sig_/gdScR2BPEPLcFK9ScRdmYba--
