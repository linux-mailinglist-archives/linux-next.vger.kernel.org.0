Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C3731F17F
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 22:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhBRVDg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 16:03:36 -0500
Received: from ozlabs.org ([203.11.71.1]:56887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhBRVDS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Feb 2021 16:03:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhRx81hbXz9sBJ;
        Fri, 19 Feb 2021 08:02:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613682156;
        bh=Enpv0uMa4bjz5DHbCSp6CHNdbTDFOdkc/Xm4KfpRcR0=;
        h=Date:From:To:Cc:Subject:From;
        b=mL/DBWjFJydFnpGLySo84fLU0Oo7vn8mQeF10N8pac7Uc9IboLBUgTphrXM2WPVmI
         PXYLGEXykTEN15/jqKYXYJUR6Qv/BvqKEgiuvC39RQdd5OzxoFyRGp0eDm7rKXX7BS
         X5Sxlikn+oM3tGbbmhTDuKTMZLihZbNFTUJUALI/v26pasaPeGFDjJKYpBhEJeSxNC
         tSU2zcRd7nZRVg1ilxsz+b6lVSBps02iCFDh9wJ1nn+AWnGHCpN3OYS3jZr0/4541J
         ePLZfsmqwyoFFyHjpZrTrCqTrZ8DpBg+FmAjZJMRLF2TF1OSoXQJbb1zlGx+z/0du/
         j8Q5RGQDPzOfg==
Date:   Fri, 19 Feb 2021 08:02:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the origin tree
Message-ID: <20210219080235.52c8c7f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4sRCjhj1ZSJVm9Cuhup/_Sq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4sRCjhj1ZSJVm9Cuhup/_Sq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/virt/kvm/api.rst:4537: WARNING: Unexpected indentation.
Documentation/virt/kvm/api.rst:4539: WARNING: Block quote ends without a bl=
ank line; unexpected unindent.

Introduced by commit

  c21d54f0307f ("KVM: x86: hyper-v: allow KVM_GET_SUPPORTED_HV_CPUID as a s=
ystem ioctl")

These have been around for some time.

--=20
Cheers,
Stephen Rothwell

--Sig_/4sRCjhj1ZSJVm9Cuhup/_Sq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAu1esACgkQAVBC80lX
0GwTeAf/Qy2XczZbfMMnBwQIHqs+3x3CuBGRF28Mv5HMs5kGtTDS6/IUZRQpJc4g
7mQlbHhwi9OhsVxy2Lx26PkMExRGKlhkyMd4Xm3BzKgzxErrR6GEKi0yUmxTfzbq
t8jyVplXE+1gztBMFm+MN4haTzDsA+Rp/A5Cuy6BLANKtvyeXjuXO1czVS1Tfo0Q
a7LA6iPki8iFmVyke5a6HL5wwYFqzwlG3W1mn4OTecSQOtTTdkmVTJ1Ibqi6x9jn
RAwdUad/fL8PITEvppWlEhuOHc3ByHv3lO363q1DUR5Po5797MwSRLV5s+Qn+BSq
Sp3y6KNqifF1BBYmWTyi1TrmhxK/vg==
=vHnc
-----END PGP SIGNATURE-----

--Sig_/4sRCjhj1ZSJVm9Cuhup/_Sq--
