Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7A7F14E75F
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 04:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgAaDNM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 22:13:12 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727749AbgAaDNM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jan 2020 22:13:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4882NP4zkQz9sRQ;
        Fri, 31 Jan 2020 14:13:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580440390;
        bh=7+oFhpfJcKAa/cg7HkSmh/uwwIAoXTHrh15BH7ElmnE=;
        h=Date:From:To:Cc:Subject:From;
        b=LPsGGNWMribUDsegdRBec2ikWuQNH1HKdw53dBwtWjaIBlWAX6E7LcorAlUztYlH/
         qolATHTWrW+tbjqkuNrGJfNJGtEp2tueynzaYniRI7wRtd3M3fu49SxNtmlTmnl7ut
         ui+M7v2SCVW/iG/NzkklUKQx0kSAEyj/976W/I/c9eI/LA+HCI95JRxGm9u3dUXXGT
         /F58+hRLG/WA+4cW49M/6bVIcK0NtoR1e0kigmffhyiHeP4/dAjTDzb4b0S8YMOspP
         cLVlWl4qnhG1U2Blqqp0EuD1nUhsDyC9KarAiTmFA+JgCqPbE5FBK9044F06dm2b0I
         9Y82eNF1U6HOg==
Date:   Fri, 31 Jan 2020 14:13:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Roberto Bergantinos Corpas <rbergant@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200131141309.367c9d8b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/swC23b23Fpgdr+7W/kiPX+k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/swC23b23Fpgdr+7W/kiPX+k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

net/sunrpc/auth_gss/svcauth_gss.c: In function 'gss_proxy_save_rsc':
net/sunrpc/auth_gss/svcauth_gss.c:1251:19: error: storage size of 'boot' is=
n't known
 1251 |   struct timespec boot;
      |                   ^~~~
net/sunrpc/auth_gss/svcauth_gss.c:1273:3: error: implicit declaration of fu=
nction 'getboottime'; did you mean 'getboottime64'? [-Werror=3Dimplicit-fun=
ction-declaration]
 1273 |   getboottime(&boot);
      |   ^~~~~~~~~~~
      |   getboottime64
net/sunrpc/auth_gss/svcauth_gss.c:1251:19: warning: unused variable 'boot' =
[-Wunused-variable]
 1251 |   struct timespec boot;
      |                   ^~~~

Caused by commit

  a415f20a18c9 ("sunrpc: expiry_time should be seconds not timeval")

from the nfsd tree interacting with commits

  de371b6c7b73 ("y2038: remove unused time32 interfaces")
  aa7ff200a719 ("y2038: hide timeval/timespec/itimerval/itimerspec types")

from the akpm-current tree.

I have reverted the nfsd commit for today.  A better solution is requested.

--=20
Cheers,
Stephen Rothwell

--Sig_/swC23b23Fpgdr+7W/kiPX+k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4zm0UACgkQAVBC80lX
0GzFGQf/UM6iAIpd1C68ZnNQJ18P0ss3uj7g3qTMzUSyF/buW9DhY9UCdm2hI38z
T/9I6FqL2AI7IeknsL02zJhs/g3s1UH4POV8C+/pWENhn4AiE0nmWkP5ijDPmHmU
23BH0CDsA15fe7PlV5eGm6fd6dxo4qRGYdX8BgxfQANJ+JPlQFLzU5GNDaNhDYsr
8RONj3Nkjdot5JdJnSZH9dSBKs7ZPvGNG5X5cZ6CxmntdypU2Wyk15qeCqzfxRSd
4FKNPWJBFV03Pk4FhHRJ+bJZux4OMxhRc6jhEW0SnpgkVB6Wn3E9k/6O2bB0b2s2
97PE0NVt7yChOSie7rjflP+TEfCiOA==
=fMf/
-----END PGP SIGNATURE-----

--Sig_/swC23b23Fpgdr+7W/kiPX+k--
