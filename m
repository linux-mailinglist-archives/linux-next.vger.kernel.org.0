Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595393BC3D2
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 00:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhGEWOf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jul 2021 18:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhGEWOf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jul 2021 18:14:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B28C061574;
        Mon,  5 Jul 2021 15:11:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GJfzs5fNgz9sX2;
        Tue,  6 Jul 2021 08:11:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625523113;
        bh=+HIz7kAkeBBlbJAAvOh1XOxHZfGVFT/S7ixaydXum9o=;
        h=Date:From:To:Cc:Subject:From;
        b=iWUt8GHB8Qw1X/CzNOiN3+ca1N12Xnsa/RaouSe2XUD/Dzx5Fv/8kV8CD5lHyksdx
         m1aKTeTp6UmC0Xa4PUNkdwj9USKfsQfI2jYCd3tdZa4iubNyFbmsbwliW+AkB1Mfob
         0bJxw6Vmam9hOWd8rGk7iTEzzWdtS3NRKSCj/oQtM7uxRZzSdLNnboYQgYk+NWMwVR
         cElEAxKgp7k5f853si47H5AMrOgzq/Oh2q0/+U9bDqbk5meoJF9Mes15GRECyTa9EO
         UUmcr2PPtqG/7aX08OaEoMDVGwUysqaHQHbcAHNJNL+WMIEBKPSl36PorToDS+SBT0
         dUMf/x7EFYjeg==
Date:   Tue, 6 Jul 2021 08:11:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ext4 tree
Message-ID: <20210706081152.59e83193@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p/u8j8QE4UVcG=4Izc8VVCB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/p/u8j8QE4UVcG=4Izc8VVCB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8813587a996e ("Revert "ext4: consolidate checks for resize of bigalloc in=
to ext4_resize_begin"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well ...

--=20
Cheers,
Stephen Rothwell

--Sig_/p/u8j8QE4UVcG=4Izc8VVCB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDjg6kACgkQAVBC80lX
0Gyb4gf+JYcldcndwIstGhV4AxU9HtvfTX0JrzZro1a3AqCSuCFe9k8qnWGavFoM
3C8aFbfkA51Ga6QPaYkblGfJqQLj0QDyOy1scEv28UTN7uv3fUM5Z/j8IXUfqodQ
3rUfZjrnrClwjfWZER4W2rzqdLjLYh9SR/J+xwuDFngepTTqqFcvimTKBXYwfJDo
psd7o2Wq8q22Qpdt3x50NLYQ564KzKQeJuA00G8X8o3OSNKDHO9ZCVf+Zyy4ZFlK
BY3qntNYADb4NSzHSh/20H9cYHABra5gcXPciwbaT+goc6jkcns7/tWJIVBIRTiK
xN/Yxf4oITTOk8PD0Wg6Ea7uCVBgDQ==
=Hbz9
-----END PGP SIGNATURE-----

--Sig_/p/u8j8QE4UVcG=4Izc8VVCB--
