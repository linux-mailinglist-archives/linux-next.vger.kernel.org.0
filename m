Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C7C1865D7
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 08:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbgCPHpn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 03:45:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57261 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729582AbgCPHpn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 03:45:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48gpJ45DM5z9sPJ;
        Mon, 16 Mar 2020 18:45:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584344740;
        bh=cBV1Ueb6fOuj4tcdK1V03+d6DIFrighm5HZQCK0tZxM=;
        h=Date:From:To:Cc:Subject:From;
        b=mjp71bUoszkXPxx6gq5RvJYiame0/rUb08CowSSUidwPqNlGzzmW7x9mraF1EXBMN
         eWTaiWCHQx2XsfR9b7N3BcmFLmFgI15kEQDQr5o29qCN1ImE/ycnN36YaxbPfZZeZ2
         cRZbtLbY26hgRn58J5f6p5pVXySlcVgvY+571ddIr8RZ7pJb9B7+iRhEe/7Rh+5KSY
         bjmaIacJjpDjgXjUScypLIhezN9NCDsc3oRNrjAyt/KVOdT5dSjFfoocxIbUh7t4QW
         zQaVsDGSPqZpAd1lTIlihuxBNTXRCOokaYuYdsJzh2fvdxh19WRM072u+NJsFZAquS
         /js2ttUryWmVA==
Date:   Mon, 16 Mar 2020 18:45:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb tree
Message-ID: <20200316184540.30b35707@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CO1P+oL0eESydM.6/2QY5v7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CO1P+oL0eESydM.6/2QY5v7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6fafbbe8d414 ("device property: Export fwnode_get_name()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/CO1P+oL0eESydM.6/2QY5v7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5vLqQACgkQAVBC80lX
0Gw8YQf/eOyBHqOyhgJIkjlHs/X4VpiG4Fhikou8MwZaLZwVFWFBBDf3MiozYcLh
FJ2epJx7wp6jvZ0BCOmvFd1rY4Jfx3A622WVgJasb3/1kJ2HvG1YIG3V6Wt6wgiZ
lcMmguIqoHCXU3dIoXIPsrt7YY5VWpjVZTgiCCzky6U3rcU4R+aQRUeKGSshDwyH
EDxnc8Ft54cxr3YOiHxqVDVBMCqGJ13y9+fZcC7GQPZfMvu0I0ILI4qOYhEQtQa8
zQEEuWtWpu1HTVNV3O1jjA+djodb2pdEzKBY3951F9Hsy5ISxA6AL9Ct4DvGsO0/
16H+nowpB0ZLwubAXFF6ggRP3H0ASA==
=uDnD
-----END PGP SIGNATURE-----

--Sig_/CO1P+oL0eESydM.6/2QY5v7--
