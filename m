Return-Path: <linux-next+bounces-7878-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCC4B1EDB9
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 19:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E773D567C1F
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 17:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5821DFD8F;
	Fri,  8 Aug 2025 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="UlNdNllt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2391DC98C
	for <linux-next@vger.kernel.org>; Fri,  8 Aug 2025 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754673637; cv=none; b=OvQPc0gQ99F/rYu/oXqSxXxyVK3CY8R3YvUx4CTfGa6BZ7RPsjLH/5T2ciYKkYvoCw85QmDBeLT/BP20vFBqOAXUYqjRuVN97sYrJbVbf7so0ae4GZh3pc+ht92aZ4lm5CH9+qCwCU8SpcVgNS4d8b4PogDXti3hNhpCTB1I6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754673637; c=relaxed/simple;
	bh=L7wOxLP5SQDKAk63h8Hs7uu+flv14cbBA7KAL5dj+Qg=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ZVQIsEf8H8REdljsnKrqwl+R8q49RW2nh7xdtfCT1OcbmDV0ohbYZEHsIBGW0nrH7YKQ/zAceRLcTDJGMQ2LmTANADncszqx6Z7k7c6bbEzxqpHT3vEoonPlpTwrLOXm9/igrr3jefCJ6MceYvFkaZaFkWkUvC9HAhiNPj+UkDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=UlNdNllt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23fc5aedaf0so16717815ad.2
        for <linux-next@vger.kernel.org>; Fri, 08 Aug 2025 10:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1754673635; x=1755278435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+sIPT2LQsT7fRQnm3CcVOzVxzJQUY6AZ7bd9JG+2fg=;
        b=UlNdNllt1+s0b+3YDdO1oaAgrXVdrithhUza4gEZrmfgmJPw/kyVh+AUdOLHwJYmRD
         Bgn5VoKu5qH7KexAviUALfz9UJfEmXeCIgFMUxxpNmEeWafjDQsgvR6XGodINtMr3Ihf
         aWezxyECKvVAXvka+Xia6lJY0/+YYRIZpdctT4BmZmuAAmrN8NYiPdryw3aJKh6EyyNq
         nzGeBHaheYAGYbf3UZ1E6ZoZfp1OskkMRPsW2YccJc/rlimmEflqHpk3TxXdWx+uaxjv
         6wuqXvWwkB9AzfxBWWuc/ykFTJ3RP+jgiLtMaR4+aU/92lTIbCjhrIT/MNrXay5BMjJH
         Iq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754673635; x=1755278435;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+sIPT2LQsT7fRQnm3CcVOzVxzJQUY6AZ7bd9JG+2fg=;
        b=vwl2rLoPGpdbbybDJCSs/kHPcCOqYJuZBopnGN8ibbkVMThQYPtnBejcXL8782tyCo
         IX1XgjgKaf3VNsharo6BZfF1hrLWMl12NZdn81Rtf4q9qK6WoAcAFKZsqF3qRmeJRD8/
         cPVHXm0XomN2Z5dmVsvA0UvLYhg0zQWjNwjhFyNc3sVMn471O/75DoFJ7r6WVAz9SMjq
         iAa0qvyoiSYB33CjZdtEW58arUkxNNc5ZCR1l401cdSFKgfvOOAS0l8Vy6et7Vug3PQK
         FYobCUtCIW2N7+ST9hmTLUPRycpYp0z6GenuOy8OfU2S/GtTjbprRUCA4cR9Z/SJNjOC
         SQ0g==
X-Forwarded-Encrypted: i=1; AJvYcCUh2eQ2KAeSo3AQWXH5Kq78PHxgM1/Wv69mx0J8oRM6zEdNlrVsImLaYiiIIXJvlt5l+L6alpiB45bJ@vger.kernel.org
X-Gm-Message-State: AOJu0YylHqDnSaIWgx0qUfUtHWLID+j8gi8FSrS5w6cD3HdZuD7k2aGR
	NLjQ9as1X0BDvVWKd1u1wJwZjCWm5wvtiPeY1nWuspX3CTu9J4Jek/fEh+DemkPklBg=
X-Gm-Gg: ASbGncuKfFFBXATQUHcQjZvOuE6sAnAWNRCF/qXoAVUcxnXzj+zAD76eVh64v/WLAc/
	qzCJBAPd7eYbmYLbZmeYOHb61lNXWbLB2oVm/Nz319akqfs9EU3dizJQKFQU0NjRrcZNcVjbr6J
	l8TpwSgabWCBJYcI14JpctNBIVJtKcD1sYCdXmVCF8CoMEDba8ciBV+AJzbEk1+Ep0hB0ocuFwQ
	mn8inMRpQcdFZb4CUXlFCEN8zLVwzkg5G1JjgAAkfPpvlae4C0N4up0/y5kVze6XhEVaIpScdKM
	aM+r3B6tkKAXGMfADWaZuobWDfASWwXDi0kNl1+LjrPugzr0iqDJGb60ju3hHCwvmPWqpD+VelQ
	94CIeaXLGLu815L7n6lGoNSmnbQ==
X-Google-Smtp-Source: AGHT+IHOby8czN77FochlczWuhjS0Bun0416YcI1s2pCN6G+dIQPuN7NDLXCjgwz8vlnPi5aoE3BkQ==
X-Received: by 2002:a17:902:ce91:b0:23f:f96d:7579 with SMTP id d9443c01a7336-242c2206d64mr54001795ad.37.1754673634618;
        Fri, 08 Aug 2025 10:20:34 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:6f48])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241d1ef48fbsm214671475ad.36.2025.08.08.10.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 10:20:34 -0700 (PDT)
Date: Fri, 08 Aug 2025 10:20:34 -0700 (PDT)
X-Google-Original-Date: Fri, 08 Aug 2025 10:20:29 PDT (-0700)
Subject:     Re: linux-next: manual merge of the mailbox tree with the risc-v tree
In-Reply-To: <20250808114332.63ec1528@canb.auug.org.au>
CC: jassisinghbrar@gmail.com, Paul Walmsley <paul@pwsan.com>,
  apatel@ventanamicro.com, justin.chen@broadcom.com, linux-kernel@vger.kernel.org,
  linux-next@vger.kernel.org, rpathak@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-2E4BF257-2676-4F2C-ADAF-8758E88AF34B@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 07 Aug 2025 18:43:32 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the mailbox tree got conflicts in:
>
>   drivers/mailbox/Kconfig
>   drivers/mailbox/Makefile
>
> between commit:
>
>   81db83e750ca ("mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver")
>
> from the risc-v tree and commit:
>
>   52436007b862 ("mailbox: Add support for bcm74110")
>
> from the mailbox tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, I think these are all pretty trivial so I was just going to 
point them out to Linus.  That said, I did pick up the RISC-V mailbox 
stuff super late so sorry about that -- Anup had asked me to pick it up 
a month ago, I just forgot.

>
> -- 
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/mailbox/Kconfig
> index aa2c868256d7,02432d4a5ccd..000000000000
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@@ -350,15 -359,14 +359,25 @@@ config CIX_MBO
>             is unidirectional. Say Y here if you want to use the CIX Mailbox
>             support.
>   
>  +config RISCV_SBI_MPXY_MBOX
>  +	tristate "RISC-V SBI Message Proxy (MPXY) Mailbox"
>  +	depends on RISCV_SBI
>  +	default RISCV
>  +	help
>  +	  Mailbox driver implementation for RISC-V SBI Message Proxy (MPXY)
>  +	  extension. This mailbox driver is used to send messages to the
>  +	  remote processor through the SBI implementation (M-mode firmware
>  +	  or HS-mode hypervisor). Say Y here if you want to have this support.
>  +	  If unsure say N.
>  +
> + config BCM74110_MAILBOX
> + 	tristate "Brcmstb BCM74110 Mailbox"
> + 	depends on ARCH_BRCMSTB || COMPILE_TEST
> + 	default ARCH_BRCMSTB
> + 	help
> + 	  Broadcom STB mailbox driver present starting with brcmstb bcm74110
> + 	  SoCs. The mailbox is a communication channel between the host
> + 	  processor and coprocessor that handles various power management task
> + 	  and more.
> + 
>   endif
> diff --cc drivers/mailbox/Makefile
> index 6659499a50db,98a68f838486..000000000000
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@@ -75,4 -77,4 +77,6 @@@ obj-$(CONFIG_THEAD_TH1520_MBOX)	+= mail
>   
>   obj-$(CONFIG_CIX_MBOX)	+= cix-mailbox.o
>   
>  +obj-$(CONFIG_RISCV_SBI_MPXY_MBOX)	+= riscv-sbi-mpxy-mbox.o
> ++
> + obj-$(CONFIG_BCM74110_MAILBOX)	+= bcm74110-mailbox.o

