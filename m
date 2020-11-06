Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8AF2A8F72
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 07:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgKFG0U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 01:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgKFG0U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 01:26:20 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3AFC0613CF;
        Thu,  5 Nov 2020 22:26:19 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CS9Q12Zy2z9sRK;
        Fri,  6 Nov 2020 17:26:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604643977;
        bh=8h4shHUMU2Yp8NBxybv83X6J7G0LdA9jJZvFEL1tanM=;
        h=Date:From:To:Cc:Subject:From;
        b=HYsNbr+dhni6jacainBswiYGpW8Rm9CleugCltF4XepIBZDo/tFBHLtSG1EHivBk3
         WMUzYguwVFiQl5ttT4ABMN7YumLQYijDz8k5Yk0EzITWKhiT90sMkP0IkRWIHe58zM
         Jd6BpawcLVZXVJe9IPAabYhTuEwv4hCJna6+Rj0zhGziBULZl25T6y8Ou6uLj641fU
         a5cZrGdqIvrhAgdWPj1ig0MxIFG6FTcCv/MqD31T5OEY5TirY7cUaSxpwwdRD7Bcvf
         3Lv3rJQo1TpPSzj5rF4Fn7fdFr+RguXgfV2NLFpLY5APDpe9anN7cBHSfkct97vkJl
         ddOrm25qz1CHw==
Date:   Fri, 6 Nov 2020 17:26:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20201106172616.4a27b3b3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f4E28sS5IoLWgM+V9tk1+bn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/f4E28sS5IoLWgM+V9tk1+bn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/kfence.h:138: warning: Function parameter or member 'addr' no=
t described in 'kfence_object_start'

Introduced by patch

  mm: add Kernel Electric-Fence infrastructure

--=20
Cheers,
Stephen Rothwell

--Sig_/f4E28sS5IoLWgM+V9tk1+bn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+k7IgACgkQAVBC80lX
0GwSjwf+Pz2gmhx4kh0a5dkY2U32WJByJAz7vv5livdncJXkOCN4xL+g9SHp7U9p
mJT6LIyFrHHq+48a/yCU0WnH9vetZY5x/mzuAQoVg9EbsjpWYorWaj/dr+YPhh3f
BSmbkA9oDPhfEPEOU2+hLqHs0Huu+EYJGKC/ScPHrwPrGAIdQ8Uih+7z7UsPfAwI
+Z24mmXXmbNv9jZSZhFnnEM1v95CjgfGqFLna2xLV4fGxPIEDEmduHIxT4DV83RQ
viOITUv4jtFTAq2iWM3T7SW5ZhRMsBWKHKMjxJrXg5jqcxt/UBHdEigK4soqXbjX
vxcA/vzvO/XxuQJLbXH5ncyRxlazWw==
=l7t9
-----END PGP SIGNATURE-----

--Sig_/f4E28sS5IoLWgM+V9tk1+bn--
