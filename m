Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C8A8948F
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2019 23:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfHKVqI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Aug 2019 17:46:08 -0400
Received: from ozlabs.org ([203.11.71.1]:51539 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfHKVqI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Aug 2019 17:46:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466CGP5VLgz9sML;
        Mon, 12 Aug 2019 07:46:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565559966;
        bh=h33Af8Gyr1M6UHVFMb5MGLkdnaeIKnAgggjQ6mL/RoQ=;
        h=Date:From:To:Cc:Subject:From;
        b=TdO3pkJwAYsMHWIwTMMXQzylopoR/Njq4NfVdcOoMd77OpzhQeB7eYUXP8VXPuWnh
         qBbZgrshVp1z90AR8s6zULsFsGNU41zSbEz+MVuV+cmrOvuIHrfF/gYqo//t2lRvdF
         IOH6logH9Fzj4CJwdsVkvT0PxZ2zocTosP6V0vAI8vdwzykwZ2TBug8V6pSTkMDBlm
         ypmWbWF8q5c75gACopbNcIwboNjqXz7SHdu06U40MWQXaG+sgAnPjJt/3zQi6wf31A
         bfLOoSYZ92FRtWW9+VO7IWD7hGkfSUpZD1FWfAysavzBxavEsAla2ucxaFC7eCf7mv
         joDxT4WszLa6A==
Date:   Mon, 12 Aug 2019 07:46:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>
Subject: linux-next: Signed-off-by missing for commit in the security tree
Message-ID: <20190812074604.12beae14@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ssk=Hri6tlh96YbUjO/mBx7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ssk=Hri6tlh96YbUjO/mBx7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  022e43b4645a ("bpf: Restrict bpf when kernel lockdown is in confidentiali=
ty mode")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ssk=Hri6tlh96YbUjO/mBx7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1QjJwACgkQAVBC80lX
0GxIfwf/YxVo/RYGi++V6JajkGBXEHVYkgJtXAWXhSVAXKGVryPAjob7yX8pYb/M
uho9ySB9C4LTcxI2AKbH6r35bzRS8ScnsrdYgUkALhUPXI+nThknU7s9C1Qz0vOo
ya23U0vxlhKw9vG9t1Jg8Aynilxl7Kh1ZonZrm7Nt7ScJq6j6h175k2XEs7IBGj3
e08jwuSVWd7cNwHq4pieqMWMi5oCcu6JoRjPN4Egx1cdysFV5nOqOksX2Qw6dpb3
sIAPvLRjtJ64Qxft3ax+vBW0ssTAqN5WBDEuBJuIHTHEl2qJ4Meha9KeH5X74Uwv
SiBVsK856pHju0q4bEi6koF8btavCA==
=NBTX
-----END PGP SIGNATURE-----

--Sig_/Ssk=Hri6tlh96YbUjO/mBx7--
