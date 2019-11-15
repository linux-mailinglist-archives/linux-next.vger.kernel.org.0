Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F402CFD466
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 06:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfKOFcG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 00:32:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33693 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbfKOFcF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 00:32:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Dn6B3gCbz9sP4;
        Fri, 15 Nov 2019 16:32:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573795922;
        bh=EgmmEVk62/FPNnUYLxtc9tGZBgbgflsJT0JxSgS/3HQ=;
        h=Date:From:To:Cc:Subject:From;
        b=cIlPkzBzK6ybCrPgG4FhbdHuouA3kXufB+PzTklifJoCxXram8v6rVy3V31q3Di3q
         uiC2va5pui0fkwyEk4BAtWGKx9VhG2Eb0Zbvg6iGJGb8G4jvQvvIWjlZu9+eiOdRVJ
         FJxQfx/6JRTdzFOxhWmm5RAhCky7np85WwBuk+3hS6mMdhOi4bNeLZnnN2NWoGbueW
         1svTb8rqFg7mSauE4HvH72f4HumPLc7obgWmgMhDqnfrbwK/eSdfKVN1OsRYZio39q
         rEhmZZZKNdnCfrC5t85jNOKg0saELFONgNesjB7wbEWgtbCRq2xdiEYBfcl/fAiGrX
         hZRcq6UoJpHVw==
Date:   Fri, 15 Nov 2019 16:32:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Adrian Reber <areber@redhat.com>
Subject: linux-next: manual merge of the pidfd tree with Linus' tree
Message-ID: <20191115163200.6526ccfa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/63otFFzaLmS9VxfxmMwYVh+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/63otFFzaLmS9VxfxmMwYVh+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Thanks, Christian, for the heads up about this.

Today's linux-next merge of the pidfd tree got a conflict in:

  include/uapi/linux/sched.h

between commit:

  fa729c4df558 ("clone3: validate stack arguments")

from Linus' tree and commit:

  fef0d8e4c7a1 ("fork: extend clone3() to support setting a PID")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/sched.h
index 25b4fa00bad1,2e649cfa07f4..000000000000
--- a/include/uapi/linux/sched.h
+++ b/include/uapi/linux/sched.h
@@@ -36,28 -39,38 +39,42 @@@
  #ifndef __ASSEMBLY__
  /**
   * struct clone_args - arguments for the clone3 syscall
-  * @flags:       Flags for the new process as listed above.
-  *               All flags are valid except for CSIGNAL and
-  *               CLONE_DETACHED.
-  * @pidfd:       If CLONE_PIDFD is set, a pidfd will be
-  *               returned in this argument.
-  * @child_tid:   If CLONE_CHILD_SETTID is set, the TID of the
-  *               child process will be returned in the child's
-  *               memory.
-  * @parent_tid:  If CLONE_PARENT_SETTID is set, the TID of
-  *               the child process will be returned in the
-  *               parent's memory.
-  * @exit_signal: The exit_signal the parent process will be
-  *               sent when the child exits.
-  * @stack:       Specify the location of the stack for the
-  *               child process.
-  *               Note, @stack is expected to point to the
-  *               lowest address. The stack direction will be
-  *               determined by the kernel and set up
-  *               appropriately based on @stack_size.
-  * @stack_size:  The size of the stack for the child process.
-  * @tls:         If CLONE_SETTLS is set, the tls descriptor
-  *               is set to tls.
+  * @flags:        Flags for the new process as listed above.
+  *                All flags are valid except for CSIGNAL and
+  *                CLONE_DETACHED.
+  * @pidfd:        If CLONE_PIDFD is set, a pidfd will be
+  *                returned in this argument.
+  * @child_tid:    If CLONE_CHILD_SETTID is set, the TID of the
+  *                child process will be returned in the child's
+  *                memory.
+  * @parent_tid:   If CLONE_PARENT_SETTID is set, the TID of
+  *                the child process will be returned in the
+  *                parent's memory.
+  * @exit_signal:  The exit_signal the parent process will be
+  *                sent when the child exits.
+  * @stack:        Specify the location of the stack for the
+  *                child process.
++ *                Note, @stack is expected to point to the
++ *                lowest address. The stack direction will be
++ *                determined by the kernel and set up
++ *                appropriately based on @stack_size.
+  * @stack_size:   The size of the stack for the child process.
+  * @tls:          If CLONE_SETTLS is set, the tls descriptor
+  *                is set to tls.
+  * @set_tid:      Pointer to an array of type *pid_t. The size
+  *                of the array is defined using @set_tid_size.
+  *                This array is used select PIDs/TIDs for newly
+  *                created processes. The first element in this
+  *                defines the PID in the most nested PID
+  *                namespace. Each additional element in the array
+  *                defines the PID in the parent PID namespace of
+  *                the original PID namespace. If the array has
+  *                less entries than the number of currently
+  *                nested PID namespaces only the PIDs in the
+  *                corresponding namespaces are set.
+  * @set_tid_size: This defines the size of the array referenced
+  *                in @set_tid. This cannot be larger than the
+  *                kernel's limit of nested PID namespaces.
   *
   * The structure is versioned by size and thus extensible.
   * New struct members must go at the end of the struct and

--Sig_/63otFFzaLmS9VxfxmMwYVh+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3OOFAACgkQAVBC80lX
0GwJJQf/WtMyIw1DdBpnWQ7UStJWZtiNh7Atco5Y2+O0MV0bSc2DtUZOsvZFHyhS
byaPj00joRIalmYVPTivIyzpZmo+vo1QfPmmz0RM4fif/pFTaRRKt6rEbXDtAD6B
x2b+dmFbmhx9o5ts/8wgHzyJPZDL8/pnBWWAbf8DKe254LFKcDnbnSHetT7Pnr0x
GBkcOYIeCb/cNKDWNlRRcyrE0wAoAP3YpK/hHlWSGyku7lgQ+WSROX7qng/rSIqF
kIFRzwlPGWhTzIyPHhEr1Jc+VUhijE4UAKdk6ydewJxGhwAq3dkVgmybmqdSUl26
2BzJJKxaz8gLDCT3hl6aa2/O23Stbg==
=SrZM
-----END PGP SIGNATURE-----

--Sig_/63otFFzaLmS9VxfxmMwYVh+--
