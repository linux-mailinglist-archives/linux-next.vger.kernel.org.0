Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DE4374B33
	for <lists+linux-next@lfdr.de>; Thu,  6 May 2021 00:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhEEWYo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 May 2021 18:24:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41073 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230135AbhEEWYn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 May 2021 18:24:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FbB7h56Klz9sPf;
        Thu,  6 May 2021 08:23:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620253425;
        bh=6AqeAEh9ZG24y38rZoAWtPUoG2d4G9AvEF8n72KHRmg=;
        h=Date:From:To:Cc:Subject:From;
        b=W4BC2fHSiP8zWrE8zs+3j+Hyuh0j4AIMq/JIEFPGzIpQ7FQakprV3CmpHYgHOm53f
         KNF9AuE6ljS4kD4u6ehvq22n7gqJxAbMeqGpU5WcfUqgOHO3dDNyjfXmZJBoFYR2fr
         7VS4aZVtajnfxXCRp6ES0dtLsZjKGyNaDLHNKR5mPXw64NkwSFWAFmTXUenK7Oed9o
         J0+HKBua+KaeT7aa9EWqn3BPLvTrkg5kX8ZZWGO5G+mpnEazmBuYcLGIqXSDCZEBoM
         jDltoxt6fJl7ohN2mr4vwqmDI7ILAiXwviuZ33KwcU142ZfSiWzGTvL2Dt62zodIDd
         k1aMvUGT5BALg==
Date:   Thu, 6 May 2021 08:23:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Minwoo Im <minwoo.im.dev@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210506082344.4f7af4af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/09IANTl.EOeQwaSNx5qMouS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/09IANTl.EOeQwaSNx5qMouS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  48145b62563a ("nvme: fix controller ioctl through ns_head")

Fixes tag

  Fixes: 3557a4409701 ("nvme: don't bother to look up a namespace for

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/09IANTl.EOeQwaSNx5qMouS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCTGvAACgkQAVBC80lX
0GxKHAf+IhrBo92bIt4LaE5JR2nVfBErfuNHbZFA/0NeHkXn6AFOLN0K8sKxk4Zx
8n8bnSN/4vWumYpj+lUTGsoTS4Ua2SLtraBizR2u36njmAPXdbNbjMSQ9dzRn1c7
uzSluWSn7tnYjpFtK6OPRuizgylQHt4tAKB2lfIXEjmRVR8svPDQZcDRAUcBQsTm
3GUCL80ohLRnv2zUraKlurWx07XAVeX66DKfISL3Zch9kwbouWREnYGXGTZkbmlt
8lyFdVrcu94JYF83ptu9be5zR8h6tJWp4UATG8sSeUQ5OgsLRfA90l/c+QOHRpY6
lDJQ4Ko2OpBbVqyqGYYMyfdZuhea5g==
=4fpt
-----END PGP SIGNATURE-----

--Sig_/09IANTl.EOeQwaSNx5qMouS--
