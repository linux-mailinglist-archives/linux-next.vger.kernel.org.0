Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36462C0119
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 09:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgKWIFk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 03:05:40 -0500
Received: from ozlabs.org ([203.11.71.1]:59681 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgKWIFk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Nov 2020 03:05:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cffpl0V1hz9sRR;
        Mon, 23 Nov 2020 19:05:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606118737;
        bh=jt3SU2wmecYt6zydgV+VjfimB4PbRhZ32q060YXUudY=;
        h=Date:From:To:Cc:Subject:From;
        b=tbcxjoTPAW9F9LHhPHWV/E9iknCe9chILE4Wh7vdmX+na0k5IoG0nz15Wm+SbHo+Q
         Xj8cq7U3zAj7mGj4g9rIYdjfXwgGKH+aLE6aJUcKHYXGQ0y5n58jSFCG5Zqg2YwKxh
         FIwGVAaEq5Hj859owFMRlVNn6C6n5xeZ72H+akaG+57jHTiwA69UOmHMFcUfuqJoS4
         rK06n72/FO8wAoQam7V2ZM+MR5OufEXZHbeGPkHXcw84iaeNmNn9xoxhZi12jzDab2
         a/Oiy7caM2rwUXHw4yIASSS1GkOfv7rZaOQ7CxKjkqKHDM2ciDAiv/Oe7IdIZws+tc
         jzFoEY+zzlGlw==
Date:   Mon, 23 Nov 2020 19:05:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Sean Christopherson <seanjc@google.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20201123190534.6c151a96@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uuHS8JhepAUgrZmiNp1ILVS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uuHS8JhepAUgrZmiNp1ILVS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/mm.h

between commit:

  95bb7c42ac8a ("mm: Add 'mprotect' hook to struct vm_operations_struct")

from the tip tree and commit:

  6dd8e5dab7c1 ("mremap: don't allow MREMAP_DONTUNMAP on special_mappings a=
nd aio")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/mm.h
index e877401baae6,cd50a37aa76d..000000000000
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@@ -557,15 -557,9 +557,16 @@@ enum page_entry_size=20
  struct vm_operations_struct {
  	void (*open)(struct vm_area_struct * area);
  	void (*close)(struct vm_area_struct * area);
- 	int (*split)(struct vm_area_struct * area, unsigned long addr);
- 	int (*mremap)(struct vm_area_struct * area);
+ 	/* Called any time before splitting to check if it's allowed */
+ 	int (*may_split)(struct vm_area_struct *area, unsigned long addr);
+ 	int (*mremap)(struct vm_area_struct *area, unsigned long flags);
 +	/*
 +	 * Called by mprotect() to make driver-specific permission
 +	 * checks before mprotect() is finalised.   The VMA must not
 +	 * be modified.  Returns 0 if eprotect() can proceed.
 +	 */
 +	int (*mprotect)(struct vm_area_struct *vma, unsigned long start,
 +			unsigned long end, unsigned long newflags);
  	vm_fault_t (*fault)(struct vm_fault *vmf);
  	vm_fault_t (*huge_fault)(struct vm_fault *vmf,
  			enum page_entry_size pe_size);

--Sig_/uuHS8JhepAUgrZmiNp1ILVS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+7bU4ACgkQAVBC80lX
0GyJ6QgAmR1jBRG0FvJlIvp6CxHqk1gpALARLqawPVzSPOWZB+DFwguDHajzrMWC
XLEXSt+cAhQXwf1J8nVVrJe/yK5EG4gWaS+x+TcABZkZs9IdnE4loPoJPuZWM2Z2
XKKSlfBqmQTKZi1Jb+Hi1YGYdT7MOvHjSGtXATjGtMHqXpgeNIhd4tm222MgxviT
A31QqJMu9t7yUUy0y7Q5K957I6RV18OAD19ZIUhwwXjz4PjVwc7LZBsr/m0CJiA4
NqUlvsTS3J/hlOQGI04DZYzGdvjlwHwqcLweLS3jjtCpm2wp0BQDBhs9AJiK1Zfk
sEFQmi9qGNbM+AJnMw3tvgjcgGEtZQ==
=/fc6
-----END PGP SIGNATURE-----

--Sig_/uuHS8JhepAUgrZmiNp1ILVS--
