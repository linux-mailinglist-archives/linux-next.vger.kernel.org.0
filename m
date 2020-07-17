Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B906622394C
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 12:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGQKbc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 06:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgGQKbb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 06:31:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9690BC061755;
        Fri, 17 Jul 2020 03:31:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7S8c0jq5z9s1x;
        Fri, 17 Jul 2020 20:31:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594981888;
        bh=24NoZ+xXKS7pzE4azUa5D+8MNAhYZHQnDHcQh22XvGg=;
        h=Date:From:To:Cc:Subject:From;
        b=mhYHAC5tFriAoUCPmHi4TYSVbGGz8nlubo1YvFh+WYE+qM+ikRWASkkJv69yTGHJi
         vPlZmTRTfv7etx1ED4vDICl++/81dhHzI7BfPcEV0D9uKtAJC0X2wx23inEkykP+Vr
         wCHvdacLedjnkJ4OA+8rx6xRo8yGK49zgazorukaDZxbBgqEaIJRvTBdFWbfOIzJRb
         jUtAFJ1x4nJsXlILZ3/8tiQOR7MfeN0fTeSuZGbFsGT0cBqFCehjUx4Jttm9OC2gRf
         I1tjP08rK9RN7XC8lqzKw+2u5Etw/cXoaz9LPLDmpqstt2PD9aToNiDtlJiSGOnO7G
         m6GZ22xwJNvmg==
Date:   Fri, 17 Jul 2020 20:31:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Roman Gushchin <guro@fb.com>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200717203127.00db2444@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ESay0Vq+Z/QpSrDUSsdEDuR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ESay0Vq+Z/QpSrDUSsdEDuR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

mm/vmstat.c:614: warning: "MAX_THRESHOLD" redefined
  614 | #define MAX_THRESHOLD 0
      |=20
mm/vmstat.c:172: note: this is the location of the previous definition
  172 | #define MAX_THRESHOLD 125
      |=20
mm/vmstat.c:614: warning: "MAX_THRESHOLD" redefined
  614 | #define MAX_THRESHOLD 0
      |=20
mm/vmstat.c:172: note: this is the location of the previous definition
  172 | #define MAX_THRESHOLD 125
      |=20

Introduced by commit

  5f6bac149e10 ("mm: vmstat: fix /proc/sys/vm/stat_refresh generating false=
 warnings")

The preproccesor directives look like this:

#ifdef CONFIG_SMP
#define MAX_THRESHOLD 125
#ifdef CONFIG_HAVE_CMPXCHG_LOCAL
#else
#define MAX_THRESHOLD 0

So I guess the second MAX_THRESHOLD was put after the wrong #else?

--=20
Cheers,
Stephen Rothwell

--Sig_/ESay0Vq+Z/QpSrDUSsdEDuR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Rff8ACgkQAVBC80lX
0GzcYAf+N3qQXO9/sWNp7DvSSHpOveKIUjaSofsd7+GmP5aVCeoEKskHam7B3U/w
47rNc/QXEcC9PjvS5ZPqoQedtoTa+E5TqiiF1rWsjP1p1NZEQLkLSkB9ntlatjFn
9RDWLKlbi2KkHV+o3VV0RPuhKcsNnWv7qr5iPLTO5wYgIXtVxuhF/eCEr08YDAlk
1BSJFfjvP2CpD9/DKd/ZAY23Gatr/iEL+capOJv+MvxwxxbSl8f+auYpdXsVvKv0
793JrIqUhAKtqC+A93Qu9dIzkS7Q+jgbhOrIt51U45/J4oITbujHCAOVN8+cXhCj
kzJ7eERBiihLrCUXqz1ixClhA1bU2A==
=nfvV
-----END PGP SIGNATURE-----

--Sig_/ESay0Vq+Z/QpSrDUSsdEDuR--
