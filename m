Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15387277C22
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 01:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgIXXFX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 19:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgIXXFX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 19:05:23 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211B4C0613D3
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 16:05:23 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u24so794470pgi.1
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 16:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hnujkixuRutuFm4HGJsB1dGhTsgM8S0w50kayJIGLaI=;
        b=AGjPLAwmd0eUyxxHh90kZSBg3bosIAt3Ufw+0IDG15NNgTznjJp8nHebjBbTvVbtJp
         VZmNIpA89F1a0DyN7dNSZErrceZ+VGgSxfVUBUC/6FUQ6DdGsduL4BCt6ghnlJDlbWV6
         MBu80ynEvcPsSPce+VyrlzcR8f24v7fopLv2vp4EE9lQ206XB75uSsUH2VFsd4bfxr/H
         T2sH2vPfRYOaBATr2pGEEvaLhByriK0qI8uc2zXnqFHM6LqQyuUQNT9X9MdkrtzZUme4
         HUd5/WCq+j0FMK53FJ8xTwGBjVsNK7CRpWgZ6fSN0dmoNs4XLYfrE3AByUS1EvR15tiD
         k6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hnujkixuRutuFm4HGJsB1dGhTsgM8S0w50kayJIGLaI=;
        b=qoCqbnkBNl+HQCQ0URPpVOgXsBAhcnc88muAAmVs0pYCYKVYZMiC90sLbjnlMbiq+v
         Dd4PjQ7IpIuvKDdeJzF/5wlgDdYk0sOHIF/fTg28xZVBrdrvR5TBlmSr0iD7qvom10sb
         tf90WJr7GoIIfakwPMXCfCIPHef13waaz0R7ZbFmalqad6AqKd01+tiwn4JxQeyXcJeG
         VxM0u4DAFhtEc8iBlNstep1Wx4vDMRxBgMg11Gg2tplgtNCZZTsOo5Gdg1JY7dG0QvMr
         HplDGxhmkXgykEWNFSJewfMsR2P90yQprhsIpc5nYpjA9ybt+0WOuli/tDIJIupzNOoJ
         dJFw==
X-Gm-Message-State: AOAM531wNyV6w1Sc8s20Q1QywxUFf5346AAvrBjEjLvao2r6waU9drro
        8/9Vw6ekD5bvDgDq+eP0T2ot/w==
X-Google-Smtp-Source: ABdhPJy48Kf1t5uSs4D7LqUt5Y++xBcg6hs8vGC7R3E5kRfGt3wS51C1KBJ0tAonffigZ7E5TVpuDQ==
X-Received: by 2002:a63:c1c:: with SMTP id b28mr1084821pgl.275.1600988722347;
        Thu, 24 Sep 2020 16:05:22 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id ih11sm302565pjb.51.2020.09.24.16.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 16:05:21 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Song Liu <songliubraving@fb.com>
References: <20200925084053.7169dd01@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c190a77d-33bd-2213-5cc1-17b5268d511d@kernel.dk>
Date:   Thu, 24 Sep 2020 17:05:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925084053.7169dd01@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/24/20 4:40 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   caec515ad9ed ("md/raid5: reallocate page array after setting new stripe_size")
>   6a4b2e201b37 ("md/raid5: resize stripe_head when reshape array")
>   1df3ccb18cf4 ("md/raid5: let multiple devices of stripe_head share page")
>   e56e7ebce809 ("md/raid6: let async recovery function support different page offset")
>   2b2059f32e20 ("md/raid6: let syndrome computor support different page offset")
>   f849daa2c23c ("md/raid5: convert to new xor compution interface")
>   4737539e07a3 ("md/raid5: add new xor function to support different page offset")
>   a5a1925b9a1a ("md/raid5: make async_copy_data() to support different page offset")
> 
> are missing a Signed-off-by from their committer.

Song, I'm going to drop this series. Please re-do it and submit it again.

-- 
Jens Axboe

