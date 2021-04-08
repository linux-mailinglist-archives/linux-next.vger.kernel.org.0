Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900DC358F91
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 00:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhDHWBK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 18:01:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58221 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232158AbhDHWBK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Apr 2021 18:01:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGZvr2TtVz9sRf;
        Fri,  9 Apr 2021 08:00:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617919257;
        bh=EtYgTBFn6oyfFMVZx45lg6/+BpeGzMT1feBky1SqNKI=;
        h=Date:From:To:Cc:Subject:From;
        b=aTEpUnuNexg9e7j0npNbZXXW5HoEniqFF8IM1EgOSc3dHz68Dd3NTIs6GDHqcntCU
         6WxUqOcv37a0J/qLw4P+rQmMbfc+KFUAJjV0iILtlyrbRnXNHBfaIbDySlShqb4fyN
         qiGViNcALTZ2muJWco8lHjVwOclBiJal+Zes1p3UiccHMGRkjca0gMEjyZSNtWSkX3
         pi7fVzEJnG1TLYAxPEyzvq4l4R/2Z8Ulo3OkrEhPlFHn3G+a/i02vPoBv4N43NOdGI
         KYalrcB6NA20zfzv6yh1MX06Q41Pu5O6EZg+clOW9B3MPLjbpUDCMqHAoowHaPRt0h
         w/nFx4khglBgg==
Date:   Fri, 9 Apr 2021 08:00:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
        Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rdma tree
Message-ID: <20210409080055.421f0dee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b7u5QSKny2/3lgjmqbFNbC=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b7u5QSKny2/3lgjmqbFNbC=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  042a00f93aad ("IB/{ipoib,hfi1}: Add a timeout handler for rdma_netdev")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/b7u5QSKny2/3lgjmqbFNbC=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBvfRcACgkQAVBC80lX
0GzEowf9G+KK1iYJJN16asbvV0hLVhE1T1zbPt+L13tOxvpFxE5Q25ZFarAr4ulZ
FRxKsOt9IdjToumHIXImsG4E1hss3tcQsV4cmlqobSJhrnhMdudHX0gVaF5e9q2/
Zi4P8iLrN/ERJkdiiDN0pnpChllLvtkGOARz1kenl4ZdawOyctyGm5aDK4OMMcb2
EBN3iyszPMyJKvrutSxtq4MgSGatLjoleUgr/uXZk0/DLchy6gO6tl+i0JzZyfu0
y6ii2WTAvri3WBb36f8M+rlDGtgT96m8y1c+HLmuVoP1R6VHtqkotRu+wELRVvQ6
GCJNBD3DdTtPJa/nw6T8PwRUfLSqQg==
=sksM
-----END PGP SIGNATURE-----

--Sig_/b7u5QSKny2/3lgjmqbFNbC=--
