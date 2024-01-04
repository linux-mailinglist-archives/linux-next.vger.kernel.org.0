Return-Path: <linux-next+bounces-616-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE3A8240B0
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 12:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7C81F21ED8
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 11:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2692134F;
	Thu,  4 Jan 2024 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="qP8srV68"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1092021347
	for <linux-next@vger.kernel.org>; Thu,  4 Jan 2024 11:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3606ac90de0so18565ab.0
        for <linux-next@vger.kernel.org>; Thu, 04 Jan 2024 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1704368001; x=1704972801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Dt7uLNKLulzrg/dNC959xAVcdyKjB2fv5qTZvClME8=;
        b=qP8srV683Nx5VjKLocNoI3lP4d1WSQwwYemqOPlfTCt9LUKdj1V09Ba2t28qrFgzFc
         7by1AYbyw0bzfgGrgY+9ZuC8s03kOUUEm/W0ulGTKQFIXtSSgrhuuN9lLJh8XHkYpt7W
         hk9yUoaYC1EWBgEgkmR06zRTu/3IAurCPUg4zt0A2i/5OqY01n+uPEgeNkuB1bhejEvk
         Uo43G0mls0vRZTyJhrlqyvjsBNhx0Xrj0YhEtGb0eDbOUpGmpa/F8YOu06DaVHWrN4Dt
         vmv8TWZgMPepuYRxxehNfddm3MYjqLP9AjCJjznQ2lKgvMb0ioCQCsxP37N7TR80kS8c
         TLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704368001; x=1704972801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Dt7uLNKLulzrg/dNC959xAVcdyKjB2fv5qTZvClME8=;
        b=wOEruOg5+UhZeckL8L3wVlSvT828qkVWdrwfbyXug8mbpChEKVFuW9QdqNGnC2z1vK
         StjmGQPdK3UJ8+OQDaXsQ7epbScJ1ljjrsBMcla4e0+7HLqu1pG0Lcpt21mm82KTzdds
         NoWq5muUxDaNUuAdFB7KXpprM/N3yW9+rknf0Ky8N8yqtv+5+ewIHGfHmlXzcTHXJtCc
         zdDRPiabEtQU0G6tuyM6T3/mh96s5X0yp9fz1HQ6Zo3FiJwcR2fB4VacHt72NnZa68/Q
         V1s9FWmRPd7ZkJzHu5O4UP3Iwv3XcAfbmgJ/SDhGhYxBzBlmCc2HipE2dAekfWzcsmZb
         Ay+Q==
X-Gm-Message-State: AOJu0Ywj1/SIlVr874MIIhwT2g1uvD6o1/HxnYzEhSutbopXkcpkJ78v
	jR9lchFrwCGGTyyyW/PK39jLxMnxXb+GX2f6UdV10dvivJDMPw==
X-Google-Smtp-Source: AGHT+IEiLv7qiits4vk8xdWF1s4r4OiPqhbNMM2mLBiLLO2wGlETEHoIcyBn6dRE3jspd9+Bb4GSzadf5GgKpkLl1DU=
X-Received: by 2002:a05:6e02:17c9:b0:360:16c7:2d6a with SMTP id
 z9-20020a056e0217c900b0036016c72d6amr482112ilu.48.1704368001050; Thu, 04 Jan
 2024 03:33:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel> <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
 <20240104-6a5a59dde14adcaf3ac22a35@orel>
In-Reply-To: <20240104-6a5a59dde14adcaf3ac22a35@orel>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jan 2024 17:03:10 +0530
Message-ID: <CAAhSdy0uVZXsP1_3zZiwXXEXBZGkmWX5ujptirojD8S4nuzQpQ@mail.gmail.com>
Subject: Re: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, rdunlap@infradead.org, 
	sfr@canb.auug.org.au, mpe@ellerman.id.au, npiggin@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:51=E2=80=AFPM Andrew Jones <ajones@ventanamicro.co=
m> wrote:
>
> On Thu, Jan 04, 2024 at 12:07:51PM +0100, Alexandre Ghiti wrote:
> > On 04/01/2024 11:52, Andrew Jones wrote:
> > > This applies to linux-next, but I forgot to append -next to the PATCH
> > > prefix.
> >
> >
> > Shoudn't this go to -fixes instead? With a Fixes tag?
>
> I'm not sure how urgent it is since it's a randconfig thing, but if we
> think it deserves the -fixes track then I can do that. The Fixes tag isn'=
t
> super easy to select since, while it seems like it should be 8132d887a702
> ("KVM: remove CONFIG_HAVE_KVM_EVENTFD"), it could also be 99cdc6c18c2d
> ("RISC-V: Add initial skeletal KVM support").
>
> I'll leave both the urgency decision and the Fixes tag selection up to
> the maintainers. Anup? Paolo?

Lets add

Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")

Regards,
Anup

