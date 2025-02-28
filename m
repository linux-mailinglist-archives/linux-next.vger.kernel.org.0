Return-Path: <linux-next+bounces-5610-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB501A49589
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 10:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96C247A4CEC
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 09:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D02B2561D9;
	Fri, 28 Feb 2025 09:42:09 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1851E2528FA;
	Fri, 28 Feb 2025 09:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735729; cv=none; b=ktRA4hPZ/KdbmFFyhNLlzHHM2Mf5sdyHNWNYkCfyRqB7Ym9cnlhOhij9YK18rIO/qn+bLlROHpgBRwX/o9PgU3/wSKDZ7yVe99AvlieJ3Kutkht5a77HVmlbIesMgL1U/7BCl9hWdEC4FTa/bZNee2YDzSXgyZz+ERC4WlbqV8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735729; c=relaxed/simple;
	bh=aYKFGM1/dqxeFUKMH2SBxw99GxJI2wKqg31Nmn04I10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttSsR65f4JobuX5lhtd14RfRbHPqyRtyFg+cwv2qndq64Z7eQxgZeuMDRGIrqkx6vUaxGCyJKHjJE0ea40QTgc9Ha7zaQ+YvTYY/sPkulcHy/5zsIFGV4n03n06S15UH1fgVj04/SD/eUwcrdzjQP9WmrA3SmvGQgFkZnUfYvWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5235db99207so256524e0c.2;
        Fri, 28 Feb 2025 01:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740735725; x=1741340525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vWXqY3w3aFyIJNMy0eOH2WJ/aN6PlG2X7oEUTzW6wk=;
        b=WtYDIB+rcYFH2AhjwnwqJgsf0uq4DyaDOXYSg3JBJf9KNuK7dSwrqfKpij2dSuNk6G
         k3yQ7BiMNWDU8P1kOP1rMJH6REd6TB2bjfDP6OLkrjI/y7+CXJxxNp7urT4TaC+Arm60
         Viplj4WHn7iDsTGOGq83BzEhcB7Su7SoDEfuXo8E0Fb5WgpzaO72VRoTNqEsgptp94hm
         BZIKZgoA2VicXs+M9et5vAj2Q1t3XHISaDSIuAzatAK2X7AA0RXx23x40JXY+IAYVFqY
         nIdfMRUghaJqiTss94CLXkQD0FzdjCV0b7cE/5nYn+yuOBMkXfh+/gwXPNfGFl7Y7cJA
         1eZw==
X-Forwarded-Encrypted: i=1; AJvYcCVbrClj2v+rB0L0d2NAS1zVyl8LbdbAui0+0/MpAhdMcuaWV8d8LuQLbqKb5LewU9QniX5QIyPqh1xFtuI=@vger.kernel.org, AJvYcCXjOdtHnxfihGWz2HmLKAdeNCqo18xj4h8YJ1/VVXfOe0519yRXqu7IMHmMWkLh56O3E+csNqQt+FR6ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmimPB1OOWn/vRByb5hpI0u0E1eVuLHUQ77u64VN5VdFDrO0xj
	/ZzG5tSF0irgCpKVE65/GXxo9tAWvBRxOGQDPyyXxqPR8YiJFRH5WhFfZRye
X-Gm-Gg: ASbGncsv91nzOD+95ZsyPqBV7MbdWCEWoDc97K/IjohcehlABgJek7U5MIFOp/TatQk
	xjSUhKeSOEFr/rVzYHYDvvU0fOcy8KIkAtErstJ1HZB6dNGws9CgtZ6ss4syGm8+2QHr4nCBUy4
	pP/svgPn3n2nFy12YEtAfbltQQkYcKTWOd+aFe3u8GWj5GcXNYUeTMl+cNdB0L+FP6hO91J+FaC
	zfnSAJzd+FjPy+RlQ/7Jq2ha+BFvx/7QvbwtHsfsksBtquNgWNMwIHj+JKieFzZv8keUvxuRZ4t
	r9eNQQMU4uPHl77n9sEgiKOVcKOOKAKvZuVmI7L+27C9aB6KMnvBeAUnTAVLLNUE
X-Google-Smtp-Source: AGHT+IE2zKcdRcGmRj7y6BqnyZfMyWqC/OnVv9QZdyDUaVswoPhYBhBr7CTLqp0vXbs55jcDK8YEbQ==
X-Received: by 2002:a05:6122:3d4b:b0:520:42d3:91bc with SMTP id 71dfb90a1353d-5235b7e10camr1698495e0c.2.1740735724770;
        Fri, 28 Feb 2025 01:42:04 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5235e9b89e4sm153624e0c.23.2025.02.28.01.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 01:42:04 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86b2e0a227fso844695241.2;
        Fri, 28 Feb 2025 01:42:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyJhbIpzQn+MNp/RuWkZy2XdHI8OYqhWfbvFwoIOC9FvTD8DLnn7dyQSSfNjwILhvLsXobgOjmgbnLww==@vger.kernel.org, AJvYcCWN0GI9NtAZmwx0Lh8r7S7KOmstuX0r4hFv30XPHM4u6SeOIpmYmOwp7bl4p02YF5HtpqYtBddtrQJl4Vw=@vger.kernel.org
X-Received: by 2002:a05:6102:e11:b0:4bb:c76d:39ec with SMTP id
 ada2fe7eead31-4c044f2a95cmr1521578137.21.1740735723987; Fri, 28 Feb 2025
 01:42:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220113338.60ba2290@canb.auug.org.au> <15141602.O6BkTfRZtg@diego>
 <CAMuHMdU102nhmHoxo+z2XCxNf+gLFuBnAZamtW+V=WjKFX9rjA@mail.gmail.com> <2087532.0S5aU1g85B@diego>
In-Reply-To: <2087532.0S5aU1g85B@diego>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Feb 2025 10:41:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_Jb1YbwTQc+fkbRMw0O1+qR0KepG4U+ug1ED-+vferQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpmjfKoIiZF7F0ztpbxbQawRWc0SYK1wTnkbkZ64caf24TvlmaRQHvI_VI
Message-ID: <CAMuHMdU_Jb1YbwTQc+fkbRMw0O1+qR0KepG4U+ug1ED-+vferQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Fri, 28 Feb 2025 at 10:01, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> Am Donnerstag, 27. Februar 2025, 18:05:18 MEZ schrieb Geert Uytterhoeven:
> > On Thu, 27 Feb 2025 at 17:16, Heiko St=C3=BCbner <heiko@sntech.de> wrot=
e:
> > > Am Donnerstag, 27. Februar 2025, 16:56:01 MEZ schrieb Geert Uytterhoe=
ven:
> > > > On Mon, 24 Feb 2025 at 13:27, Ulf Hansson <ulf.hansson@linaro.org> =
wrote:
> > > > So this was fixed by adding a dependency on HAVE_ARM_SMCCC_DISCOVER=
Y[1].
> > > >
> > > > I am no Rockchip expert, but is this the correct fix?
> > > > As arch/arm/boot/dts/rockchip/rk3036.dtsi uses enable-method =3D
> > > > "rockchip,rk3036-smp", e.g. RK3036 does not depend on PSCI, so I as=
sume
> > > > you could run a kernel without PSCI support on RK3036 before?
> > >
> > > All still relevant 32bit Rockchip SoCs (rv11*) already switched over =
to
> > > PSCI. So if one uses some sort of distro-kernel (or one simply built =
from
> > > the in-kernel defconfig), PSCI support will be in there already.
> >
> > OK.
> >
> > > So the only case where this is relevant, is for kernels custom-build =
for
> > > one specific soc type.
> > >
> > > The rk3036 (and rk3128) are from the same era as the rk3288 - 2014 .
> > > That's more than 10 years ago. And we're not talking about these old
> > > boards not working anymore - just a _possible_ size increase in very
> > > special cases (of not using any distro-like kernel).
> > >
> > > arm32 psci.o is 176kb ... and even my r3036-kylin board came with 512=
MB
> > > ram. So personally I'm not too worried.
> >
> > My worry is not so much about the size increase, but about
> > CONFIG_ROCKCHIP_PM_DOMAINS becoming disabled when
> > running "make oldconfig" if CONFIG_PSCI is disabled.
>
> ah, now I get it :-)
>
> I guess there are ways to prevent this (still uncommon) case:
>
> (1) The CONFIG_ARM_GIC_V3 already uses a
>   select HAVE_ARM_SMCCC_DISCOVERY
> The pm-domain could do that as well.
>
> (2) The main __arm_smccc_smc has a stub for the !CONFIG_HAVE_ARM_SMCCC
> case, and arm_smccc_1_1_get_conduit() is described as
>     "When SMCCCv1.1 is not present, returns SMCCC_CONDUIT_NONE."
>
> ------
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 67f6fdf2e7cd..3e6b34570a64 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -300,7 +300,14 @@ enum arm_smccc_conduit {
>   *
>   * When SMCCCv1.1 is not present, returns SMCCC_CONDUIT_NONE.
>   */
> +#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
>  enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void);
> +#else
> +static inline enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void)
> +{
> +       return SMCCC_CONDUIT_NONE;
> +}
> +#endif
>
>  /**
>   * arm_smccc_get_version()
> ----
>
> I guess case (1) might be the easier one, because stubbing out only one
> smccc function might raise the issue of what about the others.

Or protect the callsite in rockchip_do_pmu_set_power_domain() by
#ifdef CONFIG_ARM_PSCI?

Note that arch/arm/mm/proc-v7-bugs.c seems to call
arm_smccc_1_1_get_conduit() unconditionally, but the code is optimized
away due to spectre_v2_get_cpu_fw_mitigation_state() having a dummy
for the !CONFIG_ARM_PSCI case...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

