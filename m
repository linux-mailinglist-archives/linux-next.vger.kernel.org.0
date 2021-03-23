Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EF7346B99
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 23:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233769AbhCWWDR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 18:03:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233504AbhCWWCv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 18:02:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4ljJ5HdMz9sTD;
        Wed, 24 Mar 2021 09:02:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616536964;
        bh=Oa/KJdsPgcOZqeNnWZkHi6YvrCuGbwjz4me2+pP6Vsg=;
        h=Date:From:To:Cc:Subject:From;
        b=U6GiFAZ5+0R2G76Hf4sVGy4ElWvy0dDQE34yX4QSO2EXFfGT4VwRJsM9ffQoO+c/w
         1ZZ2IGQT7JTdXLK4hjM09JStauM75m7we09NR/Wmila6r7113SWWzU6I20nKJTI44l
         gPFLjxWQq57vyna3eN2gnMuffIkCFRY7wBXD8T0aVf8qBwIBO7QdlxsUNxUmmz3WXI
         ZNnMu+Kq0KE3ie8MOKuWXGO0dTUCYyTpUZD0rawrAfd4yPJec1jC6cuJiHDap26A/k
         Ii0RpwjSPhF0eSpO/TLHCA3QF5gdp6ylZvIe5X5oYD6WKZNw17S2rVrFrIArYsMZRp
         ogiqcjX5DNLiQ==
Date:   Wed, 24 Mar 2021 09:02:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: bad topic branch merged into the clk-imx tree
Message-ID: <20210324090243.6523cf32@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RR7nAqagxbxUUK_HzVgjUQv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RR7nAqagxbxUUK_HzVgjUQv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please try to avoid merging branches based on v5.12-rc1-dontuse - ask
the branch owner to rebase onto (at least) v5.12-rc2.

--=20
Cheers,
Stephen Rothwell

--Sig_/RR7nAqagxbxUUK_HzVgjUQv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBaZYMACgkQAVBC80lX
0Gy1Lwf+OM8QTFznPeUuA1Z3K7y6aJ0PVvdnHEMiC9ZS9opqg4qT84jXkWq7geEY
ROiiQh0Y0detT2AS9WUecke4RvsE1lAIA7VB1LSWp7Oq+Vp9vegNbh78kMA30fqM
5JmB7JIltbbVDdHjY181IvnbOVIpsSG/1bkDeXBioeAA/k6aEBpjfhct1jdbwxsp
YlR1XzaoNLbXvh9y2tmhKyNGMHOz1Dz5RQC+9szNSvd+PKjQ7uoBeM2i7h4Kt8s0
NnWF9L7w/ytrUNcm6AlBAF/8RzbnRLQy6MrKSTvdkWAlfkoBopv/54Xq6bicOWaB
acYOkDbqNvUpQlA3HGdI6OWxnafT0Q==
=w1z+
-----END PGP SIGNATURE-----

--Sig_/RR7nAqagxbxUUK_HzVgjUQv--
