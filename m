Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F9143AA55
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 04:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbhJZCeQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 22:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhJZCeQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 22:34:16 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1D3C061745;
        Mon, 25 Oct 2021 19:31:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdbS60Sybz4xbW;
        Tue, 26 Oct 2021 13:31:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635215510;
        bh=zvI9YbGt0l1BIDQHixb3pb8eAR+Quzgr6H4JpCjIGU4=;
        h=Date:From:To:Cc:Subject:From;
        b=n5PT9PMJlCg6nRLxUjSoHEDAwLeK0K1rbi7BlaabqIWYrFx9cKHeeJcKzZmU4I5CE
         q76Cvv3XSi99C+mLI+dmVkBcIUuh3qs03s9WtrHjRB66BlZo5toMNHYALzYPRZ+G+/
         upjDINL14HT3RuwOcA3Ez/3TXvBoBod0MZBu5nQsuAu2SVk21TPArKAZYykYVqW43C
         s/gjyO36njEzwaAO2GE7ku7yCMcwyc2VlOSIRWR+TfSRrM70qRJfC+rTfE4Tgzp7F/
         vBLs9oUj3JksnUoWQuscrn5+5gBtrTugdaCe7X+rmjHGUrTivayPyeCjNfGcOxChGT
         7BRMK/wvkXMKA==
Date:   Tue, 26 Oct 2021 13:31:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
Subject: linux-next: manual merge of the audit tree with the powerpc tree
Message-ID: <20211026133147.35d19e00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ynot28kSkVn5UbErtuc45_Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ynot28kSkVn5UbErtuc45_Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the audit tree got conflicts in:

  arch/powerpc/kernel/audit.c
  arch/powerpc/kernel/compat_audit.c

between commit:

  566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERI=
C")

from the powerpc tree and commits:

  42f355ef59a2 ("audit: replace magic audit syscall class numbers with macr=
os")
  1c30e3af8a79 ("audit: add support for the openat2 syscall")

from the audit tree.

I fixed it up (I just removed the files like the former commit) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/Ynot28kSkVn5UbErtuc45_Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3aJMACgkQAVBC80lX
0GyGFwgApMeEPlt9wHRfuDQwvzb5fk0SAh904NgIPmQV9zE8HLQJ/j0LmjDqHHbR
osGNg2Sdi+zV1430fEqhx8A6yOs0od797zJBtUtDBqLtNOwvSOO8KXtJUUEMCM60
EC0+nXK5bHPuvownNQMBoDT03s6KZH/SjFraB6V5HMUvnBd7ojYVg+mRX3GUAVYq
dyoAc6VgQETAzRr9SOvGyCSGYsYmC8JQUA6/orsZQ/yD6TRLlG3KtorZptG7Coqi
Zn6t3xXb0gRGHrw1sZjPQh2N9OKL5nRSGE3ykYFbL5hNAN6T8fHe/a3NUrln8EA6
ltgn7nF03w5UPeLO/5kImMr0uqlbUQ==
=Q3KL
-----END PGP SIGNATURE-----

--Sig_/Ynot28kSkVn5UbErtuc45_Z--
