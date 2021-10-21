Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEB9435C5E
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 09:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhJUHty (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 03:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhJUHtx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 03:49:53 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7639C06161C;
        Thu, 21 Oct 2021 00:47:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZfhm0d1nz4xbT;
        Thu, 21 Oct 2021 18:47:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634802456;
        bh=nj+ACbbT1LJ427sB6DX+UKXrW2C0LTUz/vde4pj0udU=;
        h=Date:From:To:Cc:Subject:From;
        b=CivcbtTmSK93Ziz8nUykxeWwubU6cElyaxcMD3rY84dub2JlfQGtVggwiVDAKJXTe
         oD1lideO2ZyGCIwJX5npVRTG0yRlQuCdgtEj2r9SrlBX0odhDrDa0/JS2m9SqDnrfX
         /T/uPhyHwDzJ/6tDC7MC3GtR7hSM0WV5XjYjROLUcWZPlHAccUEhWZ5QN4Hs1Ph02/
         cXADoAdV7gDB36lk4BPCeQ7JgmuUWsVmlCpgIvoQShIN/zVLBq8XJUf+hiHFeoQv2k
         8nGdX/Sa78EJjy0aTE9jzjV87BWiek77dC0CwNnrNr61VwkHe53pFY9QNTpzHxYLUl
         vhAVmcimTpdNw==
Date:   Thu, 21 Oct 2021 18:47:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drivers-x86 tree
Message-ID: <20211021184735.794b22a7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EOZ.hFPGv0HaPvO7O=ETNjg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EOZ.hFPGv0HaPvO7O=ETNjg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Unexpected in=
dentation.
Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Block quote e=
nds without a blank line; unexpected unindent.

Introduced by commit

  527cd54d49dd ("Documentation/ABI: Add new attributes for mlxreg-io sysfs =
interfaces")

--=20
Cheers,
Stephen Rothwell

--Sig_/EOZ.hFPGv0HaPvO7O=ETNjg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFxGxcACgkQAVBC80lX
0GyaoQgAoYWD86s7TRVpdRBcZdNzKkzWJLkhigSRq5twb5KCX2HsDzdImv8YXLpX
FTHNtDOPYea0bUV1oJIHAsumVPI3t+soI2wp2GTz9ZQ3DuF5e0hc5lhw8nZS7Dx8
3BYnhUtoq7em13njUaKwdkVq6h2r6JFVAZOxOiZA4iFMbnwq4ICDhwqK0HZlagbp
Q7Md/wukyVxF+mY3SR8xeAdgumlHcKgk/b/ZfUeJrXybuZ50zCP+OZGep0wUaZ4r
0XhxjNYhwOd9jCl6hkWjB8yKENbFydMIqhe6/DZNams0wYun6pSn7yoPX6vOn8Yz
Tqgx2By0GsfucxFi/WbeKSDjwG3PrQ==
=8N7m
-----END PGP SIGNATURE-----

--Sig_/EOZ.hFPGv0HaPvO7O=ETNjg--
