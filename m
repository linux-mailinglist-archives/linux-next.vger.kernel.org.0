Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE5F610C11D
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 01:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfK1ArJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 19:47:09 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726947AbfK1ArJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Nov 2019 19:47:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Nf9P4kGCz9sRc;
        Thu, 28 Nov 2019 11:47:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574902026;
        bh=Nzi2yvwNdVNDAQPLExfA+w5TED31z+K4duO7wdrACd4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cCXLuSntHwNFLWnftlpmQ8E7FHybcr9nz4kOWWJ0sKC5hr3vy04t9WBACULi7yrJh
         /bcgzXDE+gKrxRbWeyb5Xt/mJar5DZnMng50vo1DlGdt3302wEBAb73T7QofwFaqTn
         F5Lws3tlaznKFQTF4L8OAlBPsf1LdbPuOLu4WxGKa7NCo33Bw83w7yuE82yC0hWW4m
         qHbreliyhR3qEfF7WUGr2522c5suS4rE9dCex5tCIYIUL6oItXRY4NOSQgLude3Vsp
         3jJb5XiPu2o7rmaK7fCSi/uuD9HtZHXXAGXR4oQyFYnhm0WJocaCq4dnx2bqTEqJfI
         Z94cM45IzC99Q==
Date:   Thu, 28 Nov 2019 11:47:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the tip tree
Message-ID: <20191128114704.7d705a98@canb.auug.org.au>
In-Reply-To: <20191121151041.4ff886d5@canb.auug.org.au>
References: <20191121151041.4ff886d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XaCCTprV_87L6q.X_BJH3e=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XaCCTprV_87L6q.X_BJH3e=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 21 Nov 2019 15:10:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the ftrace tree got a conflict in:
>=20
>   kernel/trace/trace_export.c
>=20
> between commit:
>=20
>   60fdad00827c ("ftrace: Rework event_create_dir()")
>=20
> from the tip tree and commit:
>=20
>   6dff4d7dd3e0 ("tracing: Make internal ftrace events static")
>=20
> from the ftrace tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc kernel/trace/trace_export.c
> index 6d64c1c19fd5,2e6d2e9741cc..000000000000
> --- a/kernel/trace/trace_export.c
> +++ b/kernel/trace/trace_export.c
> @@@ -142,10 -168,12 +142,10 @@@ static struct trace_event_fields ftrace
>   #define F_printk(fmt, args...) __stringify(fmt) ", "  __stringify(args)
>  =20
>   #undef FTRACE_ENTRY_REG
>  -#define FTRACE_ENTRY_REG(call, struct_name, etype, tstruct, print, filt=
er,\
>  -			 regfn)						\
>  -									\
>  +#define FTRACE_ENTRY_REG(call, struct_name, etype, tstruct, print, regf=
n) \
> - struct trace_event_class __refdata event_class_ftrace_##call =3D {	\
> + static struct trace_event_class __refdata event_class_ftrace_##call =3D=
 {	\
>   	.system			=3D __stringify(TRACE_SYSTEM),		\
>  -	.define_fields		=3D ftrace_define_fields_##call,		\
>  +	.fields_array		=3D ftrace_event_fields_##call,		\
>   	.fields			=3D LIST_HEAD_INIT(event_class_ftrace_##call.fields),\
>   	.reg			=3D regfn,				\
>   };									\

This is now a conflict between the tip tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XaCCTprV_87L6q.X_BJH3e=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fGQgACgkQAVBC80lX
0Gz3PwgAhkbyX2A7n+vXliUgkxh6yW0j7vGTwsr9aPxgxwbnoWDQPhDmG0pxCLPB
o2+A9nM/biyz+KSePgc2EqP8G0e4iNCTzg0tmJ8a/tOU9GcCTx37ncnK9NRoXDom
LMJWhdgNouBwPhsE5ZODNGL5ZhkCRYDC/iSr6EQcX/CBS+bC0bnYJDz/c0fQ1TsR
E3fKJCmP2+kBgvbfN5V+i/HKwJxNd22f+yws+EzfJKKoeKlISjjvwwlUgI+1lOa1
wPTzY9Uq3wMn41G/FQuqm0LUinIeZ+iJEwDtxfWjRuRkL6Pg4vXfFVdvitDh93vf
4TQh2/Lo3ro1oHvPAOus0zGtGQY1bw==
=K6Zq
-----END PGP SIGNATURE-----

--Sig_/XaCCTprV_87L6q.X_BJH3e=--
