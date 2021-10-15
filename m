Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0B042E776
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 06:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhJOEGb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 00:06:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41323 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhJOEGb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 00:06:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVt1x6W2Sz4xb9;
        Fri, 15 Oct 2021 15:04:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634270664;
        bh=6W/RtSzqq2Z+GDw9T/evgV+tYlkOT8lgdq6qjYT3tuc=;
        h=Date:From:To:Cc:Subject:From;
        b=l6XbLYdoQ+2qELYE2joTH9eer/PGXmzi9Eh3cgZ8wpZGMJRY2WyBNWA1kjZlTTPdE
         59CJ7J1xel4MG129OmErpz8tJTSZiBjxXN0/FKJEuxQ+O9WMSTNOgpWgrDRgJioqQ/
         FZIoLQQY6e+Bk3PsNYUm8zlcv78SxnQTWjws/btENB9l8D2tOTNpTuBi2rl7ufOA17
         iWVeopZTo3ZjTQnWWJH/Slclzr9LLnzG574NIqr4Q5raWkRARIi0U94yqwZreHy+KE
         Iw/f5JRNAXbLn71ofEaQOsYowLTiiSMX258wqLTCzcKmLnazhwJXaV+ZwML3n9/84Q
         RWkdbbZn6o9VQ==
Date:   Fri, 15 Oct 2021 15:04:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Andreas Gruenbacher <agruenba@redhat.com>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the gfs2 tree
Message-ID: <20211015150420.617125bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6VzSXwJ4MgIsxHU73BoUJNE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6VzSXwJ4MgIsxHU73BoUJNE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/kernel/fpu/signal.c

between commit:

  4303543bac16 ("gup: Turn fault_in_pages_{readable,writeable} into fault_i=
n_{readable,writeable}")

from the gfs2 tree and commits:

  fcfb7163329c ("x86/fpu/signal: Move xstate clearing out of copy_fpregs_to=
_sigframe()")
  a2a8fd9a3efd ("x86/fpu/signal: Change return code of restore_fpregs_from_=
user() to boolean")

from the tip tree.

I fixed it up (I used the latter version - see below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/fpu/signal.c
index 164c96434704,37dbfed29d75..000000000000
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@@ -275,12 -283,12 +283,12 @@@ retry
  		fpregs_unlock();
 =20
  		/* Try to handle #PF, but anything else is fatal. */
- 		if (ret !=3D -EFAULT)
- 			return -EINVAL;
+ 		if (ret !=3D X86_TRAP_PF)
+ 			return false;
 =20
 -		if (!fault_in_pages_readable(buf, size))
 +		if (!fault_in_readable(buf, size))
  			goto retry;
- 		return -EFAULT;
+ 		return false;
  	}
 =20
  	/*

--Sig_/6VzSXwJ4MgIsxHU73BoUJNE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFo/cQACgkQAVBC80lX
0GxKqgf9HND1fghKE1tpdk2nsgs7GFXvPMnNEgawrqJ5LstlgB421T8/lv5oxogT
tVFzKvB6c3Hvr7xKcdIrecFmo8szqoFIE/Kpvj8CX2IEZ/gWt8FXjru52suCaU7R
7ISEA/9bCb8FE1a+VqjAQcZ1CuWJhZqa59skk8gdfG2ilgtHAMIIE/lD/0g5Ntsy
OGHBoSeMYUo3qwRbQKIRObHLdQy4vMv66IfBSg2QGt0WFXAnjKKHcMvflyLra6Ia
KZf9MvPczb2GUElobMYo16gcgIuhDs7qs5WRrwmIzRXKij/b/xYUGQF0ST2Yl7M8
Hed5PbqgD9NVjXIqzyxwA5VEO05DdQ==
=KRbd
-----END PGP SIGNATURE-----

--Sig_/6VzSXwJ4MgIsxHU73BoUJNE--
