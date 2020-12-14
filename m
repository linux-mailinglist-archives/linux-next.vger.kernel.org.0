Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365592DA158
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502847AbgLNUTY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388136AbgLNUTV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:19:21 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80913C0613D3
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 12:18:41 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E512F2C1;
        Mon, 14 Dec 2020 20:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E512F2C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607977064; bh=QLI/egtl/FomJoWgApEqMIP5NgPgYuRFAI2eyPIlVK0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G04smzzbupfuSYIT2doemW6+DddWm9fDKYjHMZtEeMr9KDgGFK0lTotg4pTOk+BWu
         oNgJevOGttLeWPYQR3bJF9KDeHeds5C2hEJ2cgFA2pnvxk9D1wZcfLr1DZ08dscK5B
         KMTeb6zyn2QTnHpGLjuAGHFmfQ8AOHbkQDRbyzw051iM5Tber7RUHjMHWFALFC+5/v
         hiUMdf+V+rgrgOsEhEk5pTilg/s6fCw5soQwyduZQhlUI0jC5EcY8nO0NoqQwMZuqk
         0orElOBUnGFdl0+urICeEO4AVen3BQxCEfsN76wwMAkBx6cx8PpqA4c+9zq/kjEbl1
         9k0vdUPARrUGQ==
Date:   Mon, 14 Dec 2020 13:17:42 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wang Qing <wangqing@vivo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20201214131742.20d2252f@lwn.net>
In-Reply-To: <20201215065143.65ccf365@canb.auug.org.au>
References: <20201116170303.0d457d04@canb.auug.org.au>
        <20201215065143.65ccf365@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 15 Dec 2020 06:51:43 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Mon, 16 Nov 2020 17:03:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the jc_docs tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Documentation/translations/zh_CN/filesystems/tmpfs.rst:5: WARNING: unde=
fined label: tmpfs_index (if the link has no caption the label must precede=
 a section header)
> >=20
> > Introduced by commit
> >=20
> >   09028e60fcea ("doc: zh_CN: add translatation for tmpfs") =20
>=20
> I am still getting this warning.

OK, enough of that; I've just tacked on the following patch to address
this problem, thanks for the report.

Thanks,

jon

=46rom 47e44ed01434e51e2e42b188482d837c01e5d16e Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 14 Dec 2020 13:14:22 -0700
Subject: [PATCH] docs: fix broken cross reference in translations/zh_CN

Commit 09028e60fcea ("doc: zh_CN: add translatation for tmpfs") introduced
a cross reference without adding the appropriate target tag, leading to
this docs-build warning:

  Documentation/translations/zh_CN/filesystems/tmpfs.rst:5: WARNING: undefi=
ned label: tmpfs_index (if the link has no caption the label must precede a=
 section header)

With automarkup, we don't actually need an explicit reference here at all,
so just take it out.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 09028e60fcea ("doc: zh_CN: add translatation for tmpfs")
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/translations/zh_CN/filesystems/tmpfs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/filesystems/tmpfs.rst b/Docum=
entation/translations/zh_CN/filesystems/tmpfs.rst
index cf3ccab20e50..6fd9d83b2db5 100644
--- a/Documentation/translations/zh_CN/filesystems/tmpfs.rst
+++ b/Documentation/translations/zh_CN/filesystems/tmpfs.rst
@@ -2,7 +2,7 @@
=20
 .. include:: ../disclaimer-zh_CN.rst
=20
-:Original: :ref:`Documentation/filesystems/tmpfs.rst <tmpfs_index>`
+:Original: Documentation/filesystems/tmpfs.rst
=20
 translated by Wang Qing<wangqing@vivo.com>
=20
--=20
2.28.0

