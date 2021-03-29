Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D19D34CC12
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 11:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235806AbhC2Iz2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 04:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236589AbhC2Ix4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 04:53:56 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC167C061574;
        Mon, 29 Mar 2021 01:53:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F85wJ0VSpz9rx6;
        Mon, 29 Mar 2021 19:53:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617008032;
        bh=9FpZTIiAkO/KGWTSSQIdoqFfbj5h3r5oJRwFFZQa5no=;
        h=Date:From:To:Cc:Subject:From;
        b=oPg6t4s8hf7jnwNkkGgWauv+71ojy2Lr0iEBVzZAnxl+zkLRIL0A8yMSQVgwRrOia
         /4OGskR55mpwZR8eaSJK2OSNUN7m0RoiEBt60nu7mC2SAB+Cq6jNVf7fhUNO708I5O
         EdpSQywshkt7ObmxdlkoT5+HmtXOJCWjy/k/Al8s2n78DKkxF/QPspv2WO7lrdaLiu
         tKTEZMdngr3kRZCiIbTR2uRoOaa0+tf5OX41c55mmUY81m1w+TByl0CjTnXjjkqPNe
         V9r6mf0Y7fI2hlwIyTcYZgX8mkkG+LbfVugSAyTeSj34PwGb++q9WzRXWtneSCJjcy
         WlCz8uq7WflLQ==
Date:   Mon, 29 Mar 2021 19:53:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20210329195351.3322aee1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7+1rzaokd/d=75ydLZbYNgw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7+1rzaokd/d=75ydLZbYNgw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/of/base.c:1781: warning: Excess function parameter 'prob' descripti=
on in '__of_add_property'
drivers/of/base.c:1804: warning: Excess function parameter 'prob' descripti=
on in 'of_add_property'
drivers/of/base.c:1855: warning: Function parameter or member 'prop' not de=
scribed in 'of_remove_property'
drivers/of/base.c:1855: warning: Excess function parameter 'prob' descripti=
on in 'of_remove_property'

Introduced by commit

  3637d49e1121 ("of: base: Fix some formatting issues and provide missing d=
escriptions")

--=20
Cheers,
Stephen Rothwell

--Sig_/7+1rzaokd/d=75ydLZbYNgw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhlZ8ACgkQAVBC80lX
0GzeRwgAnMWic/qIZ6hmld7934po26vsc0QOzwY8UZto7aiDmTyx5ujmy8T+roHR
phryMNZzZyntqBMbwqxJZYowD63dXcLIfpIyWZvN6KnIjb1i0Fuct+PJgTAIZx4E
x9dxJkAWxcdiWy1Ak9ShBtYvLPKuRRCS21BNBKVxygmgkh6YQSBk8FZVQxh1Mxa3
B3t22W3x7QjGUCC/CDsiJakiqDHwnxUhAZ2N/r/ZGCqz3UACJhyU0/pW1YUvTL3R
M/4sGhTBOumyaTofWfuXUYM1OdtFr//5G6EXPAa0wEDABCsiZIi44zE3VGlIUPRR
yU9qbYrXGmwj5vTYAV6uzV5pySO7jg==
=xASS
-----END PGP SIGNATURE-----

--Sig_/7+1rzaokd/d=75ydLZbYNgw--
