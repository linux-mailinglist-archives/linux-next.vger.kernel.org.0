Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE99206D88
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 09:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389661AbgFXHXd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 03:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389748AbgFXHXa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 03:23:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1742AC061573;
        Wed, 24 Jun 2020 00:23:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49sF4J2x6hz9sQt;
        Wed, 24 Jun 2020 17:23:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592983408;
        bh=vYlm9bUberKGeS5FHiBGn/ijfDTjheo3Sv1jYaFA1j4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GTdY+26CCjt20q6J20pfaYfzrW9mXZuGVMOxPFJAvu14Vtrd8W+M5sUGgPNCt06ZM
         dh4YsAopp4v21xuzxKQQvyZ5aEidgJs4XRTOIU70NS6rqIq6IA2d6ieQ9xBvXg36VG
         ZQ7iuOC3pLf0qBCa/n0Xp1fCIqFBQsIGE7xK1b2/Lzm73mMptXa+oeW2t+ZmMCJaE/
         l/rHbEhn0RW5Lr6dW1V3uY/TRHvYyn7YYCAKgsgrTOTi0wdmIyI8zsWaC1zT+/amGA
         szoJ88diuN8B2pKdskyZmrrUEJAkb1vCfSUrGuFV5Gws86IpmEPu8JdXn5aaiQxckx
         H2p6KxGiPIAZQ==
Date:   Wed, 24 Jun 2020 17:23:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     SeongJae Park <sjpark@amazon.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-fixes tree
Message-ID: <20200624172326.43723eca@canb.auug.org.au>
In-Reply-To: <20200624071447.19529-1-sjpark@amazon.com>
References: <20200624170742.4e9e9c96@canb.auug.org.au>
        <20200624071447.19529-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r3ma.Ks12w9qo/NK48UlZeq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r3ma.Ks12w9qo/NK48UlZeq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi SeongJae,

On Wed, 24 Jun 2020 09:14:47 +0200 SeongJae Park <sjpark@amazon.com> wrote:
>
> Oops, sorry for the mistake.  I will send the fixed version in reply to t=
his.

Unless Martin says otherwise, I am not sure it is worth fixing.  Just
remember for next time.

--=20
Cheers,
Stephen Rothwell

--Sig_/r3ma.Ks12w9qo/NK48UlZeq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7y/24ACgkQAVBC80lX
0GwsXwf+LF4HisbD5RKi5kKqR5j0GActj79hJrpgmBHvJn8oizLLApHOHJVRqZNz
B2FPCoYpeW0V+ZvDuzbGcAKvlOem1t4LjQ0bHSe4mRqxGp2zwb8rkEhbI5FdUNm8
RPc4E4oXwYToeIr7mxbL1CvbXzNLwg5j4COustNqglNCZrwabocyAO6Tt4aRTQq3
IkHGqfRzcEwh0R3q/kUtRfUrJVJCsvuEECdaJFiuvilm5FfV0ewa2hexxP+G1e5l
ziQtZrUSPC/R6MgpC//E/iXrnOJaGZp87DabFgpngYHSU/Jwux8nPfOrWi6GNJdO
tmQmkIOUsVJvpUdgxUm1hOlcEVGEdg==
=MMzA
-----END PGP SIGNATURE-----

--Sig_/r3ma.Ks12w9qo/NK48UlZeq--
