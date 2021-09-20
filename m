Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D900410E2F
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 03:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233654AbhITBjj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Sep 2021 21:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbhITBji (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Sep 2021 21:39:38 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C064AC061574;
        Sun, 19 Sep 2021 18:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632101890;
        bh=UNBRCHlOkXAb+E+3h5vtkCLRDugYJ+CFGeOcnTjVFiQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a88zBUt3AaDFFxhHGqZpwpWsIQ3A3vVG6+wUi5/w6DBFiTkqT532KysPUMKk2D8xU
         3gQOPKs8HbKkXDF96VcVt0pnyIDFRDqhdCBRJlu8ZWSyDu6PaxNxv4qOrothV4+7gS
         4hP2xeVOpyfFh0Cu8UqUEBDMWFCUyyWWeCmryvw6/6Djq7HZ7N+qtHZohXSLV7Qdyp
         +ORsrIOpMcXV6daM2ecHmiDpv8scLG0vS8uStBNqQowmdpiC9HAZiGRvfTMBzLJvpA
         a2OAoTPOm6zS9F8+qn/FAz9Vs2xlg2EejMkx+1ZCZuiyMhR7CfUs8HGc6TaSiUbBfb
         38KzOqLPZGJsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCRyp2mVFz9sCD;
        Mon, 20 Sep 2021 11:38:10 +1000 (AEST)
Date:   Mon, 20 Sep 2021 11:38:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20210920113809.18b9b70c@canb.auug.org.au>
In-Reply-To: <20210917115859.6cfc64a5@canb.auug.org.au>
References: <20210917115859.6cfc64a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ce2hzCRMA1Va1v0.wjfFUid";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ce2hzCRMA1Va1v0.wjfFUid
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 17 Sep 2021 11:58:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> vmlinux.o: warning: objtool: mce_setup()+0x22: call to memset() leaves .n=
oinstr.text section
> vmlinux.o: warning: objtool: do_machine_check()+0x51: call to mce_gather_=
info() leaves .noinstr.text section
> vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter()+0x0: call to rcu_dy=
nticks_task_trace_enter() leaves .noinstr.text section
> vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit()+0xe: call to rcu_dyn=
ticks_task_trace_exit() leaves .noinstr.text section
> vmlinux.o: warning: objtool: rcu_nmi_enter()+0x36: call to __kasan_check_=
read() leaves .noinstr.text section

Today, we added these:

vmlinux.o: warning: objtool: xen_irq_disable()+0xa: call to preempt_count_a=
dd() leaves .noinstr.text section
vmlinux.o: warning: objtool: xen_irq_enable()+0xb: call to preempt_count_ad=
d() leaves .noinstr.text section
vmlinux.o: warning: objtool: check_preemption_disabled()+0x81: call to is_p=
ercpu_thread() leaves .noinstr.text section

and the rcu_nmi_enter one changed to:

vmlinux.o: warning: objtool: rcu_nmi_enter()+0x5d: call to __kasan_check_re=
ad() leaves .noinstr.text section
--=20
Cheers,
Stephen Rothwell

--Sig_/ce2hzCRMA1Va1v0.wjfFUid
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFH5gEACgkQAVBC80lX
0Gx/rAf3WFoYCdBOEecpOUMgqU5f5rCx0jyZwNQKAcN0zkEywxyeNHYz5ldv1sX9
aWxTDP0lQ4WgIH9GEzCAqHWPFbPm9tmgGf0N86xitb6ag0+jVD22AKt+EUatiLTB
YHcyaO+80yGD0cL/MuBf/lFc1ESXWXHb4d24G3Z+hHLP0KrfEO+hIhtyzzfTs4vm
2gqIqf5h6HFEWT7lfw3kCH9ZePCBgVUe9MBrXjdObf3NdJPL8J9XK8qbj6ieMkyX
RVE3UbZJC9DvT4UkPjGble77ekzJm+ISsNTo3xy0TjjG8mf7/fEAIoZ3XarVxtWv
7Ta/oArMGh8tlEHQoJaLDiifssgf
=DFqI
-----END PGP SIGNATURE-----

--Sig_/ce2hzCRMA1Va1v0.wjfFUid--
