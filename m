Return-Path: <linux-next+bounces-6652-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB169AB1C44
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 20:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39AF71C02FB7
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 18:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8494E23D2A2;
	Fri,  9 May 2025 18:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5dwTCOC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D81E9B2A;
	Fri,  9 May 2025 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815153; cv=none; b=gYRrQLisEJ0C8kK5Vck9UOH02S1V7K0pVoZH04/v6OB2KquiFoa23seo5fegMpuBtyHS//ezq9AjH0THkueDdPCm0wR/OnZ6DpZRSDPl2iYtomiVjwU/QeUtWFrG+BYTQCXL6S2ogSgogokEAtvyxVCDwRPDw4KxZ1Tnz2+WeO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815153; c=relaxed/simple;
	bh=/S5/2X8AbB/pNFoxjHsyadCSPGuOCM0nt3xfn3LCHqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpO1daaW1b7pnyv8TGGT98MEvwknWBrIQ3ku5rSfdawov/Svcuj3wOwW3f4XU2eFAnBTVKmmTcVoW1dCbr+aTsS+36wn3SflATr75g8orKVrjRHnEl5yYFgl9LZDttDZ/uBcOKM4jZRac16cvLNxys7bxeetDLCGAgZzR7K7lUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5dwTCOC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EEEC4CEE9;
	Fri,  9 May 2025 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746815152;
	bh=/S5/2X8AbB/pNFoxjHsyadCSPGuOCM0nt3xfn3LCHqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z5dwTCOCxfWjLjcHTfsnKMf0qT/NFdSEwKvc0tXxVcqRaOx6sGvaV8Zd69JEieICG
	 Yqm1FBQt36eIcCF8CBNun2aImppfTj25JxYs2dF5muW9x8QCZi13Ts3hOipH44i/p8
	 WlNWuAsI4tFUt5fWUdJ95BzGKuA4QI2t2PYLPKqg8uWRpevGzYvbwK0Zk+nypjxsPA
	 BOhQFgLZ0ba5p1UnarJUjWVKsFFajv6fdvWbH4EaEK56WqGgC40Yf4UICyep+sbXlB
	 fkH+h3COlIAHNr3t63HDTNnLoahrzQteFHSzHp1Sa5BMlRWAYeOaKFXV788T+fC4ma
	 VeKlEpOCuNP+A==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbf0324faaso4764596a12.1;
        Fri, 09 May 2025 11:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSGjCF5LZaGCcxrWxIA+mpRWSuFH1uWDJ1JSD3eKY/o8Lbu4BRbbTkOI54M7HKJVlV13kl44qSYh7ggA==@vger.kernel.org, AJvYcCUYWY/PxJak0wN0ND296cwzipyWoaCRfUpRSW96Ht4D1PugFxVv8W7A7h/FZBnOgnij+VO2JK8F5fhvsg==@vger.kernel.org, AJvYcCUqzwNns7Ohyn38MmzVDOkOJfKt3kZ2mamQ+1gxBltY48Y8+UpmDqaZjLeesJzRpkcunta58K3yuwtkja06pEsC64IW@vger.kernel.org, AJvYcCWA1V+XvD0tco86RVQghuixiifJAEGLNltUleU31bGmdEdvVKT8JuUsiC70JWE4VKMc+Vej9N9KwDT6lb+Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy39h5mu5XhkJiBW9ENrtvftpCduwMNIHOMQmsbHlx8yufI6pU/
	hJngR49BFq5+R0pnQKDmxDttqkgknpsf+5q1hdpeih4SdSuYUMhJySU3q2K4yAhGgzsYgrG6+gm
	O3cBiVmV488cI6ZZf5oFC4yatbA==
X-Google-Smtp-Source: AGHT+IEcIMbpkScLHgHgxaAzEqTSRT+fIcmeokOsQ0WUYhs+OzquHc3VvXBWePDg0cjwD1dWL/+vCyq0j+CeAikC1Bk=
X-Received: by 2002:a17:906:f255:b0:ad2:23fb:59fc with SMTP id
 a640c23a62f3a-ad223fb7c5fmr236260766b.21.1746815151271; Fri, 09 May 2025
 11:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506192033.77338015@canb.auug.org.au> <CAMuHMdX_K7EA4kE2mqxv+BkfR_oQmcpek2B3LxiYxMjSMfwjAw@mail.gmail.com>
In-Reply-To: <CAMuHMdX_K7EA4kE2mqxv+BkfR_oQmcpek2B3LxiYxMjSMfwjAw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 May 2025 13:25:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJRw18vN+gXL1H11hMRNQ-6HGS1z2533z7Rb293tSvW6g@mail.gmail.com>
X-Gm-Features: AX0GCFtBENcHB_I9zSrzCsGWPQZu3qXpNFL7bfKn_iQj-3IH77pSHD1aprn9u8I
Message-ID: <CAL_JsqJRw18vN+gXL1H11hMRNQ-6HGS1z2533z7Rb293tSvW6g@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the renesas tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 5:05=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Stephen,
>
> On Tue, 6 May 2025 at 11:20, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:
> > After merging the renesas tree, today's linux-next build (arm64 defconf=
ig)
> > produced these warnings:
> >
> > arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_=
bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
> >   also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts=
:463.9-478.3
> > arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_=
bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
> >   also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts=
:463.9-478.3
> > arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus=
_reg): Failed prerequisite 'spi_bus_bridge'
> >
> > Introduced by commit
> >
> >   c29748ccad88 ("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound sup=
port")
>
> Thanks, this is a known conflict between SPI bus bindings and dtc:
>   - Serial engines that can be SPI controllers must use "spi" as their
>     node names,
>   - Dtc assumes nodes named "spi" are always SPI controllers.

I think you can disable 'spi_bus_bridge' warning by overriding or
appending DTC_FLAGS in arch/arm64/boot/dts/renesas/Makefile.

Rob

