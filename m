Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7568E72D9EF
	for <lists+linux-next@lfdr.de>; Tue, 13 Jun 2023 08:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233951AbjFMGbT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jun 2023 02:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjFMGbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jun 2023 02:31:18 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACB6E57;
        Mon, 12 Jun 2023 23:31:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QgJbm2xXGz4x42;
        Tue, 13 Jun 2023 16:31:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1686637876;
        bh=ToIi1LuD1Jp5GJyR5v1hxq0dOYGQXdGFMO6v88mLpSk=;
        h=Date:From:To:Cc:Subject:From;
        b=NsFXFnSW0PCTXa2eI58IzNP1zzXQ3w9Eyi3qFYARMK/Ll7JuqNuB4Adf9a5e7BaE+
         7q0AWFd/QZZaQoVbGyFARn7D0ukb4ay2oVAw5zIM6JiUy0YNhacvS/Il6x+WzmdhCi
         XFdEMPZB4itfHdgPaq6/g62CS3493CPxqICOtGw0NtG6FM6j4AZIlO/6qFKw3WNhR7
         5zkDgLIkIU3JmM8+bAS1skXKRBNcK6JlIVqUTnf22pvzFF60WPddXddvYjQ2zyf6XQ
         MEmLHT26pVeC3Dy39mCZ3CDFHfdQROc1TLJwXWJXvuC+YokiyzfqjnWf3LPtzGwD/u
         K0mWaueigSwzQ==
Date:   Tue, 13 Jun 2023 16:31:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Saeed Mahameed <saeedm@nvidia.com>, Shay Drory <shayd@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the net-next tree
Message-ID: <20230613163114.1ad2f38d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WVLs8HJj.wkl2uCIUd8yqtG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WVLs8HJj.wkl2uCIUd8yqtG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rs=
t:57: ERROR: Unexpected indentation.
Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rs=
t:61: ERROR: Unexpected indentation.

Introduced by commit

  e71383fb9cd1 ("net/mlx5: Light probe local SFs")

--=20
Cheers,
Stephen Rothwell

--Sig_/WVLs8HJj.wkl2uCIUd8yqtG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSIDTIACgkQAVBC80lX
0Gz6rggAlE5vpU2hts48/fua/TqwrDN5dC5ne+xXdE+g1WYmbdsfys3W2AGC6Dcc
rf33XS+xBZIqC4yNcAI6ftPkDAw1eTt1yRzG9fjgGIIXoH5ysnx1RJFvz+zEYLpp
dnEacC6FZUrRVaHE96zEPEu4kvVgT3rxWZvSDr/C9ZZPIX74hzq0ikVjkrVRpOkc
CnAAZ4TiFXgwNICT12tkZj1cxZkWTv4/xmgAp2oMgzfRyZYY3JWNe1VfkYiGXwHt
kzaWkV7eHC2xFwXR5Hmt9bOaEqFIz9ZieeFreehyuNF2i4Geaf8WGcsnCD+IhKTw
BmH9EiAl3N8/lD9CKwoZxVtdl7mrqA==
=8m5+
-----END PGP SIGNATURE-----

--Sig_/WVLs8HJj.wkl2uCIUd8yqtG--
