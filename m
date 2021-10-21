Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26572436D7C
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 00:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhJUWeG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 18:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhJUWeF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 18:34:05 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A68C061764;
        Thu, 21 Oct 2021 15:31:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hb2Jy5ZKjz4xbc;
        Fri, 22 Oct 2021 09:31:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634855507;
        bh=EepCvZgnjGPCwCn1ND0kjJne8Qbdj73IIP4oEHCEHX8=;
        h=Date:From:To:Cc:Subject:From;
        b=p+3eRmrrJt8A6UzkbU9fI5ub+e8UEq3VXKNScLe7wI08+hiCZA/qc7TngG0mh9o2d
         thGjuWBBarBit7mgtNAWYH4W04HRp1LjO8pQyO2CmyhEHe+mbGt06EootDmSmWhMpU
         TAwt+rguHKOdf+IGzFz80aTB635Plmw/vZQIeVAQgJjqWsROpL6DRwjK6cd0uDAq8Z
         EY+rsZdeSLHq3kHdupeA6iXvZmcCRwGrTABqhDY0QkRI9o9cBnPdQsuPX/RQkSeEnh
         JHx8qYo1pqYE2dgKHEH8JuNwz5VfxEwW7EfpK0JVRSgT9YoUc0zUtmyUTIAe4iztHO
         BRcPJGkkcTC6A==
Date:   Fri, 22 Oct 2021 09:31:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Daeho Jeong <daehojeong@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the f2fs tree
Message-ID: <20211022093145.3b816875@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5cgxp1CwNUmaYHEGZTTTq=d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5cgxp1CwNUmaYHEGZTTTq=d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  701179c15976 ("f2fs: include non-compressed blocks in compr_written_block=
")

Fixes tag

  Fixes: commit 5ac443e26a09 ("f2fs: add sysfs nodes to get runtime compres=
sion stat")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/5cgxp1CwNUmaYHEGZTTTq=d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFx6lEACgkQAVBC80lX
0Gy/2Af8CLXMukC7zsj0tLVtytWXk/CXdUcXSZUZsN5TDyjs/8nvw3QVRCj+Eejw
8IZcNv2SeBabj6LlXoWjxiLNF0gZquArgW7Ic6ZQHclwgaI6/7MaSJESFhZo6U5v
kD+A7BTqQcPFmB9EOpJl1HAVmlR4xgmKGW5Tr/lDRFJNPqAD0bldCF0l4MguoG6v
oZV/r7kk1f+a55srPmV/1fHGoZIg7L/d06uMShiLovVp/yJ0SI93EvB9f9vIFbYL
P/0QIgplsTLzzn1XGbbRds3uT0CaWJ8kwOXypXLLurOgMnOu7i5R9GJ3CnuyeOsr
TDr+tgiRF+BHwb6YdJNNRPoQJAKYgw==
=ogYg
-----END PGP SIGNATURE-----

--Sig_/5cgxp1CwNUmaYHEGZTTTq=d--
