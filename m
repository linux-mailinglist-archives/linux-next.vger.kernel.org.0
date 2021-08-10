Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB36D3E8605
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 00:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhHJWXS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 18:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231380AbhHJWXS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 18:23:18 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA67C061765;
        Tue, 10 Aug 2021 15:22:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GknWw5rDtz9sRN;
        Wed, 11 Aug 2021 08:22:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628634173;
        bh=RBnYQNu6CEB4pZ3BTiMeqLtPWDGvpHVH3ebei8HCDkg=;
        h=Date:From:To:Cc:Subject:From;
        b=RdgwcJElWn+FrphufTg4qT8A/jothI2GQ0FQWXLXw5YfvlvWiBQtBIdLoWY4TfNx7
         cBQObDG9TpsFa5Ee7y61WNp5fNkmCUYDlPuPBhzg8T/96ELcaxF4RUU7CNSW78NVXC
         ChZDGaawSzlRJV0NeB7zqa7YVGNHQVIkXtKrHQ6iHRivSHJudDNyb1FDMZm5vHdba6
         UMn4MvEaVtpvCnbAgF5fwfYl9HA1h8Bj6pfYezcB6jHSWGTkEpGo9UY3DFjPHPpfzk
         DSl/x9iRLtnUgJhQtrWK21FNlb+5mmwDpg1Z+5S0KjVNmBdkAkv+LUbpSV4aYZ4XDz
         0YLUWmb1vbCYw==
Date:   Wed, 11 Aug 2021 08:22:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Xie Yongji <xieyongji@bytedance.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20210811082251.24a5f9ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fDwr.+wHrjMGDu_ImiXN3JK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fDwr.+wHrjMGDu_ImiXN3JK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  155cb8a4e63c ("vhost: Fix the calculation in vhost_overflow()")

Fixes tag

  Fixes: ec33d031a14b ("vhost: detect 32 bit integer wrap around=E2=80=9C)

has these problem(s):

  - Subject has leading but no trailing quotes (actually leading ascii
    double quote, but a trailing Unicode double quote)
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

This is probably is not worth rebasing to fix.
--=20
Cheers,
Stephen Rothwell

--Sig_/fDwr.+wHrjMGDu_ImiXN3JK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmES/DwACgkQAVBC80lX
0GxvQgf9GKs6FLhDSTlMeLfpqNNU4ixPv0wFwNqD1WwxcN04lH/Nlwg+EXUdlxhp
3/sC9+TnBH9KsAmi1yXu/ITMv0kA+JppM30az3qWMyDR27DnHfCs3Hx+NHOskDoN
MoKe0D5eBNjQlcDL8LPU3VjbZJj28RI/xVfcbrtckQ33s/4E4NMXyOIWmAZuzXWk
Q3ZGySiXIz2w2+qyCZlEHK1MMKio+WfA4TIQa8v97CRRwdQtRDUUf61lnCtXn7w4
uzYChrPZmjMyU/7gVPZTggmgd2U0pvRrqubOpDiH61DRjNPeIgBUT9HpEuu7vU0C
BOR8rBKCR/tCBUkhqARY63/P3spGmg==
=DP2d
-----END PGP SIGNATURE-----

--Sig_/fDwr.+wHrjMGDu_ImiXN3JK--
