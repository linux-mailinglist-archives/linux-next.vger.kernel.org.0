Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4823412D8C
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 05:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbhIUDwI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 23:52:08 -0400
Received: from ozlabs.org ([203.11.71.1]:33617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231551AbhIUDwE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Sep 2021 23:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632196235;
        bh=Nf2v3ium6ChudMEM/tpTI7QeK1+fS9wTGzEBFP1rJ3I=;
        h=Date:From:To:Cc:Subject:From;
        b=fNwI2bLn3o98nWktKaj2OTL2mkDrGTQW99n9eNIHhCnpHJRho6m57uaqR2phAzFXM
         0uqN9L6pZdhmpMpNvyLMYoRgE8iKBaPYkc+0jkeUfl5zBCjTRd6vAI/YAAAkYyOPgQ
         wt47lssXID40DJ3e7I8bkvWgM8P8zpg08YsGG3cB25ccy5lFI5llAfm3hc7jcjW7yv
         qQ8LKK+cqfw/p4RxadNFTz4GlTLobswx1a7tLIAcIK7xfR5EB1snhZqy8gK2JN248F
         OtuSvSy4Ge3fBJrbBqV5b40Ev99DlhWkcgkONU+pqBfUIIe5Vm3t6/XI2VMDCBbDki
         F50RSjBKak6SQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HD6s51MQ2z9ssP;
        Tue, 21 Sep 2021 13:50:32 +1000 (AEST)
Date:   Tue, 21 Sep 2021 13:50:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20210921135031.2b39fb76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XyyHhQ02R++M=wGEVN_Y4J5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XyyHhQ02R++M=wGEVN_Y4J5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm64 allmodconfig
clang-12) produced this warning:

kernel/locking/test-ww_mutex.c:138:7: error: variable 'ret' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Introduced by commit

  12235da8c80a ("kernel/locking: Add context to ww_mutex_trylock()")

--=20
Cheers,
Stephen Rothwell

--Sig_/XyyHhQ02R++M=wGEVN_Y4J5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJVocACgkQAVBC80lX
0GyJfggAk6CVwUjJvJjalOB9L4oqE0B3fDbednJx/0VPVqsJEQfcW1aOh6s0nlmC
TOGWSAEk2WBMddzPmj1JAJEBsrx1gOplLFpaVVhUvSA9+qPt3uk+neini3QPFcbz
6XP0b7ysMDUOEgwsSQ1rcWjaWkbjI3/948iBpqq3AvTQ82gmoC9wnb8ao0Flqgkx
WAahsN6mdX5v+M/wwNWQx7TX/lvpEYwlnAev1WpECMIqzCi+Fd5vTd0WVPCvreQD
Wfvj52ngTZpQJJxzpe7kDuN+vO9oheEWEoI29Y8eZpTCdOXIMVt16ps9AyagkZ0V
ndsOSYHiJZidI0rp95qfAo3JlUfmyA==
=U0ML
-----END PGP SIGNATURE-----

--Sig_/XyyHhQ02R++M=wGEVN_Y4J5--
