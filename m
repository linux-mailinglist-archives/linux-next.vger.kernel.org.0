Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F007113B552
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 23:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgANWaN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 17:30:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38797 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbgANWaN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jan 2020 17:30:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47y4sH0VLmz9sPW;
        Wed, 15 Jan 2020 09:30:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579041011;
        bh=NEyZJYZ0Wq7zlfwJk42V8nW+vPRzTpG+cWsKZeFQRgA=;
        h=Date:From:To:Cc:Subject:From;
        b=faeHL1MeMav1a0X+8Y1c6OAfPBA398tCKV5VoATsdSz/6aCifZ3fBP006RgLmvPd4
         M8PRf7UDDzxFApb7/1HNQ5HRyev1pQAgutXOEMRzrgvtyRFtnpDahdmchIfOUTr3Fm
         N8drLu9W5J6431wDQhWDxikiv2MD+nnRRrsd5O6mkENl/s7IgxFMMigEWct+aI9+c6
         2TMAnPMJDpc9mET4iwIBiJPlrToLWQWGg168nnYLObbEE1PDBr2UgsmOvZ4c8qZOnA
         CWLprIYI0FIM3vxUOhSzC/kDgWfGR6+p1BEuvTSzbOOIZRjmHhlodmLUuloOnMfLj4
         tHcvxX1AUpZlA==
Date:   Wed, 15 Jan 2020 09:30:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nikolay Borisov <nborisov@suse.com>
Subject: linux-next: build warnings after merge of the btrfs tree
Message-ID: <20200115093004.1a4a6794@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hS6V9eJG40BaX1ithXhU/rw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hS6V9eJG40BaX1ithXhU/rw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warnings:

fs/btrfs/block-group.c: In function 'exclude_super_stripes':
fs/btrfs/block-group.c:1706:5: warning: 'logical' may be used uninitialized=
 in this function [-Wmaybe-uninitialized]
 1706 |     kfree(logical);
      |     ^~~~~~~~~~~~~~
fs/btrfs/block-group.c:1691:20: warning: 'stripe_len' may be used uninitial=
ized in this function [-Wmaybe-uninitialized]
 1691 |    if (logical[nr] + stripe_len <=3D cache->start)
      |        ~~~~~~~~~~~~^~~~~~~~~~~~

Introduced by commit

  767f58cdaf20 ("btrfs: Refactor btrfs_rmap_block to improve readability")

btrfs_rmap_block() returns zero even if its output arguments are not
assigned to ... maybe the final "return 0" should be "return ret"?

--=20
Cheers,
Stephen Rothwell

--Sig_/hS6V9eJG40BaX1ithXhU/rw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4eQO0ACgkQAVBC80lX
0GxQbwf9Hg+Wi6//EPHnaAr2giyKJhiYRS2Ms9Xm9pz7Ik78TQErqjqmv0zFZ3mZ
+FwowhYgb+xxdaZgo+15oUMlxqkN2Xigdsj9hcVsq7nq2W2E1GlFSuBTdIxI03rh
AKvT4NhSGJFo10S8tWSDLhnqgdmhn2EoIAGMq1AFSgaLuun88Z9PcSbl/9qf8GfK
FbewHJgSAoNc4/DIwsR+HuP2tBTLXCdgJ9/9LeXFdPJvWTvApC3HYqlK6gim0VGn
0szrB5MguWCrKEEVi/hjyOa4ikMcIiDxMAJW/SaZNZBWDM+VTLFdbKaqErl6SYcW
0pV3pSvMSlmGWWO5ORGulLYnAV/AuA==
=NpJ1
-----END PGP SIGNATURE-----

--Sig_/hS6V9eJG40BaX1ithXhU/rw--
