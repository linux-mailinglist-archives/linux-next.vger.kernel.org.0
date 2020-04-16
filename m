Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB281AD2DB
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 00:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgDPWdc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 18:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgDPWdb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2020 18:33:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D404C061A0C;
        Thu, 16 Apr 2020 15:33:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 493DX94rCCz9sSG;
        Fri, 17 Apr 2020 08:33:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587076409;
        bh=AsnxfBUeAaPUcsV2eF9qjr/AjDQf6c/4w/iWaBENYnY=;
        h=Date:From:To:Cc:Subject:From;
        b=jwfoIGhTbGy12naiCgeA9N2ihtIgrc0dblCoYHt/sXxyQd89I1XQKXYhgEhDgg0c6
         ZMjsAaMkXt6A5g6Dw/KPNA6palzMfUQFFS1uJvz0GTxOYIJYCWfwTkQBql7Cyk9Lcw
         xv0B9fVfyVDWZHVuTzIo4e2OzQ+MIMY6xEfzf08vLcBNuEc0z4AaR7ziUej/pX/5yY
         hpo7wKy8lyorqDmTgvqsg3FuEZ3vet4Qy17zo1kBBEgrQBDg1WseTQ7Zm0fVoRO98K
         X21rbBKwewkTblwzc4FbPTtfHfZ9WPQIZtWQV5GF3t3i+9skuIZmur+DleZLlF9bGt
         Og4nDmlmH6amg==
Date:   Fri, 17 Apr 2020 08:33:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the coresight tree
Message-ID: <20200417083328.7968ae29@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/18Z9DBVsV3x0nMmtLx2kZFq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/18Z9DBVsV3x0nMmtLx2kZFq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  25a0b4731117 ("coresight: Fix support for sparsely populated ports")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/18Z9DBVsV3x0nMmtLx2kZFq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Y3TgACgkQAVBC80lX
0GzhJAf/cdHUxxq+MLobfkf7tpmxWj9WCh4uHKyAX/K0n8HuhWXYraFH/eWxS3TH
0QZkG7tswL4FS04SDYQNoBGT2ib0NvEFUTLprXdAwqJUuMXEwRe42HkRlcckEadq
IXv7SysgdS12aCvF85P5O+rYdmQLxR/wId3O1vvWwLsslpr5xasV2pCsKuBrf7PT
tAYwxZEpVoqMi68mt3ykQDINw/PQe32UDMsrVHfyeBAZqn/UQeYwsagBcvaUhC0w
/gxiqQPF7yB+ecOe3VXbKvlO7MQjw5mHJnZdnn5YV93XanlDx2JcNmfQXcWkK+KP
HYwbDNSwYqncgPS5EZnxT8dqbNdrTg==
=t2hH
-----END PGP SIGNATURE-----

--Sig_/18Z9DBVsV3x0nMmtLx2kZFq--
