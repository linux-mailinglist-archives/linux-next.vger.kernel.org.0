Return-Path: <linux-next+bounces-3437-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1738C95FFA5
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 05:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378541C21A1A
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 03:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AD01773A;
	Tue, 27 Aug 2024 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Caem2T/X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBA2747F;
	Tue, 27 Aug 2024 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724728298; cv=none; b=MyA1WP927F7tfecntjLRPJvEpcwzM9mk7W1be8Mu3DYX/Tr1ZuiTF1M3a3T8qm78F88226WrocX4P6xQcRzLLfic70JiIuERtvl0X80uJSQNXIEcWaKgOfHvSbUAtu4IqLFz53bUWnpLMSFVxWB64IXPa5ZsJlarEnHI9rr8ml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724728298; c=relaxed/simple;
	bh=kVmwpgl4HhTOswEV2gAG5l/FK1XOLFjKRenMlkfORvM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XzhE4+7qLp0zGFaM6Yj9dA72Y+c1RY8uoH1HutMaDmKxAIZhxXK1yPqoNvpOnsUS+V3b0Sjb/k4+QSH6XNK4+lTuJ1Xv7sV25z18Di7RBkNPE5+oYZXW9lYFOmVy8v+60omSZhyGUdKvMio7XUj896jjOmChAiUXerKGXHSW4HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Caem2T/X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724728292;
	bh=F6vG+AA2G5BQQtxr3IYoNc8taFFkMSKW/tDshUARvI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Caem2T/XyL0o5drR12G0ru+mkprwkYFVe/3+ZtyKvwAWTbw20PuAW1xtdz2N9U4aV
	 qvaCIMxS3HbsZW6hHqnRweZaWMFUNrsehTqORYpYf7/w20UaRiu4Df4pkFZ7jhH9D9
	 CNu6dOMAkMDZMh53+RWkUn5Ks/6i0f1PI4aY/AYgD0gx/7y+l4oGmaMyyGyCj9feKA
	 GGHFzvPlDHEwxC05g7GDZVok6Fj4vktubW2r1MCA4k+YogtkRosVmw7f4fwggnoW7F
	 TTdzesa9omsjwRDn4w6rSzYyslskYeU4To/SHSJ1McxaRk2JzcC/ILXNZNRFInPP9t
	 Me5jCTyUm7cZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtCHm5KdTz4x2g;
	Tue, 27 Aug 2024 13:11:32 +1000 (AEST)
Date: Tue, 27 Aug 2024 13:11:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20240827131132.5a11f873@canb.auug.org.au>
In-Reply-To: <20240827125043.57ac444c@canb.auug.org.au>
References: <20240827125043.57ac444c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XMN8OJYX9g26WWBEp2yo1Vb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XMN8OJYX9g26WWBEp2yo1Vb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 27 Aug 2024 12:50:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:

In file included from include/asm-generic/percpu.h:7,
                 from arch/x86/include/asm/percpu.h:616,
                 from arch/x86/include/asm/preempt.h:6,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/irq.h:14,
                 from kernel/irq/manage.c:11:
kernel/irq/manage.c: In function 'irq_do_set_affinity':
include/linux/percpu-defs.h:92:40: error: section attribute cannot be speci=
fied for local variables
   92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;       =
     \
      |                                        ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:115:9: note: in expansion of macro 'DEFINE_PER_=
CPU_SECTION'
  115 |         DEFINE_PER_CPU_SECTION(type, name, "")
      |         ^~~~~~~~~~~~~~~~~~~~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:93:33: error: section attribute cannot be speci=
fied for local variables
   93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;              =
     \
      |                                 ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:115:9: note: in expansion of macro 'DEFINE_PER_=
CPU_SECTION'
  115 |         DEFINE_PER_CPU_SECTION(type, name, "")
      |         ^~~~~~~~~~~~~~~~~~~~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:93:33: error: declaration of '__pcpu_unique___t=
mp_mask' with no linkage follows extern declaration
   93 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;              =
     \
      |                                 ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:115:9: note: in expansion of macro 'DEFINE_PER_=
CPU_SECTION'
  115 |         DEFINE_PER_CPU_SECTION(type, name, "")
      |         ^~~~~~~~~~~~~~~~~~~~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:92:40: note: previous declaration of '__pcpu_un=
ique___tmp_mask' with type 'char'
   92 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;       =
     \
      |                                        ^~~~~~~~~~~~~~
include/linux/percpu-defs.h:115:9: note: in expansion of macro 'DEFINE_PER_=
CPU_SECTION'
  115 |         DEFINE_PER_CPU_SECTION(type, name, "")
      |         ^~~~~~~~~~~~~~~~~~~~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~
kernel/irq/manage.c:230:47: error: section attribute cannot be specified fo=
r local variables
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                                               ^~~~~~~~~~
include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER=
_CPU_SECTION'
   94 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;            =
     \
      |                                                   ^~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~
kernel/irq/manage.c:230:47: error: section attribute cannot be specified fo=
r local variables
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                                               ^~~~~~~~~~
include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER=
_CPU_SECTION'
   95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
      |                                                   ^~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~
kernel/irq/manage.c:230:47: error: weak declaration of '__tmp_mask' must be=
 public
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                                               ^~~~~~~~~~
include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER=
_CPU_SECTION'
   95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
      |                                                   ^~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~
kernel/irq/manage.c:230:47: error: declaration of '__tmp_mask' with no link=
age follows extern declaration
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                                               ^~~~~~~~~~
include/linux/percpu-defs.h:95:51: note: in definition of macro 'DEFINE_PER=
_CPU_SECTION'
   95 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
      |                                                   ^~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~
kernel/irq/manage.c:230:47: note: previous declaration of '__tmp_mask' with=
 type 'struct cpumask'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                                               ^~~~~~~~~~
include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER=
_CPU_SECTION'
   94 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;            =
     \
      |                                                   ^~~~
kernel/irq/manage.c:230:16: note: in expansion of macro 'DEFINE_PER_CPU'
  230 |         static DEFINE_PER_CPU(struct cpumask, __tmp_mask);
      |                ^~~~~~~~~~~~~~

> Caused by commit
>=20
>   6c70d79f363c ("genirq: Get rid of global lock in irq_do_set_affinity()")
>=20
> I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/XMN8OJYX9g26WWBEp2yo1Vb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbNQ+QACgkQAVBC80lX
0GyDKggAjKwfNGpSuZv1FUShgvH4qFkqT8AyWlUqjGlYDCzXCxFmQS9qURsUBTTO
vzj7xEP9KXGC+17g/NtIZNCk1wvVkOneMTljWsX2JsfsHM4tGq09X9r9MTnPF9bG
3skP/b0n/y6BgG1knM2V6rPd8dJ5OSBBU1jHpfyIMsC1rvKZA4Q2XeGQDjT/51Wy
l88jMYybbGDytozw9DhSUYRwIdfNOAQAVHvWKikGIo8Bhj7/tO8XzNTv4vlHuMJR
YAeZF+HTvvpdKe8R/CaVSMUOfT2FD3U7PPqwAPtqqWlgv09jp5evUlHIDnGv1fNd
w21h1YvD092IrpCmYVk93Nw7Jy3d5Q==
=L7U0
-----END PGP SIGNATURE-----

--Sig_/XMN8OJYX9g26WWBEp2yo1Vb--

