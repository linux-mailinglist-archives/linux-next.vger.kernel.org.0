Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62F97104999
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 05:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfKUEKq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 23:10:46 -0500
Received: from ozlabs.org ([203.11.71.1]:56149 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbfKUEKq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Nov 2019 23:10:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47JR1Z2NQ2z9sQp;
        Thu, 21 Nov 2019 15:10:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574309442;
        bh=KNSsTCkEGHKwtRBV/7SKkGsRM3jmjtFbPh1Pt03aJDc=;
        h=Date:From:To:Cc:Subject:From;
        b=Jm1jKOeoxojGd7x41xLOz4LAk5NfKvQnhqua5kRhEuhSE8kLNq6sv1DMyDD3P9HM5
         skhgzf0UWJZpu6GvFqLSoTd5towZ7EgQEnn9ZiLWQJIB5vG9Vn3p98YNsUYfov1ojj
         UVAnnMdoUmKBqyVUxAqShEpdApN7vc9UFKFreDzCxfuSIhgGFJGxMkqum/Juw5eXtR
         d6niYhccSeVzlofwRXmXxP/uV3W9wxN4y5cDcylYFHDADf2XpNM6i6ip5l4xUYEthw
         +znoBP43BHkpeVtBpZLt10hEe7uHF60ONyl/AbqDmjR15/3N+jfBESScaSerkR+BHH
         ePPZFI+LO/Ugg==
Date:   Thu, 21 Nov 2019 15:10:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: linux-next: manual merge of the ftrace tree with the tip tree
Message-ID: <20191121151041.4ff886d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=yf4Axgz9OsFNzeyOjv/5m_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=yf4Axgz9OsFNzeyOjv/5m_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/trace_export.c

between commit:

  60fdad00827c ("ftrace: Rework event_create_dir()")

from the tip tree and commit:

  6dff4d7dd3e0 ("tracing: Make internal ftrace events static")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/trace/trace_export.c
index 6d64c1c19fd5,2e6d2e9741cc..000000000000
--- a/kernel/trace/trace_export.c
+++ b/kernel/trace/trace_export.c
@@@ -142,10 -168,12 +142,10 @@@ static struct trace_event_fields ftrace
  #define F_printk(fmt, args...) __stringify(fmt) ", "  __stringify(args)
 =20
  #undef FTRACE_ENTRY_REG
 -#define FTRACE_ENTRY_REG(call, struct_name, etype, tstruct, print, filter=
,\
 -			 regfn)						\
 -									\
 +#define FTRACE_ENTRY_REG(call, struct_name, etype, tstruct, print, regfn)=
 \
- struct trace_event_class __refdata event_class_ftrace_##call =3D {	\
+ static struct trace_event_class __refdata event_class_ftrace_##call =3D {=
	\
  	.system			=3D __stringify(TRACE_SYSTEM),		\
 -	.define_fields		=3D ftrace_define_fields_##call,		\
 +	.fields_array		=3D ftrace_event_fields_##call,		\
  	.fields			=3D LIST_HEAD_INIT(event_class_ftrace_##call.fields),\
  	.reg			=3D regfn,				\
  };									\

--Sig_/=yf4Axgz9OsFNzeyOjv/5m_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3WDkEACgkQAVBC80lX
0Gztrgf+OdXzHn76B2G0onYDZL25F1WUMjQb4unDbsfTZpD97uiVUi8epBLiAquN
VOs9SMI6aZYF3VjUKrVKZCSCVlwgZCxpMTbo0rgQaow21MIkrq7KjkqhdZekMpSD
9w8dcfeWndyb2pcn26Jz2G5wO3/2zobutgDsnRlksAgQlizOEEPmT3YQt5ic11/z
KhTdj9OLAPzfXVx0ieBHG2vMgmdYyrJ/Ct2DqFeZFXI8yQx0phMIxbBiJKGbkXVz
yJdauXdn0Bo5KcUu802HfT5nJ1Yfz95y8ekgJiSydKZEcgbciKFT1DZuLYulJS7n
C6eT76kWvFOPHJnRxvho8MNnr6EW4g==
=8bSY
-----END PGP SIGNATURE-----

--Sig_/=yf4Axgz9OsFNzeyOjv/5m_--
