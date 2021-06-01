Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67D1396EFB
	for <lists+linux-next@lfdr.de>; Tue,  1 Jun 2021 10:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhFAIbt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Jun 2021 04:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbhFAIbs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2021 04:31:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92484C061574;
        Tue,  1 Jun 2021 01:30:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvQMH1DHYz9sSn;
        Tue,  1 Jun 2021 18:30:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622536203;
        bh=K3FBU1+AjIwzODQMzIbSger+HfYWtlItLlr+x2MdE28=;
        h=Date:From:To:Cc:Subject:From;
        b=I+BSjSczMRgnmDst7UpWqYqqDn519l5hGa2Q5etgRO1eLprQvbJxok+A6c+/0zCgJ
         QIb119Mxne8nFeQvClepOETjNnzu37J76CV8BvnRkTNvjiqgxozOjp8rBifYA4qcat
         khBpIRnBmeQNU2N+xzB+tVHa+AAatpb15tC9afcDgaJjVdZrHsXk2uzIbjFETBAxDo
         mNE9N9qwJ45K3ZxFWwTz0NJ6Fpp6KPSIu+GDSYcyNwp3idL7S69NGjxJ+0jVuj1VC4
         2XZmgdrOyLXWVPQg9FyVskMRTw0luJExEyn8EGfIg8S+0uvvpcPZnXKXhXf3avX9tX
         fGJ6BEwFdbPvg==
Date:   Tue, 1 Jun 2021 18:30:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Rajat Jain <rajatja@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20210601183002.26176586@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vvOjpJer9Fp84cjAHRf=ysu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vvOjpJer9Fp84cjAHRf=ysu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected in=
dentation.
Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote e=
nds without a blank line; unexpected unindent.

Introduced by commit

  70f400d4d957 ("driver core: Move the "removable" attribute from USB to co=
re")

--=20
Cheers,
Stephen Rothwell

--Sig_/vvOjpJer9Fp84cjAHRf=ysu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC18AoACgkQAVBC80lX
0GwpLQgAliCVU1vxjrk/UDx780r2vE74IUxBzUmr0HthirKMAsvo+FGzFy44Cm2v
N4Q3VpnEOLrAZ+DLD6tjq8A4vquhnD3SVy25WR411wVHtULeWafSUK60AM/2ZTms
AU2xbtob/JJsGvZOm49mtfuDM+q4ldzn5hy3n3evo/yxzTsa6V32EeqXMXH7RZMy
lowBZv6UrzlWWCgNstQLHd0FVBXzGqO6JY5HODQE7rwXfVdtL9UuTps9ihm6TNus
fiBgddSrKiJ2RFKtOLi/516SthBo0tcbFXFjBqSgkvAFk865RFVpDPW7bLJ6xzfg
3fGy4Zq6MW31tJCYTW/ps3gns4X50g==
=l5FH
-----END PGP SIGNATURE-----

--Sig_/vvOjpJer9Fp84cjAHRf=ysu--
