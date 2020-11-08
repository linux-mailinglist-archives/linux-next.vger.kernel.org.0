Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A812AADB8
	for <lists+linux-next@lfdr.de>; Sun,  8 Nov 2020 22:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgKHVnz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 16:43:55 -0500
Received: from ozlabs.org ([203.11.71.1]:40993 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727570AbgKHVnz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 8 Nov 2020 16:43:55 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTngq5GHQz9s0b;
        Mon,  9 Nov 2020 08:43:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604871833;
        bh=J2WBoTzRiTm4cJ6T//yQ5D8O8Bk3/W6JTxEF7Zuo+Lk=;
        h=Date:From:To:Cc:Subject:From;
        b=DGUdZD9CRBXZy13UUGPYXOLLai1Xz7e/OqQaPejZ6S6wWDVQqt2yMiteQsv61YyrU
         WVbZSQzQ0oXVAjhrgYTD0MNMBXVAyACtZy+M/XMsmTEuXyzu4GMiGQgFb04F92irjr
         uCsK/xnXBibvdW4wH5eq8xJwqk3GHaYCHlrGoezTE939vVLd9bO5JTQcJyvafn0u+L
         RQJi18duCsfD6zl1KsEw13kcdPQB7ufZiT5hQ7/MZsUwXFtnjjwLHxcL8heYJm9shO
         ceC15anSyo4mGQafQ0JgJSO/ybDbU1LEX979bohTLXwTTIM89qq+AZEdhMRpMDG+W/
         MXtB6kReW75fw==
Date:   Mon, 9 Nov 2020 08:43:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     David Woodhouse <dwmw@amazon.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20201109084350.75624851@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lu2ApLBn7M2FT7VHIKKk7DH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lu2ApLBn7M2FT7VHIKKk7DH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f36a74b9345a ("x86/ioapic: Use I/O-APIC ID for finding irqdomain, not ind=
ex")

Fixes tag

  Fixes: b643128b917 ("x86/ioapic: Use irq_find_matching_fwspec() to find r=
emapping irqdomain")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  26573a97746c ("x86/apic: Fix x2apic enablement without interrupt remappin=
g")

Fixes tag

  Fixes: ce69a784504 ("x86/apic: Enable x2APIC without interrupt remapping =
under KVM")

has these problem(s):

  - SHA1 should be at least 12 digits long

This can be fxed in the future by setting core.abbrev to 12 (or more)
or (for git v2.11 or later) just making sure it is not set (or set to
"auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/lu2ApLBn7M2FT7VHIKKk7DH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+oZpcACgkQAVBC80lX
0GzXjQf9GrPZEqlwOJeFoBZwJGXZgqIwIACMYgxDjFRMJeES5Lyamfk2Nm7Iu8CU
St2efYMJMpwPjGqYaCkcz72LkIxK6/56NaZjh91xaPp6khXoemyhfZ7NJCMdt/6Z
c1bIKLg8IMb584Q1/lE+8y/EpuZ1KcJ5W3NS3ehyk6GXwtIXMWxTFWdSjKK9LZWt
NKXMLyx8iisj7JWWF3mrZ2FOrXYr/jwEzoyzzJEKfa/vm8fU2zftIMrDwMFGq+XJ
osrD9y2mxCDuo5aQUvj/I2sYx61S9IH7o5Xpy4JtQfI1pLN8NB0iA+7IwNwWNclJ
hwGLfBdZePZ0bK+I4GSo2XkBC/2HyA==
=udeT
-----END PGP SIGNATURE-----

--Sig_/lu2ApLBn7M2FT7VHIKKk7DH--
