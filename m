Return-Path: <linux-next+bounces-7394-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772FAFC20E
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 07:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 428171AA05C8
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 05:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C58215F7C;
	Tue,  8 Jul 2025 05:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7IOjhu6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA8D215766;
	Tue,  8 Jul 2025 05:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751952894; cv=none; b=Nfj2gV56t93PncFtvPeYAw+uEHsGOuE4Xhq19AoID+GzaMBrvWKzQyuNPGQwMHIdpuZgckU/M5qhrjURf2mxy/lGSHaSnE843vUaVw71++PoRDlxSEb7cki/dyhVh+1dvib7SPhMih6T5Pbs49b8iEQKwALSGWMlq1wTNMH2Tpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751952894; c=relaxed/simple;
	bh=/wO1tMP02aycUkhnEy3fgG0kfCAS2RqV6qhsUgj8mPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQ/RgJjE0wQtFokKeOgSRzJgInln6GPLBmo0XZriuiW8nssMhj7K/eIFHUtQDjKnL+X0oAd7wNDRpIjT5KIsdT88QrtfLIVDiCER+azfO0jtAIcUcPPtxFX5f2mFgdB1BG8DoO0yMPfU5GSWCLRORbKdD9LaBg9Rxh/AhOeGnH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7IOjhu6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A29BC4CEEF;
	Tue,  8 Jul 2025 05:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751952894;
	bh=/wO1tMP02aycUkhnEy3fgG0kfCAS2RqV6qhsUgj8mPE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o7IOjhu6GoJzatEe8N30pyEF/krOm8axRNC50+2V+xi07Z2oD702MuIdvOrlb6ueu
	 UVvNOdlCqAJzTjM45APUY55q/9/8ml9q4rU5PppwpTcOz/LntA36CedkAzwladk6ur
	 tK4uuizrH27e+JgwY7LOxUvgB+8lcFh0wFMMKpdkIojH00ZhY54nkaxK7KW1z1WDe5
	 2X5SxPCuC9YKw2KI7FZzrC/U4dEfKxxCjLXMhtiAi6pgHXr6ngR4G4mUbkNnyQ/HJ9
	 +Bu4zCdvK25xuL1Dt2X+6dopTIJ+sJtiv+4RZAIuIy7+/x6/0iURnqyvOQVlek796w
	 ZJ3ILC94nj99Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b16a0e38so4276677e87.1;
        Mon, 07 Jul 2025 22:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFNOG2BYR0dbL1rDZC6lPeThlqkOaSCtEvdC9Fh4KohQF9VyjjCCMN+9AOGldLh7oeMpd1bKclE47dgEY=@vger.kernel.org, AJvYcCVNCSAcySvUzp7Ie5xl3bARSmhgFOs/dF9dYRPBZPKoIOuj2C4CDTwpiNxTCSQcLrFPIK5JrDd10YbCQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0PDk7atE7CcQ1ul/rFF7JRI9mEcy4g77q8X1JulsrBeu0H1p
	gg3OEmo4yhVXr89uRf2pZonLa/OEq6hSqKzZIkDJ5BaBXZ8+DhekcJVNU4j3PlS3S4Joiw4rNwd
	L6CCWGah/JsAcX744kX7MQxZJLLtRuYs=
X-Google-Smtp-Source: AGHT+IEexdJftgVVdz7A++r2v+UsDUSuujl8aH6aIhXmsKyA1514AdDNRiHslZUadVP3TMSeqPFzX7jsLFiz1Rf6Q1k=
X-Received: by 2002:a05:6512:1092:b0:553:3945:82a7 with SMTP id
 2adb3069b0e04-557f82fffddmr459569e87.12.1751952892482; Mon, 07 Jul 2025
 22:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613154204.42392ad4@canb.auug.org.au> <12838efb-238f-4bdd-af81-06c6408cee4f@infradead.org>
 <08e97c2e-18eb-4c74-81d3-9caa53a9aa9b@infradead.org>
In-Reply-To: <08e97c2e-18eb-4c74-81d3-9caa53a9aa9b@infradead.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 8 Jul 2025 15:34:40 +1000
X-Gmail-Original-Message-ID: <CAMj1kXGDiCAkHYi6YY2Tq87Le4Ry=pBbaVWSk_wPzNsj8kcXtA@mail.gmail.com>
X-Gm-Features: Ac12FXyPB6iYhHN9x4brnMCEQgn12Hnqillg_vvjzJZ4ChAS2FzKGCgP0DjHcow
Message-ID: <CAMj1kXGDiCAkHYi6YY2Tq87Le4Ry=pBbaVWSk_wPzNsj8kcXtA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 13 (objtool: __sev_es_nmi_complete+0x58)
 (& July 02)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Joerg Roedel <jroedel@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 13:06, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 6/13/25 7:59 PM, Randy Dunlap wrote:
> >
> >
> > On 6/12/25 10:42 PM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20250612:
> >>
> >
> > on x86_64:
> >
> > vmlinux.o: error: objtool: __sev_es_nmi_complete+0x58: call to __kcsan_check_access() leaves .noinstr.text section
> >
> >
> > Full randconfig file is attached.
> >
>
> I am still seeing this on linux-next 20250702.
>
> Adding BP, Joerg, Ard to Cc: list.
>

Where is this full randconfig that provokes it?

