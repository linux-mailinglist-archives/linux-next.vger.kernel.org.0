Return-Path: <linux-next+bounces-441-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB8B816B2D
	for <lists+linux-next@lfdr.de>; Mon, 18 Dec 2023 11:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE50281A2B
	for <lists+linux-next@lfdr.de>; Mon, 18 Dec 2023 10:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D6713FE3;
	Mon, 18 Dec 2023 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtqO5q53"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD11168DD
	for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c60dfa5bfso34256665e9.0
        for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 02:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702895419; x=1703500219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=593VCvRfGuzYPpYh8WvCXPg8SumJKKYUwdEYMlQe26E=;
        b=FtqO5q533kWHT9lYQ9aZcEMwmjlo1ubq/wK/q/TB69POfl5MqLbJGYY9GZSHd5LV/D
         +8GHelG/xaCyq/xZYCFAn1VCu473b1qnUSV7opSq5Z9OhzsQ2Vd6ZIQ6VO26kfSmrUv1
         XFcbh5ycHKzR7UVT3e1rTmhzNXDgM2EorK6NR3DTuZXikZb2M+l/kgA1Z8SqSWlOmX1u
         zDjrkWnim5RlhhZjwVIHZwTFkhb2gB6hjxe9XxDv+PXxS8rj+yg17JYd4ZOfUoo6b5I8
         6kYMsnvygKuay3UlY79VOT5qvAGGPLlxUMg2pfpUNEPwSJ9H6v+SzY3YJUf0yUm3W2gz
         /Jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702895419; x=1703500219;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=593VCvRfGuzYPpYh8WvCXPg8SumJKKYUwdEYMlQe26E=;
        b=inzG0T7PWXsVYQPlrHOWQN6+QlzUAdS7utJW18PdNXw9ABfVdTldPkjCeKh0LhzSM4
         a0ZE7TDqPPgwegEeLDhZzk16BRD2gFKwg0HMKHH91hFy3rvaDOFA9+nL92Nmvbb9NyfI
         iq5RYIPAcY0IZ3Tq5iN3yTxVwfcEkmYJnqRLZL54fzJuUDow/S/kPmiYFHWs4N3JVI71
         DHC0JCPlqQ8oVWVbiTJtdZOPH95anSrQ6pCupO5+hZUAItsWD5xTdVKM9pmWdPXLzDon
         fFy1pUliz2CVSusPg/3W5NhdRZiD+ZqAngLZSVhiN2BM+cq4bTxd6RqTtGBHqb2RcNWk
         Aq9A==
X-Gm-Message-State: AOJu0Ywc5tPNg25zZ3R9+s6c+++pX6B9IQQ5uCMBcnlQFMrFP78AgytD
	yDrvWT0wef8bu7JKwtsAqWayIw==
X-Google-Smtp-Source: AGHT+IEoVQQEFvjpsrUb/QWOY+CDJjVsPa8vHX5rpdWF514cc/vTeg7jzyk/fJXWxjykytVM+vFySQ==
X-Received: by 2002:a05:600c:4c94:b0:40c:2b08:fde3 with SMTP id g20-20020a05600c4c9400b0040c2b08fde3mr8512126wmp.87.1702895418939;
        Mon, 18 Dec 2023 02:30:18 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id bg22-20020a05600c3c9600b0040c6ab53cd2sm14702714wmb.10.2023.12.18.02.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 02:30:18 -0800 (PST)
Message-ID: <97891c14-3436-4662-b8af-4539d12938c4@linaro.org>
Date: Mon, 18 Dec 2023 10:30:17 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the nvmem tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231218161238.59ce255d@canb.auug.org.au>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231218161238.59ce255d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Stephen,
On 18/12/2023 05:12, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>    82c6ba6a7d96 ("nvmem: brcm_nvram: store a copy of NVRAM content")
>    a9d68bd9fc7a ("nvmem: stm32: add support for STM32MP25 BSEC to control OTP data")
>    5bc8339a8af8 ("dt-bindings: nvmem: add new stm32mp25 compatible for stm32-romem")
>    6deccfa25e3d ("dt-bindings: nvmem: mxs-ocotp: Document fsl,ocotp")
>    e15e05ed845a ("nvmem: core: Expose cells through sysfs")
>    38ebc72019b9 ("ABI: sysfs-nvmem-cells: Expose cells through sysfs")
>    fc334e722496 ("nvmem: core: Rework layouts to become regular devices")
>    d5827449f96c ("nvmem: Move and rename ->fixup_cell_info()")
>    52be3c1543c4 ("nvmem: Simplify the ->add_cells() hook")
>    26378491d343 ("nvmem: Create a header for internal sharing")
>    c016e72f9346 ("nvmem: Move of_nvmem_layout_get_container() in another header")
>    0e7ceb1551ee ("of: device: Export of_device_make_bus_id()")
> 
This should be fixed now

--srini


> These are commits
> 
>    1e37bf84afac ("nvmem: brcm_nvram: store a copy of NVRAM content")
>    f0ac5b230396 ("nvmem: stm32: add support for STM32MP25 BSEC to control OTP data")
>    a729c0f57dc8 ("dt-bindings: nvmem: add new stm32mp25 compatible for stm32-romem")
>    a2a8aefecbd0 ("dt-bindings: nvmem: mxs-ocotp: Document fsl,ocotp")
>    0331c611949f ("nvmem: core: Expose cells through sysfs")
>    192048e5a5b6 ("ABI: sysfs-nvmem-cells: Expose cells through sysfs")
>    fc29fd821d9a ("nvmem: core: Rework layouts to become regular devices")
>    1172460e7167 ("nvmem: Move and rename ->fixup_cell_info()")
>    1b7c298a4ecb ("nvmem: Simplify the ->add_cells() hook")
>    ec9c08a1cb8d ("nvmem: Create a header for internal sharing")
>    4a1a40233b4a ("nvmem: Move of_nvmem_layout_get_container() in another header")
>    7f38b70042fc ("of: device: Export of_device_make_bus_id()")
> 
> in the char-misc tree.
> 
> 
> 

