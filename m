Return-Path: <linux-next+bounces-731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F1D82B3E9
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 18:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 135221C241D1
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 17:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54298524AB;
	Thu, 11 Jan 2024 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="QAPyiDd3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637DE53E0D
	for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bbc5636b8eso3539667b6e.2
        for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 09:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1704993647; x=1705598447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuBWFfCHQEYOGFXSXRVh/tqOJZ9yfBHx65XIDHm7aYE=;
        b=QAPyiDd35PzO8dByv/cadhL61C5oLjuGEodyV3K5c8ntP23iGSniIyM/UGQBexlXHt
         OhI8cFQUm0N9gXF5Wc19tjX1Qx78VOcEzo0aFUVfPSR7SX4PsfhW4hyV/DFybLTpqMR6
         OK7DIFMEEsVuiRBvUPHW/5jW7sKHDJcK8WOCf7p+a2Cgb0sXCUb32qX9/4sZJs+kuF8P
         bpe8uJYjqJGs5i6+fh8kik/CReRg/fIO9y8tOiZp3qhB6Mpzynk4cufJCSIqEwBTalMm
         etYD4yECKhBIT7D4aaRg6iHwWLS7ObFj/X4nmtdJwPYqf3JGwYhopDZxZw206SzwJR3i
         YpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704993647; x=1705598447;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuBWFfCHQEYOGFXSXRVh/tqOJZ9yfBHx65XIDHm7aYE=;
        b=nFr+eJnmLisM9jptf4XeiixitYOeAaGghQCaB7tyjkUKoMExuf+FgR8m0b7x8nHy4h
         Lsk5jfvSqMxWH7dNltcA1y4Ke+hIIIBTyCuQ8VRXHAYjyYDF4316AYlXxCBPldSF2o3k
         Zu/p+sBzk0yrz3/9/qynH67B5Hw9sTvtl8IU6hXVKEJ7B40kinLUPRyY8hkSmvF5nL3W
         ffzuBIwQ3SnhcKts/MoquxYb09uswY8c2sJlqOIENkKrhugMK6j8xgtrGJatqLn2pzIr
         cAn3YIK14YjOvPZ0+zyOrtMwV5lK8uhREmzyT12DC42I42yA/2zBSvGJXc2CSuSi3HTr
         cNkw==
X-Gm-Message-State: AOJu0Yw+WEgi9oYXjS9wOUtP2g7DGhNeF9dDAwu/jrTF+hF85F1R9TDx
	l+lvqIxdMYtvlSIPEeI4PJ5z4OS4V3wDm44rxAxu0sAa0IA=
X-Google-Smtp-Source: AGHT+IEYJoi8L5o7NZjCk6vxWflMf4h5WF3d3ZwonWK1q6oYAkVZoWQKyTEkkE/k3b59xti7Cy7eow==
X-Received: by 2002:a05:6808:3845:b0:3bd:539a:f252 with SMTP id ej5-20020a056808384500b003bd539af252mr1633244oib.109.1704993647336;
        Thu, 11 Jan 2024 09:20:47 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id q2-20020a0568080a8200b003bd368cd4d7sm229110oij.6.2024.01.11.09.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 09:20:46 -0800 (PST)
Date: Thu, 11 Jan 2024 09:20:46 -0800 (PST)
X-Google-Original-Date: Thu, 11 Jan 2024 09:20:44 PST (-0800)
Subject:     Re: linux-next: manual merge of the risc-v tree with Linus' tree
In-Reply-To: <20240108094957.2cc727e0@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, ajones@ventanamicro.com,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-50bc009c-c654-4f6b-885e-87c249758d4d@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, 07 Jan 2024 14:49:57 PST (-0800), Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the risc-v tree got a conflict in:
>
>   arch/riscv/kernel/sys_riscv.c
>
> between commit:
>
>   777c0d761be7 ("RISC-V: hwprobe: Always use u64 for extension bits")
>
> from Linus' tree and commit:
>
>   53b2b22850e1 ("RISC-V: Move the hwprobe syscall to its own file")
>
> from the risc-v tree.
>
> I fixed it up (I used the latter version of this file and applied the
> following merge fix patch) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 8 Jan 2024 09:46:10 +1100
> Subject: [PATCH] fix up for "RISC-V: Move the hwprobe syscall to its own file"
>
> interacting with commit
>
>   777c0d761be7 ("RISC-V: hwprobe: Always use u64 for extension bits")
>
> from Linus' tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/riscv/kernel/sys_hwprobe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index ccf61b040536..41f45acb156b 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -136,7 +136,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  	pair->value &= ~missing;
>  }
>  
> -static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
> +static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
>  {
>  	struct riscv_hwprobe pair;
>  
> -- 
> 2.43.0
>
> -- 
> Cheers,
> Stephen Rothwell

Sorry, I think I screwed this up a few times.  I've got something on 
linux-next as of this morning that I think should be sane.

