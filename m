Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41962E2A4A
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2019 08:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437703AbfJXGQj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Oct 2019 02:16:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437707AbfJXGQj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Oct 2019 02:16:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46zH7m0Tl1z9sQm;
        Thu, 24 Oct 2019 17:16:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571897797;
        bh=5LZtGB6MpqVjniWkZe+D10Mn/VWNL4Dp4QZvuqo+V8g=;
        h=Date:From:To:Cc:Subject:From;
        b=Pty571ULRKxFJP4VguEno1jWhrV1gwckqog/SoVUNaM6vO+BVi3npirHatRDqw1qJ
         OTeAu2JqcKdPLze19UpgH9D1qs4TwKGQXt1V/6OwHxynpXa9Sqgz6cU0mCMF0L8Yw7
         Qdj1Mt9JfB2YaAqkLg3Cqx0vFh+2JCxYMrcmHKhT8fUKW6S9ixetMiEksqYIvIuXQ7
         4uJKjrZUKXdTAky1cT4OjbOGuhpqOdaCuyh9Nw1VOMHIAycfQ2gjZCVbSTkDyEa9DP
         4QWPutZAT65blByCQo3MbH1I8N4OjfbAPTHeCYs2lc92piIQh8yLFHCVJAPbo/MAdQ
         nRbH9L3uwJ7Qg==
Date:   Thu, 24 Oct 2019 17:16:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jackie Liu <liuyun01@kylinos.cn>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20191024171634.298c96df@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xqZBob5s/U0TS4sAHWvB0NN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xqZBob5s/U0TS4sAHWvB0NN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f131f240623a ("io_uring: cq entries should be equal to (or greater) than =
sq entries")

Fixes tag

  Fixes: 95d8765bd9f2 ("io_uring: allow application controlled CQ ring size=
")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: f3cbc97703c5 ("io_uring: allow application controlled CQ ring size")

--=20
Cheers,
Stephen Rothwell

--Sig_/xqZBob5s/U0TS4sAHWvB0NN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2xQcIACgkQAVBC80lX
0GyO5Qf6A+mgdkYFOPN3YBmj1EqsxA8gnJ1fnCJWSI49f018qN0l0KRsL2AAFOWc
MnJqlEDtVPMIFhQS+OpW1xKiMrVxZyz3wWNqm6MtJ1x7Oa7l7Up4BuLejwT0XkMQ
yOpdZw9RAkJD7hNXvLPG0lgTswfzzxV2/1728OvAQO4G753Qmgu8rUBF9QVZ4uN/
JVlzG9Edn2XTrHyiMPAwXR5Ruzvoz7jSjR7xA+I1UNSHUClzVu8WUcNJgAVeE9G4
gOv7yAdWc3VOgjUvW+Pt91jZ8HDwFJP2jtRveT9S9GDCFHD4e5nqaw5Dmsida9AQ
fVUR0gWykzugeZppGf1nYPTJcafpjg==
=9gY+
-----END PGP SIGNATURE-----

--Sig_/xqZBob5s/U0TS4sAHWvB0NN--
