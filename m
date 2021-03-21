Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CE13434FC
	for <lists+linux-next@lfdr.de>; Sun, 21 Mar 2021 22:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhCUVMd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Mar 2021 17:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhCUVME (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Mar 2021 17:12:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C67BC061574;
        Sun, 21 Mar 2021 14:12:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3Vgf4ZVPz9sS8;
        Mon, 22 Mar 2021 08:11:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616361119;
        bh=IDggsfFab4Wl/gat9844PqR5It+FO1yHeO9bfSdBuNA=;
        h=Date:From:To:Cc:Subject:From;
        b=AwdIM7k9PlC8rPYrtUXCX9DXlkqqGfOeXsQuz0RUsOEApbpXxcsLfFw4yGm4R5SzH
         FeCxR6uyB3lVp6h77dWsgLAN4z6wy/AM5NYax6m6Zx9Ir9wwq7ymhxZTYUp9OSCwSc
         7ZA4wa8yhNwhnVrl7GF16J928Kk93j4z4FB8Jzp9Nbfaowpm0IjfjLf2Zv7hhSkCEE
         l3Y9sH8rVpCzZ19uoVE+VbpwnS5cmoCMJlSlsklS1WEe31vVVYxlKRUXd+CuIzZ9Wn
         g6Y1L9SJQpMrWdU+cQ1p/snFzlvaq+nrQedNODgSoOoe25qNukvW51Zawm6wqtJwPY
         DQxuXQG7vd5GA==
Date:   Mon, 22 Mar 2021 08:11:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     "zhangyi (F)" <yi.zhang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ext4 tree
Message-ID: <20210322081157.3ed5c0f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sx3TxuQNGOMWjGyCZFOEATh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Sx3TxuQNGOMWjGyCZFOEATh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b7ff91fd030d ("ext4: find old entry again if failed to rename whiteout")

Fixes tag

  Fixes: 6b4b8e6b4ad ("ext4: fix bug for rename with RENAME_WHITEOUT")

has these problem(s):

  - SHA1 should be at least 12 digits long

I don't think that this is worth rebasing to fix, but it can be avoided
in the future by setting core.abbrev to 12 (or more) or (for git v2.11
or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Sx3TxuQNGOMWjGyCZFOEATh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBXtp0ACgkQAVBC80lX
0GxXrQf8DohYA2A5QOjtJrRyXdf06SIgUvNlAiaVJsjAYE19/FvN/gmGW3nr9Mqd
aDIkUPUNmtTSpRIh7GXoiAjN+EAooXRvdVV3gFSZq8ukX+DE7VEnjJbBjrg6Ktzr
eyVAknvYkir0LrwRfZd9bILtHBHf2JZ6pl9WxJ14FLf+wn/fPBxve3ZVzo3wPY6s
pcR2Xy0u7Gmp+bmfSt9+NJPBIz6MhCjrVvhV901NZyUDsfuJT3uJk+1Bz0wqQxBG
77abS7jvkwa5X/xv0/GAk7jZB0ThvohaCwh4R2tJLj6AmrRMmrTcEpLS9llIEBsE
sq0kVHUf2gY28VtlwIvKKld+hLHN3g==
=CBNN
-----END PGP SIGNATURE-----

--Sig_/Sx3TxuQNGOMWjGyCZFOEATh--
