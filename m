Return-Path: <linux-next+bounces-1651-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF287D2A8
	for <lists+linux-next@lfdr.de>; Fri, 15 Mar 2024 18:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2449284561
	for <lists+linux-next@lfdr.de>; Fri, 15 Mar 2024 17:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5497945BFB;
	Fri, 15 Mar 2024 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ZviRoxDO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4D245C1C
	for <linux-next@vger.kernel.org>; Fri, 15 Mar 2024 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710523276; cv=none; b=XRycj+PMVqCke3/k3gkVZC9EsI0U3xmagnnU6XzpQ2G35RzBIqQWH9dej2uvqxjXGnggpVQxqmsFvs0/WDKHi2OynlVpHJrGfUK5aMK6H/FSPkUnTSPq1UpHy5I2KFRtZH5R1NlDAYI5KYgUo/Tq8hJ5lhAI+1t/egqBXgngx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710523276; c=relaxed/simple;
	bh=SxJQdfTuoCb2x/lelfOwJHFDyaV1gs/ZM8Bw0k7kT8U=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=VtHmOwq0VbtYo+N0y3ibF8ZcEdZUHqnN0JHC2hBlQknm38Y+cKfO+FoTCOsMtV8GI56lx7DUKJKqPDg6opBpAdEWY58ijayKyG+5FNYOx4SydmlWpIoJMUlfhRsmzHGxsjsbbtWMbYO5iwpnrj/Iwq4K/v5YPbknZrEk1oHicMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ZviRoxDO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6adc557b6so2170649b3a.2
        for <linux-next@vger.kernel.org>; Fri, 15 Mar 2024 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1710523274; x=1711128074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hwKt2WtLIQ3knQVAXCKQv7Q6M4Yg0kZzDjLYdF3FVk=;
        b=ZviRoxDO2qgaPX9Zb/WzLuxFXHY6HtoMYACIfK1Zmpv9iX5fyAfbd2Xg/7k53PJdGD
         TYXElzLDAlWQZkVejrRUkfsO5E6zUq/8YxNP9INxuD80labOqrmhsA4s3yZV/zK4lFgS
         D+C2gBaLAP9y6+OSKLNiSM00RC1lw5mcN113YE1PXicye66RmC6xNOOpVLdcFu2NYP1N
         quRdOGAZleiBj289reHis9F3g3Ul6DwWijQMdOHErOP4Mm/Zfjqi1wkCVGgCLpjj0gk3
         YaSnd6uTmk0bwXpLae7QWL6z2GO8GPiESywuOXpxApUt0xAfKm41wMQEX0ol8b9fIQRt
         Qosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523274; x=1711128074;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hwKt2WtLIQ3knQVAXCKQv7Q6M4Yg0kZzDjLYdF3FVk=;
        b=mkm5lKdjErxas2ai/+ZlZ1MEvwFZlKzQL3ZeP9jQpJ26pg853dqqNxYqavql7hFJCR
         0/Hnn9RJ6dxNwZObZZW30t/6eCpQ8znTNwsajzJl4GlZ8Tws4xMf0xXl4CqCenlWrsx8
         Dsxvc6mxZ8yBRNwTsbSCltxRi5/aqnUDduT1qMijb9xI7lp2jK4l83D54GrjV8syomQx
         +ClnNFTteXX5S1/F3oofkR+uewxwhgAnOGvQiPibgKnG/lxdpJcaxf6U6wyIzlUl/Okw
         55aH3t2zr1Ph/0X/NaF8486k5Q7hgi1rXbvVJT9gUxdtgruSpAQft6NyZMr7CTo3bp1Y
         EfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo7C2BsnIeyzVuJjdIOKC424ACb6jtmD4NJpk7i21V2myQsAr8s1d3+m3puRq3Neti3sks3TGo9o0/8h6nFFwpq5ah7+38f8IZyA==
X-Gm-Message-State: AOJu0YwmIsvzON1Lsbo32CBydf8HT7JtsbcaJL6+dz/yqMbh1JAtdike
	IYYOHe9hxkNBpZwoN+d2CUzsIktjweVJV9TUarc8vNxklaFLS6rbDR+hPtXDxwQ=
X-Google-Smtp-Source: AGHT+IG2d1HwRlz17fSSyKppMsKotmpDN/qlq2y5UrMrzoFTLJfeFmTGXz0aNVPGXLAHhBK3/RdQ9A==
X-Received: by 2002:a05:6a00:14c1:b0:6e6:4ebc:3cd with SMTP id w1-20020a056a0014c100b006e64ebc03cdmr6389370pfu.27.1710523273519;
        Fri, 15 Mar 2024 10:21:13 -0700 (PDT)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id g1-20020aa79dc1000000b006e6c733bde9sm3630800pfq.155.2024.03.15.10.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 10:21:13 -0700 (PDT)
Date: Fri, 15 Mar 2024 10:21:13 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Mar 2024 10:16:22 PDT (-0700)
Subject:     Re: linux-next: manual merge of the risc-v tree with the arm64 tree
In-Reply-To: <20240315103146.225b653b@canb.auug.org.au>
CC: Paul Walmsley <paul@pwsan.com>, Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>, jisheng.teoh@starfivetech.com, linux-kernel@vger.kernel.org,
  linux-next@vger.kernel.org, locus84@andestech.com, peterlin@andestech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-cfc51b24-8f65-4b87-a258-71a9893cb6fe@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 14 Mar 2024 16:31:46 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the risc-v tree got a conflict in:
>
>   drivers/perf/Kconfig
>
> between commits:
>
>   c2b24812f7bc ("perf: starfive: Add StarLink PMU support")
>   f0dbc6d0de38 ("perf: starfive: Only allow COMPILE_TEST for 64-bit architectures")
>
> from the arm64 tree and commit:
>
>   bc969d6cc96a ("perf: RISC-V: Introduce Andes PMU to support perf event sampling")
>
> from the risc-v tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry, I guess maybe I should have looked at my queue before agreeing to 
send the starfive PMU patches via the arm64 tree.  The Andes stuff 
touches a bunch of other RISC-V bits, but I'm happy to do a shared tag 
or something if folks want.

Otherwise I'll just point this out to Linus when I send my PR -- I'm 
going to hold off on that this morning, as I just realized I should have 
taken this GUP fix and thus want to let things bake a little longer.

>
> -- 
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/perf/Kconfig
> index 004d86230aa6,564e813d8c69..000000000000
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@@ -86,15 -86,20 +86,29 @@@ config RISCV_PMU_SB
>   	  full perf feature support i.e. counter overflow, privilege mode
>   	  filtering, counter configuration.
>   
>  +config STARFIVE_STARLINK_PMU
>  +	depends on ARCH_STARFIVE || (COMPILE_TEST && 64BIT)
>  +	bool "StarFive StarLink PMU"
>  +	help
>  +	   Provide support for StarLink Performance Monitor Unit.
>  +	   StarLink Performance Monitor Unit integrates one or more cores with
>  +	   an L3 memory system. The L3 cache events are added into perf event
>  +	   subsystem, allowing monitoring of various L3 cache perf events.
>  +
> + config ANDES_CUSTOM_PMU
> + 	bool "Andes custom PMU support"
> + 	depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
> + 	default y
> + 	help
> + 	  The Andes cores implement the PMU overflow extension very
> + 	  similar to the standard Sscofpmf and Smcntrpmf extension.
> + 
> + 	  This will patch the overflow and pending CSRs and handle the
> + 	  non-standard behaviour via the regular SBI PMU driver and
> + 	  interface.
> + 
> + 	  If you don't know what to do here, say "Y".
> + 
>   config ARM_PMU_ACPI
>   	depends on ARM_PMU && ACPI
>   	def_bool y

