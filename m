Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D611D039F
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 02:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgEMAaj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 20:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728313AbgEMAai (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2020 20:30:38 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB74C061A0C;
        Tue, 12 May 2020 17:30:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49MFvH3Y6yz9sSF;
        Wed, 13 May 2020 10:30:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589329837;
        bh=xyBXaReo38HKhKDXoOOGZ6HWaVAnBSJC1GZgIaG3nIk=;
        h=Date:From:To:Cc:Subject:From;
        b=Zrlqo02w7WjZzdlh8WCnmF7JIFsPWtdHuS7toau6D0kYOxOKbPPLderD9At5A2z79
         moGZnIjxTmtWXa9NhZuaWoRoXPiJq9AXAKAcDfISY0kHczAJTKB/iSdbIg5t7Pyihu
         GTGfk/QTzdKD1gBLd2A8latJnXXgJ/P7zNSunikyhEWpvZWxJh+u7uYl4XZXL1mzly
         1+t9vU1kjgVKljpdpV2fKMtlJ+vpvzqkjcALU91hozIk2DUDR16Vd3VMrmzb7s0Egk
         ReUWY4H7aHCcZejS7Ki7gDHVlFiqmKM8AdRy7tb/nQ+UwLQ20D0/MaC0FzC7UmzhPm
         yPNhpFf1W0WiQ==
Date:   Wed, 13 May 2020 10:30:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Corey Minyard <cminyard@mvista.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: linux-next: Signed-off-by missing for commit in the ipmi tree
Message-ID: <20200513103034.4de3c630@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XBt90n+5nvkCRgE12Hjv8S7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XBt90n+5nvkCRgE12Hjv8S7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  73d0824e48eb ("char: ipmi: convert to use i2c_new_client_device()")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/XBt90n+5nvkCRgE12Hjv8S7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl67P6oACgkQAVBC80lX
0GyeHAf+Jby9ZCJVMSaHJazTCvbNpiQZBZqdMKlrc8vnjAqkoSnUdmeQKCEfDn60
CNfVr0x5XSateSx24j1JhCWN+tZNu/wkDD0RxYGhjzoObiJjGYeXfh6BCJZFnsSR
eQrKP6wsLceFhqHZvcPjcOWY9d4P4NxcsO0J5o4JJcq4nKuJIlq6mruFh94ij6Ms
l2cyUIpwAqkcz1P7kfzZZcZjg9A0ZLkZxbTeCJCojS9D8DahedcAYR2QCC0+g/jy
wUUE+Z+Nq2WlLKRFe0uRQodC1o1MaVAWQWqGafBvG2Wpe/uLXGTQk7/Gh/ZtmaAv
wTfzt9v855gD8tM5OBYSCKXw7QVQCg==
=k95z
-----END PGP SIGNATURE-----

--Sig_/XBt90n+5nvkCRgE12Hjv8S7--
