Return-Path: <linux-next+bounces-775-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7E9832391
	for <lists+linux-next@lfdr.de>; Fri, 19 Jan 2024 04:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D4F4284A41
	for <lists+linux-next@lfdr.de>; Fri, 19 Jan 2024 03:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23303184E;
	Fri, 19 Jan 2024 03:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cNFsReMZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B24917F0
	for <linux-next@vger.kernel.org>; Fri, 19 Jan 2024 03:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705633990; cv=none; b=JmFNaP9e23Aik7i+GBENkeFQRb+vbd72vur+/axG7cLdVJbG5uVf29APIQeV9UkdEN0qXdVubnln2kBT4zIq0XQsoIAvqZzMDNxEWzzj+kf4dmOARit9WKOsHMnpsl94fo4mHQQbcw87Jrlx5fLo3+k/c6mivhHD1Q/Pi74GzvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705633990; c=relaxed/simple;
	bh=+f2ZoedK7FP1DbND5juUvhTafSPGIv0emWsVqtcPME4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3HFh+9fgRmKzqCnrfvaD9DDX9fl9+ATROMKx4PXXjhtyxNMyS/esj3bWS4OUgLV7bnHZbgRJEvuVgSSgajGx6gGY18ugJc6ZyrClpbxA9N84dT57AZatSoFZ4JAXtXvKwBBifhaNAd+fXuaiz/TYFq6zBHOJnp9+WvgMjXMKH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cNFsReMZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so358087e87.0
        for <linux-next@vger.kernel.org>; Thu, 18 Jan 2024 19:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705633986; x=1706238786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfU1RR3yVXE2aFjE6KuwO1NTsoIa0IOOIUzkc/YADig=;
        b=cNFsReMZRK0Oc4hfqvzplg3X83svfp0wBCIib+Vdz3umPUWpuj0yD1o2kKGYM0+T2E
         m/zZjfYBrbPTm1J7V8vBpdDf0C169yUdWgWx6zi3U7VHazKbDL2aoQo98YB23hgf84xH
         CqlCkE0b3KwvkRzw92qsMP3vWQYKfzJ0WK6hi1rCheVMcCet1ROlAbC9kiz2S5jiZ8DF
         ziDD8MlYdcN0JfOoFablYt7v2NNTB0wXKRVJKbrxzcVlBIx2n47/uzGtCsYzWToF0T05
         YCL5/9Pt8eXzQQVMBTywhk4waq7dAGPsUAXVZ6bOMOPj93AH4AdGCFBKn9yAW98fGQP7
         OWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705633986; x=1706238786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfU1RR3yVXE2aFjE6KuwO1NTsoIa0IOOIUzkc/YADig=;
        b=MfEC1umsebQaOxa+fvFoITg24aBpEkLKh1bs6uYN4ZYNB7Os0cQ3vuK4GcBZRnkMrl
         x4SbT4v1P/kcLH2/DeQFKwPpB75/x7kxPskOr004pdhoMIYP9mpANBca3aNq6IB36Mog
         PhTWEoNydXp8qb5yDxSebiYLpvT29NEmrMLreFlb+26QL8VwsUT41650tDS7XHYoeiXP
         61m4Ur7Qd7CNcRHZ3D3Klw6bUvyFhgioxKkwD9jct0iWfmeg4RtGbAFxeOpoEM4BMLRz
         L6xWUwPTc7FVhvalEAemuKSbyn/SE0YXQBRDXFMSGLDhGoobNQ8CV5SGwho4gBHVUX1f
         JljQ==
X-Gm-Message-State: AOJu0YxwUDDOKK0k+/SZI+kAOKdGn/2Bo1UIoTN9OqgNNC1sQzhehfif
	D9oeSHN1yPFuAvJC/lEGwPmTf3SFRafVGyRtfksf26cbzAtIc38iJKyAHB6e4+fUx2lebUi7QHh
	HbTcADh1MFvQW12tCQAuk6Mb4Pd0wztZza70Rdw==
X-Google-Smtp-Source: AGHT+IE+iUkkY6fxTl1+JfpkYAQ0slyXdEkKVq40J5n5SU1ZLhag+ZXwroh2Z1WoXt0AjKQUbiW1WyNyUstIlFIKEPY=
X-Received: by 2002:ac2:41c9:0:b0:50e:314c:76da with SMTP id
 d9-20020ac241c9000000b0050e314c76damr265337lfi.82.1705633986292; Thu, 18 Jan
 2024 19:13:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104123727.76987-2-ajones@ventanamicro.com>
 <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com> <ZalilFSHBa_XHolD@google.com>
In-Reply-To: <ZalilFSHBa_XHolD@google.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jan 2024 08:42:53 +0530
Message-ID: <CAK9=C2X4R+3F5Lh-f33dPVMkyGt+koXorfwMOmB-JnqSs79eQw@mail.gmail.com>
Subject: Re: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, rdunlap@infradead.org, 
	sfr@canb.auug.org.au, alex@ghiti.fr, mpe@ellerman.id.au, npiggin@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 11:10=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Jan 18, 2024, Anup Patel wrote:
> > On Thu, Jan 4, 2024 at 6:07=E2=80=AFPM Andrew Jones <ajones@ventanamicr=
o.com> wrote:
> > >
> > > KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> > > supporting architectures select HAVE_KVM and then their KVM
> > > Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> > > consistent with that approach which fixes configs which have KVM
> > > but not EVENTFD, as was discovered with a randconfig test.
> > >
> > > Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > > Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d382553=
9d8@infradead.org/
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >
> > Queued this patch for Linux-6.8
>
> That should be unnecessary.  Commit caadf876bb74 ("KVM: introduce CONFIG_=
KVM_COMMON"),
> which is in Paolo's pull request for 6.8, addresses the EVENTFD issue.  A=
nd the
> rest of Paolo's series[*], which presumably will get queued for 6.9, elim=
inates
> HAVE_KVM entirely.
>
> [*] https://lore.kernel.org/all/20240108124740.114453-6-pbonzini@redhat.c=
om

I was not sure about the timeline of when Paolo's series would be merged
hence thought of taking this patch as a fix.

For now, I will drop this patch from my queue. If required we can have it
as a 6.8-rc fix.

Regards,
Anup

