Return-Path: <linux-next+bounces-4272-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77E299F0F2
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 17:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED7C41C21E87
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF8014A60D;
	Tue, 15 Oct 2024 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkPCkJ7G"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F61CB9F0;
	Tue, 15 Oct 2024 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729005759; cv=none; b=maCasQIv+ONmlKhg1jFMHkzG6h88TBrjzlAitsPaWq33ltjez0syxtNt1dnOLxuN1XY2OrbyueqMQ7Q7oDqfsccju2zVKy4WOieBPRBYVt1HRpRtWs3DaLMdYO0LgZYgGRh/tpqUz6Lu7AZefPyYOglaviH6+V7FEDnJwwlRLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729005759; c=relaxed/simple;
	bh=9+M4tc8pgeagmV9+ZE2duez28d3yI+su9S1KEKo+hiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uK0/3AcOLX+hHvpHD4I/fdLBA7q/Pv6cOL0xppGxl6ZPRUT7scU8dssiwwhszmOjAyUGpvzBEmImuwxdg2UoLtpeDVzRxofe5zqT8tXMUPuQkD/kKfL8DyP4yHQ3GIR0bcPkMkGOUt+1y2VBm5QD6glkeHKCnd0Doq8YtTa6I+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkPCkJ7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D74C4AF09;
	Tue, 15 Oct 2024 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729005758;
	bh=9+M4tc8pgeagmV9+ZE2duez28d3yI+su9S1KEKo+hiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fkPCkJ7G2BTZRzasBOi8m1FIP1Br59tAcVRsbmoNbTfqf+tu5aCxTVRapLoRm8imK
	 G2Y/zd90jyHNckbLzlfMJEuiXR1xZf0FyjSAAcjlvL4o11TljwEOq04dZbz5AGbQ83
	 wfCEOR9uOcQVzT/4hTKHtCwHNgfGbOexisB0vASKDMc60f72UTcf2kCH37TSC6wJmb
	 NAC3Fp8O1nMuTua3JAIqQb7Fe3oGO7l8Yp+2vRUoxyZUSoQPrz8135RlX+YV7ANnT1
	 IARwwFhc2iwJe84vcYFySN/ZAkhYhRW7ATHhDDtLwlVCEOPok4bxtS/kVNYkpo3g0P
	 cDq1n+HABWcCQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so6490060e87.0;
        Tue, 15 Oct 2024 08:22:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVybBCI1kMWMSGtfs9qcl8vmkObOPvN1LVr3QfFkWyjyNagA++MIt5EICc+qRCeaDT8ikD3dQGP6EeNKg==@vger.kernel.org, AJvYcCXVbZdeWaQXFlV8G2SBBsheyM9NUmQsGK/P264Xgl43M0vWAXKc93mw253OUiqj6aIVPNCn+ZNRTLp8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz99hM2B+O7LcNxj7/tAeuwR+LTz7xJZ8hiUKtELcZQ+cHaDQYJ
	I02Myvf1uPuNoyyErXQN6qfyDz5svd+s1DvxF/Gb3ZEE321FxxDvrx+4gmYYY2dVhbkL1ZPfnbG
	sUSiiKUOc1LNjrDgXsOXFr87HLg==
X-Google-Smtp-Source: AGHT+IHXhc2IpilQ2wMgkgn3VmiF/eQxq6st/LeoWg2qUlC4rlFIP+hLmeE5Gwz8lsNg+8Smpgeh1IMtYd5IM/qV+j4=
X-Received: by 2002:a05:6512:124c:b0:52c:8979:9627 with SMTP id
 2adb3069b0e04-53a03f07384mr570020e87.3.1729005757149; Tue, 15 Oct 2024
 08:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYuhS6Ltemvb_EZfq+j3PpTnmo4qb46Gu1s6L47wMsNO3g@mail.gmail.com>
In-Reply-To: <CA+G9fYuhS6Ltemvb_EZfq+j3PpTnmo4qb46Gu1s6L47wMsNO3g@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Oct 2024 10:22:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJQVhR13XPBixS1GecueE40uPf7G_jgxtFK4CYiCHTZWg@mail.gmail.com>
Message-ID: <CAL_JsqJQVhR13XPBixS1GecueE40uPf7G_jgxtFK4CYiCHTZWg@mail.gmail.com>
Subject: Re: next-20241015: drivers/of/address.c:244:31: error: passing 'const
 struct fwnode_handle *' to parameter of type 'struct fwnode_handle *'
 discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Saravana Kannan <saravanak@google.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 9:49=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> A larger set of clang-19 builds failed on arm, mips, riscv and powerpc du=
e to
> following Linux next-20241015 tag and these include tinyconfig, allnoconf=
ig etc.
>
> And gcc-13 and gcc-12 builds are passed.
>
> First seen on next-20241014
>   GOOD: next-20241014
>   BAD: next-20241015
>
> List of build regressions,
> arm:
>   build:
>     * clang-19-sama5_defconfig
>     * clang-nightly-mxs_defconfig
>     * clang-nightly-exynos_defconfig
>     * clang-19-at91_dt_defconfig
>     * clang-19-pxa910_defconfig
>     * clang-nightly-vexpress_defconfig
>     * clang-19-vexpress_defconfig
>     * clang-19-mxs_defconfig
>     * clang-nightly-davinci_all_defconfig
>     * clang-19-allnoconfig
> ...
> powerpc:
>   build:
>     * clang-19-tqm8xx_defconfig
>     * clang-19-tinyconfig
>     * clang-nightly-tinyconfig
>     * clang-nightly-tqm8xx_defconfig
>     * clang-19-allnoconfig
>     * clang-19-ppc64e_defconfig
>     * clang-nightly-ppc64e_defconfig
>     * clang-nightly-allnoconfig
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build log:
> -----------
> drivers/of/address.c:244:31: error: passing 'const struct
> fwnode_handle *' to parameter of type 'struct fwnode_handle *'
> discards qualifiers
> [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>   244 |                 err =3D pci_register_io_range(&np->fwnode,
> range->cpu_addr,
>       |                                             ^~~~~~~~~~~
> include/linux/pci.h:2022:63: note: passing argument to parameter 'fwnode'=
 here
>  2022 | static inline int pci_register_io_range(struct fwnode_handle *fwn=
ode,
>       |                                                               ^
> 1 error generated

Already fixed this in my tree.

Rob

