Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45933202921
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 08:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgFUGdb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 02:33:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56905 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729296AbgFUGda (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Jun 2020 02:33:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qN5w1dTzz9s1x;
        Sun, 21 Jun 2020 16:33:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592721208;
        bh=osK81FAouFRVm3XnKWLXnb25pZwWpqzCUxttjazJ9bY=;
        h=Date:From:To:Cc:Subject:From;
        b=XqVZ9dq0IVkDBDG/l4oEw0RUU0YGcIjxc8ToEyp0NmZQZjgumr4d8LkPiBLqqtqp5
         qGt1EaXAoiOWDCMpRNM91hQnQfc0I2y0EcelwcUktJXWYPfSfzCIVFjPvpAa64Tk8w
         bMEfKjQnQo1BxeX1BxxYpkqkdu7YItPICFtV1P7nb9dlQgKYaqK11dnK3GbmUdDhTb
         AHdEV3pSEoJT3uQ8iybUW9LBDoh6jZbNVBZAGbzCeUXthfcYLwpPp7Kch4fnSivqWB
         NAhYZRkmKSHvujmCXYhGXgvM+SVJHul+bcyXPtR9aFYgu7PdoARFjcnCHwtAqNj8gJ
         fERpyVp+4VfaA==
Date:   Sun, 21 Jun 2020 16:33:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Guenter Roeck <linux@roeck-us.net>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20200621163323.14e8533f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eM3JYHWXRzbJM35X3B/cQ38";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eM3JYHWXRzbJM35X3B/cQ38
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (perf) failed
like this:

In file included from trace/beauty/tracepoints/x86_msr.c:10:
perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: error: initialize=
d field overwritten [-Werror=3Doverride-init]
  292 |  [0xc0010280 - x86_AMD_V_KVM_MSRs_offset] =3D "F15H_PTSC",
      |                                             ^~~~~~~~~~~
perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: note: (near initi=
alization for 'x86_AMD_V_KVM_MSRs[640]')

Caused by commit

  1068ed4547ad ("x86/msr: Lift AMD family 0x15 power-specific MSRs")

I have used the tip tree from next-20200618 for tooday.

--=20
Cheers,
Stephen Rothwell

--Sig_/eM3JYHWXRzbJM35X3B/cQ38
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7u/zMACgkQAVBC80lX
0Gwx8wgAnHV/xGt40eHnOHOX/zLmv3IC6+FQ6birKfHuHu9Phqw2LQG0tki/xSG2
ctpOmXhLnPTAhqmMhj57VMr+p/vrInLVEnqsEzi89rG0eswOsGlKq4lpjBsVI28z
IijeL59ZON4YqsEbUqKrjrxjLPPaYFfbp4xB0C2pgenMdwIiEyO6v7mckX73abtC
x3+JOGfuQE1tCIljWwXC1oitLWlZpTAp+cOsuvdSnHxrJOivkhl/ETE99SCpENzK
d2woGtw1O1Jo00Pbb3li74HM2WAc4nCK8Eu9AHtCXGjY3jhb/I5KfJe6PgcvIjwf
mwgj/Bfgl2g836KCpFJ8GadX4xS3qw==
=G6q7
-----END PGP SIGNATURE-----

--Sig_/eM3JYHWXRzbJM35X3B/cQ38--
