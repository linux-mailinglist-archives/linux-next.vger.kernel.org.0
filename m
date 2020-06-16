Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF8B1FA801
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 06:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgFPEzZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 00:55:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47395 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgFPEzY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jun 2020 00:55:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49mG9607N4z9sR4;
        Tue, 16 Jun 2020 14:55:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592283322;
        bh=krMluR8fpInKbkKZYa9qh0eFojk300GkGHQDjQkfm18=;
        h=Date:From:To:Cc:Subject:From;
        b=mW9eBkKCO52QECWMutxypW61HDfbosiPt735Dw6joRqfKhbQ+zbxXpC5P3SSl5g9L
         TMAuR7bzp6BrorFJEbqz1B1VTnkDGUVAcmYtjxKJmiPicyP3PgauBJvD110qD61wZ5
         Hs+LSEmKmQocfeYeG1w2UJ7mtvfzjUcs0Oes23MQk2UpxNUjtvL0uLqBd0Q2d/f7vS
         naqNjj6EAmqGbhliBfl62Q4MBWOp3EwGFNEP7ef2gLJjLgovCp2pio7534xUDZqaQ5
         tQITM2HKt/HZp7OdTXL+iz3IdG1i0FMcRHxYK8QVpJQy+/i6sfcNhPIJDIQskOEWaB
         pJHNP+Fs0WvNg==
Date:   Tue, 16 Jun 2020 14:55:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Salter <msalter@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: removal of the c6x tree
Message-ID: <20200616145520.7e15e9a8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b8=4sBBps9=D4iC9st8=DTS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b8=4sBBps9=D4iC9st8=DTS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

I have removed the c6x tree
(git://linux-c6x.org/git/projects/linux-c6x-upstreaming.git#for-linux-next)
from linux-next because it has not been updated in more than a year.
If you would like it reinstated, please just reply and let me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/b8=4sBBps9=D4iC9st8=DTS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7oULgACgkQAVBC80lX
0GxI6wf+IOWyIpR93PA+oeLUHwVjJkXyYiHZt9lyeuT6SFCqeUi2ZK/qMjv3KrDW
xWCJftK4jY6vzPhWdAsD/aaQmFv//V+cILKdZ4zM2fjIye8pfALqIyISkSIK4xu8
CmhQ9+IWPi5uJ9hFgKvLyCGhP/yFCqoXeBSXqrasXjayDOQwEzRMA1zksPgypVR2
6CiE388rhpSSzvkJ42cJrK02OZFWPt4UzyMSV6PNrnI1nHF0WHDWMfC6nTDSW28U
TW3aiKoi2wMixhA4eJ8M6aTnJXavOJLH5oW08svu1Fr/UnpfxZJ7+seN7QQdQbjE
CWtXjUmNGaJzCNr+4h1+USNE621Y9A==
=Tqrt
-----END PGP SIGNATURE-----

--Sig_/b8=4sBBps9=D4iC9st8=DTS--
