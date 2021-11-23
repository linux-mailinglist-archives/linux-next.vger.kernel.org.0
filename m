Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D15459B8A
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 06:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhKWFYu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 00:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhKWFYu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 00:24:50 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EBEC061574;
        Mon, 22 Nov 2021 21:21:42 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hysv65xtWz4xbC;
        Tue, 23 Nov 2021 16:21:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637644900;
        bh=3SUPm4Wktpjpj3Cyphqo++ZVF3wwgmM/YcqCM96N0Ww=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CVZwvspyTUteNlmX2SxPtSnxFjUNEA1D/eUF+7SKwv94OjQ/RPcJumxu0VKJXIX4v
         XWZdI58YGaGE9bKaVEqLKru9qSbAy5Ox/h0LZGYQoYayblwRKcM5kkOjybznmxGvW4
         g/8SMZcAmp0Azwv/DpV8sepMJIx5kihfhSsO4cWgzv07pFzz/qcl6YskVEITbGZNuM
         9WI1g1/1u2P/6XpB2/e2OCi0LfRPCFfd5zWgn60lwCUqdSfkljfrko87FmzbDMNfgE
         VQubkg0X4/msC6fx30KD7rqUcLdFjvattSRbgbKqMqcY4vDDr0LlBkqPWdbw/n7e/B
         K8L/8afU3iVrw==
Date:   Tue, 23 Nov 2021 16:21:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20211123162137.3a8b729f@canb.auug.org.au>
In-Reply-To: <YURQlNtL00f1HWVe@hirez.programming.kicks-ass.net>
References: <20210917115859.6cfc64a5@canb.auug.org.au>
        <YURQlNtL00f1HWVe@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9HaD_NijYfn2lFBOZQv3Ynz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9HaD_NijYfn2lFBOZQv3Ynz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 17 Sep 2021 10:23:48 +0200 Peter Zijlstra <peterz@infradead.org> wr=
ote:
>
> On Fri, Sep 17, 2021 at 11:58:59AM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the tip tree, today's linux-next build (x86_64 allmodconf=
ig)
> > produced this warning:
> >=20
> > vmlinux.o: warning: objtool: mce_setup()+0x22: call to memset() leaves =
.noinstr.text section
> > vmlinux.o: warning: objtool: do_machine_check()+0x51: call to mce_gathe=
r_info() leaves .noinstr.text section =20
>=20
> Those are pre-existing and Boris is lokoing into them

I am still seeing the above 2 warnings and also now:

vmlinux.o: warning: objtool: xen_get_debugreg()+0xb: call to HYPERVISOR_get=
_debugreg() leaves .noinstr.text section
vmlinux.o: warning: objtool: xen_set_debugreg()+0x15: call to HYPERVISOR_se=
t_debugreg.isra.0() leaves .noinstr.text section

Presumably caused by

  f4afb713e5c3 ("x86/xen: Make get_debugreg() noinstr")
  7361fac0465b ("x86/xen: Make set_debugreg() noinstr")

--=20
Cheers,
Stephen Rothwell

--Sig_/9HaD_NijYfn2lFBOZQv3Ynz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcemEACgkQAVBC80lX
0GwfvQf/WRtEEXCaiT0WTMImL9cv0udYLC8yYHmvt86DXWCoGSddMwQGFHMxeE+F
E3nKpvVPMm+aFDti3kkFDCmNm4QH65UNjks5z4ros33M5pSb94M7ifp54LXDld7b
w+0T7ZHOb9xjOrLV6TcyEbM5CrHzvoptTnwdCmhWzoUEcs6B5F7cuKIzMssFUFEo
jzspMsv/PhReLYZDkzLEj7/yjkayt+vUPzVy/4mkQ7MsyDhE5zvFgewfLiov47lq
UOLiiuXlt1Q+QTTmIjTYGBCAFgXm/UJmIFEs7serTiKVqxFgWwSsG/7uPDvzM/FF
5SX1DqgI6FdwmZmSvQTQseGJNmcwxQ==
=vO3/
-----END PGP SIGNATURE-----

--Sig_/9HaD_NijYfn2lFBOZQv3Ynz--
