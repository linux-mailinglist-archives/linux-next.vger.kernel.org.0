Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BA0443CF6
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 07:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhKCGN6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 02:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhKCGNz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 02:13:55 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693CFC061714;
        Tue,  2 Nov 2021 23:11:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hkbxc6xJdz4xYy;
        Wed,  3 Nov 2021 17:11:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635919877;
        bh=btB45sFlkTAw4tSn9BQW2qa+73PLGtNev7OucS9Al9c=;
        h=Date:From:To:Cc:Subject:From;
        b=MNBC3OQJTpCDxMsuppJjlemFkQg1wzh4NvmvZ6QrTSseUOmb0HWR0VBwOWRr3t6/G
         P/7vq8obiU3fQiN/sMD+O3zw3OT1bKdCPRfn2Gc0QEJKcQQ+UYXo42Hy2F2yZI5vy2
         wlj9cPWlOKyMUlStLpTygBA/SmrzfGctcifuqx2NboqkSW8Z6L8RqFRg2tWJ5cItSS
         nX4oFJhDr29yZ0hNyZK+kEFlke9ad+eZWE9OmPKtHQYiWgTYsjoONjufmpimqyWVS1
         12vb7IBofh4xJZqQ49nVAQqivFn1PdACXU9AJCagXTa5hF/I0OfgXUEFf6OyQ1DFbG
         fIHPfUXa4yU1A==
Date:   Wed, 3 Nov 2021 17:11:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the v9fs tree
Message-ID: <20211103171115.1694cd05@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zafmfnNpKpvbTh4vnJMPpPa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zafmfnNpKpvbTh4vnJMPpPa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  33b741d6c4f9 ("fixup! 9p: Convert to using the netfs helper lib to do rea=
ds and caching")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/zafmfnNpKpvbTh4vnJMPpPa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGCKAMACgkQAVBC80lX
0GxXLAf8D1p1unx7FlXW599yqgtmb3AaWkJdOEYSR1WsVcwWRvWcoq124L/Hc6yp
+pXEpz7sCosvpeRiuAPLVF1n71WOQqE3NcRFKbFc1iGV1TGKpZlYBLqVNfBSA0YU
2Mz77MitTe3F4vnBf897DgoOO3xjSt3iGmNGTkGEi1fnAAMn2TGxZzpjmlN9FbvA
8ZOmf+XyE/MW7O44cxZdPabYiXjoIoMCGUmkd6fKR8W1aUu6pjx4+lXUt78zkZXJ
jleu6hJqKF/ii3y1G2ZTFdby1hGWjREbgRJ6bCSYJOqj+alh0Cwmd6ktmrXLVfeo
DTT6e3TpdNDbmyAUkeJbEJlTbwn9Fg==
=J91X
-----END PGP SIGNATURE-----

--Sig_/zafmfnNpKpvbTh4vnJMPpPa--
