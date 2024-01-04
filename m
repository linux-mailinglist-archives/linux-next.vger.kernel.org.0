Return-Path: <linux-next+bounces-612-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39C823FEC
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 11:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 689F11C23C4C
	for <lists+linux-next@lfdr.de>; Thu,  4 Jan 2024 10:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCFF210F5;
	Thu,  4 Jan 2024 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iYyjWaP6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0076B20DDE
	for <linux-next@vger.kernel.org>; Thu,  4 Jan 2024 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a28ec136715so29148466b.1
        for <linux-next@vger.kernel.org>; Thu, 04 Jan 2024 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704365529; x=1704970329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5fZa5BBUNgRC/MuXKPlVg1/H35HoZwMYqORDEqtrMo=;
        b=iYyjWaP6ZDYkFjkx+R35sNVUvrUOrmoDd691I5eM20pFp7Mt2AGSYsQ/Kla8eFRpFt
         KqngfhQODGrOdnFvKcYg0Yhk5LLHcZJl0jFfu8IXJ244r003EWS+M8uWQp4YiGEwKM5D
         aLFT4ZFRek4CVbLaPucYgLn4IDu4ntHonff2apgUc1ITYIjARZxjY32c45WcJygy4VZL
         /ySOQw3OIcqnRWN4KQ4XXYinpuVq4DUxT7/IyQ/abEr0uY78/lrH/liK+28wsSkHu30F
         gMZa7+VV8XF8ByPUTO++82QzRSrZ8uDkqMz4dnoxIq0oIdOKSXJc5It9xjM2YeYyCkOk
         4v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704365529; x=1704970329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5fZa5BBUNgRC/MuXKPlVg1/H35HoZwMYqORDEqtrMo=;
        b=DujMjxFrx3cke+pYf+EF9qBzXyAcr7sd5R/7aO3iJ2d9lsw2SvQVFWzqaOcN+jQtQG
         QPDVRIwzLfiIIzeAdQQToyNbt3Qd8Si3sx5ipvddvbk1mIFrKMw81ofJMOcm/6EOj5Kd
         7ZxPBPMU2y6jboI82GJN1NUO1qlmdb2bNQ3ZvQJrBkC+klZm6pGf12CBRDC+/SMBiDl/
         LRfHGHmEHEevjtzNxXil1y1p/0TQpgcDhjomrmN4zyDfwE0YCmhoUXMGp6f00av64Anp
         e53kjgJLTlGhXb1u1j6uHHR97G8bgrsvzlyUlhsmG/u9jOcwvjCltC+0oeirIqKpynLw
         IasA==
X-Gm-Message-State: AOJu0YzuKBki6H/b7pbYMXemhYi33F8f98o0OblwutHVKskJ8XXcNpG0
	MTEL3KHzRBncujtiRp/k5QuInxzGayNXAg==
X-Google-Smtp-Source: AGHT+IH2SFA7HOTq7Srx7DUub3qQkU+yO1rsmGqpIPcd4XSv3GgGa5Bl/CgkrtDWu8S+ikAtHQUTUA==
X-Received: by 2002:a17:906:d9c9:b0:a27:fdc1:593f with SMTP id qk9-20020a170906d9c900b00a27fdc1593fmr240521ejb.67.1704365529270;
        Thu, 04 Jan 2024 02:52:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y2-20020a1709063da200b00a26e4986df8sm10496620ejh.58.2024.01.04.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:52:08 -0800 (PST)
Date: Thu, 4 Jan 2024 11:52:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	anup@brainfault.org, atishp@atishpatra.org, rdunlap@infradead.org, 
	sfr@canb.auug.org.au, mpe@ellerman.id.au, npiggin@gmail.com, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
Message-ID: <20240104-d5ebb072b91a6f7abbb2ac76@orel>
References: <20240104104307.16019-2-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104104307.16019-2-ajones@ventanamicro.com>


This applies to linux-next, but I forgot to append -next to the PATCH
prefix.

On Thu, Jan 04, 2024 at 11:43:08AM +0100, Andrew Jones wrote:
> KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> supporting architectures select HAVE_KVM and then their KVM
> Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> consistent with that approach which fixes configs which have KVM
> but not EVENTFD, as was discovered with a randconfig test.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/

I think powerpc may need a patch like this as well, since I don't see
anything ensuring EVENTFD is selected for it anymore either.

Thanks,
drew

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig     | 1 +
>  arch/riscv/kvm/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a935a5f736b9..daba06a3b76f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_KVM
>  	# https://github.com/ClangBuiltLinux/linux/issues/1881
>  	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>  	select HAVE_MOVE_PMD
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 1fd76aee3b71..36fa8ec9e5ba 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -	depends on RISCV_SBI && MMU
> +	depends on HAVE_KVM && RISCV_SBI && MMU
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> -- 
> 2.43.0
> 

