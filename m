Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89523349CB
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 22:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhCJVY2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 16:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbhCJVYB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Mar 2021 16:24:01 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E718CC061574;
        Wed, 10 Mar 2021 13:23:58 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DwlSW1pPXz9sVw;
        Thu, 11 Mar 2021 08:23:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615411435;
        bh=hyy07TdsQZqq+6ZbszW2WD5wRcvxFeHpA3xz8f60kuo=;
        h=Date:From:To:Cc:Subject:From;
        b=FjDy3Zpfjs0FgrWMhNCmXYFbkYEFu0ey0yy5cZeEzp22IMmP4avQYmUXxPBNQOzSf
         mq4Y40kSueU+gvRBmbFQH2knOm3FozPbAmhh8BFYjsDF0OlKlSrI7VszpKnTEISPVR
         XONnbqwmTbktLb/81AExGp/0n/KDHJw5vNGq1BL37E2rA/qJHROTB+z1tRxeRsNmBG
         NNCF2Gs2LRh42inHbt/YT2iHlUY/qFoGeW1MQ+BTldiyJ5/+kZ6AtUTE2mg+/Kw676
         upsxl9m5WRuc+Mv5W0FRCDjGy1Q8pmyGe1om1mYWzo2YtQmgtcbrb06Tyrfw71dTm9
         W7Yx1fZqj5WgA==
Date:   Thu, 11 Mar 2021 08:23:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Xen Devel <Xen-devel@lists.xensource.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the xen-tip tree
Message-ID: <20210311082354.0f149e1c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fML9M7KD_SWHiQ1yTH0NtvG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fML9M7KD_SWHiQ1yTH0NtvG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1103e2826a9f ("xen/events: don't unmask an event channel when an eoi is p=
ending")

Fixes tag

  Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framew=
ork")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/fML9M7KD_SWHiQ1yTH0NtvG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBJOOoACgkQAVBC80lX
0GxsGgf/bklAmv7OF8puwVjmyBLICRBDo/j0zy3NFRUgHASx4IEO+HS5nJwr6R5D
Zq+h13nNyf6kPgxdsas9o8sV8tDLAGtRrq6jq05KXd4ZOTvTyISEBhdmqEbZgUrI
IoQB1czSn7Lq5bc3Wg8mA6zRkLu4Ce6mXWvxdy1PDIFUW6e5NLB2V349//+kIj6P
RUmXHKkGWe+YzWHW1nE2sP2HiNwLVXlBUCDr2W2pFcVY7dyPj5QruesTZACPVY6X
FIW64pmgYFz3nwLmMbuJe31OAUk2N5ddQ/z1C6yBKRLIca0IDdIuoBVHRFYg6DZN
kqXVn8cm+Yn7s8KZ22ACGRjk+tAD/g==
=bbos
-----END PGP SIGNATURE-----

--Sig_/fML9M7KD_SWHiQ1yTH0NtvG--
