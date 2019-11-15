Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E76EFD3B3
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 05:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfKOEga (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 23:36:30 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57499 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726549AbfKOEga (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 23:36:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Dlt46Xdsz9sPK;
        Fri, 15 Nov 2019 15:36:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573792589;
        bh=oGJG6CibNn1LIfFqvAz8jRajFEACP07geZMp2/GkYqs=;
        h=Date:From:To:Cc:Subject:From;
        b=p6D2DUojurHcCjaCI+NAN1rb3KTod1JkNMfDwEezxlfAycM/Cz1Li6/ZaMuq5LTYO
         R63uVh2MTznv0CLrNNDRwEU0UgccPeBesehevzcfOrw9ABfEjx0ZCaTh60yuDgqUoM
         ZVjOdoeeF7PQQsUvzbxfcsXee1dD5Idy7+CCGW+85ZCqI0KQ9qpsYxjFOChI+z+2OZ
         gNuql/GdINJJG/98yz+pucFOhFX4VKqjdji+sMNv/eybzwnhjXd9oHh0FkgjdXQA+m
         ZafnBU1j/8bNYX7+0iCyna/TBm+OHmfIOywe0NsnoX4ObSSuKXmJs8HSdXJQo4rHjE
         /2eai5pwQCrag==
Date:   Fri, 15 Nov 2019 15:36:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the vhost tree
Message-ID: <20191115153628.62214e42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GTepAnVWKI5MsEM2dZKk+uo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GTepAnVWKI5MsEM2dZKk+uo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/vhost/vhost.c: In function 'fetch_buf_packed':
drivers/vhost/vhost.c:2568:1: warning: no return statement in function retu=
rning non-void [-Wreturn-type]
 2568 | }
      | ^

Introduced by commit

  b65f969494e9 ("vhost: partial infrastructure for vhost")

--=20
Cheers,
Stephen Rothwell

--Sig_/GTepAnVWKI5MsEM2dZKk+uo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3OK0wACgkQAVBC80lX
0Gy5uwf+IDnPpdhyUifv74A6j76Kmvya00rB4AjeIanhmSDNpev++UgK8R822VO2
FNuYebln74PgZ1Wi3fjN6IP1ngS/SsL/rcwE+aUUUGYvJ3PY5ED/U9Ll4HaTALbO
mJOhPp22bt6F05ak7GbDnXSYvUq/0dLHNOOGirZWlhI2xizRM53esdKV5NkVar6p
3fMkV6skzPQM+lKWx1Z/j7yhabVOQP9IslgfeXqzozD7QnAv74aEY9dEG1973Et5
+wjrvF6KZOQsIoCV7ZiNTCtWPhtrE6U41zjzMwySe01iV11CAWdgal13f85Oa1GA
cSbA6y31qmPY92/eScy3sscUy/wc6w==
=5ZGK
-----END PGP SIGNATURE-----

--Sig_/GTepAnVWKI5MsEM2dZKk+uo--
