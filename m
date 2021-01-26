Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A0230510F
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbhA0Ek6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731137AbhAZXUa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 18:20:30 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5359C061574;
        Tue, 26 Jan 2021 15:18:34 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQN2c2r74z9s24;
        Wed, 27 Jan 2021 10:18:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611703112;
        bh=eEh6lo1xs5OZ48tzhJJT472B+zDs7xxKBfOnoCR6/3w=;
        h=Date:From:To:Cc:Subject:From;
        b=LqKGDw0pQmhyJr2L8qUhTVnwDluXekwkvdyw1ZpO6LE9gwiXZmfFljlTQ1skUO7t4
         T0FJ1yMbUtS3iNxRdUhYlJ3NtlOQ7rwi8gowc5Otha8XnFdgxNXjko2GW781cbYaP4
         sCxkKFSyo0F6EK8Wgh7XOCKBuC6cDMBzOx4UyV2EfRRBHFnFvnNny49X5PFhOPSLrH
         NZU3C2Tv5HB52UX0hgdRIXOc67Eh2EIYhxZKD8XYN2lerwCbL2q8G/g8eLP4bSClY/
         /H+odNdvBMZN9rVb4lNda2RGJs57y2aWqzzjGHvzk4SFbhPMd4m6DMeLiUprsWRRCY
         nH78wzddDg0fA==
Date:   Wed, 27 Jan 2021 10:18:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Josef Bacik <josef@toxicpanda.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the btrfs tree
Message-ID: <20210127101831.21dde304@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LvIMG/aG=XyZYKBPy1Jnx7J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LvIMG/aG=XyZYKBPy1Jnx7J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/btrfs/space-info.c:1373: warning: Function parameter or member 'start_ns=
' not described in 'handle_reserve_ticket'
fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig_byt=
es' not described in 'handle_reserve_ticket'

Introduced by commit

  cf61ceb78394 ("btrfs: add a trace point for reserve tickets")

--=20
Cheers,
Stephen Rothwell

--Sig_/LvIMG/aG=XyZYKBPy1Jnx7J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQo0cACgkQAVBC80lX
0GzkDgf/TLbxnzV7aV14VY9rMWf35CwdkihEswQlapQMIlR0gadS3rhjDWKa7+MB
0DTNasaZC2Y1ejnBj6wnsJjbsmqZ1ihbJpiBfC308aSi7djdwDqunEHmXAw9bbPE
bBnaXteW1tJWg+7HQCsk1CtyImVCQY5QHwOV5XwfjQR/Wmqgc0B2iAmkPffuc/ot
+ZNnm+eqlVRxjDfgCL04hclxdE4gi6Sitbq2Xa+Dq3YKhi45MU0npyTvBr3f1+VW
PmnspJZIfOz4NBQAzxwUlgSv+dMJGpBSXjs9DHDWBHa3R8KO3RZG1qK7ebNRCy/l
bMen6MUwz0hIAeQecYyBza/kdgX1qQ==
=y1uy
-----END PGP SIGNATURE-----

--Sig_/LvIMG/aG=XyZYKBPy1Jnx7J--
