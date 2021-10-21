Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53BA4358C6
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 05:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhJUDGA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 23:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhJUDGA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 23:06:00 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C201C06161C;
        Wed, 20 Oct 2021 20:03:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZXP93j7Kz4xbP;
        Thu, 21 Oct 2021 14:03:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634785423;
        bh=dc66k0dF4z0ZXASyBO1m1mvqt3iGvOAXX1j0VuG87XI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WK/sZdqkN5vYcJkruddisnKTo6MGL8QBu6bIm8xyuaxNG3bqhZ6HemIgKMtMmgiIC
         bNtBv+N/F7qv4mYq4N7Oq0GSo5Fd5BqxrhemE/WtimXmT4u+QjSMlnmDh5t+YVkXaA
         SRWqVet3LJgP+QTBCYY7n0pOLMUQdw5Feh6rCjoftYQQc6dzSVDOrYHJaFGydRmcre
         ebzDGzwFftdVxY0DN6IEOmeo37KkkbOeltS6xFZ9nVnTXhnKzIGMO09tb6/WiLPGu4
         2aTul6pyg5dFpz0cPymQs4PWZ7xHjt7xWFKbVGs5xd10w7zWeHYEq/fUXMBrf726im
         glUSo+zvP+jqA==
Date:   Thu, 21 Oct 2021 14:03:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20211021140340.139eab65@canb.auug.org.au>
In-Reply-To: <20210920113809.18b9b70c@canb.auug.org.au>
References: <20210917115859.6cfc64a5@canb.auug.org.au>
        <20210920113809.18b9b70c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5A65ZPteqLRstCVN1y.t1LF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5A65ZPteqLRstCVN1y.t1LF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Sep 2021 11:38:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 17 Sep 2021 11:58:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the tip tree, today's linux-next build (x86_64 allmodconf=
ig)
> > produced this warning:
> >=20
> > vmlinux.o: warning: objtool: mce_setup()+0x22: call to memset() leaves =
.noinstr.text section
> > vmlinux.o: warning: objtool: do_machine_check()+0x51: call to mce_gathe=
r_info() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter()+0x0: call to rcu_=
dynticks_task_trace_enter() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit()+0xe: call to rcu_d=
ynticks_task_trace_exit() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: rcu_nmi_enter()+0x36: call to __kasan_chec=
k_read() leaves .noinstr.text section =20
>=20
> Today, we added these:
>=20
> vmlinux.o: warning: objtool: xen_irq_disable()+0xa: call to preempt_count=
_add() leaves .noinstr.text section
> vmlinux.o: warning: objtool: xen_irq_enable()+0xb: call to preempt_count_=
add() leaves .noinstr.text section
> vmlinux.o: warning: objtool: check_preemption_disabled()+0x81: call to is=
_percpu_thread() leaves .noinstr.text section
>=20
> and the rcu_nmi_enter one changed to:
>=20
> vmlinux.o: warning: objtool: rcu_nmi_enter()+0x5d: call to __kasan_check_=
read() leaves .noinstr.text section

Currently, I am getting these:

vmlinux.o: warning: objtool: xen_irq_disable()+0xa: call to preempt_count_a=
dd() leaves .noinstr.text section
vmlinux.o: warning: objtool: xen_irq_enable()+0xb: call to preempt_count_ad=
d() leaves .noinstr.text section
vmlinux.o: warning: objtool: mce_setup()+0x22: call to memset() leaves .noi=
nstr.text section
vmlinux.o: warning: objtool: do_machine_check()+0x99: call to mce_gather_in=
fo() leaves .noinstr.text section

(the rcu ones are gone once I merge the rcu tree)
--=20
Cheers,
Stephen Rothwell

--Sig_/5A65ZPteqLRstCVN1y.t1LF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFw2IwACgkQAVBC80lX
0GyeAAf8CTQW1u+V7fkxqlJpIpcoklJq0DDh0M3NLko4/AqoXl/Sg6jWOp6KsWrd
DzSaNPuSp5Lz0Gi99In/lpe6m232Gl8MstZg9e1GzDRJDdKmhwOTaogSjr/otZHI
544AMC8duXZuNmOU2slkSXE0nskRpszgULyTh5IQMV/SXdxh8Atppsg6H4ZRQzJ7
jfsC4UIoQrY9+bb9/+90ml/2dczmsoYC4Z3+fgcOrcdfSqoPsSC/Tz319K1988LC
yC3gOx+mwzzoglHjeKI/N7bs5lbFU2QvcNibdOZ3Q9n+A+QWfdjinXsA7Zvp/M/g
pByMu9lM4StxgzVQOlWdvMUpFPZCYA==
=xttI
-----END PGP SIGNATURE-----

--Sig_/5A65ZPteqLRstCVN1y.t1LF--
