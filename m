Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2010A202E1E
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 03:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgFVBia (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 21:38:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:32931 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726616AbgFVBi3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Jun 2020 21:38:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qsW52Q87z9sRf;
        Mon, 22 Jun 2020 11:38:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592789906;
        bh=gFKLnB8nhbKKuTEnbfrhDS9nVWeNL8Gq938DTMzHiqQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bs0pq449QlG9p7XUF3biwtOL8yPNp5N6i1/Gg6VYcNNnaMp9DQMT6KVCUiq1Pm5dJ
         19zR0SkLQDGZmrjNK8Eko/V8JLw+q9tuciSkLeLx/Eem1iHHCwmQesSfXTqseuV7Bw
         ODFSqPEo5hcpDhIx+naodrs/bjgElOxlbivM+T2D+1Fy6ASq+XBhGI8O/JPwPrmYch
         nl6Al+QrH4cXy9GFVk+XdLb+37RCzt7alKKCWuEn+KOyq43hFO+uFo83u83xLGiA3N
         zD5cCrvfOU+Ev17qQmhJ2vnc8CZHDjPKc+2VQKdIvceO/+G/G2VYLhqQ2frEQVn94c
         uTFHU749tSo7g==
Date:   Mon, 22 Jun 2020 11:38:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200622113824.6a3ab82f@canb.auug.org.au>
In-Reply-To: <20200621105350.GA28206@zn.tnic>
References: <20200621163323.14e8533f@canb.auug.org.au>
        <20200621105350.GA28206@zn.tnic>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ON7aHcUF6v.+g+q+iDPDmte";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ON7aHcUF6v.+g+q+iDPDmte
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Sun, 21 Jun 2020 12:53:50 +0200 Borislav Petkov <bp@alien8.de> wrote:
>
> + acme for an FYI.
>=20
> On Sun, Jun 21, 2020 at 04:33:23PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the tip tree, today's linux-next build (perf) failed
> > like this:
> >=20
> > In file included from trace/beauty/tracepoints/x86_msr.c:10:
> > perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: error: initia=
lized field overwritten [-Werror=3Doverride-init]
> >   292 |  [0xc0010280 - x86_AMD_V_KVM_MSRs_offset] =3D "F15H_PTSC",
> >       |                                             ^~~~~~~~~~~
> > perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: note: (near i=
nitialization for 'x86_AMD_V_KVM_MSRs[640]')
> >=20
> > Caused by commit
> >=20
> >   1068ed4547ad ("x86/msr: Lift AMD family 0x15 power-specific MSRs")
> >=20
> > I have used the tip tree from next-20200618 for tooday. =20
>=20
> Thanks, I saw that once but then got distracted to something of higher
> prio. :-\
>=20
> I'll apply this after testing it a bit:
>=20
> ---
> From: Borislav Petkov <bp@suse.de>
> Date: Sun, 21 Jun 2020 12:41:53 +0200
> Subject: [PATCH] x86/msr: Move the F15h MSRs where they belong
>=20
> 1068ed4547ad ("x86/msr: Lift AMD family 0x15 power-specific MSRs")
>=20
> moved the three F15h power MSRs to the architectural list but that was
> wrong as they belong in the family 0x15 list. That also caused:
>=20
>   In file included from trace/beauty/tracepoints/x86_msr.c:10:
>   perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: error: initia=
lized field overwritten [-Werror=3Doverride-init]
>     292 |  [0xc0010280 - x86_AMD_V_KVM_MSRs_offset] =3D "F15H_PTSC",
>         |                                             ^~~~~~~~~~~
>   perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: note: (near i=
nitialization for 'x86_AMD_V_KVM_MSRs[640]')
>=20
> due to MSR_F15H_PTSC ending up being defined twice. Move them where they
> belong and drop the duplicate.
>=20
> While at it, update the msr-index.h copy to pick up the changes from
>=20
>   7e5b3c267d25 ("x86/speculation: Add Special Register Buffer Data Sampli=
ng (SRBDS) mitigation")
>=20
> Fixes: 1068ed4547ad ("x86/msr: Lift AMD family 0x15 power-specific MSRs")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> ---
>  arch/x86/include/asm/msr-index.h       | 5 ++---
>  tools/arch/x86/include/asm/msr-index.h | 9 ++++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-=
index.h
> index eb9537254920..63ed8fe35738 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -422,11 +422,8 @@
>  #define MSR_AMD_PERF_CTL		0xc0010062
>  #define MSR_AMD_PERF_STATUS		0xc0010063
>  #define MSR_AMD_PSTATE_DEF_BASE		0xc0010064
> -#define MSR_F15H_CU_PWR_ACCUMULATOR     0xc001007a
> -#define MSR_F15H_CU_MAX_PWR_ACCUMULATOR 0xc001007b
>  #define MSR_AMD64_OSVW_ID_LENGTH	0xc0010140
>  #define MSR_AMD64_OSVW_STATUS		0xc0010141
> -#define MSR_F15H_PTSC			0xc0010280
>  #define MSR_AMD_PPIN_CTL		0xc00102f0
>  #define MSR_AMD_PPIN			0xc00102f1
>  #define MSR_AMD64_CPUID_FN_1		0xc0011004
> @@ -469,6 +466,8 @@
>  #define MSR_F16H_DR0_ADDR_MASK		0xc0011027
> =20
>  /* Fam 15h MSRs */
> +#define MSR_F15H_CU_PWR_ACCUMULATOR     0xc001007a
> +#define MSR_F15H_CU_MAX_PWR_ACCUMULATOR 0xc001007b
>  #define MSR_F15H_PERF_CTL		0xc0010200
>  #define MSR_F15H_PERF_CTL0		MSR_F15H_PERF_CTL
>  #define MSR_F15H_PERF_CTL1		(MSR_F15H_PERF_CTL + 2)
> diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/incl=
ude/asm/msr-index.h
> index 7dfd45bb6cdb..63ed8fe35738 100644
> --- a/tools/arch/x86/include/asm/msr-index.h
> +++ b/tools/arch/x86/include/asm/msr-index.h
> @@ -128,6 +128,10 @@
>  #define TSX_CTRL_RTM_DISABLE		BIT(0)	/* Disable RTM feature */
>  #define TSX_CTRL_CPUID_CLEAR		BIT(1)	/* Disable TSX enumeration */
> =20
> +/* SRBDS support */
> +#define MSR_IA32_MCU_OPT_CTRL		0x00000123
> +#define RNGDS_MITG_DIS			BIT(0)
> +
>  #define MSR_IA32_SYSENTER_CS		0x00000174
>  #define MSR_IA32_SYSENTER_ESP		0x00000175
>  #define MSR_IA32_SYSENTER_EIP		0x00000176
> @@ -418,11 +422,8 @@
>  #define MSR_AMD_PERF_CTL		0xc0010062
>  #define MSR_AMD_PERF_STATUS		0xc0010063
>  #define MSR_AMD_PSTATE_DEF_BASE		0xc0010064
> -#define MSR_F15H_CU_PWR_ACCUMULATOR     0xc001007a
> -#define MSR_F15H_CU_MAX_PWR_ACCUMULATOR 0xc001007b
>  #define MSR_AMD64_OSVW_ID_LENGTH	0xc0010140
>  #define MSR_AMD64_OSVW_STATUS		0xc0010141
> -#define MSR_F15H_PTSC			0xc0010280
>  #define MSR_AMD_PPIN_CTL		0xc00102f0
>  #define MSR_AMD_PPIN			0xc00102f1
>  #define MSR_AMD64_CPUID_FN_1		0xc0011004
> @@ -465,6 +466,8 @@
>  #define MSR_F16H_DR0_ADDR_MASK		0xc0011027
> =20
>  /* Fam 15h MSRs */
> +#define MSR_F15H_CU_PWR_ACCUMULATOR     0xc001007a
> +#define MSR_F15H_CU_MAX_PWR_ACCUMULATOR 0xc001007b
>  #define MSR_F15H_PERF_CTL		0xc0010200
>  #define MSR_F15H_PERF_CTL0		MSR_F15H_PERF_CTL
>  #define MSR_F15H_PERF_CTL1		(MSR_F15H_PERF_CTL + 2)

I applied that patch to the tip tree merge today.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build tested

--=20
Cheers,
Stephen Rothwell

--Sig_/ON7aHcUF6v.+g+q+iDPDmte
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7wC5AACgkQAVBC80lX
0Gz0ggf/WwzIrlSl3C3AApljMTQ/giylH3ownY7CARuvr+JUXKnrbffKL3NltXYo
mCFkJTx/1HlnJYncSYPg/umDNily6UX2GfmO+JMPQkkeFips8i2rkCsDPJR6D6mv
GTaA/wY9aJK9CSv5VMK51IeK5AmPNWOekhiggVwlXMJybxdGpK0zPXK3GeW2b/Yw
zTKQpV0SXCJed1KAM4q1rYPZI3d1+Ed/f3QyuQ2Mz/iWhoZdKttWgQadUFHj9A3+
rKSGQ0ieUQVyDxVrYI/LI/8ps8DpRSlV3Qrvw4vQypBsAW/X2ssg/TLTmYmImga/
+rTqdDk633uR2R3Mnoh/qNA9U8zk0g==
=kC5v
-----END PGP SIGNATURE-----

--Sig_/ON7aHcUF6v.+g+q+iDPDmte--
