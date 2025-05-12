Return-Path: <linux-next+bounces-6688-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D1AB3207
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 10:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D745E179D18
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 08:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABD8254872;
	Mon, 12 May 2025 08:46:31 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538383234;
	Mon, 12 May 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039591; cv=none; b=npS0ZklR+oTl2MmbNhJE3JZHPRUi927GhSlC3Cgege2GU8ve23J4ufa3RF/MWm2Bv5IOXVaW4IL6TJ8DoEDSiYMoNX4BLsIDB4Bfc6FrYceuqBxdr7WS08b17uPe1ybbaLQBgDV3qC7YaorWTmBQ4Gt+5RsHoGR0LRHAgzhXboI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039591; c=relaxed/simple;
	bh=Io5UFZTqm8Lw9JYk0VCOf0VK26C26TuHAeEeKuuS8hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdTQIfctZh+/lUo7iF1qBXDvmqA4cfMDjEXynhpmwiSWue39iMvrYMxgDqBURDJBsbb4/V05jnAYj6U9CNMTObkhf0DYi/FWDY8pvGIxCfk62KBOFks3xFKZaQNt4NWlXgks5KXb8VLM+P6Bhoug8FHD3t5+Tpv+9cPQQO8/5WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5259327a93bso1464942e0c.2;
        Mon, 12 May 2025 01:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039587; x=1747644387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKOi5KiEbUlTkmRJMN7ZFl6uLQWf/hx3AnyYinhNvrk=;
        b=rmqWvetrfQeveikRgD+kT1FNvPaUgbLpkJceSelYBd+xfO4lzgwI5QfDxZsSMHTx4g
         Q6Naf0BhVQHn4EoPRtTY8txhMCfaPqNcZxaLQrQbKq5gS1VgFhcHwAXqnIOsNzPLsl+8
         xTrv4mZSB245bBCfaq0VmUiUe+LxUdOX3cDzqvuHrq45FSDPe0qUOV7l+b0CUoP2J+zO
         ZejKaNelH2JKvFddOicHcMhBH7QuqfSbIKhmIrFl8V9ebjadutZF78f3LIR3FefvH7ZV
         7DltzQDMjBakrTTaafJSwf68Pg6QdJypkB1dAWyQHFQs2akyKpiVotAxZP4zfzooCGqU
         9bgA==
X-Forwarded-Encrypted: i=1; AJvYcCV1G+Ov+3CyPln2XeKnnpF9fark4Gq/M8H6rkp4H675II+P7bo/eCtsjq5B4c4IWvoeEY7zrQk2PNx7Sg==@vger.kernel.org, AJvYcCVgPLJdrq328xFOdO302k0Q73IKA78tzexBQGEqtDVJTL/VzW8VvpQaLZRaJyYbSKvyOB5c1Tkf+lfBgjZ/@vger.kernel.org, AJvYcCVj+93n6O9WNcAKUQ8fNwJzHLxUkmjc9Cx8K1/a5nnG4nDscsohc+fFGpPtGMySruA5HiXYvK4mZoFmsQ==@vger.kernel.org, AJvYcCWepsTvNM5U+B95GNomOU3+IUQYTpqxYdDxbTKBTBcYyE+LV7Q4cpPJYBFnFX1UiaSYzXmDwpLqBwV2BePrY4ulCg1f@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4aD3lB4GugW7nzU/rG/S85Tzmn9s6nW4ZBbEHdo9FwcCfy2X
	dxE+Qud8dFB0qGVg4493b+XUMx2PE5LjZUWtfyk8TWNFOq1cXQutDWTre5Tc
X-Gm-Gg: ASbGncv9t3nrGqC3tN6CvHr6Za0v0ZRjC7NlOWhMaMjEDC+iAMg3tL678INtNDphwbN
	clfqSCQ//a2M7sYukqz24gDt/V+CBQc70Z5/tRS/Ew4XcnjNXCn7wUtir0BUtf53DzV3QztzARA
	ac9pRsbxoCVCEvSyS4FZzQ2urTnLKbAPtEOjJtjYTizZ9bXkicipGvvccUSCNnBWuk9dOs8s8yx
	yNx9CAl2IlfQJN7NF+Y25Ph6I7J7RDucVf/RLchkyNqrmDjurEXAoG65o0gascbf5SM7gru04lo
	iEmLf2P1xWi3wibVAXCmI4DqFwO/VswVZsJhg3J9RPfR0TWnziray3TZu+oCGNNUJhhXyNg/P5F
	lglanPaXxTZxsGg==
X-Google-Smtp-Source: AGHT+IHpKG/i4WSB6zhjanRq5d5u8RVaYmC5MGxRr8rBFabaILxB80pEi39pX72QSQxvrPQ6+JDbDA==
X-Received: by 2002:a05:6122:1da4:b0:529:373:fcb7 with SMTP id 71dfb90a1353d-52c53cebf52mr7705752e0c.10.1747039587359;
        Mon, 12 May 2025 01:46:27 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c538a6f4fsm5237087e0c.43.2025.05.12.01.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:46:26 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4def13d3f01so1028733137.1;
        Mon, 12 May 2025 01:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9l2OFEUve0PySFuztN1nDsv0bBNijNbeI1sFh9YeZU47U3awebwvhWC+bwudvVQTZ5A0SW0jZTzDVs83NVJhuQ8H6@vger.kernel.org, AJvYcCWEArj0bnTOAc1kjpmROmmZ/fRCnMt0Tl9qUerIybbt+64vGPHDUEWVDFqb1xfh8Ef7DvWZPUfM6S24euKm@vger.kernel.org, AJvYcCWMhjqV8AkRgaLLMJpJTiUwEedSEx2AZWg2goLvSZJlWnSFoAuCdwTw9Rvla/SyIsIn7c7hx9Pwv23dBg==@vger.kernel.org, AJvYcCWNBM2b9KNNigcz6CByJMjBiCECnbqh+kIrmY3B+BEHiT74Tfsk0GEPbE0lKOmREIbFOIHcssx+qonbRA==@vger.kernel.org
X-Received: by 2002:a05:6102:fa8:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4deed37048dmr8678078137.15.1747039586713; Mon, 12 May 2025
 01:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506192033.77338015@canb.auug.org.au> <CAMuHMdX_K7EA4kE2mqxv+BkfR_oQmcpek2B3LxiYxMjSMfwjAw@mail.gmail.com>
 <CAL_JsqJRw18vN+gXL1H11hMRNQ-6HGS1z2533z7Rb293tSvW6g@mail.gmail.com>
In-Reply-To: <CAL_JsqJRw18vN+gXL1H11hMRNQ-6HGS1z2533z7Rb293tSvW6g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 10:46:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiVW0p5J5tki47YzvYz5eU87kGVdx8dFq522Zv5Qdw5w@mail.gmail.com>
X-Gm-Features: AX0GCFufQxBxiXNWp_ZGdOOrG3lhvKdPMrPtLr8VTsff-VdHayWXxDxwfI2YNk0
Message-ID: <CAMuHMdXiVW0p5J5tki47YzvYz5eU87kGVdx8dFq522Zv5Qdw5w@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the renesas tree
To: Rob Herring <robh@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, 9 May 2025 at 20:25, Rob Herring <robh@kernel.org> wrote:
> On Tue, May 6, 2025 at 5:05=E2=80=AFAM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Tue, 6 May 2025 at 11:20, Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> > > After merging the renesas tree, today's linux-next build (arm64 defco=
nfig)
> > > produced these warnings:
> > >
> > > arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (sp=
i_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
> > >   also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.d=
ts:463.9-478.3
> > > arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (sp=
i_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
> > >   also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.d=
ts:463.9-478.3
> > > arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_b=
us_reg): Failed prerequisite 'spi_bus_bridge'
> > >
> > > Introduced by commit
> > >
> > >   c29748ccad88 ("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound s=
upport")
> >
> > Thanks, this is a known conflict between SPI bus bindings and dtc:
> >   - Serial engines that can be SPI controllers must use "spi" as their
> >     node names,
> >   - Dtc assumes nodes named "spi" are always SPI controllers.
>
> I think you can disable 'spi_bus_bridge' warning by overriding or
> appending DTC_FLAGS in arch/arm64/boot/dts/renesas/Makefile.

Thx, I've sent a fix
https://lore.kernel.org/fbad3581f297d5b95a3b2813bbae7dba25a523fd.1747039399=
.git.geert+renesas@glider.be

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

