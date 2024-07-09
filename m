Return-Path: <linux-next+bounces-2889-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E482B92B9C1
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 14:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57817B256B2
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 12:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83698158D6A;
	Tue,  9 Jul 2024 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiDtjfFE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A94013A25F;
	Tue,  9 Jul 2024 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720528964; cv=none; b=HeSlWu1XubPa7p9sJ5QfblZT8YycRWNSV2wTiMDrQkQLRb/NpfPvzuy9oz104uBxp5coCKK3XdE3GFisVTlqu33RKfGEKjhZJd49BZz4eFvXNrtuapFKcRN1hM55PyNhUnJy0MGPAMabitaUmRFvC0/48YcLpUKJKqoX/k/y0FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720528964; c=relaxed/simple;
	bh=qQEcMYXqKNq0TWv7hl5Ht7iPEiXNq7qFmMddZ9VMTXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpVu5DiuXPArXMG13i39iKC8miUA7UO/3RaOG14pc8v6dsBfma0p1bXOv9AgyIZYMTTSIQ/EgAgMZ27SjFec70qs9kzTceb0w7FbceQvFu3a8Es3kOg5+/8EAZLY9DLAI3dNGl5tPytiKv63ZCa/Agl52AAyrj+Nh+VnHl49weU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiDtjfFE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1844C4AF49;
	Tue,  9 Jul 2024 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720528963;
	bh=qQEcMYXqKNq0TWv7hl5Ht7iPEiXNq7qFmMddZ9VMTXg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eiDtjfFE0b87jVlqh+ARPh6NTorVLpRPS652gZi7AGYtEV/4PNaLy6MIhKTEdbn0T
	 EU8AyNLQPKN3V5Idkx9uBX4kFEkXr/GzNlD/c8whgg91JS2JhiwT5oYJM08L4HJDfG
	 x4pDnhYD4fKpNKiFFd07m2yHUzLoMgnugHIrJq/hcto90jxKQcLoSxX1LrwpLYB7Er
	 gRMzsy57ztX0v+tonhb0kPT+vFF3pnx3kXxpGW5pjZCmkaOOK6TXqOcy/Ku8DL+SFA
	 6o5hbJ8uLYtAa2IIAD/pC823BUS9PfAbgPtExROglBye3QnDinMLO7dQ0L9TpnoQCA
	 v726klfFpiLWA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so35167311fa.1;
        Tue, 09 Jul 2024 05:42:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfJ5Qte1s92FngL4zamFRSUneaaVnicrdf3iRto8xNWVlDQ+QJoefpDogO1Fguz6fZTzNQrZPAMCkhWXBGfEKIEh4hVe7YoPBvE981SlHsDEXTstn8yTj7Z0gywrcL6PRsUOjBxo7d4w==
X-Gm-Message-State: AOJu0YwZktZZ+acBczbCsgdBOrvPIbYM+QYKSssGj6RdCSrOP/rQiYdA
	SJvoFbz5HIHODhGXN+/bREXu78iy9zZmGX2t95FAHjgeOwPX6stlc5WA15yvoJ9qR3W0NNlRTir
	FcRl03FSf9T0ou7PvAM/C7GILvA==
X-Google-Smtp-Source: AGHT+IGPoEZZTFAs7uz5nkr/yFitdKrLKwVDJKkZqaUX25kKoBaBI7eEU/23XfVDTOu2IdbWdo2Tu1TL/WSQlZ2suDk=
X-Received: by 2002:a2e:96d3:0:b0:2ee:4a67:3d82 with SMTP id
 38308e7fff4ca-2eeb30fef9bmr20467101fa.28.1720528962220; Tue, 09 Jul 2024
 05:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709164618.69cfcfad@canb.auug.org.au>
In-Reply-To: <20240709164618.69cfcfad@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Jul 2024 06:42:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLmm6Da=4G9cJfAtKJB5j_dfbTywRRwHMKZyf3J7SAxfg@mail.gmail.com>
Message-ID: <CAL_JsqLmm6Da=4G9cJfAtKJB5j_dfbTywRRwHMKZyf3J7SAxfg@mail.gmail.com>
Subject: Re: linux-next: duplicate patches in the devicetree tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul@pwsan.com>, ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 12:46=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> The following commits are also in the arm-soc and risc-v trees as
> different commits (but the same patches):
>
>   0620bce64afa ("dt-bindings: riscv: cpus: add ref to interrupt-controlle=
r")
>   877097a2fab0 ("dt-bindings: interrupt-controller: convert marvell,mpic =
binding to YAML")
>   c7ce06684bf5 ("dt-bindings: interrupt-controller: riscv,cpu-intc: conve=
rt to dtschema")

I had to rebase my tree yesterday to drop a bunch of reserved-memory
restructuring that seems broken beyond repair. Maybe I'm going to have
to just do reverts instead. I had no knowledge that anyone had pulled
in my tree and how is it just these 3 commits? It should be at least
these:

e83445ff82c3 dt-bindings: interrupt-controller: convert marvell,mpic
binding to YAML
7de99a24a975 dt-bindings: clock: drop obsolete stericsson,abx500.txt
c0ea5d103c5d dt-bindings: riscv: cpus: add ref to interrupt-controller
634c4347b3b4 dt-bindings: interrupt-controller: riscv,cpu-intc:
convert to dtschema
27674d602e7e dt-bindings: arm: cpus: Add new Cortex and Neoverse names
3251b36bf430 dt-bindings: interrupt-controller: qcom,pdc: Add sc8180x PDC
4f42882bb9e4 PCI: of_property: Add interrupt-controller property in
PCI device nodes
58a7a4ac485f of: unittest: Add a test case for of_changeset_add_prop_bool()
de63fa7dc80e of: dynamic: Introduce of_changeset_add_prop_bool()
05c9f943c9d8 of: unittest: Add tests for changeset properties adding
8957c7464362 of: dynamic: Constify parameter in
of_changeset_add_prop_string_array()
a16705e10236 dt-bindings: dma: qcom,gpi: document the SDX75 GPI DMA Engine
8c58884d056d dt-bindings: watchdog: img,pdc-wdt: Convert to dtschema
dab5b8e26e84 dt-bindings: timer: renesas,tmu: Make interrupt-names required
285c645d842c dt-bindings: interrupt-controller: fsl,irqsteer: Add
imx8mp/imx8qxp support

Rob

