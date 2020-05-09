Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957D11CBB82
	for <lists+linux-next@lfdr.de>; Sat,  9 May 2020 02:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgEIAAZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 20:00:25 -0400
Received: from ozlabs.org ([203.11.71.1]:53975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgEIAAZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 May 2020 20:00:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JnQH3pRLz9sSc;
        Sat,  9 May 2020 10:00:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588982423;
        bh=at6m1BG7XAUJio6pcjB5ILExirq9FTj8zcY3370amxg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mYwPneG97+rn5H85+L++lLV/7zu1N0OwyWZ4lqyiKSLu0M1UgBBFIbxETCdpUYdz7
         frCKHFJMZcXwvpmBRjI6Yi5wG7nJ0ZefiBXYykEcKdqgnnpz2+7xLzxl1/DNo8wbGf
         pOoH2yarL7puVuYS9locZikE9Dn3xqjgsjJnqPmdl9LIwEvonEJ6xPID5HFSKp9ssm
         vnPHtuVzDjnFidgcIGxC8viMRx9lmmi/qwwabnDo1RzNlDkL3ks2AiwG6UdFOClesw
         gsK3y3mFX/FK9lhUQSMOSV5XjaaOu1wNJUMEGKkJ200wL9Pu79EyouPAHXjXjiEqSK
         mWmnDBFqIAeQA==
Date:   Sat, 9 May 2020 10:00:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Adding a linux-integrity "fixes" branch
Message-ID: <20200509100021.4d79b426@canb.auug.org.au>
In-Reply-To: <1588906186.6053.10.camel@linux.ibm.com>
References: <1588906186.6053.10.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a5DsUSi7kTNw1wVepPEAkMX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a5DsUSi7kTNw1wVepPEAkMX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mimi,

On Thu, 07 May 2020 22:49:46 -0400 Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> In addition to the existing "next-integrity" branch, could you add the
> "fixes" branch?

Added from Monday.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/a5DsUSi7kTNw1wVepPEAkMX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl618pUACgkQAVBC80lX
0GwezAf+OqtayFjhJC8oP+xXOxPLRZVj8PTwUs5H+rWKtDcWrAVietalzziFUqfU
5t1+lnb1QYbvph49OwV0uBDGkXYtw+ulSD3l13WhLcHt9eQ3EUMot92wcMXbh8vE
CsCiiEeL8fucFZ79wQiEQ6Ie2VzepRKX0qFHGZFok9QWFPuTAgRHcHvaNVcSam+b
lXf7FqXz7D8OwiBkeV+U1er5v6ZA57W9OdsIh4yrsvuruVDLHSuVqJEM59rsTmK9
xFFR7ak1Ozqf4f+TafxbT86iRbZLVrxIMOKh5JQaTC8DdzkDz0XqDf4CNJtG4G8s
hU6UrpAeoaq51DTdFcZJlMj7vm+D5A==
=eYfc
-----END PGP SIGNATURE-----

--Sig_/a5DsUSi7kTNw1wVepPEAkMX--
