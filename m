Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA6734A2C3
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 08:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhCZHzR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 03:55:17 -0400
Received: from ozlabs.org ([203.11.71.1]:59527 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229892AbhCZHyt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Mar 2021 03:54:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F6DlR3ds9z9sS8;
        Fri, 26 Mar 2021 18:54:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616745283;
        bh=klg5vb6b6NpRbw9txYhhP9AO24AiTa6YB6+9hCJTzqM=;
        h=Date:From:To:Cc:Subject:From;
        b=Luu7R/j5FX76jQcEedW201TkDoX86QS37ryDdEKhkGdhWcB7WKbRCxxozB00tRPnN
         7CSb0RIacDhBRo1QCcfY3XQgjPGyJwYNSOmyS9tctsz7CkliyUChFzSasm03y6+pmC
         oXWvqfph41SRIT+y6jf/Lfw2g+rrdOHw/AV2TBJQto+ZOhaaxiVKxc29AS/JJUaYi/
         dSxzTIDsssrvKHTVLATV4/a6VdfhfXP+1ixkMZIdtIF01dFk5FMEfCj6/3aEYQN4m3
         8GVfBPGAeAVSwm017Mq3baIBffNwJz/Rm8DEPyFvdsd3/yklgyR16wkTqDEVH259Z+
         uBu+J9S+TdfmQ==
Date:   Fri, 26 Mar 2021 18:54:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the jc_docs tree
Message-ID: <20210326185440.42ea948a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KyC6t50SD7MyCMMru1ZVt8J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KyC6t50SD7MyCMMru1ZVt8J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced these warnings:

include/linux/pstore_zone.h:55: warning: Function parameter or member 'writ=
e' not described in 'pstore_zone_info'
include/linux/pstore_blk.h:43: warning: Function parameter or member 'write=
' not described in 'pstore_device_info'
include/media/v4l2-mediabus.h:127: warning: Function parameter or member 't=
ype' not described in 'v4l2_mbus_config'

and many more similar. These appear to be false positives :-(

Introduced by commit

  8d295fbad687 ("kernel-doc: better handle '::' sequences")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/KyC6t50SD7MyCMMru1ZVt8J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBdk0AACgkQAVBC80lX
0Gxftwf+Kga3Dom/LgRUrQ8M5uZX8bBOtRrpDwgqeXUfn2ovjohnJot1CC1cN4VO
dh5JDigSV5qG8CXphkI+Y/kwu5Suyh2w5RC5JKXsuo/3eaIkDF9SzzKDyvncSlsn
D4QVdtWS5fhZUAUaLdN4h4oQklMY9JrMoHzIYZ0VIjqnhkthvXrMSMqZBTlmGUHq
tKWDiIKfka8G9rdCda/x+SldUEjJcPOs92smO7LOTznL6/ZHtMkGDq+BmAz3tBKB
w5hczIdVfWL/mAIpVpfMhjzRlU4nsy5BhRihAdisdY1999SX3zy8aGEjiKuXW1h4
dQXxhgz586iWvejOC96JEkYW1AK/cg==
=w6es
-----END PGP SIGNATURE-----

--Sig_/KyC6t50SD7MyCMMru1ZVt8J--
