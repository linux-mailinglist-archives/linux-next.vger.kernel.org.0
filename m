Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C78C3E4F85
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 00:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbhHIWwM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 18:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233266AbhHIWwL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 18:52:11 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B9AC0613D3;
        Mon,  9 Aug 2021 15:51:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkBCl33j2z9sX3;
        Tue, 10 Aug 2021 08:51:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628549507;
        bh=4Cdb0uiDw+lIgSZAAg7qkBMBMNPEC0n2lx0cA61vEQU=;
        h=Date:From:To:Cc:Subject:From;
        b=harOZFNcpgkO2jJh64zFlWCbewHGWLX1FUhyWRsfFMAi00dgpD8fsGl2nIdGM4oMo
         BDSzvbP6GkxHA1qH7QCyCdftzZg3f++TxZvBdwlhZ2cgwfrQPEzUKlF/yIYupzdrij
         xrpm9jE6q3w0onYkJQhaEV3YYCiD/flvhay4rbAjY/PkA5Mn2cRaYQcXraxTSBrIYu
         h6TVw3sfS8uMlspVqX7/Ma5qLZLxzv84PA2+y6ccQJFZkIEutIEyNyqZpNJz/92YsR
         GOtK4kH+5l9p2WGldCSWHWy2Ov0+z69FznOfQ25nmwTWlGFxch8G5Bsi3ArJkmTwhY
         xWnG5AcD+rH0Q==
Date:   Tue, 10 Aug 2021 08:51:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tejun Heo <tj@kernel.org>
Cc:     Waiman Long <longman@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the cgroup tree
Message-ID: <20210810085146.0b9ec2b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lPe5o_ueYvGMmroVONd4dSr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lPe5o_ueYvGMmroVONd4dSr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f944e005aa9b ("cgroup/cpuset: Fix violation of cpuset locking rule")

Fixes tag

  Fixes: 4b842da276a8 ("cpuset: Make CPU hotplug work with partition)

has these problem(s):

  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/lPe5o_ueYvGMmroVONd4dSr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmERsYIACgkQAVBC80lX
0GzMmggAjb5vf1P4CmaHXIv7z2wqt+dogR2l9ijI5jSgwyO3L4R9sL7DPlj+Vkt4
W47GW0DENGkKCfyiPNfi383ISz2IrbsOPTPNIsuPT8g00fJhKhZ3AnkFWqd/pU8K
as9Puos++Yl9w6eYSS3NlV6tl1D/x/lwnPHQPR2pWMON3MEW8rUP/ElTkQADMoEh
8pNB7VW8CdNcvjn7McVpS2fg8B8AVIYIQBs5kTjgNYZEieY7JoWmiCrgJ0iLGP5U
TUSX9vNakmX7N6y7tIYYeqnnpBTiaq4p39qyaNOSmJUAZzwqN2hGRczvYts2y5Wx
B4CApksX+3Dz1PJsLQEnxyxDjJloRw==
=o3xj
-----END PGP SIGNATURE-----

--Sig_/lPe5o_ueYvGMmroVONd4dSr--
