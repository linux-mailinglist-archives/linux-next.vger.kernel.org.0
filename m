Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C61A2D5CBF
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 15:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgLJOEM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 09:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732424AbgLJOEG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 09:04:06 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155A5C0613D6
        for <linux-next@vger.kernel.org>; Thu, 10 Dec 2020 06:03:26 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id ce23so7451518ejb.8
        for <linux-next@vger.kernel.org>; Thu, 10 Dec 2020 06:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wQkZfoQiHk1xwccW1qOvkd2W3WhIuH9Tuwz2EAXi1QE=;
        b=TohY7715fqEyw/5GjAEVPNV37qaIsrFhUphQ5D0Qi62jTDE/9Mr3f3oICVrRu0NQVR
         ZlRrHK3BK05HYMiI2ImzDJ3XcD+ycCwriNVRzRZUpKfD9o1WNriiQGfExofjaxgrag9U
         MXsilONV07UtdI/ToYtXVqwJkt3QEKspK5uMhxjB+bK3w7YFeEwgkcX48fcIJM5VaAy/
         PKDZBok9Ia9S3ii1chbrBz/mp/qNMQMPs/u6osmeEuRp/e9vzvQkW0pS7xHE+Uf0j3Wl
         u1NMjEifApdg6JTcSugs2/0c3WZgLr2OETvf071QVDwYShhkmXn9+EmDTPGBhH33xqM3
         M+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wQkZfoQiHk1xwccW1qOvkd2W3WhIuH9Tuwz2EAXi1QE=;
        b=C6NbmT6KdvPmIUMoMaVPrtFx69ehQZF9gq/y74Ey4qRzIwR9ax/W+1Vy6fWgX3T9zG
         zoTkgrJeazf0U6OQAqYOUONLQx7n6TN5DGgNKJC7l7IzgPiSM+mDllq8PyOSyFZOOn5F
         kNRFHrDBOfUzCM6e/pX2Gt6f72e9GZJOy45e6/97B4cC6tJyl1OIG+pKpK2pcrHAednI
         E7Ae1elsJjblrde3qeVsAhfvqbozG2SUvpXrrgChyMsAv0cxdWqWuIs4zbziiwu8YuFP
         OYmhN769cqRfy+C47uz13HKMfihVmsEU8gSanyj9FCoXLqg2vMfVXrDnhx/CWdgM3K5n
         WtJw==
X-Gm-Message-State: AOAM530JRCVQLEwqS2v04MCbw+ZxY0v+LUuMuzVvDxWN9AE/sIzcX3Jk
        bBrMhpYx+aVh8LMP8vIcEsoJuEhgtml95sbt
X-Google-Smtp-Source: ABdhPJwYDfFoEIJMhCuEIucESC7KnKGajEnGFwmu71YD+I9rvBJsJTreJiRmXUx82xbweE+nQCNkyw==
X-Received: by 2002:a17:906:7fcd:: with SMTP id r13mr6682088ejs.242.1607609004361;
        Thu, 10 Dec 2020 06:03:24 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id f11sm5148560edy.59.2020.12.10.06.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 06:03:23 -0800 (PST)
Subject: Re: linux-next: manual merge of the tip tree with the microblaze tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201210155808.717a7257@canb.auug.org.au>
From:   Michal Simek <monstr@monstr.eu>
Message-ID: <1848f245-2a64-0aec-58db-b575de29debc@monstr.eu>
Date:   Thu, 10 Dec 2020 15:03:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210155808.717a7257@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 10. 12. 20 5:58, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got conflicts in:
> 
>   arch/microblaze/Kconfig
>   arch/microblaze/mm/Makefile
> 
> between commit:
> 
>   05cdf457477d ("microblaze: Remove noMMU code")
> 
> from the microblaze tree and commit:
> 
>   7ac1b26b0a72 ("microblaze/mm/highmem: Switch to generic kmap atomic")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks for letting me know. I will mentioned it to Linus.
Your resolution is correct.

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

