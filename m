Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF5A30CCD5
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 21:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240494AbhBBUKM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 15:10:12 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:32979 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240488AbhBBUJ6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Feb 2021 15:09:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVbVz6mXjz9tl7;
        Wed,  3 Feb 2021 07:09:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612296556;
        bh=tbOypyd8KY8FX7ans6NU/EulP2Nyi/rkMwWZTX0QPb8=;
        h=Date:From:To:Cc:Subject:From;
        b=Fk9bYFDhCWX3Z2y0c4zOM9WM+c5VEu/u/AFXSN6ajm0XU7ihe1jAEaQZQ/PfljKyo
         aanwidZIsDm87fRKjBvftXpGf9kTSt2iw1C9k7PyqqZ5Ek/ykgy0dGCy6q3DEi8E2R
         VDEC/V/YPZv2YDgqVKmEQ0ratGo6XsuDmaKoJJu8dKwUVM9vSTsP6/rbOa6+5KrUac
         uypCde/ZMOlhEYtwfJ+Zg6VkIG63yYnk4rTEXOdXHxjUnMUrXfb9NBaxzOP48uBb8B
         r9AXWOIqQ5GE/MvQY009TcCUAI7iUNjuvAgtWqtR3W2K1TwiWEWPBVOxy+EzYE6lsB
         w5bMRGTc3qlEQ==
Date:   Wed, 3 Feb 2021 07:09:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the fscache tree
Message-ID: <20210203070915.06a1a574@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//NSZVaMyddnlu+peJXIJPMj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//NSZVaMyddnlu+peJXIJPMj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  51721d69bb95 ("afs: Fix error handling in afs_req_issue_op()")

Fixes tag

  Fixes: 0dd1a43b5d74 ("afs: Fix error handling in afs_req_issue_op()")

has these problem(s):

  - Target SHA1 does not exist

I have no idea which commit you meant :-(

--=20
Cheers,
Stephen Rothwell

--Sig_//NSZVaMyddnlu+peJXIJPMj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAZsWsACgkQAVBC80lX
0Gz0eAf+OgewCqE7g3a23ijoTvcnfwF+pyxc677fv+d9MmLtrpECCqNSkZK6nWU6
NNcVL/ClEvibREsUIVrYPSx4s70VbSIimJiOJgVcNefpg453QErwmhN0chxL3QD5
fhXV/WWiR2rb6kpKcenRb8D1RQN8NzPGpJSb3oBw2GmQWbCj8cVKckLTvf+OnX2t
KNb4F8NYbYFIUFwny3QxFXDnaOxPoFhlDYG8nRhWc/kFFL0ZwssnhNzQbWAGamba
2lOe8DjHTylJQZGRiiGWs1WcOTLUwFNLvxlF9wZTknlYhadJPs8OZiiskhGEO8mx
ARM5g7lR2cjNwasL6xRsH40Z61LQVQ==
=d3cl
-----END PGP SIGNATURE-----

--Sig_//NSZVaMyddnlu+peJXIJPMj--
