Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4100CA102C
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 06:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbfH2EIb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 00:08:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfH2EIb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 00:08:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Jpxm6mc8z9sBp;
        Thu, 29 Aug 2019 14:08:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567051709;
        bh=V594ezHRVBgHby2RxzNrXyfkuC0Hrx0Pn6E+PGG67L4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EGnf5BXOID37/RjbUsYEbphS+MA/Cz+qKUujDaz8ZwbOlmAmkKchj0TTvl7VMF92n
         m75G8pQ0Se9ezhdBPC6dDFoNlmyHegGTnz4su1my4xKiyJtg63Nl4rPEXP+UCArCMi
         0Zy8eWuK4u6uY8q6CfXfSI4i7orqKTicwX1wNy+USuNB7ioUcANbXjdlmVwM5wXlb3
         R3gS06Ss6KYtsmrUEZ+x4yZD+17EEbJe6NRk1tJYQz+O7Nh8YWte949AMotp2485qW
         BDgFyJIrRvoN86iHPV2zabzQs7YOvovfzC7Af9NQJrjcEttVQfc0qjEzH5TYxxStB8
         eUqJ13znukxBw==
Date:   Thu, 29 Aug 2019 14:08:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20190829140828.39e05c27@canb.auug.org.au>
In-Reply-To: <20190829135150.4f0e533a@canb.auug.org.au>
References: <20190829135150.4f0e533a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LPEdhd6/ifEKkTjJu1CE_N.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LPEdhd6/ifEKkTjJu1CE_N.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 29 Aug 2019 13:51:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> In file included from include/trace/events/iocost.h:8,
>                  from <command-line>:
> include/trace/events/iocost.h:12:57: warning: 'struct ioc_now' declared i=
nside parameter list will not be visible outside of this definition or decl=
aration
>   TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
>                                                          ^~~~~~~
> include/linux/tracepoint.h:233:34: note: in definition of macro '__DECLAR=
E_TRACE'
>   static inline void trace_##name(proto)    \
>                                   ^~~~~
> include/linux/tracepoint.h:396:24: note: in expansion of macro 'PARAMS'
>   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
>                         ^~~~~~
> include/linux/tracepoint.h:532:2: note: in expansion of macro 'DECLARE_TR=
ACE'
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>   ^~~~~~~~~~~~~
> include/linux/tracepoint.h:532:22: note: in expansion of macro 'PARAMS'
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>                       ^~~~~~
> include/trace/events/iocost.h:10:1: note: in expansion of macro 'TRACE_EV=
ENT'
>  TRACE_EVENT(iocost_iocg_activate,
>  ^~~~~~~~~~~
> include/trace/events/iocost.h:12:2: note: in expansion of macro 'TP_PROTO'
>   TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
>   ^~~~~~~~
> include/trace/events/iocost.h:12:18: warning: 'struct ioc_gq' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
>   TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
>                   ^~~~~~
> include/linux/tracepoint.h:233:34: note: in definition of macro '__DECLAR=
E_TRACE'
>   static inline void trace_##name(proto)    \
>                                   ^~~~~
> include/linux/tracepoint.h:396:24: note: in expansion of macro 'PARAMS'
>   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
>                         ^~~~~~
> include/linux/tracepoint.h:532:2: note: in expansion of macro 'DECLARE_TR=
ACE'
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>   ^~~~~~~~~~~~~
> include/linux/tracepoint.h:532:22: note: in expansion of macro 'PARAMS'
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>                       ^~~~~~
> include/trace/events/iocost.h:10:1: note: in expansion of macro 'TRACE_EV=
ENT'
>  TRACE_EVENT(iocost_iocg_activate,
>  ^~~~~~~~~~~
> include/trace/events/iocost.h:12:2: note: in expansion of macro 'TP_PROTO'
>   TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
>   ^~~~~~~~
>=20
> (and many more)
>=20
> Introduced by commit
>=20
>   7caa47151ab2 ("blkcg: implement blk-iocost")
>=20
> To get these warnings you need to build with CONFIG_HEADER_TEST and
> CONFIG_KERNEL_HEADER_TEST (and maybe CONFIG_UAPI_HEADER_TEST).
> allmodconfig does that.

I have applied this patch to linux-next for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Aug 2019 14:03:43 +1000
Subject: [PATCH] blkcg: blk-iocost: predeclare used structs

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/trace/events/iocost.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
index ec2217dd57ac..7ecaa65b7106 100644
--- a/include/trace/events/iocost.h
+++ b/include/trace/events/iocost.h
@@ -2,6 +2,10 @@
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM iocost
=20
+struct ioc;
+struct ioc_now;
+struct ioc_gq;
+
 #if !defined(_TRACE_BLK_IOCOST_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_BLK_IOCOST_H
=20
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/LPEdhd6/ifEKkTjJu1CE_N.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1nT7wACgkQAVBC80lX
0GxmyQf/V2S8PWyQciwZmRgs0stJeCed4Sth4fT+Zel8Nz7uxvPQV7cKEsCf1Zbf
HgseK5dhgIVgiZfvdxRnOVQ0PnU5NrXziLbOryUniQHa/WAhvkNekpTBDEzX9aEE
JVr+AgBU/SXhwus/NPWnNVWnt2Eh7DvnJfR6hu7JaSpxDECIHejV/IqLvAu8+yCV
gGKvHFkoMOMFnNie4OX0OiyGdtcv8O7Fp3jdo5DMnPJl92EyD9lKggeSvkuxI2Os
gB1OY5FB5C5rbY9kUHvEVA4RfjPV9ibkightrB7xEf/GyW5VDZPwQoDEOj5l8YJX
gvHA283UnopdNH4VKsAJlI2yoBmNEQ==
=mqdU
-----END PGP SIGNATURE-----

--Sig_/LPEdhd6/ifEKkTjJu1CE_N.--
