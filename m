Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A532CC857
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 21:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgLBUwy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 15:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgLBUwy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 15:52:54 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5671C0613D6;
        Wed,  2 Dec 2020 12:52:13 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmWP64ThFz9sVH;
        Thu,  3 Dec 2020 07:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606942330;
        bh=sMnqek50PyrSwyyXV+CKxN0ikXYnt2ua+MBusiYwxJQ=;
        h=Date:From:To:Cc:Subject:From;
        b=pWaelN8zjhZeLewJf7h1GGiviuN2OZxLFDe+Ud70B5Nf6Sh1mqN7RQZfaUveCYfs+
         DvOtwIUij1ySkURS5ZYz3hMqeW0gQxl6qU15zERMvhiISjH8inxpeoc9tmmpVg+jDs
         ceMkhW0twMR1Zwn27koUoY1BQx6KpNIBVXjPS682hIOAbhx6+66YawUmQNVjPxPTdT
         zCbI1qFSnDLfbm0Nyi2ExK9HNCY7sVDDhZNhyr0LSNkzAcjq9fbwfl6CohxRrSJlE1
         OlInJuP9nZh34fEHGdW+WjTQyWXJcOWyiN8ByMwCOaYJhxBJO9jdbIEHLAYVaTa0VZ
         R1kW6M7HL9iQw==
Date:   Thu, 3 Dec 2020 07:52:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20201203075203.33d7aa4f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=3eHgx5zYjz5=yuNM/v8vdM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=3eHgx5zYjz5=yuNM/v8vdM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  03d99e5d63da ("nvme-fcloop: add sysfs attribute to inject command drop")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/=3eHgx5zYjz5=yuNM/v8vdM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/H/nMACgkQAVBC80lX
0GzQdwf/YwbzE9SH0P8a+EY//gIL8dl5m+cdmPH/HYZqNXRIPZg9zcG46TDvXClG
ROadA/SqSfy61fkMJ4sv1MMR+Bbiw4KpLzrZ/wODKqGZGWoojnR3b+vtp/LwS1QG
e08/B95HKlrFK823n9nsgb0jqL37wMig9PsA/nRz5tlIcVDTEQvGkdaA/lJ3hyce
+sqWlVp1eT4EGYDD7J0elOVYWjbf8G3rPoOTIH4I0rZhOiWta+0VBEHAdQg7KxAZ
yntdnvGLhSnR+GW/TR2GcmqeasxjYPyC3zjODr6OQSvU/l/1krDx6TDA4BaqNafO
Oy7lNAwga5Y92+NOpkwiWbDjx8oDeA==
=Vmes
-----END PGP SIGNATURE-----

--Sig_/=3eHgx5zYjz5=yuNM/v8vdM--
