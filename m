Return-Path: <linux-next+bounces-5592-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57084A484B4
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 17:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AEC33A8AFE
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 16:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368B51B0412;
	Thu, 27 Feb 2025 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="MbOHVH4e"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BF28F40;
	Thu, 27 Feb 2025 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672993; cv=none; b=KP5NZTqxGspOkERP4GI/B4UbZ7G/vLe2g2ZEKj1faiJj+z7JP3sHB81b811muFPj2zs7Keoq1QJ+XqnhLBOSRD2K9fO2MnkDY975Z0ynquZCK3IuX1AtqLfLj22F+EAuXFrs8NAZuaeGoc6Cj4mKcsCBrCs40N85TiD7DztoBEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672993; c=relaxed/simple;
	bh=D9auL4mVzuIdaoq3cneJklxnARpyIsVxgPbBYqsHeTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=coMIb29yKl8c2ZHh4VSS0YZ5h764dZV+Mj5AuKzvW0c73mfGtYZVQgp6L3SSTpWgeWdIqbAqKxpbCzFR36oXcTXVavBscEMyEKB+SXBCR9mFggK88J7A91dfjnt9xaarj5pWs4fH9bGMY3bEj4tMe6Omd7iy0/l7XBCtauSQL0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=MbOHVH4e; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6gmcEZ4AlbviTHTWUn40oCIh2NbCrVQFZwaF22jKSJI=; b=MbOHVH4efnN31dADadERt+jWM8
	NSAibwntHHS1PUtq8tRvMHBKYmWPIsHWN1e1/a94ioI396ubikM4Y+f2rLuql0IOzq+zA/vEpJnJN
	FL3WLT22PTOW7hxLKHxvs7DpEowx7qozugdkD8CIRs8PTCUbfYarYe4SpRFQUmfZgjBY343v6E5OL
	1oVL88xCQ6vD6BNdwrA78TJC2au+Aj9/iJnDJU5exU2pyBj9/PrQt9bEAitn/3yNRltv2RWD2gz4A
	R8K9InsVGJe5XkjGzwbKjWnKUq9Ol+xHDjD/gBF8O/ccW/L3rdqLqTfE3tsSprc0+vBUhnLy38d4x
	U5lssE5w==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tngYR-0002KD-0K; Thu, 27 Feb 2025 17:16:07 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
Date: Thu, 27 Feb 2025 17:16:05 +0100
Message-ID: <15141602.O6BkTfRZtg@diego>
In-Reply-To:
 <CAMuHMdXQK2+-FaqK6FJWPYrS1TfASfZaJ0-VJBLdB53MZY_rxQ@mail.gmail.com>
References:
 <20250220113338.60ba2290@canb.auug.org.au>
 <CAPDyKFqBwari-MoRefG82kbxovVaLt3ewRVFihHoLbrOSWSnMQ@mail.gmail.com>
 <CAMuHMdXQK2+-FaqK6FJWPYrS1TfASfZaJ0-VJBLdB53MZY_rxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Geert,

Am Donnerstag, 27. Februar 2025, 16:56:01 MEZ schrieb Geert Uytterhoeven:
> Hi Ulf,
> 
> On Mon, 24 Feb 2025 at 13:27, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Mon, 24 Feb 2025 at 06:20, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > On Mon, 24 Feb 2025 12:23:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > On Thu, 20 Feb 2025 11:33:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > > After merging the pmdomain tree, today's linux-next build (x86_64
> > > > > allmodconfig) failed like this:
> > > > >
> > > > > x86_64-linux-gnu-ld: vmlinux.o: in function `rockchip_do_pmu_set_power_domain':
> > > > > pm-domains.c:(.text+0x19aa103): undefined reference to `arm_smccc_1_1_get_conduit'
> > > > >
> > > > > Caused by commit
> > > > >
> > > > >   61eeb9678789 ("pmdomain: rockchip: Check if SMC could be handled by TA")
> > > > >
> > > > > $ grep CONFIG_HAVE_ARM_SMCCC_DISCOVERY .config
> > > > > $
> > > > >
> > > > > I have used the pmdomain tree from next-20250219 for today.
> > > >
> > > > I am still seeing this build failure.
> > >
> > > And now that commit from the pmdomain tree has been merged into the
> > > scsi-mkp tree and so the build failure happens there as well.
> > >
> > > I have used the scsi-mkp tree from next-20250221 for today.
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> >
> > Stephen, thanks for reporting and sorry for the delay.
> >
> > I have now fixed the problem on the next branch as well on the
> > immutable rockchip branch. Martin, please pull again.
> 
> So this was fixed by adding a dependency on HAVE_ARM_SMCCC_DISCOVERY[1].
> 
> I am no Rockchip expert, but is this the correct fix?
> As arch/arm/boot/dts/rockchip/rk3036.dtsi uses enable-method =
> "rockchip,rk3036-smp", e.g. RK3036 does not depend on PSCI, so I assume
> you could run a kernel without PSCI support on RK3036 before?

All still relevant 32bit Rockchip SoCs (rv11*) already switched over to
PSCI. So if one uses some sort of distro-kernel (or one simply built from
the in-kernel defconfig), PSCI support will be in there already.


So the only case where this is relevant, is for kernels custom-build for
one specific soc type.

The rk3036 (and rk3128) are from the same era as the rk3288 - 2014 .
That's more than 10 years ago. And we're not talking about these old
boards not working anymore - just a _possible_ size increase in very
special cases (of not using any distro-like kernel).

arm32 psci.o is 176kb ... and even my r3036-kylin board came with 512MB
ram. So personally I'm not too worried.


Heiko




