Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DA12CD07F
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 08:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgLCHnE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 02:43:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgLCHnE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 02:43:04 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A3AC061A4D;
        Wed,  2 Dec 2020 23:42:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmnqJ5K8Bz9sT5;
        Thu,  3 Dec 2020 18:42:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606981342;
        bh=BmUPj1+WphjfxR1eTNgF6Us3p8eHfCdtFXEzVY9c4zM=;
        h=Date:From:To:Cc:Subject:From;
        b=nxQhg29Gol9Z+ub+fs0KpsMhMG40IBX+snX10avFIJMLV99l2U9VzMhCXyOhnzFkf
         VU7D7KNmXSHi0sFIgfIfUxIV4C9bYmMcvYpEbxCxMhxAZQ4W89Snx1qE6Idgt4urqL
         MOxFHPSmykyMSg7WjOkVN/JCmJzMVUXslpa7x4XUg3vH5PQlbKzwpdm/dleudPRG44
         z7dNgSlwu1Qeql5KdPOpokM8QaPfPeVnpNDdNxxuFbs3NJoLICLWJBeebhw+2mVAwd
         6Iv7d9oLTllwtFZWN2ARMXixwL4rQ+B9CjeSTJPwrVniWN0SUf7YKAqbE8A/OU4ZF2
         MPUosBxD5UnKA==
Date:   Thu, 3 Dec 2020 18:42:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Leon Romanovsky <leonro@mellanox.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rdma tree
Message-ID: <20201203184219.285df51f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5oYMWnAjVLjCH_B9oCL6o83";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5oYMWnAjVLjCH_B9oCL6o83
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (htmldocs) produced
this warning:

drivers/infiniband/core/verbs.c:1206: warning: Function parameter or member=
 'caller' not described in 'ib_create_named_qp'

Introduced by commit

  66f57b871efc ("RDMA/restrack: Support all QP types")

--=20
Cheers,
Stephen Rothwell

--Sig_/5oYMWnAjVLjCH_B9oCL6o83
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/IltsACgkQAVBC80lX
0GyOkAf+MmbxqSl+TOjBbASY6DsfkWz/JSnz7X7Wk3Y4IXgMnJ0W/Mz7e5ezqbEk
EdVxHD5DoKt+/iOHbN0IbE88zQZB5kf5YvUeZaBaoRalmSbjJtBGKKi4+pqDjkBa
OpO0DCCHT4y/iOeBPxeikXbHgw4aVOucpCE4AtAl7SOc6SRpZN+tT035IJcizfz7
4bBit7OHa20eXAzsrq47FgCNmfMJhDZQRT8fBovA7kvmty98YAoZhj09TcjBFVtI
BJOkKYSLcg/I5mABH3W/fCuXaqvOS3myWQLxslK8JCKw6bXcK416bIYnW+5eFHiC
9R1VLOj4TKvIOnd0c3jbuABQwL+crA==
=8uaX
-----END PGP SIGNATURE-----

--Sig_/5oYMWnAjVLjCH_B9oCL6o83--
