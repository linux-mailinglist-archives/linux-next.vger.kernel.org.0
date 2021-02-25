Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FC1324E8A
	for <lists+linux-next@lfdr.de>; Thu, 25 Feb 2021 11:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbhBYKui (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 05:50:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbhBYKsb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2021 05:48:31 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C628C061788
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 02:47:47 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id i7so4716266wmb.0
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 02:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ntcKBESxFVyduoAY/dPjBxtnQO9pteJ/Wd6m2/ACihc=;
        b=CZf/YGKddhGVVe1DMJkkY2i0ywBaQyh9j5Ps+4eoOK4pyx73889nYyXjQ2j5o4kYOD
         6yc+KTpkfDaMzXLWM1EIxoD+uuNoDy79QIvWV0wg+gzpNENJycAQA8trhJNb9lzoTKhH
         1RVdxC1FCEbP0NEUp6BAR5SouVnBDQBHjXoe1zRaynZFDAh5LNlH01Hq1C3ermFExGBF
         cSBDesOdk0Roo/EgATMQkFSgqr40AlfDuHaL9fIVfgQSUFOkpKVIbwBj2coe9TFZmiaq
         EvME94oOIm//YmFOXhkH3PA5UzH+K1Bf643S3j/5JAzM7YoDys1kIaSnOrDzPnlqgg39
         2z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ntcKBESxFVyduoAY/dPjBxtnQO9pteJ/Wd6m2/ACihc=;
        b=o9inHZpPohECbK9e+iWTd2WvxPT9p7OuCUivSLQ4aREigtEn03T2wxDi8hqUsAiCDu
         ycNz+y6pbnaKrOvF3TqFTtmEx+4XK60+oFLKDv6J6YqoiVPi76QlLL6StnIA7CKYnGvn
         T+3Mht1rMgz71S/1aemUW6nBwzcs8kXNxgZ2kiCku1yR//ZstHGmYLdBcjhYduitf0ub
         pcTs0s9/Fp4WbRvKwcAb+PpYckR4ROBpusAcem5aHRG935LCI9Q1txtGugoAI/TynFKu
         o1HVolfF93L6ePoSXo63kn6yrxNK+zLzy3rJsVRX5+Foy0QiMfvUx/Sd/KoMa1Hwba2y
         7vVQ==
X-Gm-Message-State: AOAM532wnbJOdw0WMsM6BzUW/ygt+qvOQGVZP/kBU9wsmm5Ob1O7h4w1
        qtsLWlu4+2mZSye5s8kzv2bm1w==
X-Google-Smtp-Source: ABdhPJydhYQjpuk8jx4V1ehMhP9g4MgIJuBp/VmDpGOyeOXqMKpjjqh9XwwYrZZKTeBhxE9UwIe2Yw==
X-Received: by 2002:a05:600c:3588:: with SMTP id p8mr2602481wmq.71.1614250066000;
        Thu, 25 Feb 2021 02:47:46 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id l4sm7927850wrt.42.2021.02.25.02.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:47:45 -0800 (PST)
Date:   Thu, 25 Feb 2021 11:47:43 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the sparc tree
Message-ID: <YDeAT33QxlCuzLz+@Red>
References: <20210222190928.4f093646@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210222190928.4f093646@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Le Mon, Feb 22, 2021 at 07:09:28PM +1100, Stephen Rothwell a écrit :
> Hi all,
> 
> After merging the sparc tree, today's linux-next build (sparc64 defconfig)
> produced these warnings:
> 
> arch/sparc/configs/sparc64_defconfig:237:warning: override: reassigning to symbol ATA
> arch/sparc/configs/sparc64_defconfig:239:warning: override: reassigning to symbol HAPPYMEAL
> 
> Presumably introduced by commit
> 
>   520615e1f5b2 ("sparc64: switch defconfig from the legacy ide driver to libata")
> 
> or commit
> 
>   a57cdeb369ef ("sparc: sparc64_defconfig: add necessary configs for qemu")
> 
> -- 
> Cheers,
> Stephen Rothwell

Hello

Sorry, that's my fault for both warnings.
I send a patch fixing that.

Thanks for the report
Regards
